import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/components/app_container.dart';
import 'package:het/src/config/theme/app_colors.dart';
import 'package:het/src/config/theme/text_styles.dart';
import 'package:het/src/core/app_state/cubit/app_cubit.dart';
import 'package:het/src/core/router/app_routes.dart';
import 'package:het/src/features/engineer/production/presentation/manager/engineer_production_bloc.dart';
import 'package:het/src/features/master/main/tabs/tasks/widgets/master_task_item.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class MasterTasksPage extends StatefulWidget {
  const MasterTasksPage({super.key});

  @override
  State<MasterTasksPage> createState() => _MasterTasksPageState();
}

class _MasterTasksPageState extends State<MasterTasksPage> with TickerProviderStateMixin {
  late final bloc = context.read<EngineerProductionBloc>();
  late final appBloc = context.read<AppCubit>();
  int _previousTabIndex = 0;
  int _masterId = -1;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 6,
      vsync: this,
    );
    _tabController.addListener(_listenToTabChanges);
    _masterId=appBloc.state.userModel?.id??0;
    bloc.masterTasks('', _masterId);
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
      bloc.masterTasks(_previousTabIndex == 0 ? '' : (_previousTabIndex + 1).toString(), _masterId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<EngineerProductionBloc, EngineerProductionState>(
        listener: (context, state) {
          if (state.isRemontTaskDeleted) {
            bloc.masterTasks(_previousTabIndex == 0 ? '' : (_previousTabIndex + 1).toString(), _masterId);
          }
          if (state.isObxodTaskDeleted) {
            bloc.masterTasks(_previousTabIndex == 0 ? '' : (_previousTabIndex + 1).toString(), _masterId);
          }
        },
        builder: (context, state) {
          return  Column(
            children: [
              AppContainer(
                margin: const EdgeInsets.only(
                    right: 16, left: 16, top: 16, bottom: 8),
                padding: const EdgeInsets.all(4),
                radius: 6,
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
                    Tab(text: S.of(context).currentTasks),
                    Tab(text: S.of(context).new1),
                    Tab(text: S.of(context).inProccess),
                    Tab(text: S.of(context).awaitingConfirmation),
                    Tab(text: S.of(context).complated),
                    Tab(text: S.of(context).rejected),
                  ],
                ),
              ),
              !state.isLoading?
              Expanded(
                child: TabBarView(
                    controller: _tabController,
                    children: [
                      LazyLoadScrollView(
                        isLoading: state.isPagingMasterTasks,
                        scrollOffset: 300,
                        onEndOfPage: () => bloc.pagingMasterTasks('', _masterId),
                        child: ListView.builder(
                          itemCount: state.masterTasks.length +
                              (state.isPagingMasterTasks ? 1 : 0),
                          itemBuilder: (context, index) => index ==
                              state.masterTasks.length
                              ? const Center(child: CircularProgressIndicator())
                              : TaskItem(
                            model: state.masterTasks[index],
                            onClick: () {
                              if (state.masterTasks[index].type == '3') {
                                bloc.obxodDetails(state.masterTasks[index].id ?? 0);
                                context.pushNamed(AppRoutes.masterObxodTaskDetails.name).then((onValue){
                                  if(onValue!=null){
                                    bloc.masterTasks(_previousTabIndex == 0 ? '' : (_previousTabIndex + 1).toString(), _masterId);
                                  }
                                });
                              } else {
                                bloc.remontDetails(state.masterTasks[index].id ?? 0);
                                context.pushNamed(AppRoutes.masterRemontTaskDetails.name).then((onValue){
                                  if(onValue!=null){
                                    bloc.masterTasks(_previousTabIndex == 0 ? '' : (_previousTabIndex + 1).toString(), _masterId);
                                  }
                                });
                              }
                            },
                          ),
                        ),
                      ),
                      LazyLoadScrollView(
                        isLoading: state.isPagingMasterTasks,
                        scrollOffset: 300,
                        onEndOfPage: () => bloc.pagingMasterTasks('2', _masterId),
                        child: ListView.builder(
                          itemCount: state.masterTasks.length +
                              (state.isPagingMasterTasks ? 1 : 0),
                          itemBuilder: (context, index) => index ==
                              state.masterTasks.length
                              ? const Center(child: CircularProgressIndicator())
                              : TaskItem(
                            model: state.masterTasks[index],
                            onClick: () {
                              if (state.masterTasks[index].type == '3') {
                                bloc.obxodDetails(state.masterTasks[index].id ?? 0);
                                context.pushNamed(AppRoutes.masterObxodTaskDetails.name);
                              } else {
                                bloc.remontDetails(state.masterTasks[index].id ?? 0);
                                context.pushNamed(AppRoutes.masterRemontTaskDetails.name);
                              }
                            },
                          ),
                        ),
                      ),
                      LazyLoadScrollView(
                        isLoading: state.isPagingMasterTasks,
                        scrollOffset: 300,
                        onEndOfPage: () => bloc.pagingMasterTasks('3', _masterId),
                        child: ListView.builder(
                          itemCount: state.masterTasks.length +
                              (state.isPagingMasterTasks ? 1 : 0),
                          itemBuilder: (context, index) => index ==
                              state.masterTasks.length
                              ? const Center(child: CircularProgressIndicator())
                              : TaskItem(
                            model: state.masterTasks[index],
                            onClick: () {
                              if (state.masterTasks[index].type == '3') {
                                bloc.obxodDetails(state.masterTasks[index].id ?? 0);
                                context.pushNamed(AppRoutes.masterObxodTaskDetails.name);
                              } else {
                                bloc.remontDetails(state.masterTasks[index].id ?? 0);
                                context.pushNamed(AppRoutes.masterRemontTaskDetails.name);
                              }
                            },
                          ),
                        ),
                      ),
                      LazyLoadScrollView(
                        isLoading: state.isPagingMasterTasks,
                        scrollOffset: 300,
                        onEndOfPage: () => bloc.pagingMasterTasks('4', _masterId),
                        child: ListView.builder(
                          itemCount: state.masterTasks.length +
                              (state.isPagingMasterTasks ? 1 : 0),
                          itemBuilder: (context, index) => index ==
                              state.masterTasks.length
                              ? const Center(child: CircularProgressIndicator())
                              : TaskItem(
                            model: state.masterTasks[index],
                            onClick: () {
                              if (state.masterTasks[index].type == '3') {
                                bloc.obxodDetails(state.masterTasks[index].id ?? 0);
                                context.pushNamed(AppRoutes.masterObxodTaskDetails.name);
                              } else {
                                bloc.remontDetails(state.masterTasks[index].id ?? 0);
                                context.pushNamed(AppRoutes.masterRemontTaskDetails.name);
                              }
                            },
                          ),
                        ),
                      ),
                      LazyLoadScrollView(
                        isLoading: state.isPagingMasterTasks,
                        scrollOffset: 300,
                        onEndOfPage: () => bloc.pagingMasterTasks('5', _masterId),
                        child: ListView.builder(
                          itemCount: state.masterTasks.length +
                              (state.isPagingMasterTasks ? 1 : 0),
                          itemBuilder: (context, index) => index ==
                              state.masterTasks.length
                              ? const Center(child: CircularProgressIndicator())
                              : TaskItem(
                            model: state.masterTasks[index],
                            onClick: () {
                              if (state.masterTasks[index].type == '3') {
                                bloc.obxodDetails(state.masterTasks[index].id ?? 0);
                                context.pushNamed(AppRoutes.masterObxodTaskDetails.name);
                              } else {
                                bloc.remontDetails(state.masterTasks[index].id ?? 0);
                                context.pushNamed(AppRoutes.masterRemontTaskDetails.name);
                              }
                            },
                          ),
                        ),
                      ),
                      LazyLoadScrollView(
                        isLoading: state.isPagingMasterTasks,
                        scrollOffset: 300,
                        onEndOfPage: () => bloc.pagingMasterTasks('6', _masterId),
                        child: ListView.builder(
                          itemCount: state.masterTasks.length +
                              (state.isPagingMasterTasks ? 1 : 0),
                          itemBuilder: (context, index) => index ==
                              state.masterTasks.length
                              ? const Center(child: CircularProgressIndicator())
                              : TaskItem(
                            model: state.masterTasks[index],
                            onClick: () {
                              if (state.masterTasks[index].type == '3') {
                                bloc.obxodDetails(state.masterTasks[index].id ?? 0);
                                context.pushNamed(AppRoutes.masterObxodTaskDetails.name);
                              } else {
                                bloc.remontDetails(state.masterTasks[index].id ?? 0);
                                context.pushNamed(AppRoutes.masterRemontTaskDetails.name);
                              }
                            },
                          ),
                        ),
                      ),
                    ]),
              ):
              Center(child: CircularProgressIndicator(color: AppColors.mainColor,))
            ],
          );
        },
      ),
    );
  }
}
