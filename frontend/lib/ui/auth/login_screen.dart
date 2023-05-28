import 'package:resperia/routes.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:resperia/ui/mics/custom_eleveted_button.dart';

import 'bloc/login_screen_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isSubmitting = false;

  late FocusNode? passwordFocusNode;

  @override
  void initState() {
    super.initState();

    passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    passwordFocusNode?.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginScreenBloc(),
        child: Builder(
          builder: (context) {
            final loginBloc = BlocProvider.of<LoginScreenBloc>(context);

            return FormBlocListener<LoginScreenBloc, dynamic, String>(
              onSubmitting: (context, state) {
                EasyLoading.dismiss();

                setState(() {
                  _isSubmitting = true;
                });
              },
              onSuccess: (context, state) {
                EasyLoading.dismiss();

                EasyLoading.showToast(
                  'Successfully Logged In!',
                  toastPosition: EasyLoadingToastPosition.bottom,
                  duration: const Duration(seconds: 4),
                );

                AutoRouter.of(context).replaceAll([const HomeRoute()]);

                setState(() {
                  _isSubmitting = false;
                });
              },
              onFailure: (context, state) {
                EasyLoading.dismiss();

                EasyLoading.showToast(
                  '${state.failureResponse}',
                  toastPosition: EasyLoadingToastPosition.bottom,
                  duration: const Duration(seconds: 4),
                );

                setState(() {
                  _isSubmitting = false;
                });
              },
              child: GestureDetector(
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
                            width: size.width < 500
                                ? size.width * 0.05
                                : size.width * 0.2,
                          ),
                          SizedBox(
                            width: size.width < 500
                                ? size.width * 0.9
                                : size.width * 0.6,
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Image.asset(
                                  'assets/images/Resperia.png',
                                  width: size.width < 500
                                      ? size.width * 0.5
                                      : size.width * 0.3,
                                  fit: BoxFit.fitWidth,
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Column(
                                  children: [
                                    TextFieldBlocBuilder(
                                      textFieldBloc: loginBloc.email,
                                      isEnabled: !_isSubmitting,
                                      maxLines: 1,
                                      keyboardType: TextInputType.emailAddress,
                                      textInputAction: TextInputAction.next,
                                      nextFocusNode: passwordFocusNode,
                                      decoration: InputDecoration(
                                        labelText: 'Email',
                                        prefixIcon: Icon(
                                          Icons.email,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFieldBlocBuilder(
                                      textFieldBloc: loginBloc.password,
                                      isEnabled: !_isSubmitting,
                                      suffixButton: SuffixButton.obscureText,
                                      obscureTextTrueIcon: Icon(
                                        Icons.visibility,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      obscureTextFalseIcon: Icon(
                                        Icons.visibility_off,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      textInputAction: TextInputAction.done,
                                      focusNode: passwordFocusNode,
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
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    TextButton(
                                      onPressed: () {
                                        AutoRouter.of(context)
                                            .navigate(const RegisterRoute());
                                      },
                                      child: const Text(
                                        'Create Account',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                        ),
                                      ).tr(),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                _isSubmitting
                                    ? SpinKitCircle(
                                        color: Theme.of(context).primaryColor,
                                      )
                                    : CustomElevatedButton(
                                        onPressed: !_isSubmitting
                                            ? () {
                                                loginBloc.submit();
                                              }
                                            : null,
                                        isFullWidth: true,
                                        child: const Text('Login').tr(),
                                      ),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: size.width < 500
                                ? size.width * 0.05
                                : size.width * 0.2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
