import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/components/app_container.dart';
import 'package:het/src/config/theme/app_colors.dart';
import 'package:het/src/config/theme/text_styles.dart';
import 'package:het/src/core/router/app_routes.dart';
import 'package:het/src/features/master/defective/presentation/manager/master_defective_act_bloc.dart';
import 'package:het/src/features/master/main/tabs/defective/widgets/defective_act_item.dart';
import 'package:het/src/features/master/main/tabs/defective/widgets/defective_act_item1.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class MasterDefectiveActPage extends StatefulWidget {
  const MasterDefectiveActPage({super.key});

  @override
  State<MasterDefectiveActPage> createState() => _MasterDefectiveActPageState();
}

class _MasterDefectiveActPageState extends State<MasterDefectiveActPage>
    with TickerProviderStateMixin {
  late final bloc = context.read<MasterDefectiveActBloc>();
  int _previousTabIndex = 0;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    _tabController.addListener(_listenToTabChanges);
    bloc.defectiveActs(false);
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
      bloc.defectiveActs(_previousTabIndex == 0 ? false : true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainColor,
        onPressed: () {
          context.pushNamed(AppRoutes.masterCreateDefectiveAct.name,
              pathParameters: {'id': '0'});
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: BlocConsumer<MasterDefectiveActBloc, MasterDefectiveActState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Column(
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
                  indicatorSize: TabBarIndicatorSize.tab,
                  splashBorderRadius: BorderRadius.circular(8),
                  labelStyle: CustomTextStyle.h16M,
                  labelColor: Colors.white,
                  unselectedLabelStyle: CustomTextStyle.h16M,
                  tabs: <Widget>[
                    Tab(text: S.of(context).sent),
                    Tab(text: S.of(context).draft),
                  ],
                ),
              ),
              !state.isLoading
                  ? Expanded(
                      child: TabBarView(controller: _tabController, children: [
                        LazyLoadScrollView(
                          isLoading: state.isPaging,
                          scrollOffset: 300,
                          onEndOfPage: () => bloc.pagingDefectiveActs(false),
                          child: ListView.builder(
                            itemCount: state.defectiveActs.length +
                                (state.isPaging ? 1 : 0),
                            itemBuilder: (context, index) => index ==
                                    state.defectiveActs.length
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : DefectiveActItem(
                                    model: state.defectiveActs[index],
                                    onLookClick: () {
                                      bloc.defectiveActDetails(
                                          state.defectiveActs[index].id ?? 0);
                                      context.pushNamed(AppRoutes
                                          .masterDefectiveActDetails.name);
                                    },
                                  ),
                          ),
                        ),
                        LazyLoadScrollView(
                          isLoading: state.isPaging,
                          scrollOffset: 300,
                          onEndOfPage: () => bloc.pagingDefectiveActs(true),
                          child: ListView.builder(
                            itemCount: state.defectiveActs.length + (state.isPaging ? 1 : 0),
                            itemBuilder: (context, index) => index == state.defectiveActs.length
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : DefectiveActItem1(
                                    model: state.defectiveActs[index],
                                    onLookClick: () {
                                      bloc.defectiveActDetails(state.defectiveActs[index].id ?? 0);
                                      context.pushNamed(AppRoutes.masterDefectiveActDetails.name);
                                    },
                                    onEditClick: () {
                                      bloc.defectiveActDetails(state.defectiveActs[index].id ?? 0);
                                      context.pushNamed(AppRoutes.masterCreateDefectiveAct.name,
                                          pathParameters: {'id': state.defectiveActs[index].id.toString()});
                                    },
                                  ),
                          ),
                        ),
                      ]),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                      color: AppColors.mainColor,
                    ))
            ],
          );
        },
      ),
    );
  }
}
