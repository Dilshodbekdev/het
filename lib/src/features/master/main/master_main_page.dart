import 'package:flutter/material.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/assets/app_icons.dart';
import 'package:het/src/features/main/main_page.dart';
import 'package:het/src/features/master/main/tabs/defective/master_defective_act_page.dart';
import 'package:het/src/features/master/main/tabs/home/master_home_page.dart';
import 'package:het/src/features/master/main/tabs/tasks/master_tasks_page.dart';

class MasterMainPage extends StatelessWidget {
  const MasterMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      const MasterHomePage(),
      MasterTasksPage(),
      MasterDefectiveActPage(),
    ];
    List<String> titles = [
      S.of(context).main,
      S.of(context).tasks,
      S.of(context).defectiveAct,
    ];
    List<String> icons = [AppIcons.home, AppIcons.tasks, AppIcons.doc];

    return MainPage(pages: pages, titles: titles, icons: icons);
  }
}
