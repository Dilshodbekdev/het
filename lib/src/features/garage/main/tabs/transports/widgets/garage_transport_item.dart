import 'package:flutter/material.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/components/app_container.dart';
import 'package:het/src/features/engineer/transport/data/models/transports_model.dart';
import 'package:het/src/features/garage/main/tabs/transports/widgets/funs.dart';
import 'package:het/src/features/master/main/tabs/tasks/widgets/row_texts.dart';

class GarageTransportItem extends StatefulWidget {
  final Transport? model;
  final VoidCallback onClick;

  const GarageTransportItem({
    super.key,
    required this.model,
    required this.onClick,
  });

  @override
  State<GarageTransportItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<GarageTransportItem>
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
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RowTexts(
                    text1: S.of(context).typeApplication,
                    text2: widget.model?.type?.name ?? '-'),
                RowTexts(
                    text1: S.of(context).address,
                    text2: widget.model?.status ?? '-'),
                RowTexts(
                    text1: S.of(context).fromWhom,
                    text2: widget.model?.status ?? '-'),
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
                            color: getGarageTransportStatusColor(widget.model?.status ?? '')
                                .withValues(alpha: 0.3),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                                color: getGarageTransportStatusColor(widget.model?.status ?? ''))),
                        child: Text(
                          getGarageTransportStatusTitle(widget.model?.status ?? '',context),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                  color: getGarageTransportStatusColor(widget.model?.status ?? '')),
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ])
              ],
            ),
          )),
    );
  }
}
