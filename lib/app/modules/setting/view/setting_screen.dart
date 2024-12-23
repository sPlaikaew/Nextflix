import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nextflix/core/utils/themes/color.dart';
import 'package:nextflix/core/utils/widgets/btn_common.dart';
import 'package:nextflix/localization/app_localization.dart';

import '../bloc/setting_bloc.dart';

enum Language { english, thai }

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  Language? local = Language.english;
  @override
  void initState() {
    setState(() {
      local = Modular.get<SettingBloc>().state.locale.languageCode == 'en'
          ? Language.english
          : Language.thai;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 20, right: 20),
          color: Colors.black,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                localizations.language.language,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Row(
                children: [
                  Radio<Language>(
                    activeColor: NextFlixColor.primary,
                    value: Language.english,
                    groupValue: local,
                    onChanged: (value) {
                      setState(() {
                        local = value;
                      });
                    },
                  ),
                  const Text(
                    'English',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Radio<Language>(
                    activeColor: NextFlixColor.primary,
                    value: Language.thai,
                    groupValue: local,
                    onChanged: (value) {
                      setState(() {
                        local = value;
                      });
                    },
                  ),
                  const Text(
                    'thai',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              BtnCommon(
                onPress: () {
                  local.toString().split('.').last == 'english'
                      ? Modular.get<SettingBloc>()
                          .add(const LocaleChanged(Locale('en')))
                      : Modular.get<SettingBloc>()
                          .add(const LocaleChanged(Locale('th')));
                },
                text: localizations.common.save,
                width: MediaQuery.of(context).size.height,
              )
            ],
          ),
        ),
      ),
    );
  }
}
