import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/components/app_container.dart';
import 'package:het/src/config/components/app_elevated_button.dart';
import 'package:het/src/config/components/text_field_components.dart';
import 'package:het/src/config/theme/app_colors.dart';
import 'package:het/src/features/engineer/transport/data/bodies/completed_transport_application_body.dart';
import 'package:het/src/features/engineer/transport/data/bodies/confirmed_transport_application_body.dart';
import 'package:het/src/features/engineer/transport/presentation/manager/engineer_transport_bloc.dart';
import 'package:het/src/features/garage/main/tabs/applications/widgets/funs.dart';
import 'package:het/src/features/master/main/tabs/tasks/widgets/row_texts.dart';
import 'package:intl/intl.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:toastification/toastification.dart';

class GarageApplicationDetailsPage extends StatefulWidget {
  const GarageApplicationDetailsPage({super.key});

  @override
  State<GarageApplicationDetailsPage> createState() =>
      _GarageApplicationDetailsPageState();
}

class _GarageApplicationDetailsPageState
    extends State<GarageApplicationDetailsPage> {
  late final bloc = context.read<EngineerTransportBloc>();

  final formConfirmed = FormGroup({
    'transport': FormControl<int>(validators: [Validators.required]),
    'from': FormControl<DateTime>(validators: [Validators.required]),
    'to': FormControl<DateTime>(validators: [Validators.required]),
  });

  final formCompleted = FormGroup({
    'date': FormControl<DateTime>(validators: [Validators.required]),
  });

  FormControl<int> get transport => formConfirmed.control('transport') as FormControl<int>;
  FormControl<DateTime> get from => formConfirmed.control('from') as FormControl<DateTime>;
  FormControl<DateTime> get to => formConfirmed.control('to') as FormControl<DateTime>;

  FormControl<DateTime> get date => formCompleted.control('date') as FormControl<DateTime>;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EngineerTransportBloc, EngineerTransportState>(
      listener: (context, state) {
        if (state.isConfirmed) {
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
          context.pop(1);
        }
        if (state.isCompleted) {
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
          context.pop(1);
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
          persistentFooterAlignment: AlignmentDirectional.center,
          persistentFooterButtons: state.applicationDetailsModel?.status == '2' ||
                  state.applicationDetailsModel?.status == '4'
              ? [
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
                      state.applicationDetailsModel?.status == '2'?
                      Expanded(
                          child: AppElevatedButton(
                              text:S.of(context).accept,
                              onClick: () {
                                bloc.transportNumbers(state.applicationDetailsModel?.type?.id ?? 0);
                                showModalBottomSheet(
                                  backgroundColor: Colors.grey[200],
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                  ),
                                  builder: (innerContext) {
                                    return BlocBuilder<EngineerTransportBloc, EngineerTransportState>(
                                      builder: (context, state) {
                                        return ReactiveForm(
                                      formGroup: formConfirmed,
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          spacing: 16.0,
                                          children: [
                                            Text(
                                              S.of(context).comfirm,
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            ReactiveDropdownField(
                                              formControl: transport,
                                              decoration: InputDecoration(
                                                filled: true,
                                                isDense: true,
                                                fillColor: Colors.white,
                                                labelText: S.of(context).number,
                                                border: appTextFiledTransparentBorder(),
                                                enabledBorder: appTextFiledTransparentBorder(),
                                                disabledBorder: appTextFiledTransparentBorder(),
                                                focusedBorder: appTextFiledTransparentBorder(),
                                                errorBorder: appTextFiledErrorBorder(),
                                              ),
                                              items: state.transportNumbers
                                                  ?.map(
                                                    (e) => DropdownMenuItem(
                                                  value: e.id,
                                                  child: Text(
                                                    e.number ?? '-',
                                                  ),
                                                ),
                                              ).toList() ?? [],
                                              validationMessages: {
                                                'required': (error) =>
                                                S.of(context).thefieldmustnotbeempty,
                                              },
                                            ),
                                            ReactiveDateTimePicker(
                                              formControl: from,
                                              type: ReactiveDatePickerFieldType.time,
                                              decoration: InputDecoration(
                                                filled: true,
                                                isDense: true,
                                                fillColor: Colors.white,
                                                labelText: S.of(context).start,
                                                border: appTextFiledTransparentBorder(),
                                                enabledBorder: appTextFiledTransparentBorder(),
                                                disabledBorder: appTextFiledTransparentBorder(),
                                                focusedBorder: appTextFiledTransparentBorder(),
                                                errorBorder: appTextFiledErrorBorder(),
                                                suffixIcon: const Icon(Icons.access_time),
                                              ),
                                              validationMessages: {
                                                'required': (error) =>
                                                S.of(context).thefieldmustnotbeempty,
                                              },
                                            ),
                                            ReactiveDateTimePicker(
                                              formControl: to,
                                              type: ReactiveDatePickerFieldType.time,
                                              decoration: InputDecoration(
                                                filled: true,
                                                isDense: true,
                                                fillColor: Colors.white,
                                                labelText: S.of(context).end,
                                                border: appTextFiledTransparentBorder(),
                                                enabledBorder: appTextFiledTransparentBorder(),
                                                disabledBorder: appTextFiledTransparentBorder(),
                                                focusedBorder: appTextFiledTransparentBorder(),
                                                errorBorder: appTextFiledErrorBorder(),
                                                suffixIcon: const Icon(Icons.access_time),
                                              ),
                                              validationMessages: {
                                                'required': (error) =>
                                                S.of(context).thefieldmustnotbeempty,
                                              },
                                            ),
                                            ReactiveFormConsumer(builder: (context, form, child){
                                              return AppElevatedButton(
                                                  text: S.of(context).comfirm,
                                                  onClick: () {
                                                    if (form.valid) {
                                                      bloc.confirmedApplication(ConfirmedTransportApplicationBody(
                                                          garajConfirmedTimeFrom: DateTime.parse(state.applicationDetailsModel?.whenNeed??'').copyWith(
                                                              hour: from.value?.hour,
                                                              minute: from.value?.minute
                                                          ).toString(),
                                                          garajConfirmedTimeTo: DateTime.parse(state.applicationDetailsModel?.whenNeed??'').copyWith(
                                                              hour: to.value?.hour,
                                                              minute: to.value?.minute
                                                          ).toString(),
                                                          transport: transport.value,
                                                          id: state.applicationDetailsModel?.id
                                                      ));
                                                      context.pop();
                                                    } else {
                                                      formConfirmed.markAllAsTouched();
                                                    }
                                                  });
                                            })
                                          ],
                                        ),
                                      ),
                                    );
                                      },
                                    );
                                  },
                                );
                              })):
                      Expanded(
                          child: AppElevatedButton(
                              text:S.of(context).closed,
                              onClick: () {
                                showModalBottomSheet(
                                  backgroundColor: Colors.grey[200],
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                                  ),
                                  builder: (innerContext) {
                                    return BlocBuilder<EngineerTransportBloc, EngineerTransportState>(
                                      builder: (context, state) {
                                        return ReactiveForm(
                                          formGroup: formCompleted,
                                          child: Padding(
                                            padding: const EdgeInsets.all(16.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              spacing: 16.0,
                                              children: [
                                                Text(
                                                  S.of(context).closed,
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                ReactiveDateTimePicker(
                                                  formControl: date,
                                                  type: ReactiveDatePickerFieldType.dateTime,
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    isDense: true,
                                                    fillColor: Colors.white,
                                                    labelText: S.of(context).end,
                                                    border: appTextFiledTransparentBorder(),
                                                    enabledBorder: appTextFiledTransparentBorder(),
                                                    disabledBorder: appTextFiledTransparentBorder(),
                                                    focusedBorder: appTextFiledTransparentBorder(),
                                                    errorBorder: appTextFiledErrorBorder(),
                                                    suffixIcon: const Icon(Icons.calendar_month),
                                                  ),
                                                  validationMessages: {
                                                    'required': (error) =>
                                                    S.of(context).thefieldmustnotbeempty,
                                                  },
                                                ),
                                                ReactiveFormConsumer(builder: (context, form, child){
                                                  return AppElevatedButton(
                                                      text: S.of(context).closed,
                                                      onClick: () {
                                                        if (form.valid) {
                                                          bloc.completedApplication(CompletedTransportApplicationBody(
                                                            completedTime: date.value.toString(),
                                                            id: state.applicationDetailsModel?.id
                                                          ));
                                                          context.pop();
                                                        } else {
                                                          formCompleted.markAllAsTouched();
                                                        }
                                                      });
                                                })
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              })),
                    ],
                  )
                ]
              : null,
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
                                text1: S.of(context).whoRequested,
                                text2: state.applicationDetailsModel?.creatorHetObjectName ?? '-',
                            ),
                            RowTexts(
                                text1: S.of(context).typeApplication,
                                text2: state.applicationDetailsModel?.type?.name ?? '-',
                            ),
                            RowTexts(
                                text1: S.of(context).address,
                                text2: state.applicationDetailsModel?.address ?? '-',
                            ),
                            RowTexts(
                                text1: S.of(context).description,
                                text2: state.applicationDetailsModel?.description ?? '-',
                            ),
                            RowTexts(
                                text1: S.of(context).whenNeed,
                                text2: DateFormat("dd.MM.yyyy, HH:mm").format(DateTime.parse(state.applicationDetailsModel?.whenNeed ?? '')),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                                    child: Text(
                                      S.of(context).status,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12),
                                    decoration: BoxDecoration(
                                        color: getGarageApplicationStatusColor(state.applicationDetailsModel?.status ?? '')
                                            .withValues(alpha: 0.3),
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                            color: getGarageApplicationStatusColor(state.applicationDetailsModel?.status ?? ''))),
                                    child: Text(
                                      getGarageApplicationStatusTitle(
                                          state.applicationDetailsModel
                                                  ?.status ??
                                              '',
                                          context),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                              color: getGarageApplicationStatusColor(
                                                  state.applicationDetailsModel
                                                          ?.status ??
                                                      '')),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                ]),
                            if (state.applicationDetailsModel
                                        ?.garajConfirmedTimeFrom?.isNotEmpty ==
                                    true &&
                                state.applicationDetailsModel
                                        ?.garajConfirmedTimeTo?.isNotEmpty ==
                                    true)
                              RowTexts(
                                  text1: S.of(context).appointedTime,
                                  text2:
                                      "${DateFormat("dd.MM.yyyy, HH:mm").format(DateTime.parse(state.applicationDetailsModel?.garajConfirmedTimeFrom ?? ''))}\n${DateFormat("dd.MM.yyyy, HH:mm").format(DateTime.parse(state.applicationDetailsModel?.garajConfirmedTimeTo ?? ''))}"),
                          ],
                        ),
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
