import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/components/app_elevated_button.dart';
import 'package:het/src/config/components/text_field_components.dart';
import 'package:het/src/config/theme/app_colors.dart';
import 'package:het/src/config/theme/text_styles.dart';
import 'package:het/src/core/router/app_routes.dart';
import 'package:het/src/features/auth/data/bodies/login_body.dart';
import 'package:het/src/features/auth/presentation/manager/auth_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final bloc = context.read<AuthBloc>();

  final form = FormGroup({
    'username': FormControl<String>(
      validators: [Validators.required],
    ),
    'password': FormControl<String>(validators: [
      Validators.required,
    ]),
  });

  FormControl<String> get username =>
      form.control('username') as FormControl<String>;

  FormControl<String> get password =>
      form.control('password') as FormControl<String>;

  FormControl<bool> get remember =>
      form.control('remember') as FormControl<bool>;

  FormControl<String> get server =>
      form.control('server') as FormControl<String>;

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.mainColor,
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state.hasError) {
              toastification.show(
                  title: Text(
                    state.errorMessage,
                    style: const TextStyle(fontSize: 16),
                  ),
                  type: ToastificationType.error,
                  alignment: Alignment.bottomCenter,
                  style: ToastificationStyle.fillColored,
                  primaryColor: Colors.red);
            }
            if (state.isLoginVerified) {
              debugPrint(jsonEncode(state.oneIdModel?.access));
              String role =
                  state.oneIdModel?.data?.positions?.first.type?.id ?? '';
              debugPrint(role);
              if (role == "1") {
                context.goNamed(AppRoutes.engineerMain.name);
              } else if (role == "2") {
                context.goNamed(AppRoutes.masterMain.name);
              } else if (role == "5") {
                context.goNamed(AppRoutes.laboratoryMain.name);
              } else if (role == "6") {
                context.goNamed(AppRoutes.garageMain.name);
              } else {
                toastification.show(
                    title: Text(
                      "Account type not found",
                      style: const TextStyle(fontSize: 16),
                    ),
                    type: ToastificationType.error,
                    alignment: Alignment.bottomCenter,
                    style: ToastificationStyle.fillColored,
                    primaryColor: Colors.red);
              }
            }
          },
          builder: (context, state) {
            return ReactiveForm(
              formGroup: form,
              child: Stack(alignment: Alignment.center, children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 16, right: 16, bottom: 32, top: 24),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(33),
                            topLeft: Radius.circular(33))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            textAlign: TextAlign.center,
                            'S.of(context).login',
                            style: CustomTextStyle.h24SB),
                        const Gap(18),
                        ReactiveTextField(
                          formControl: username,
                          decoration: InputDecoration(
                            hintStyle: const TextStyle(color: Colors.grey),
                            labelText: 'S.of(context).username',
                            counterText: '',
                            border: appTextFiledBorder(),
                            enabledBorder: appTextFiledBorder(),
                            disabledBorder: appTextFiledBorder(),
                            focusedBorder: appTextFiledBorder(),
                            errorBorder: appTextFiledErrorBorder(),
                          ),
                          keyboardType: TextInputType.text,
                          validationMessages: {
                            'required': (error) =>
                                S.of(context).thefieldmustnotbeempty,
                          },
                        ),
                        const Gap(18),
                        ReactiveTextField(
                          formControl: password,
                          decoration: InputDecoration(
                            labelText: 'S.of(context).password',
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                            border: appTextFiledBorder(),
                            enabledBorder: appTextFiledBorder(),
                            disabledBorder: appTextFiledBorder(),
                            focusedBorder: appTextFiledBorder(),
                            errorBorder: appTextFiledErrorBorder(),
                          ),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: _obscurePassword,
                          validationMessages: {
                            'required': (error) =>
                                S.of(context).thefieldmustnotbeempty,
                          },
                        ),
                        const Gap(18),
                        state.isLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.mainColor,
                                ),
                              )
                            : ReactiveFormConsumer(
                                builder: (context, form, child) {
                                return AppElevatedButton(
                                    text: 'S.of(context).login',
                                    onClick: () {
                                      //context.goNamed(AppRoutes.main.name);
                                      debugPrint(jsonEncode(form.value));
                                      if (form.valid) {
                                        bloc.login(LoginBody(
                                            pinfl: username.value,
                                            password: password.value));
                                      } else {
                                        form.markAllAsTouched();
                                      }
                                    });
                              }),
                      ],
                    ),
                  ),
                )
              ]),
            );
          },
        ));
  }
}
