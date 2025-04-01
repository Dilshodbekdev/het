import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/assets/app_icons.dart';
import 'package:het/src/config/components/app_container.dart';
import 'package:het/src/config/theme/app_colors.dart';
import 'package:het/src/config/theme/text_styles.dart';
import 'package:het/src/core/router/app_routes.dart';
import 'package:het/src/features/engineer/production/presentation/manager/engineer_production_bloc.dart';
import 'package:het/src/features/engineer/production/presentation/widgets/master_task_item.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class EngineerMasterTasksPage extends StatefulWidget {
  final String name;
  final int id;

  const EngineerMasterTasksPage(
      {super.key, required this.name, required this.id});

  @override
  State<EngineerMasterTasksPage> createState() =>
      _EngineerMasterTasksPageState();
}

class _EngineerMasterTasksPageState extends State<EngineerMasterTasksPage> with TickerProviderStateMixin {
  late final bloc = context.read<EngineerProductionBloc>();
  int _previousTabIndex = 0;

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
    bloc.masterTasks('', widget.id);
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
      bloc.masterTasks(_previousTabIndex == 0 ? '' : (_previousTabIndex + 1).toString(), widget.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainColor,
        onPressed: () {
          bloc.taskTypes();
          context.pushNamed(AppRoutes.engineerFormTask.name, pathParameters: {'id': widget.id.toString()}).then((onValue){
            if(onValue!=null){
              bloc.masterTasks(_previousTabIndex == 0 ? '' : (_previousTabIndex + 1).toString(), widget.id);
            }
          });
        },
        child: SvgPicture.asset(AppIcons.cloud),
      ),
      body: BlocConsumer<EngineerProductionBloc, EngineerProductionState>(
        listener: (context, state) {
          if (state.isRemontTaskDeleted) {
            bloc.masterTasks(_previousTabIndex == 0 ? '' : (_previousTabIndex + 1).toString(), widget.id);
          }
          if (state.isObxodTaskDeleted) {
            bloc.masterTasks(_previousTabIndex == 0 ? '' : (_previousTabIndex + 1).toString(), widget.id);
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
                    Tab(text: S.of(context).didntStart),
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
                    onEndOfPage: () => bloc.pagingMasterTasks('', widget.id),
                    child: ListView.builder(
                      itemCount: state.masterTasks.length +
                          (state.isPagingMasterTasks ? 1 : 0),
                      itemBuilder: (context, index) => index ==
                              state.masterTasks.length
                          ? const Center(child: CircularProgressIndicator())
                          : MasterTaskItem(
                              model: state.masterTasks[index],
                              onLookClick: () {
                                if (state.masterTasks[index].type == '3') {
                                  bloc.obxodDetails(state.masterTasks[index].id ?? 0);
                                  context.pushNamed(AppRoutes.engineerObxodTaskDetails.name).then((onValue){
                                    if(onValue!=null){
                                      bloc.masterTasks(_previousTabIndex == 0 ? '' : (_previousTabIndex + 1).toString(), widget.id);
                                    }
                                  });
                                } else {
                                  bloc.remontDetails(state.masterTasks[index].id ?? 0);
                                  context.pushNamed(AppRoutes.engineerRemontTaskDetails.name).then((onValue){
                                    if(onValue!=null){
                                      bloc.masterTasks(_previousTabIndex == 0 ? '' : (_previousTabIndex + 1).toString(), widget.id);
                                    }
                                  });
                                }
                              },
                              onDeleteClick: () {
                                if (state.masterTasks[index].type == '3') {
                                  bloc.deleteObxod(state.masterTasks[index].id ?? 0);
                                } else {
                                  bloc.deleteRemont(state.masterTasks[index].id ?? 0);
                                }
                              },
                            ),
                    ),
                  ),
                  LazyLoadScrollView(
                    isLoading: state.isPagingMasterTasks,
                    scrollOffset: 300,
                    onEndOfPage: () => bloc.pagingMasterTasks('2', widget.id),
                    child: ListView.builder(
                      itemCount: state.masterTasks.length +
                          (state.isPagingMasterTasks ? 1 : 0),
                      itemBuilder: (context, index) => index ==
                              state.masterTasks.length
                          ? const Center(child: CircularProgressIndicator())
                          : MasterTaskItem(
                              model: state.masterTasks[index],
                        onLookClick: () {
                          if (state.masterTasks[index].type == '3') {
                            bloc.obxodDetails(state.masterTasks[index].id ?? 0);
                            context.pushNamed(AppRoutes.engineerObxodTaskDetails.name);
                          } else {
                            bloc.remontDetails(state.masterTasks[index].id ?? 0);
                            context.pushNamed(AppRoutes.engineerRemontTaskDetails.name);
                          }
                        },
                        onDeleteClick: () {
                          if (state.masterTasks[index].type == '3') {
                            bloc.deleteObxod(state.masterTasks[index].id ?? 0);
                          } else {
                            bloc.deleteRemont(state.masterTasks[index].id ?? 0);
                          }
                        },
                            ),
                    ),
                  ),
                  LazyLoadScrollView(
                    isLoading: state.isPagingMasterTasks,
                    scrollOffset: 300,
                    onEndOfPage: () => bloc.pagingMasterTasks('3', widget.id),
                    child: ListView.builder(
                      itemCount: state.masterTasks.length +
                          (state.isPagingMasterTasks ? 1 : 0),
                      itemBuilder: (context, index) => index ==
                              state.masterTasks.length
                          ? const Center(child: CircularProgressIndicator())
                          : MasterTaskItem(
                              model: state.masterTasks[index],
                        onLookClick: () {
                          if (state.masterTasks[index].type == '3') {
                            bloc.obxodDetails(state.masterTasks[index].id ?? 0);
                            context.pushNamed(AppRoutes.engineerObxodTaskDetails.name);
                          } else {
                            bloc.remontDetails(state.masterTasks[index].id ?? 0);
                            context.pushNamed(AppRoutes.engineerRemontTaskDetails.name);
                          }
                        },
                        onDeleteClick: () {
                          if (state.masterTasks[index].type == '3') {
                            bloc.deleteObxod(state.masterTasks[index].id ?? 0);
                          } else {
                            bloc.deleteRemont(state.masterTasks[index].id ?? 0);
                          }
                        },
                            ),
                    ),
                  ),
                  LazyLoadScrollView(
                    isLoading: state.isPagingMasterTasks,
                    scrollOffset: 300,
                    onEndOfPage: () => bloc.pagingMasterTasks('4', widget.id),
                    child: ListView.builder(
                      itemCount: state.masterTasks.length +
                          (state.isPagingMasterTasks ? 1 : 0),
                      itemBuilder: (context, index) => index ==
                              state.masterTasks.length
                          ? const Center(child: CircularProgressIndicator())
                          : MasterTaskItem(
                              model: state.masterTasks[index],
                        onLookClick: () {
                          if (state.masterTasks[index].type == '3') {
                            bloc.obxodDetails(state.masterTasks[index].id ?? 0);
                            context.pushNamed(AppRoutes.engineerObxodTaskDetails.name);
                          } else {
                            bloc.remontDetails(state.masterTasks[index].id ?? 0);
                            context.pushNamed(AppRoutes.engineerRemontTaskDetails.name);
                          }
                        },
                        onDeleteClick: () {
                          if (state.masterTasks[index].type == '3') {
                            bloc.deleteObxod(state.masterTasks[index].id ?? 0);
                          } else {
                            bloc.deleteRemont(state.masterTasks[index].id ?? 0);
                          }
                        },
                            ),
                    ),
                  ),
                  LazyLoadScrollView(
                    isLoading: state.isPagingMasterTasks,
                    scrollOffset: 300,
                    onEndOfPage: () => bloc.pagingMasterTasks('5', widget.id),
                    child: ListView.builder(
                      itemCount: state.masterTasks.length +
                          (state.isPagingMasterTasks ? 1 : 0),
                      itemBuilder: (context, index) => index ==
                              state.masterTasks.length
                          ? const Center(child: CircularProgressIndicator())
                          : MasterTaskItem(
                              model: state.masterTasks[index],
                        onLookClick: () {
                          if (state.masterTasks[index].type == '3') {
                            bloc.obxodDetails(state.masterTasks[index].id ?? 0);
                            context.pushNamed(AppRoutes.engineerObxodTaskDetails.name);
                          } else {
                            bloc.remontDetails(state.masterTasks[index].id ?? 0);
                            context.pushNamed(AppRoutes.engineerRemontTaskDetails.name);
                          }
                        },
                        onDeleteClick: () {
                          if (state.masterTasks[index].type == '3') {
                            bloc.deleteObxod(state.masterTasks[index].id ?? 0);
                          } else {
                            bloc.deleteRemont(state.masterTasks[index].id ?? 0);
                          }
                        },
                            ),
                    ),
                  ),
                  LazyLoadScrollView(
                    isLoading: state.isPagingMasterTasks,
                    scrollOffset: 300,
                    onEndOfPage: () => bloc.pagingMasterTasks('6', widget.id),
                    child: ListView.builder(
                      itemCount: state.masterTasks.length +
                          (state.isPagingMasterTasks ? 1 : 0),
                      itemBuilder: (context, index) => index ==
                              state.masterTasks.length
                          ? const Center(child: CircularProgressIndicator())
                          : MasterTaskItem(
                              model: state.masterTasks[index],
                        onLookClick: () {
                          if (state.masterTasks[index].type == '3') {
                            bloc.obxodDetails(state.masterTasks[index].id ?? 0);
                            context.pushNamed(AppRoutes.engineerObxodTaskDetails.name);
                          } else {
                            bloc.remontDetails(state.masterTasks[index].id ?? 0);
                            context.pushNamed(AppRoutes.engineerRemontTaskDetails.name);
                          }
                        },
                        onDeleteClick: () {
                          if (state.masterTasks[index].type == '3') {
                            bloc.deleteObxod(state.masterTasks[index].id ?? 0);
                          } else {
                            bloc.deleteRemont(state.masterTasks[index].id ?? 0);
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
