
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/components/app_container.dart';
import 'package:het/src/config/components/app_elevated_button.dart';
import 'package:het/src/config/components/text_field_components.dart';
import 'package:het/src/config/theme/app_colors.dart';
import 'package:het/src/features/engineer/laboratory/data/bodies/completed_laboratory_application_body.dart';
import 'package:het/src/features/engineer/laboratory/data/bodies/confirmed_laboratory_application_body.dart';
import 'package:het/src/features/engineer/laboratory/presentation/manager/engineer_laboratory_bloc.dart';
import 'package:het/src/features/garage/main/tabs/applications/widgets/funs.dart';
import 'package:het/src/features/master/main/tabs/tasks/widgets/row_texts.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:toastification/toastification.dart';

class LaboratoryApplicationDetailsPage extends StatefulWidget {
  const LaboratoryApplicationDetailsPage({super.key});

  @override
  State<LaboratoryApplicationDetailsPage> createState() =>
      _LaboratoryApplicationDetailsPage();
}

class _LaboratoryApplicationDetailsPage
    extends State<LaboratoryApplicationDetailsPage> {
  late final bloc = context.read<EngineerLaboratoryBloc>();

  final formCompleted = FormGroup({
    'inStandard': FormControl<bool>(validators: [Validators.required]),
    'comment': FormControl<String>(validators: [Validators.required]),
  });

  FormControl<bool> get inStandard => formCompleted.control('inStandard') as FormControl<bool>;
  FormControl<String> get comment => formCompleted.control('comment') as FormControl<String>;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EngineerLaboratoryBloc, EngineerLaboratoryState>(
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
                                bloc.confirmedApplication(ConfirmedLaboratoryApplicationBody(
                                  confirm: true,
                                  id: state.applicationDetailsModel?.id,
                                ));
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
                                            ReactiveDropdownField(
                                              formControl: inStandard,
                                              decoration: InputDecoration(
                                                filled: true,
                                                isDense: true,
                                                fillColor: Colors.white,
                                                labelText: S.of(context).typeApplication,
                                                border: appTextFiledTransparentBorder(),
                                                enabledBorder: appTextFiledTransparentBorder(),
                                                disabledBorder: appTextFiledTransparentBorder(),
                                                focusedBorder: appTextFiledTransparentBorder(),
                                                errorBorder: appTextFiledErrorBorder(),
                                              ),
                                              items: [
                                                DropdownMenuItem(
                                                  value: true,
                                                  child: Text(S.of(context).corresponds),
                                                ),
                                                DropdownMenuItem(
                                                  value: false,
                                                  child: Text(S.of(context).nocorresponds),
                                                ),
                                              ],
                                              validationMessages: {
                                                'required': (error) =>
                                                S.of(context).thefieldmustnotbeempty,
                                              },
                                            ),
                                            ReactiveTextField(
                                              formControl: comment,
                                              decoration: InputDecoration(
                                                filled: true,
                                                isDense: true,
                                                fillColor: Colors.white,
                                                labelText: S.of(context).description,
                                                border: appTextFiledTransparentBorder(),
                                                enabledBorder: appTextFiledTransparentBorder(),
                                                disabledBorder: appTextFiledTransparentBorder(),
                                                focusedBorder: appTextFiledTransparentBorder(),
                                                errorBorder: appTextFiledErrorBorder(),
                                              ),
                                              keyboardType: TextInputType.text,
                                              minLines: 4,
                                              maxLines: null,
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
                                                      bloc.completedApplication(CompletedLaboratoryApplicationBody(
                                                          closeApplicationComment: comment.value,
                                                          inStandart: inStandard.value,
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
                                text1: S.of(context).organization,
                                text2: state.applicationDetailsModel?.creatorHetObjectName ?? '-',
                            ),
                            RowTexts(
                                text1: S.of(context).address,
                                text2: state.applicationDetailsModel?.address ?? '-',
                            ),
                            RowTexts(
                              text1: S.of(context).typeApplication,
                              text2: state.applicationDetailsModel?.type ?? '-',
                            ),
                            RowTexts(
                              text1: S.of(context).object,
                              text2: state.applicationDetailsModel?.hetObjectPropertyName ?? '-',
                            ),
                            RowTexts(
                              text1: S.of(context).description,
                              text2: state.applicationDetailsModel?.applicationDescription ?? '-',
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
                            ],
                        ),
                      ),
                      if(state.applicationDetailsModel?.status == '5')
                      Text(
                        S.of(context).Results,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      if(state.applicationDetailsModel?.status == '5')
                      AppContainer(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          spacing: 8.0,
                          children: [
                            RowTexts(
                              text1: S.of(context).complieswiththenorm,
                              text2: state.applicationDetailsModel?.inStandart?S.of(context).corresponds:S.of(context).nocorresponds,
                            ),
                            RowTexts(
                              text1: S.of(context).comments,
                              text2: state.applicationDetailsModel?.closeApplicationComment ?? '-',
                            ),
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
