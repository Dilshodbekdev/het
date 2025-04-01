import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/components/app_container.dart';
import 'package:het/src/config/components/text_field_components.dart';
import 'package:het/src/config/theme/app_colors.dart';
import 'package:het/src/features/engineer/transport/data/bodies/transport_change_status_body.dart';
import 'package:het/src/features/engineer/transport/presentation/manager/engineer_transport_bloc.dart';
import 'package:het/src/features/garage/main/tabs/transports/widgets/funs.dart';
import 'package:het/src/features/master/main/tabs/tasks/widgets/row_texts.dart';
import 'package:toastification/toastification.dart';

class GarageTransportDetailsPage extends StatelessWidget {
  const GarageTransportDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    late final bloc = context.read<EngineerTransportBloc>();

    return BlocConsumer<EngineerTransportBloc, EngineerTransportState>(
      listener: (context, state) {
        if (state.isChanged) {
          toastification.show(
              title: Text(
                S.of(context).savedSuccessfully,
                style: const TextStyle(fontSize: 16),
                maxLines: 4,
              ),
              type: ToastificationType.success,
              alignment: Alignment.bottomCenter,
              showProgressBar: true,
              autoCloseDuration: Duration(seconds: 3),
              style: ToastificationStyle.fillColored,
              primaryColor: AppColors.mainGreenColor);
          bloc.transportDetails(state.transportDetails?.id ?? 0);
        }
        if (state.hasError) {
          toastification.show(
              title: Text(
                state.errorMessage,
                style: const TextStyle(fontSize: 16),
              ),
              type: ToastificationType.error,
              alignment: Alignment.bottomCenter,
              autoCloseDuration: Duration(seconds: 3),
              style: ToastificationStyle.fillColored,
              primaryColor: Colors.redAccent);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).details),
          ),
          body: !state.isLoading
              ? SingleChildScrollView(
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
                            RowTexts(
                              text1: S.of(context).number,
                              text2: state.transportDetails?.number ?? '-',
                            ),
                            RowTexts(
                              text1: S.of(context).typeTransport,
                              text2: state.transportDetails?.type?.name ?? '-',
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    padding: EdgeInsets.symmetric(
                                        vertical: 2, horizontal: 12),
                                    decoration: BoxDecoration(
                                        color: getGarageTransportStatusColor(
                                                state.transportDetails
                                                        ?.status ??
                                                    '')
                                            .withValues(alpha: 0.3),
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                            color:
                                                getGarageTransportStatusColor(
                                                    state.transportDetails
                                                            ?.status ??
                                                        ''))),
                                    child: Text(
                                      getGarageTransportStatusTitle(
                                          state.transportDetails?.status ?? '',
                                          context),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                              color:
                                                  getGarageTransportStatusColor(
                                                      state.transportDetails
                                                              ?.status ??
                                                          '')),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ])
                          ],
                        ),
                      ),
                      Text(
                        S.of(context).status,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      DropdownButtonFormField(
                        decoration: InputDecoration(
                          filled: true,
                          isDense: true,
                          fillColor: Colors.white,
                          labelText: S.of(context).status,
                          border: appTextFiledTransparentBorder(),
                          enabledBorder: appTextFiledTransparentBorder(),
                          disabledBorder: appTextFiledTransparentBorder(),
                          focusedBorder: appTextFiledTransparentBorder(),
                          errorBorder: appTextFiledErrorBorder(),
                        ),
                        items: [
                          DropdownMenuItem(
                              value: '1', child: Text(S.of(context).free)),
                          DropdownMenuItem(
                              value: '2', child: Text(S.of(context).borrow)),
                          DropdownMenuItem(
                              value: '3', child: Text(S.of(context).repair)),
                        ],
                        onChanged: (val) {
                          bloc.transportChangeStatus(TransportChangeStatusBody(
                              status: val, id: state.transportDetails?.id));
                        },
                      ),
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                  color: AppColors.mainColor,
                )),
        );
      },
    );
  }
}
