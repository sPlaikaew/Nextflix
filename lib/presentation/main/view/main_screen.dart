import 'package:flutter/material.dart';
import 'package:nextflix/data/model/profile.dart';
import 'package:nextflix/localization/app_localization.dart';
import 'package:nextflix/presentation/empty/view/empty_screen.dart';
import 'package:nextflix/presentation/home/view/home_screen.dart';
import 'package:nextflix/presentation/setting/view/setting_screen.dart';
import 'package:nextflix/utils/themes/color.dart';

class MainScreen extends StatefulWidget {
  final Profile profile;
  const MainScreen({super.key, required this.profile});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    final List<Widget> pages = [
      HomeScreen(
        profile: widget.profile,
      ),
      const EmptyScreen(),
      const EmptyScreen(),
      const EmptyScreen(),
      const SettingScreen(),
    ];
    return Scaffold(
      body: SafeArea(
        child: pages[selectedIndex],
      ),
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: BottomNavigationBar(
          backgroundColor: NextFlixColor.navigationColor,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 9,
          unselectedFontSize: 9,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: localizations.common.home,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.playlist_play),
              label: localizations.common.coming,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.search),
              label: localizations.common.search,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.download),
              label: localizations.common.downloads,
            ),
            BottomNavigationBarItem(
              icon: const Icon(Icons.menu),
              label: localizations.common.menu,
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}