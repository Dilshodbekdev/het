import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/assets/app_icons.dart';
import 'package:het/src/config/components/app_divider.dart';
import 'package:het/src/config/theme/app_colors.dart';
import 'package:het/src/core/app_state/cubit/app_cubit.dart';
import 'package:het/src/core/app_state/localization.dart';
import 'package:het/src/core/router/app_routes.dart';
import 'package:het/src/core/services/services.dart';
import 'package:het/src/core/util/app_constants.dart';
import 'package:het/src/features/master/home/data/bodies/stats_body.dart';
import 'package:het/src/features/master/home/presentation/manager/master_home_bloc.dart';

class MainPage extends StatefulWidget {
  final List<Widget> pages;
  final List<String> titles;
  final List<String> icons;
  const MainPage({super.key, required this.pages, required this.titles, required this.icons});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late final bloc = context.read<AppCubit>();
  late final blocMaster = context.read<MasterHomeBloc>();

  @override
  void initState() {
    super.initState();
    bloc.fetchUserData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state){
        if(state.isDark){
          if(state.userModel?.positions?.first.type?.id=='1'||state.userModel?.positions?.first.type?.id=='2'){
            blocMaster.masterStats(StatsBody(type: state.userModel?.positions?.first.hetObject?.type?.id??'', role: state.userModel?.positions?.first.type?.id));
            blocMaster.masterQuarters(StatsBody(type: state.userModel?.positions?.first.hetObject?.type?.id??'', role: state.userModel?.positions?.first.type?.id));
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.titles[state.selectedIndex]),
          ),
          drawer: Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: Text("${state.userModel?.lastName} ${state.userModel?.firstName}"),
                  accountEmail: Text(state.userModel?.positions?.first.type?.name??'-'),
                  currentAccountPicture: CircleAvatar(
                    child: SvgPicture.asset(
                      AppIcons.user,
                      height: 30,
                    ),
                  ),
                  decoration: const BoxDecoration(color: AppColors.mainColor),
                ),
                ...List.generate(widget.pages.length, (index){
                  return ListTile(
                    leading: SvgPicture.asset(widget.icons[index]),
                    title: Text(widget.titles[index]),
                    onTap: () {
                      bloc.selectTab(index);
                      context.pop();
                    },
                  );
                }),
                ExpansionTile(
                  leading: SvgPicture.asset(
                    AppIcons.translate,
                    color: AppColors.mainColor,
                  ),
                  title: Text(
                    S.of(context).changeLanguage,
                  ),
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: AppDivider(),
                    ),
                    ListTile(
                      onTap: () {
                        bloc.changeLocale(Localization.uz, 'uz');
                      },
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: SvgPicture.asset(
                            AppIcons.uz,
                            height: 30,
                          )),
                      title: const Text(
                        "O'zbek",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Checkbox(
                        activeColor: AppColors.mainColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          value: state.lang=='uz',
                          onChanged: (v) {
                            bloc.changeLocale(Localization.uz, 'uz');
                          }),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: AppDivider(),
                    ),
                    ListTile(
                      onTap: () {
                        bloc.changeLocale(Localization.ru, 'ru');
                      },
                      leading: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: SvgPicture.asset(
                            AppIcons.ru,
                            height: 30,
                          )),
                      title: const Text(
                        "Русский",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      trailing: Checkbox(
                          activeColor: AppColors.mainColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)),
                          value: state.lang=='ru',
                          onChanged: (v) {
                            bloc.changeLocale(Localization.ru, 'ru');
                          }),
                    ),
                  ],
                ),
                const AppDivider(),
                ListTile(
                  leading: SvgPicture.asset(
                    AppIcons.logout,
                    color: Colors.redAccent,
                  ),
                  title: Text(S.of(context).logout,
                      style: const TextStyle(color: Colors.redAccent)),
                  onTap: () {
                    Prefs.setString(AppConstants.kPositionType, '');
                    Prefs.setString(AppConstants.kHetObjectType, '');
                    bloc.selectTab(0);
                    context.goNamed(AppRoutes.login.name);
                  },
                ),
              ],
            ),
          ),
          body: widget.pages[state.selectedIndex],
        );
      },
    );
  }
}
