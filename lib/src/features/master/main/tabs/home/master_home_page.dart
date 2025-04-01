import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/assets/app_images.dart';
import 'package:het/src/config/components/app_container.dart';
import 'package:het/src/config/theme/text_styles.dart';
import 'package:het/src/core/app_state/cubit/app_cubit.dart';
import 'package:het/src/core/util/chart/chart_data.dart';
import 'package:het/src/features/master/home/data/bodies/stats_body.dart';
import 'package:het/src/features/master/home/presentation/manager/master_home_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MasterHomePage extends StatefulWidget {
  const MasterHomePage({super.key});

  @override
  State<MasterHomePage> createState() => _MasterHomePageState();
}

class _MasterHomePageState extends State<MasterHomePage> {
  late final bloc = context.read<MasterHomeBloc>();
  late final cubit = context.read<AppCubit>();

  @override
  void initState() {
    super.initState();
    bloc.masterStats(StatsBody(type: cubit.state.userModel?.positions?.first.hetObject?.type?.id??'', role: cubit.state.userModel?.positions?.first.type?.id));
    bloc.masterQuarters(StatsBody(type: cubit.state.userModel?.positions?.first.hetObject?.type?.id??'', role: cubit.state.userModel?.positions?.first.type?.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MasterHomeBloc, MasterHomeState>(
        builder: (context, state) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Table(
                  children: [
                    TableRow(children: [
                      AppContainer(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              spacing: 8.0,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  S.of(context).allTasks,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Text(
                                  state.stats?.totalTasksCount.toString() ??
                                      '-',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                              ],
                            ),
                            Image.asset(
                              AppImages.home1,
                              height: 32,
                            )
                          ],
                        ),
                      ),
                      AppContainer(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              spacing: 8.0,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  S.of(context).inProccess,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Text(
                                  state.stats?.totalInProcessTasksCount
                                          .toString() ??
                                      '-',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                              ],
                            ),
                            Image.asset(
                              AppImages.home2,
                              height: 32,
                            )
                          ],
                        ),
                      ),
                    ]),
                    TableRow(children: [
                      AppContainer(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              spacing: 8.0,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  S.of(context).inAnticipation,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Text(
                                  state.stats?.totalInAwaitingTasksCount
                                          .toString() ??
                                      '-',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                              ],
                            ),
                            Image.asset(
                              AppImages.home3,
                              height: 32,
                            )
                          ],
                        ),
                      ),
                      AppContainer(
                        padding: EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              spacing: 8.0,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  S.of(context).complated,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                                Text(
                                  state.stats?.totalCompletedTasksCount
                                          .toString() ??
                                      '-',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium
                                      ?.copyWith(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                              ],
                            ),
                            Image.asset(
                              AppImages.home3,
                              height: 32,
                            )
                          ],
                        ),
                      ),
                    ]),
                  ],
                ),
                AppContainer(
                  child: Column(
                    children: [
                      SfCircularChart(
                          margin: EdgeInsets.zero,
                          tooltipBehavior: TooltipBehavior(enable: true),
                          title: ChartTitle(
                            text: S.of(context).capitalRepair,
                            textStyle: CustomTextStyle.h18SB,
                            alignment: ChartAlignment.near,
                          ),
                          legend: Legend(
                            isVisible: true,
                            position: LegendPosition.right,
                            isResponsive: false,
                            textStyle: CustomTextStyle.h14R,
                          ),
                          annotations: [
                            CircularChartAnnotation(
                                widget: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text:
                                    '${(state.quarters?.capitalQ1Done ?? 0) + (state.quarters?.capitalQ2Done ?? 0) + (state.quarters?.capitalQ3Done ?? 0) + (state.quarters?.capitalQ4Done ?? 0)}\n',
                                style: Theme.of(context).textTheme.titleLarge,
                                children: <TextSpan>[
                                  TextSpan(
                                      text: S.of(context).total,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium),
                                ],
                              ),
                            )),
                          ],
                          series: <CircularSeries<ChartData, String>>[
                            DoughnutSeries<ChartData, String>(
                              explode: true,
                              innerRadius: '55',
                              legendIconType: LegendIconType.circle,
                              dataSource: [
                                ChartData(
                                    S.of(context).quarter(1),
                                    state.quarters?.capitalQ1Done?.toDouble() ??
                                        0.0),
                                ChartData(
                                    S.of(context).quarter(2),
                                    state.quarters?.capitalQ2Done?.toDouble() ??
                                        0.0),
                                ChartData(
                                    S.of(context).quarter(3),
                                    state.quarters?.capitalQ3Done?.toDouble() ??
                                        0.0),
                                ChartData(
                                    S.of(context).quarter(4),
                                    state.quarters?.capitalQ4Done?.toDouble() ??
                                        0.0),
                              ],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y,
                              dataLabelMapper: (data, _) =>
                                  data.y.toInt().toString(),
                            )
                          ]),
                    ],
                  ),
                ),
                AppContainer(
                  child: Column(
                    children: [
                      SfCircularChart(
                          margin: EdgeInsets.zero,
                          tooltipBehavior: TooltipBehavior(enable: true),
                          title: ChartTitle(
                            text: S.of(context).currentRepair,
                            textStyle: CustomTextStyle.h18SB,
                            alignment: ChartAlignment.near,
                          ),
                          legend: Legend(
                            isVisible: true,
                            position: LegendPosition.right,
                            isResponsive: false,
                            textStyle: CustomTextStyle.h14R,
                          ),
                          annotations: [
                            CircularChartAnnotation(
                                widget: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text:
                                    '${(state.quarters?.currentQ1Done ?? 0) + (state.quarters?.currentQ2Done ?? 0) + (state.quarters?.currentQ3Done ?? 0) + (state.quarters?.currentQ4Done ?? 0)}\n',
                                style: Theme.of(context).textTheme.titleLarge,
                                children: <TextSpan>[
                                  TextSpan(
                                      text: S.of(context).total,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium),
                                ],
                              ),
                            )),
                          ],
                          series: <CircularSeries<ChartData, String>>[
                            DoughnutSeries<ChartData, String>(
                              explode: true,
                              innerRadius: '55',
                              legendIconType: LegendIconType.circle,
                              dataSource: [
                                ChartData(
                                    S.of(context).quarter(1),
                                    state.quarters?.currentQ1Done?.toDouble() ??
                                        0.0),
                                ChartData(
                                    S.of(context).quarter(2),
                                    state.quarters?.currentQ2Done?.toDouble() ??
                                        0.0),
                                ChartData(
                                    S.of(context).quarter(3),
                                    state.quarters?.currentQ3Done?.toDouble() ??
                                        0.0),
                                ChartData(
                                    S.of(context).quarter(4),
                                    state.quarters?.currentQ4Done?.toDouble() ??
                                        0.0),
                              ],
                              xValueMapper: (ChartData data, _) => data.x,
                              yValueMapper: (ChartData data, _) => data.y,
                              dataLabelMapper: (data, _) =>
                                  data.y.toInt().toString(),
                            )
                          ]),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
