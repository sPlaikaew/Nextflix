import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nextflix/app/domain/entities/profile_entity.dart';
import 'package:nextflix/app/modules/select_profile/view/widgets/profile_widget.dart';
import 'package:nextflix/core/utils/images/images.dart';
import 'package:nextflix/core/utils/widgets/btn_common.dart';
import 'package:nextflix/localization/app_localization.dart';
import 'package:nextflix/localization/translations/translations.i69n.dart';

import '../../../data/model/profile.dart';
import '../bloc/select_profile_bloc.dart';

class SelectProfileScreen extends StatefulWidget {
  const SelectProfileScreen({super.key});

  @override
  State<SelectProfileScreen> createState() => _SelectProfileScreenState();
}

class _SelectProfileScreenState extends State<SelectProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.black,
          padding:
              const EdgeInsets.only(left: 55, right: 55, top: 34, bottom: 36),
          child: BlocBuilder<SelectProfileBloc, SelectProfileState>(
            buildWhen: (previous, current) =>
                previous.loading != current.loading,
            builder: (context, state) {
              if (state.loading) {
                return Container(
                  alignment: Alignment.center,
                  child: const CircularProgressIndicator(),
                );
              } else if (state.isError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.errorMsg!,
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      BtnCommon(
                        onPress: () {
                          BlocProvider.of<SelectProfileBloc>(context)
                              .add(GetAllProfiles());
                        },
                        text: localizations.common.refresh,
                      )
                    ],
                  ),
                );
              }
              return _buildContent(state.profiles!,localizations);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContent(List<ProfileEntity> profiles,Translations localizations) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            LogoImage.nextflixText,
            height: 25,
            width: 80,
          ),
          Column(
            children: [
              Text(
                localizations.selectProfilePage.whoWatch,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 27,
                  childAspectRatio: 0.9,
                ),
                itemCount: profiles.length,
                itemBuilder: (BuildContext context, int index) {
                  return ProfileWidget(profile: profiles[index]);
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                localizations.common.edit,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 5),
              SvgPicture.asset(
                CommonImage.editImage,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
