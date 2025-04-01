import 'package:flutter/material.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/components/app_container.dart';
import 'package:het/src/config/components/app_divider.dart';
import 'package:het/src/config/theme/app_colors.dart';
import 'package:het/src/features/engineer/production/data/models/engineer_masters_model.dart';
import 'package:het/src/features/master/main/tabs/tasks/widgets/row_texts.dart';

class MasterItem extends StatefulWidget {
  final EngineerMaster? model;
  final VoidCallback onClick;

  const MasterItem({
    super.key,
    required this.model,
    required this.onClick,
  });

  @override
  State<MasterItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MasterItem>
    with SingleTickerProviderStateMixin {
  static const clickAnimationDurationMillis = 100;

  double _scaleTransformValue = 1;

  // needed for the "click" tap effect
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: clickAnimationDurationMillis),
      lowerBound: 0.0,
      upperBound: 0.05,
    )
      ..addListener(() {
        setState(() => _scaleTransformValue = 1 - animationController.value);
      });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void _shrinkButtonSize() {
    animationController.forward();
  }

  void _restoreButtonSize() {
    Future.delayed(
      const Duration(milliseconds: clickAnimationDurationMillis),
          () => animationController.reverse(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Future.delayed(
          const Duration(milliseconds: clickAnimationDurationMillis * 2),
              () => widget.onClick.call(),
        );
        _shrinkButtonSize();
        _restoreButtonSize();
      },
      onTapDown: (_) => _shrinkButtonSize(),
      onTapCancel: _restoreButtonSize,
      child: Transform.scale(
        scale: _scaleTransformValue,
        child: AppContainer(
          padding: EdgeInsets.all(8.0),
          margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.model?.fullName ?? '-',
            style: Theme
                .of(context)
                .textTheme
                .titleMedium,
          ),
        ),
        AppDivider(),
        RowTexts(text1: S.of(context).department, text2: widget.model?.department ?? '-'),
        RowTexts(text1: S.of(context).numberOfTasks, text2: widget.model?.tasksCount.toString() ?? '-'),
        RowTexts(text1: S.of(context).jobTitle, text2: widget.model?.positionType ?? '-'),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Text(S.of(context).status,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                decoration: BoxDecoration(
                    color: AppColors.mainGreenColor.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: getColor(widget.model?.status??''))
                ),
                child: Text(
                  'Новый',
                  style: Theme
                      .of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: AppColors.mainGreenColor),
                  textAlign: TextAlign.end,
                ),
              ),
            ])
        ],
      ),
    )),
    );
  }

  Color getColor(String status) {
    return (() {
      switch (status) {
        case '2':
          return Colors.grey;
        case '3':
          return AppColors.mainYellowColor;
        case '4':
          return AppColors.mainGreenColor;
        case '5':
          return AppColors.mainRedColor;
        case '6':
          return AppColors.borderColor;
        default:
          return Colors.grey;
      }
    }());
  }
}
