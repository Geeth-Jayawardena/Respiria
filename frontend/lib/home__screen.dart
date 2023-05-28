import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:resperia/main.dart';
import 'package:resperia/models/patient.dart';
import 'package:resperia/notifiers/user_notifier.dart';
import 'package:resperia/repositories/auth_repository.dart';
import 'package:resperia/repositories/predict_repository.dart';
import 'package:resperia/routes.gr.dart';
import 'package:resperia/service_locator.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:audio_session/audio_session.dart';
import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'api/dio_client.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenScreenState();
}

typedef _Fn = void Function();
const theSource = AudioSource.microphone;

class _HomeScreenScreenState extends State<HomeScreen> {
  Codec _codec = Codec.aacMP4;
  String _mPath = 'tau_file.mp4';
  FlutterSoundPlayer? _mPlayer = FlutterSoundPlayer();
  FlutterSoundRecorder? _mRecorder = FlutterSoundRecorder();
  bool _mPlayerIsInited = false;
  bool _mRecorderIsInited = false;
  bool _mplaybackReady = false;

  File? selectedFile;

  bool isFileSelected = false;

  @override
  void initState() {
    super.initState();

    validate(context);

    _mPlayer!.openPlayer().then((value) {
      setState(() {
        _mPlayerIsInited = true;
      });
    });

    openTheRecorder().then((value) {
      setState(() {
        _mRecorderIsInited = true;
      });
    });
  }

  @override
  void dispose() {
    _mPlayer!.closePlayer();
    _mPlayer = null;

    _mRecorder!.closeRecorder();
    _mRecorder = null;
    super.dispose();
  }

  Future<void> openTheRecorder() async {
    if (!kIsWeb) {
      var status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        throw RecordingPermissionException('Microphone permission not granted');
      }
    }
    await _mRecorder!.openRecorder();
    if (!await _mRecorder!.isEncoderSupported(_codec) && kIsWeb) {
      if (!await _mRecorder!.isEncoderSupported(_codec) && kIsWeb) {
        _mRecorderIsInited = true;
        return;
      }
    }
    final session = await AudioSession.instance;
    await session.configure(AudioSessionConfiguration(
      avAudioSessionCategory: AVAudioSessionCategory.playAndRecord,
      avAudioSessionCategoryOptions:
          AVAudioSessionCategoryOptions.allowBluetooth |
              AVAudioSessionCategoryOptions.defaultToSpeaker,
      avAudioSessionMode: AVAudioSessionMode.spokenAudio,
      avAudioSessionRouteSharingPolicy:
          AVAudioSessionRouteSharingPolicy.defaultPolicy,
      avAudioSessionSetActiveOptions: AVAudioSessionSetActiveOptions.none,
      androidAudioAttributes: const AndroidAudioAttributes(
        contentType: AndroidAudioContentType.speech,
        flags: AndroidAudioFlags.none,
        usage: AndroidAudioUsage.voiceCommunication,
      ),
      androidAudioFocusGainType: AndroidAudioFocusGainType.gain,
      androidWillPauseWhenDucked: true,
    ));

    _mRecorderIsInited = true;
  }

  void record() {
    _mRecorder!
        .startRecorder(
      toFile: _mPath,
      codec: _codec,
      audioSource: theSource,
    )
        .then((value) {
      setState(() {
        selectedFile = null;
      });
    });
  }

  void stopRecorder() async {
    await _mRecorder!.stopRecorder().then((value) {
      setState(() {
        //var url = value;
        _mplaybackReady = true;
        isFileSelected = true;
      });
    });
  }

  void play() {
    assert(_mPlayerIsInited &&
        _mplaybackReady &&
        _mRecorder!.isStopped &&
        _mPlayer!.isStopped);
    _mPlayer!
        .startPlayer(
            fromURI: _mPath,
            //codec: kIsWeb ? Codec.opusWebM : Codec.aacADTS,
            whenFinished: () {
              setState(() {});
            })
        .then((value) {
      setState(() {});
    });
  }

  void stopPlayer() {
    _mPlayer!.stopPlayer().then((value) {
      setState(() {});
    });
  }

  _Fn? getRecorderFn() {
    if (!_mRecorderIsInited || !_mPlayer!.isStopped) {
      return null;
    }
    return _mRecorder!.isStopped ? record : stopRecorder;
  }

  _Fn? getPlaybackFn() {
    if (!_mPlayerIsInited || !_mplaybackReady || !_mRecorder!.isStopped) {
      return null;
    }
    return _mPlayer!.isStopped ? play : stopPlayer;
  }

  void validate(BuildContext context) async {
    try {
      // ignore: unused_local_variable
      Dio dio = await getIt<DioClient>().initializeWithKey();

      Provider.of<UserNotifier>(context, listen: false).getState();
    } catch (e) {
      // AutoRouter.of(context).popUntilRoot();
      AutoRouter.of(context).replaceAll([const LoginRoute()]);
    }
  }

  @override
  Widget build(BuildContext context) {
    var loading = Provider.of<UserNotifier>(context).getLoading;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resperia'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () async {
              await showDialog<dynamic>(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Logout"),
                    content: const Text("Do you want to logout?"),
                    actions: <Widget>[
                      TextButton(
                        child: const Text("Yes"),
                        onPressed: () {
                          AutoRouter.of(context).popUntilRoot();
                          AutoRouter.of(context)
                              .replaceAll([const LoginRoute()]);

                          getIt<AuthRepository>().deleteToken();
                        },
                      ),
                      TextButton(
                        child: const Text("No"),
                        onPressed: () {
                          AutoRouter.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(top: 50, bottom: 50),
                  child: Column(
                    children: [
                      const Text('Record Audio',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          createElevatedButton(
                            icon: _mRecorder!.isRecording
                                ? Icons.stop
                                : Icons.mic,
                            iconColor: Colors.red,
                            onPressFunc: getRecorderFn(),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          createElevatedButton(
                            icon: _mPlayer!.isPlaying
                                ? Icons.stop
                                : Icons.play_arrow,
                            iconColor: Colors.red,
                            onPressFunc: getPlaybackFn(),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(children: <Widget>[
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(
                                  left: 10.0, right: 20.0),
                              child: const Divider(
                                color: Colors.black,
                                height: 36,
                              )),
                        ),
                        const Text("OR"),
                        Expanded(
                          child: Container(
                              margin: const EdgeInsets.only(
                                  left: 20.0, right: 10.0),
                              child: const Divider(
                                color: Colors.black,
                                height: 36,
                              )),
                        ),
                      ]),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text('Select Audio File',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 25,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles(
                            type: FileType.custom,
                            allowedExtensions: [
                              'wav',
                            ],
                          );

                          if (result != null) {
                            File file = File(result.files.single.path!);

                            setState(() {
                              selectedFile = file;
                              isFileSelected = true;
                            });
                          } else {
                            // User canceled the picker
                          }
                        },
                        child: const Text('Select File'),
                      ),
                      Visibility(
                        visible: selectedFile != null,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(selectedFile?.path.split('/').last ?? '')
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Visibility(
                        visible: isFileSelected,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red),
                          onPressed: () async {
                            submit();
                          },
                          child: const Text('Submit'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  void submit() async {
    late File file;

    if (selectedFile != null) {
      file = selectedFile!;
    } else {
      Directory tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;

      file = File.fromUri(Uri.file('$tempPath/$_mPath'));
    }

    if (!mounted) return;

    _LoadingDialog.show(context);

    try {
      Response response = await getIt<PredictionRepository>().getPrediction(
        file: file,
      );

      if (!mounted) return;

      _LoadingDialog.hide(context);

      if (response.statusCode == 200) {
        await showDialog<dynamic>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Result"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text('You may have'),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    response.data['prediction'] ?? 'N/A',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    AutoRouter.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else {
        EasyLoading.showToast(
          'Error!',
          toastPosition: EasyLoadingToastPosition.bottom,
          duration: const Duration(seconds: 4),
        );
      }
    } catch (e) {
      logger.e(e);
      _LoadingDialog.hide(context);
      EasyLoading.showToast(
        'Error!',
        toastPosition: EasyLoadingToastPosition.bottom,
        duration: const Duration(seconds: 4),
      );
    }
  }
}

ElevatedButton createElevatedButton({
  required IconData icon,
  required Color iconColor,
  required Function()? onPressFunc,
}) {
  return ElevatedButton.icon(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(6.0),
      side: const BorderSide(
        color: Colors.red,
        width: 4.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      primary: Colors.white,
      elevation: 9.0,
    ),
    onPressed: onPressFunc,
    icon: Icon(
      icon,
      color: iconColor,
      size: 38.0,
    ),
    label: const Text(''),
  );
}

class _LoadingDialog extends StatelessWidget {
  static void show(BuildContext context, {Key? key}) => showDialog<void>(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (_) => _LoadingDialog(key: key),
      ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) => Navigator.pop(context);

  const _LoadingDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Center(
        child: SpinKitCircle(
          color: Theme.of(context).primaryColor,
          size: 70,
        ),
      ),
      onWillPop: () async => false,
    );
  }
}
