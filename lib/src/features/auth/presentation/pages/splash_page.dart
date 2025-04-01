import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/assets/app_images.dart';
import 'package:het/src/core/app_state/cubit/app_cubit.dart';
import 'package:het/src/core/router/app_routes.dart';
import 'package:het/src/core/services/services.dart';
import 'package:het/src/core/util/app_constants.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () async {
      final String role = await Prefs.getString(AppConstants.kPositionType) ?? "";
      debugPrint(role);
      if (role.isNotEmpty) {
        if (role == "1") {
          context.goNamed(AppRoutes.engineerMain.name);
        } else if (role == "2") {
          context.goNamed(AppRoutes.masterMain.name);
        } else if (role == "5") {
          context.goNamed(AppRoutes.laboratoryMain.name);
        } else if (role == "6") {
          context.goNamed(AppRoutes.garageMain.name);
        } else {
          context.goNamed(AppRoutes.login.name);
        }
      } else {
        context.goNamed(AppRoutes.login.name);
      }
    });
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //SvgPicture.asset('assets/icons/ic_logo.svg',height: 100,fit: BoxFit.cover,),
                    Image.asset(
                      AppImages.logo,
                      fit: BoxFit.cover,
                    ),
                    Gap(20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Text(
                        textAlign: TextAlign.center,
                        S.of(context).appTitle,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ));
  }
}
