import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/components/app_container.dart';
import 'package:het/src/config/theme/app_colors.dart';
import 'package:het/src/config/theme/text_styles.dart';
import 'package:het/src/core/router/app_routes.dart';
import 'package:het/src/features/engineer/laboratory/presentation/manager/engineer_laboratory_bloc.dart';
import 'package:het/src/features/engineer/main/tabs/laboratory/widgets/application_item.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class EngineerLaboratoryPage extends StatefulWidget {
  const EngineerLaboratoryPage({super.key});

  @override
  State<EngineerLaboratoryPage> createState() => _EngineerLaboratoryPageState();
}

class _EngineerLaboratoryPageState extends State<EngineerLaboratoryPage> with TickerProviderStateMixin{
  late final bloc = context.read<EngineerLaboratoryBloc>();
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
      bloc.applications(_previousTabIndex==0?null:_previousTabIndex.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.mainColor,
        onPressed: (){
          bloc.applicationTypes();
           context.pushNamed(AppRoutes.engineerCreateLaboratoryApplication.name).then((onValue){
             if(onValue!=null){
               bloc.applications(_previousTabIndex==0?null:_previousTabIndex.toString());
             }
           });
        },child: Icon(Icons.add,color: Colors.white,)),
      body: BlocBuilder<EngineerLaboratoryBloc, EngineerLaboratoryState>(
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
                    Tab(text: S.of(context).approved),
                    Tab(text: S.of(context).rejected),
                    Tab(text: S.of(context).inProccess),
                    Tab(text: S.of(context).complated),
                  ],
                ),
              ),
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
                              : ApplicationItem(
                              model: state.applications[index],
                              onClick: () {
                                bloc.applicationDetails(state.applications[index].id??0);
                                context.pushNamed(AppRoutes.engineerLaboratoryApplicationDetails.name);
                              }),
                        ),
                      ),
                      LazyLoadScrollView(
                        isLoading: state.isPaging,
                        scrollOffset: 300,
                        onEndOfPage: () => bloc.pagingApplications('1'),
                        child: ListView.builder(
                          itemCount: state.applications.length + (state.isPaging ? 1 : 0),
                          itemBuilder: (context, index) => index == state.applications.length
                              ? const Center(child: CircularProgressIndicator())
                              : ApplicationItem(
                              model: state.applications[index],
                              onClick: () {
                                bloc.applicationDetails(state.applications[index].id??0);
                                context.pushNamed(AppRoutes.engineerLaboratoryApplicationDetails.name);
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
                              : ApplicationItem(
                              model: state.applications[index],
                              onClick: () {
                                bloc.applicationDetails(state.applications[index].id??0);
                                context.pushNamed(AppRoutes.engineerLaboratoryApplicationDetails.name);
                              }),
                        ),
                      ),
                      LazyLoadScrollView(
                        isLoading: state.isPaging,
                        scrollOffset: 300,
                        onEndOfPage: () => bloc.pagingApplications('3'),
                        child: ListView.builder(
                          itemCount: state.applications.length + (state.isPaging ? 1 : 0),
                          itemBuilder: (context, index) => index == state.applications.length
                              ? const Center(child: CircularProgressIndicator())
                              : ApplicationItem(
                              model: state.applications[index],
                              onClick: () {
                                bloc.applicationDetails(state.applications[index].id??0);
                                context.pushNamed(AppRoutes.engineerLaboratoryApplicationDetails.name);
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
                              : ApplicationItem(
                              model: state.applications[index],
                              onClick: () {
                                bloc.applicationDetails(state.applications[index].id??0);
                                context.pushNamed(AppRoutes.engineerLaboratoryApplicationDetails.name);
                              }),
                        ),
                      ),
                      LazyLoadScrollView(
                        isLoading: state.isPaging,
                        scrollOffset: 300,
                        onEndOfPage: () => bloc.pagingApplications('6'),
                        child: ListView.builder(
                          itemCount: state.applications.length + (state.isPaging ? 1 : 0),
                          itemBuilder: (context, index) => index == state.applications.length
                              ? const Center(child: CircularProgressIndicator())
                              : ApplicationItem(
                              model: state.applications[index],
                              onClick: () {
                                bloc.applicationDetails(state.applications[index].id??0);
                                context.pushNamed(AppRoutes.engineerLaboratoryApplicationDetails.name);
                              }),
                        ),
                      ),
                    ]),
              )
            ],
          );
        },
      ),
    );
  }
}
