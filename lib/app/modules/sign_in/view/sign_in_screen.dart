import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nextflix/core/utils/images/images.dart';
import 'package:nextflix/core/utils/themes/color.dart';
import 'package:nextflix/core/utils/widgets/btn_common.dart';
import 'package:nextflix/core/utils/widgets/input_text_common.dart';
import 'package:nextflix/injections/onboard.dart';
import 'package:nextflix/localization/app_localization.dart';
import 'package:toastification/toastification.dart';

import '../bloc/sign_in_bloc.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: BlocListener<SignInBloc, SignInState>(
            listenWhen: (previous, current) =>
                previous.loading != current.loading,
            listener: (context, state) {
              if (state.loading == false && state.isError == true) {
                EasyLoading.dismiss();
                toastification.show(
                  context: context,
                  title: Text(
                      '${localizations.common.tryAgain} ${state.errorMsg}'),
                  autoCloseDuration: const Duration(seconds: 4),
                );
              }
              if (state.loading == false && state.isError == false) {
                EasyLoading.dismiss();
                Modular.to.pushNamed(OnboardPageType.selectProfile.path);
              }
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      LogoImage.nextflixLogo,
                      height: 40,
                      width: 26,
                    ),
                    const SizedBox(height: 34),
                    InputTextCommon(
                      onChanged: (String value) {
                        (value) => email = value;
                      },
                      hint: localizations.signInPage.enterEmail,
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.7),
                      ),
                      textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 6),
                    InputTextCommon(
                      onChanged: (String value) {
                        (value) => password = value;
                      },
                      hint: localizations.signInPage.enterPassword,
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.7),
                      ),
                      textStyle: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 25),
                    BtnCommon(
                      text: localizations.signInPage.signIn,
                      fontSize: 20,
                      height: 50,
                      width: MediaQuery.of(context).size.height,
                      onPress: () {
                        EasyLoading.show();
                        BlocProvider.of<SignInBloc>(context)
                            .add(SignIn(email, password));
                      },
                    ),
                    const SizedBox(height: 12),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        localizations.signInPage.forgotPassword,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 45,
                  child: Row(
                    children: [
                      Text(
                        localizations.signInPage.noAccount,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          localizations.signInPage.createOne,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: NextFlixColor.textColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
