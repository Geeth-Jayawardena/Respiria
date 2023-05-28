import 'package:resperia/models/hospital.dart';
import 'package:auto_route/auto_route.dart';
import 'package:resperia/routes.gr.dart';
import 'package:resperia/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:resperia/ui/auth/bloc/register_screen_bloc.dart';
import 'package:resperia/ui/mics/custom_eleveted_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterScreenBloc(),
      child: Builder(
        builder: (context) {
          final registerScreenBloc =
              BlocProvider.of<RegisterScreenBloc>(context);

          return Scaffold(
            body: FormBlocListener<RegisterScreenBloc, dynamic, String>(
              onSubmitting: (context, state) {
                _LoadingDialog.show(context);
              },
              onSuccess: (context, state) {
                _LoadingDialog.hide(context);

                EasyLoading.showToast(
                  'Account Created Successfully',
                  toastPosition: EasyLoadingToastPosition.bottom,
                  duration: const Duration(seconds: 4),
                );

                AutoRouter.of(context).popUntilRouteWithName(LoginRoute.name);
              },
              onFailure: (context, state) {
                _LoadingDialog.hide(context);

                EasyLoading.showToast(
                  '${state.failureResponse}',
                  toastPosition: EasyLoadingToastPosition.bottom,
                  duration: const Duration(seconds: 4),
                );
              },
              child: BlocBuilder<RegisterScreenBloc, FormBlocState>(
                buildWhen: (previous, current) =>
                    previous.runtimeType != current.runtimeType ||
                    previous is FormBlocLoading && current is FormBlocLoading,
                builder: (context, state) {
                  if (state is FormBlocLoading) {
                    return Center(
                      child: SpinKitCircle(
                        color: Theme.of(context).primaryColor,
                        size: 70,
                      ),
                    );
                  } else if (state is FormBlocLoadFailed) {
                    return _ErrorLoadingScreen(
                      registerScreenBloc: registerScreenBloc,
                      state: state,
                    );
                  } else {
                    return _FormBody(
                      registerScreenBloc: registerScreenBloc,
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class _FormBody extends StatefulWidget {
  const _FormBody({
    Key? key,
    required this.registerScreenBloc,
  }) : super(key: key);

  final RegisterScreenBloc registerScreenBloc;

  @override
  State<_FormBody> createState() => _FormBodyState();
}

class _FormBodyState extends State<_FormBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 50, bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width:
                      size.width < 500 ? size.width * 0.05 : size.width * 0.2,
                ),
                SizedBox(
                  width: size.width < 500 ? size.width * 0.9 : size.width * 0.6,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: const Text(
                              'Register',
                              style: TextStyle(
                                color: primaryColor,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ).tr(),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: widget.registerScreenBloc.name,
                            maxLines: 1,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              labelText: 'Name',
                              prefixIcon: Icon(
                                Icons.person,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: widget.registerScreenBloc.email,
                            maxLines: 1,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              prefixIcon: Icon(
                                Icons.email,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: widget.registerScreenBloc.phone,
                            maxLines: 1,
                            keyboardType: TextInputType.phone,
                            maxLength: 10,
                            decoration: InputDecoration(
                              labelText: 'Mobile Number',
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: widget.registerScreenBloc.nicNumber,
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'NIC Number',
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          DateTimeFieldBlocBuilder(
                            dateTimeFieldBloc: widget.registerScreenBloc.dob,
                            // canSelectTime: true,
                            format: DateFormat('yyyy-MM-dd'),
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                            decoration: InputDecoration(
                              labelText: 'Date of Birth',
                              prefixIcon: Icon(
                                Icons.date_range,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: widget.registerScreenBloc.address,
                            maxLines: 1,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                              labelText: 'Address',
                              prefixIcon: Icon(
                                Icons.mail,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc: widget.registerScreenBloc.password,
                            suffixButton: SuffixButton.obscureText,
                            obscureTextTrueIcon: Icon(
                              Icons.visibility,
                              color: Theme.of(context).primaryColor,
                            ),
                            obscureTextFalseIcon: Icon(
                              Icons.visibility_off,
                              color: Theme.of(context).primaryColor,
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            enableSuggestions: false,
                            autocorrect: false,
                            maxLines: 1,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFieldBlocBuilder(
                            textFieldBloc:
                                widget.registerScreenBloc.confirmPassword,
                            suffixButton: SuffixButton.obscureText,
                            obscureTextTrueIcon: Icon(
                              Icons.visibility,
                              color: Theme.of(context).primaryColor,
                            ),
                            obscureTextFalseIcon: Icon(
                              Icons.visibility_off,
                              color: Theme.of(context).primaryColor,
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            enableSuggestions: false,
                            autocorrect: false,
                            maxLines: 1,
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          DropdownFieldBlocBuilder<Hospital>(
                            selectFieldBloc: widget.registerScreenBloc.hospital,
                            decoration: const InputDecoration(
                                labelText: 'Select Hospital'),
                            itemBuilder: (context, item) => FieldItem(
                                child: Text(item.user?.name ?? 'N/A')),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomElevatedButton(
                        onPressed: () {
                          widget.registerScreenBloc.submit();
                        },
                        child: const Text('Register').tr(),
                        isFullWidth: true,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width:
                      size.width < 500 ? size.width * 0.05 : size.width * 0.2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
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

class _ErrorLoadingScreen extends StatelessWidget {
  const _ErrorLoadingScreen({
    Key? key,
    required this.registerScreenBloc,
    required this.state,
  }) : super(key: key);

  final RegisterScreenBloc registerScreenBloc;
  final FormBlocLoadFailed state;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Icon(
              Icons.sentiment_dissatisfied,
              size: size.width < 500 ? 40 : 70,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              alignment: Alignment.center,
              child: Text(
                state.failureResponse as String,
                style: TextStyle(
                  fontSize: size.width < 500 ? 18 : 22,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomElevatedButton(
              onPressed: registerScreenBloc.reload,
              child: const Text('Retry').tr(),
            ),
          ],
        ),
      ),
    );
  }
}
