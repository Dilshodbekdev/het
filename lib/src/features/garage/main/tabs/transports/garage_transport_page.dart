import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/components/app_container.dart';
import 'package:het/src/config/theme/app_colors.dart';
import 'package:het/src/config/theme/text_styles.dart';
import 'package:het/src/core/router/app_routes.dart';
import 'package:het/src/features/engineer/transport/presentation/manager/engineer_transport_bloc.dart';
import 'package:het/src/features/garage/main/tabs/transports/widgets/garage_transport_item.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

class GarageTransportPage extends StatefulWidget {
  const GarageTransportPage({super.key});

  @override
  State<GarageTransportPage> createState() => _GarageTransportPageState();
}

class _GarageTransportPageState extends State<GarageTransportPage> with TickerProviderStateMixin{
  late final bloc = context.read<EngineerTransportBloc>();
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
    bloc.transports(null);
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
      bloc.transports(_previousTabIndex==0?null:_previousTabIndex.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<EngineerTransportBloc, EngineerTransportState>(
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
                    Tab(text: S.of(context).free),
                    Tab(text: S.of(context).borrow),
                    Tab(text: S.of(context).repair),
                  ],
                ),
              ),
              !state.isLoading?
              Expanded(
                child: TabBarView(
                    controller: _tabController,
                    children: [
                      LazyLoadScrollView(
                        isLoading: state.isPagingTransport,
                        scrollOffset: 300,
                        onEndOfPage: () => bloc.pagingTransports(null),
                        child: ListView.builder(
                          itemCount: state.transports.length + (state.isPagingTransport ? 1 : 0),
                          itemBuilder: (context, index) => index == state.transports.length
                              ? const Center(child: CircularProgressIndicator())
                              : GarageTransportItem(
                              model: state.transports[index],
                              onClick: () {
                                bloc.transportDetails(state.transports[index].id??0);
                                context.pushNamed(AppRoutes.garageTransportDetails.name).then((onValue){
                                  if(onValue!=null){
                                    bloc.transports(null);
                                  }
                                });
                              }),
                        ),
                      ),
                      LazyLoadScrollView(
                        isLoading: state.isPagingTransport,
                        scrollOffset: 300,
                        onEndOfPage: () => bloc.pagingTransports('1'),
                        child: ListView.builder(
                          itemCount: state.transports.length + (state.isPagingTransport ? 1 : 0),
                          itemBuilder: (context, index) => index == state.transports.length
                              ? const Center(child: CircularProgressIndicator())
                              : GarageTransportItem(
                              model: state.transports[index],
                              onClick: () {
                                bloc.transportDetails(state.transports[index].id??0);
                                context.pushNamed(AppRoutes.garageTransportDetails.name).then((onValue){
                                  if(onValue!=null){
                                    bloc.transports('1');
                                  }
                                });
                              }),
                        ),
                      ),
                      LazyLoadScrollView(
                        isLoading: state.isPagingTransport,
                        scrollOffset: 300,
                        onEndOfPage: () => bloc.pagingTransports('2'),
                        child: ListView.builder(
                          itemCount: state.transports.length + (state.isPagingTransport ? 1 : 0),
                          itemBuilder: (context, index) => index == state.transports.length
                              ? const Center(child: CircularProgressIndicator())
                              : GarageTransportItem(
                              model: state.transports[index],
                              onClick: () {
                                bloc.transportDetails(state.transports[index].id??0);
                                context.pushNamed(AppRoutes.garageTransportDetails.name).then((onValue){
                                  if(onValue!=null){
                                    bloc.transports('2');
                                  }
                                });
                              }),
                        ),
                      ),
                      LazyLoadScrollView(
                        isLoading: state.isPagingTransport,
                        scrollOffset: 300,
                        onEndOfPage: () => bloc.pagingTransports('3'),
                        child: ListView.builder(
                          itemCount: state.transports.length + (state.isPagingTransport ? 1 : 0),
                          itemBuilder: (context, index) => index == state.transports.length
                              ? const Center(child: CircularProgressIndicator())
                              : GarageTransportItem(
                              model: state.transports[index],
                              onClick: () {
                                bloc.transportDetails(state.transports[index].id??0);
                                context.pushNamed(AppRoutes.garageTransportDetails.name).then((onValue){
                                  if(onValue!=null){
                                    bloc.transports('3');
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
