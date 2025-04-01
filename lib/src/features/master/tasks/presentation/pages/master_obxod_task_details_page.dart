import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/components/app_container.dart';
import 'package:het/src/config/components/app_elevated_button.dart';
import 'package:het/src/config/theme/app_colors.dart';
import 'package:het/src/core/router/app_routes.dart';
import 'package:het/src/features/engineer/production/presentation/manager/engineer_production_bloc.dart';
import 'package:het/src/features/engineer/production/presentation/widgets/funs.dart';
import 'package:het/src/features/master/main/tabs/tasks/widgets/row_texts.dart';

class MasterObxodTaskDetailsPage extends StatelessWidget {
  const MasterObxodTaskDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EngineerProductionBloc, EngineerProductionState>(
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).details),
      ),
      persistentFooterAlignment: AlignmentDirectional.center,
      persistentFooterButtons: state.obxodDetailsModel?.status=='3'||state.obxodDetailsModel?.status=='2'||state.obxodDetailsModel?.status=='6'? [
        Row(
          spacing: 16.0,
          children: [
            Expanded(
                child: AppElevatedButton(
                  text: S.of(context).back,
                  onClick: () {
                    context.pop();
                  },
                  bgColor: Colors.white,
                  textColor: AppColors.mainColor,
                )),
            state.obxodDetailsModel?.status=='3'?
            Expanded(child: AppElevatedButton(text: S.of(context).closed, onClick: (){
              context.pushNamed(AppRoutes.masterClosingObxodTask.name,pathParameters: {
                'id': state.obxodDetailsModel?.id.toString()??'',
                'type': state.obxodDetailsModel?.type??'',
              }).then((onValue){
                if(onValue!=null){
                  context.pop(1);
                }
              });
            })):Expanded(child: AppElevatedButton(text: S.of(context).accept, onClick: (){
              context.pushNamed(AppRoutes.masterAcceptTask.name,pathParameters: {
                'id': state.obxodDetailsModel?.id.toString()??'',
                'type': state.obxodDetailsModel?.type??'',
              }).then((onValue){
                if(onValue!=null){
                  context.pop(1);
                }
              });
            })),
          ],
        )
      ]:null,
      body: SingleChildScrollView(
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
                  RowTexts(text1: S.of(context).object, text2: state.obxodDetailsModel?.hetObjectProperty?.name??'-'),
                  RowTexts(text1: S.of(context).typeApplication, text2: getTaskType(state.obxodDetailsModel?.type??'', context)),
                  RowTexts(text1: S.of(context).description, text2: state.obxodDetailsModel?.engineerOpeningComment??'-'),
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
                              color: getColor(state.obxodDetailsModel?.status ?? '')
                                  .withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: getColor(state.obxodDetailsModel?.status ?? ''))),
                          child: Text(
                            getTitle(state.obxodDetailsModel?.status ?? '',context),
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(
                                color: getColor(state.obxodDetailsModel?.status ?? '')),
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ]),
                ],
              ),
            ),
            Text(
              S.of(context).passport,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            AppContainer(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.all(8.0),
              child: Column(
                spacing: 8.0,
                children: [
                  RowTexts(text1: S.of(context).inventoryNumber, text2: state.obxodDetailsModel?.hetObjectProperty?.inventoryNumber??'-'),
                  RowTexts(text1: S.of(context).dateOfCommissioning, text2: state.obxodDetailsModel?.hetObjectProperty?.startDate??'-'),
                  RowTexts(text1: S.of(context).objectType, text2: state.obxodDetailsModel?.hetObjectProperty?.type??''),
                  RowTexts(text1: S.of(context).voltage, text2: "${state.obxodDetailsModel?.hetObjectProperty?.voltage?.value} ${state.remontDetailsModel?.hetObjectProperty?.voltage?.unit}"),
                  RowTexts(text1: S.of(context).section, text2: "${state.obxodDetailsModel?.hetObjectProperty?.size?.value} ${state.remontDetailsModel?.hetObjectProperty?.size?.unit}"),
                  RowTexts(text1: S.of(context).cableType, text2: state.obxodDetailsModel?.hetObjectProperty?.typeCabel??''),
                  RowTexts(text1: S.of(context).cableLength, text2: state.obxodDetailsModel?.hetObjectProperty?.cabelLength??''),
                ],
              ),
            ),
            Text(
              S.of(context).dataonequipmentmaintenancerepairsandtesting,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            AppContainer(
              margin: EdgeInsets.zero,
              padding: EdgeInsets.all(8.0),
              child: Column(
                spacing: 8.0,
                children: [
                  RowTexts(text1: S.of(context).resultRemont, text2: state.obxodDetailsModel?.resultObxod??'-'),
                  RowTexts(text1: S.of(context).whoWorked, text2: state.obxodDetailsModel?.fitters?.map((e)=>e).toList().join(', ')??'-'),
                  RowTexts(text1: S.of(context).mastersComment, text2: state.obxodDetailsModel?.masterComment??'-'),
                ],
              ),
            ),
            if(state.remontDetailsModel?.status=='6')
            Text(
              S.of(context).reasonforrefusal,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            if(state.remontDetailsModel?.status=='6')
            AppContainer(
              color: Colors.redAccent.withValues(alpha: 0.2),
              margin: EdgeInsets.zero,
              padding: EdgeInsets.all(8.0),
              child: Text(
                state.remontDetailsModel?.engineerClosingComment??'-',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.black),
                textAlign: TextAlign.end,
              ),
            ),
            if(state.remontDetailsModel?.status=='5')
              Text(
                S.of(context).grade,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            if(state.remontDetailsModel?.status=='5')
              AppContainer(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.all(8.0),
                child: Column(
                  spacing: 8.0,
                  children: [
                    RowTexts(text1: S.of(context).grade, text2: state.remontDetailsModel?.mark.toString()??'-'),
                    RowTexts(text1: S.of(context).comments, text2: state.remontDetailsModel?.engineerClosingComment??'-'),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  },
);
  }
}
