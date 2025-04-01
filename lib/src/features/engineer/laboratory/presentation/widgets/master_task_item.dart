import 'package:flutter/material.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/components/app_container.dart';
import 'package:het/src/config/components/app_divider.dart';
import 'package:het/src/config/theme/app_colors.dart';
import 'package:het/src/features/engineer/production/data/models/engineer_master_tasks_model.dart';
import 'package:het/src/features/engineer/production/data/models/engineer_masters_model.dart';
import 'package:het/src/features/master/main/tabs/tasks/widgets/row_texts.dart';

class MasterTaskItem extends StatefulWidget {
  final EngineerMasterTask? model;
  final VoidCallback onClick;

  const MasterTaskItem({
    super.key,
    required this.model,
    required this.onClick,
  });

  @override
  State<MasterTaskItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MasterTaskItem>
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
    )..addListener(() {
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
            margin: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RowTexts(text1: S.of(context).typeOfWork, text2: widget.model?.type??'-'),
                RowTexts(text1: S.of(context).object, text2: widget.model?.hetObjectProperty??'-'),
                RowTexts(text1: S.of(context).completionDate, text2: widget.model?.deadline??'-'),
                RowTexts(text1: S.of(context).description, text2: widget.model?.engineerOpeningComment??'-'),
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
                        padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                        decoration: BoxDecoration(
                            color: getColor(widget.model?.status??'').withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: getColor(widget.model?.status??''))
                        ),
                        child: Text(
                          getTitle(widget.model?.status??''),
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(color: getColor(widget.model?.status??'')),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ])
              ],
            ),
          )
      ),
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
          return Colors.blueAccent;
        case '5':
          return AppColors.mainGreenColor;
        case '6':
          return AppColors.mainRedColor;
        default:
          return Colors.grey;
      }
    }());
  }

  String getTitle(String status) {
    return (() {
      switch (status) {
        case '2':
          return S.of(context).didntStart;
        case '3':
          return S.of(context).inProccess;
        case '4':
          return S.of(context).awaitingConfirmation;
        case '5':
          return S.of(context).complated;
        case '6':
          return S.of(context).rejected;
        default:
          return '-';
      }
    }());
  }
}
