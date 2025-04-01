import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/assets/app_icons.dart';
import 'package:het/src/config/components/app_container.dart';
import 'package:het/src/config/components/app_elevated_button.dart';
import 'package:het/src/config/theme/app_colors.dart';
import 'package:het/src/features/engineer/production/data/models/engineer_master_tasks_model.dart';
import 'package:het/src/features/engineer/production/presentation/widgets/funs.dart';
import 'package:het/src/features/master/defective/data/models/master_defective_acts_model.dart';
import 'package:het/src/features/master/main/tabs/defective/widgets/funs.dart';
import 'package:het/src/features/master/main/tabs/tasks/widgets/row_texts.dart';

class DefectiveActItem1 extends StatelessWidget {
  final DefectiveAct? model;
  final VoidCallback onLookClick;
  final VoidCallback onEditClick;

  const DefectiveActItem1({
    super.key,
    required this.model,
    required this.onLookClick,
    required this.onEditClick,
  });

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RowTexts(
              text1: S.of(context).object,
              text2: model?.hetObjectPropertyName ?? '-'),
          RowTexts(
              text1: S.of(context).fitters,
              text2: model?.fitters?.map((e)=>e.fullName).toList().join(', ')??'-'),
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
                      color: getDefectiveActColor(model?.status ?? '')
                          .withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color: getDefectiveActColor(model?.status ?? ''))),
                  child: Text(
                    getDefectiveActTitle(model?.status ?? '',context),
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(
                        color: getDefectiveActColor(model?.status ?? '')),
                    textAlign: TextAlign.end,
                  ),
                ),
              ]),
          Gap(16.0),
          Row(
            spacing: 16.0,
            children: [
              Expanded(
                  child: AppElevatedButton(
                text: S.of(context).look,
                onClick: () =>onLookClick(),
                icon: AppIcons.eye,
                    bgColor: Colors.grey[200],
                    textColor: AppColors.mainColor,
              )),
              Expanded(
                  child: AppElevatedButton(
                text: S.of(context).edit,
                onClick: () =>onEditClick(),
                icon: AppIcons.edit,
                    bgColor: Colors.grey[200],
                    textColor: AppColors.mainYellowColor,
              )),
            ],
          )
        ],
      ),
    );
  }
}
