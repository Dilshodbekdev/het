import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/components/app_container.dart';
import 'package:het/src/config/theme/app_colors.dart';
import 'package:het/src/config/theme/text_styles.dart';
import 'package:het/src/core/router/app_routes.dart';
import 'package:het/src/features/engineer/laboratory/presentation/manager/engineer_laboratory_bloc.dart';
import 'package:het/src/features/engineer/main/tabs/transport/widgets/transport_application_item.dart';
import 'package:het/src/features/engineer/transport/presentation/manager/engineer_transport_bloc.dart';
import 'package:het/src/features/garage/main/tabs/applications/widgets/garage_application_item.dart';
import 'package:het/src/features/laboratory/main/tabs/applications/widgets/laboratory_application_item.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class LaboratoryApplicationsPage extends StatefulWidget {
  const LaboratoryApplicationsPage({super.key});

  @override
  State<LaboratoryApplicationsPage> createState() => _LaboratoryApplicationsPageState();
}

class _LaboratoryApplicationsPageState extends State<LaboratoryApplicationsPage> with TickerProviderStateMixin {
  late final bloc = context.read<EngineerLaboratoryBloc>();
  int _previousTabIndex = 0;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 4,
      vsync: this,
    );
    _tabController.addListener(_listenToTabChanges);
    bloc.applications(null);
  }

  @override
  void dispose() {
    _tabController.removeListener(_listenToTabChanges);
    _tabController.dispose();
    super.dispose();
  }

  void _listenToTabChanges() {
    if (_previousTabIndex != _tabController.index) {
      _previousTabIndex = _tabController.index;
      bloc.applications(
          (() {
            switch (_previousTabIndex) {
              case 0:
                return null;
              case 1:
                return '2';
              case 2:
                return '4';
              case 3:
                return '5';
              default:
                return '';
            }
          }())
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<EngineerLaboratoryBloc, EngineerLaboratoryState>(
        builder: (context, state) {
          return Column(
            children: [
              AppContainer(
                margin: const EdgeInsets.only(
                    right: 16, left: 16, top: 16, bottom: 8),
                padding: const EdgeInsets.all(4),
                radius: 4,
                child: TabBar(
                  controller: _tabController,
                  indicatorColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: AppColors.mainColor,
                  ),
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  indicatorSize: TabBarIndicatorSize.tab,
                  splashBorderRadius: BorderRadius.circular(8),
                  labelStyle: CustomTextStyle.h16M,
                  labelColor: Colors.white,
                  unselectedLabelStyle: CustomTextStyle.h16M,
                  tabs: <Widget>[
                    Tab(text: S.of(context).all),
                    Tab(text: S.of(context).new1),
                    Tab(text: S.of(context).inProccess),
                    Tab(text: S.of(context).complated),
                  ],
                ),
              ),
              !state.isLoading?
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                    children: [
                      LazyLoadScrollView(
                        isLoading: state.isPaging,
                        scrollOffset: 300,
                        onEndOfPage: () => bloc.pagingApplications(null),
                        child: ListView.builder(
                          itemCount: state.applications.length + (state.isPaging ? 1 : 0),
                          itemBuilder: (context, index) => index == state.applications.length
                              ? const Center(child: CircularProgressIndicator())
                              : LaboratoryApplicationItem(
                              model: state.applications[index],
                              onClick: () {
                                bloc.applicationDetails(state.applications[index].id??0);
                                context.pushNamed(AppRoutes.laboratoryApplicationDetails.name).then((onValue){
                                  if(onValue!=null){
                                    bloc.applications(null);
                                  }
                                });
                              }),
                        ),
                      ),
                      LazyLoadScrollView(
                        isLoading: state.isPaging,
                        scrollOffset: 300,
                        onEndOfPage: () => bloc.pagingApplications('2'),
                        child: ListView.builder(
                          itemCount: state.applications.length + (state.isPaging ? 1 : 0),
                          itemBuilder: (context, index) => index == state.applications.length
                              ? const Center(child: CircularProgressIndicator())
                              : LaboratoryApplicationItem(
                              model: state.applications[index],
                              onClick: () {
                                bloc.applicationDetails(state.applications[index].id??0);
                                context.pushNamed(AppRoutes.laboratoryApplicationDetails.name).then((onValue){
                                  if(onValue!=null){
                                    bloc.applications('2');
                                  }
                                });
                              }),
                        ),
                      ),
                      LazyLoadScrollView(
                        isLoading: state.isPaging,
                        scrollOffset: 300,
                        onEndOfPage: () => bloc.pagingApplications('4'),
                        child: ListView.builder(
                          itemCount: state.applications.length + (state.isPaging ? 1 : 0),
                          itemBuilder: (context, index) => index == state.applications.length
                              ? const Center(child: CircularProgressIndicator())
                              : LaboratoryApplicationItem(
                              model: state.applications[index],
                              onClick: () {
                                bloc.applicationDetails(state.applications[index].id??0);
                                context.pushNamed(AppRoutes.laboratoryApplicationDetails.name).then((onValue){
                                  if(onValue!=null){
                                    bloc.applications('4');
                                  }
                                });
                              }),
                        ),
                      ),
                      LazyLoadScrollView(
                        isLoading: state.isPaging,
                        scrollOffset: 300,
                        onEndOfPage: () => bloc.pagingApplications('5'),
                        child: ListView.builder(
                          itemCount: state.applications.length + (state.isPaging ? 1 : 0),
                          itemBuilder: (context, index) => index == state.applications.length
                              ? const Center(child: CircularProgressIndicator())
                              : LaboratoryApplicationItem(
                              model: state.applications[index],
                              onClick: () {
                                bloc.applicationDetails(state.applications[index].id??0);
                                context.pushNamed(AppRoutes.laboratoryApplicationDetails.name).then((onValue){
                                  if(onValue!=null){
                                    bloc.applications('5');
                                  }
                                });
                              }),
                        ),
                      ),
                    ]),
              ):Center(child: CircularProgressIndicator(color: AppColors.mainColor,))
            ],
          );
        },
      ),
    );
  }
}
