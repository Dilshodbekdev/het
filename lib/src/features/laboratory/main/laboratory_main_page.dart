import 'package:flutter/material.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/assets/app_icons.dart';
import 'package:het/src/features/laboratory/main/tabs/applications/laboratory_applications_page.dart';
import 'package:het/src/features/main/main_page.dart';

class LaboratoryMainPage extends StatelessWidget {
  const LaboratoryMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [const LaboratoryApplicationsPage(),];
    List<String> titles = [
      S.of(context).applications,
    ];
    List<String> icons = [AppIcons.home];

    return MainPage(pages: pages, titles: titles, icons: icons);
  }
}
