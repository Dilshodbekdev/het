import 'package:flutter/material.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/assets/app_icons.dart';
import 'package:het/src/features/engineer/main/tabs/laboratory/engineer_laboratory_page.dart';
import 'package:het/src/features/engineer/main/tabs/production/engineer_production_page.dart';
import 'package:het/src/features/engineer/main/tabs/transport/engineer_transport_page.dart';
import 'package:het/src/features/main/main_page.dart';
import 'package:het/src/features/master/main/tabs/home/master_home_page.dart';

class EngineerMainPage extends StatelessWidget {
  const EngineerMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const MasterHomePage(),
      const EngineerProductionPage(),
      const EngineerLaboratoryPage(),
      const EngineerTransportPage()
    ];
    List<String> titles = [
      S.of(context).main,
      S.of(context).productionManagement,
      S.of(context).applicationToLabaratory,
      S.of(context).equipmentReservation,
    ];
    List<String> icons = [
      AppIcons.home,
      AppIcons.personalCard,
      AppIcons.check,
      AppIcons.car
    ];

    return MainPage(pages: pages, titles: titles, icons: icons);
  }
}
