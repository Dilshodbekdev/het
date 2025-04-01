import 'package:flutter/material.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/assets/app_icons.dart';
import 'package:het/src/features/garage/main/tabs/applications/garage_applications_page.dart';
import 'package:het/src/features/garage/main/tabs/transports/garage_transport_page.dart';
import 'package:het/src/features/main/main_page.dart';

class GarageMainPage extends StatelessWidget {
  const GarageMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [const GarageApplicationsPage(), GarageTransportPage(),];
    List<String> titles = [
      S.of(context).applications,
      S.of(context).transports,
    ];
    List<String> icons=[AppIcons.home,AppIcons.personalCard];

    return MainPage(pages: pages, titles: titles, icons: icons);
  }
}
