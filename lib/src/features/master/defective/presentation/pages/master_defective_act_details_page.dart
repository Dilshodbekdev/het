import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/components/app_container.dart';
import 'package:het/src/config/theme/app_colors.dart';
import 'package:het/src/core/util/funs.dart';
import 'package:het/src/features/master/defective/presentation/manager/master_defective_act_bloc.dart';
import 'package:het/src/features/master/main/tabs/defective/widgets/funs.dart';
import 'package:het/src/features/master/main/tabs/tasks/widgets/row_texts.dart';
import 'package:intl/intl.dart';

class MasterDefectiveActDetailsPage extends StatelessWidget {
  const MasterDefectiveActDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MasterDefectiveActBloc, MasterDefectiveActState>(
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).details),
      ),
      body: !state.isLoading? SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16.0,
          children: [
            Text(
              S.of(context).basicData,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            AppContainer(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.all(8.0),
              child: Column(
                spacing: 8.0,
                children: [
                  RowTexts(text1: S.of(context).object, text2: state.defectiveActDetails?.hetObjectProperty?.name??'-'),
                  RowTexts(text1: S.of(context).fitters, text2: state.defectiveActDetails?.fitters?.map((e)=>e.fullName).toList().join(', ')??'-'),
                  RowTexts(text1: S.of(context).documentCreationDate, text2: DateFormat("dd.MM.yyyy, HH:mm").format(DateTime.parse(state.defectiveActDetails?.createdAt ?? ''))),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4.0),
                          child: Text(
                            S.of(context).status,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(color: Colors.grey),
                          ),
                        ),
                        Container(
                          padding:
                          EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                          decoration: BoxDecoration(
                              color: getDefectiveActColor(state.defectiveActDetails?.status ?? '')
                                  .withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: getDefectiveActColor(state.defectiveActDetails?.status ?? ''))),
                          child: Text(
                            getDefectiveActTitle(state.defectiveActDetails?.status ?? '',context),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                color: getDefectiveActColor(state.defectiveActDetails?.status ?? '')),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ]),
                  RowTexts(text1: S.of(context).comments, text2: state.defectiveActDetails?.masterComment??'-'),
                ],
              ),
            ),
            Text(
              S.of(context).tasks,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            state.defectiveActDetails?.defectWorks?.isNotEmpty==true?
            AppContainer(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.all(8.0),
              child: DataTable(
                showCheckboxColumn: false,
                dividerThickness: 1,
                border: TableBorder.all(color: AppColors.borderColor,borderRadius: BorderRadius.circular(8)),
                columns: [
                  appDataColumn(S.of(context).name),
                  appDataColumn(S.of(context).unitOf),
                  appDataColumn(S.of(context).qty),
                ],
                rows: List<DataRow>.generate(
                  state.defectiveActDetails?.defectWorks?.length ?? 0,
                      (index) => DataRow(
                    onSelectChanged: (selected) {},
                    cells: <DataCell>[
                      DataCell(Text(state.defectiveActDetails?.defectWorks?[index].name??'-')),
                      DataCell(Text(state.defectiveActDetails?.defectWorks?[index].unit?.name??'-')),
                      DataCell(Text(state.defectiveActDetails?.defectWorks?[index].quantity.toString()??'-')),
                    ],
                  ),
                ),
              ),
            ):const Center(child: CircularProgressIndicator(color: AppColors.mainColor,)),
            if(state.defectiveActDetails?.status=='3'||state.defectiveActDetails?.status=='7')
              Text(
                S.of(context).reasonforrefusal,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            if(state.defectiveActDetails?.status=='3'||state.defectiveActDetails?.status=='7')
              AppContainer(
                color: Colors.redAccent.withValues(alpha: 0.2),
                margin: EdgeInsets.zero,
                padding: EdgeInsets.all(8.0),
                child: Text(
                  state.defectiveActDetails?.rejectComment??'-',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black),
                  textAlign: TextAlign.end,
                ),
              ),
          ],
        ),
      ):Center(child: CircularProgressIndicator(color: AppColors.mainColor,)),
    );
  },
);
  }
}
