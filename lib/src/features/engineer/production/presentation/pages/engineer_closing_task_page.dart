import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/components/app_elevated_button.dart';
import 'package:het/src/config/components/text_field_components.dart';
import 'package:het/src/config/theme/app_colors.dart';
import 'package:het/src/features/engineer/production/data/bodies/engineer_accept_body.dart';
import 'package:het/src/features/engineer/production/data/bodies/engineer_emergency_accept_body.dart';
import 'package:het/src/features/engineer/production/data/bodies/paging_body.dart';
import 'package:het/src/features/engineer/production/data/models/engineer_masters_model.dart';
import 'package:het/src/features/engineer/production/presentation/manager/engineer_production_bloc.dart';
import 'package:high_q_paginated_drop_down/high_q_paginated_drop_down.dart';
import 'package:intl/intl.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:toastification/toastification.dart';

class EngineerClosingTaskPage extends StatefulWidget {
  final int id;
  final String type;
  final String result;

  const EngineerClosingTaskPage(
      {super.key, required this.id, required this.type, required this.result});

  @override
  State<EngineerClosingTaskPage> createState() =>
      _EngineerClosingTaskPageState();
}

class _EngineerClosingTaskPageState extends State<EngineerClosingTaskPage> {
  late final bloc = context.read<EngineerProductionBloc>();
  late final blocProduction = context.read<EngineerProductionBloc>();

  final form = FormGroup({
    'mark': FormControl<int>(),
    'master': FormControl<int>(),
    'date': FormControl<DateTime>(),
    'comment': FormControl<String>(validators: [Validators.required]),
  });

  FormControl<int> get mark => form.control('mark') as FormControl<int>;

  FormControl<int> get master => form.control('master') as FormControl<int>;

  FormControl<DateTime> get date =>
      form.control('date') as FormControl<DateTime>;

  FormControl<String> get comment =>
      form.control('comment') as FormControl<String>;

  @override
  void initState() {
    super.initState();
    if (widget.type == '5' && widget.result == '2') {
      master.setValidators([Validators.required], autoValidate: true);
      date.setValidators([Validators.required], autoValidate: true);
      mark.setValidators([], autoValidate: true);
    } else {
      master.setValidators([], autoValidate: true);
      date.setValidators([], autoValidate: true);
      mark.setValidators([Validators.required], autoValidate: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).closeTask),
        ),
        persistentFooterAlignment: AlignmentDirectional.center,
        persistentFooterButtons: [
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
              ReactiveFormConsumer(builder: (context, form1, child) {
                return Expanded(
                    child: AppElevatedButton(
                        text: S.of(context).accept,
                        onClick: () {
                          if (form.valid) {
                            if (widget.type == '5' && widget.result == '2') {
                              bloc.emergencyAcceptTask(
                                  EngineerEmergencyAcceptBody(
                                    deadline: DateFormat('yyyy-MM-dd').format(date.value ?? DateTime.now()),
                                    master: master.value,
                                    id: widget.id,
                                    engineerClosingComment: comment.value,
                                  ));
                            } else {
                              bloc.acceptTask(EngineerAcceptBody(
                                  mark: mark.value,
                                  engineerClosingComment: comment.value,
                                  id: widget.id,
                                  type: widget.type));
                            }
                          } else {
                            form.markAllAsTouched();
                          }
                        }));
              })
            ],
          )
        ],
        body: BlocConsumer<EngineerProductionBloc, EngineerProductionState>(
          listener: (context, state) {
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
                  primaryColor: Colors.red);
            }
            if (state.isTaskAccepted) {
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
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16.0,
                children: [
                  Text(
                    S.of(context).closingTask,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  widget.type == '5' && widget.result == '2'
                      ? Column(
                          spacing: 16.0,
                          children: [
                            HighQPaginatedDropdown<EngineerMaster>.paginated(
                              backgroundDecoration: (child) => InputDecorator(
                                decoration: InputDecoration(
                                  filled: true,
                                  isDense: true,
                                  fillColor: Colors.white,
                                  labelText: S.of(context).master,
                                  border: appTextFiledTransparentBorder(),
                                  enabledBorder:
                                      appTextFiledTransparentBorder(),
                                  disabledBorder:
                                      appTextFiledTransparentBorder(),
                                  focusedBorder:
                                      appTextFiledTransparentBorder(),
                                  errorBorder: appTextFiledErrorBorder(),
                                ),
                                child: child,
                              ),
                              hasTrailingClearIcon: false,
                              trailingIcon: Icon(Icons.arrow_drop_down),
                              spaceBetweenDropDownAndItemsDialog: 0,
                              requestItemCount: 10,
                              isDialogExpanded: false,
                              showTextField: false,
                              paginatedRequest:
                                  (int page, String? searchText) async {
                                final paginatedList = await bloc.mastersList(
                                    PagingBody(page: page, search: searchText));
                                return paginatedList?.results?.map((e) {
                                  return MenuItemModel(
                                    value: e,
                                    label: e.fullName ?? '-',
                                    child: Text(
                                      e.fullName ?? '-',
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  );
                                }).toList();
                              },
                              paddingValueWhileIsDialogExpanded: 110,
                              padding: const EdgeInsets.all(0),
                              onChanged: (EngineerMaster? value) async {
                                master.value = value?.id;
                              },
                            ),
                            ReactiveDateTimePicker(
                              formControl: date,
                              type: ReactiveDatePickerFieldType.date,
                              dateFormat: DateFormat('yyyy-MM-dd'),
                              decoration: InputDecoration(
                                filled: true,
                                isDense: true,
                                fillColor: Colors.white,
                                labelText: S.of(context).term,
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
                          ],
                        )
                      : ReactiveDropdownField(
                          formControl: mark,
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            fillColor: Colors.white,
                            labelText: S.of(context).grade,
                            border: appTextFiledTransparentBorder(),
                            enabledBorder: appTextFiledTransparentBorder(),
                            disabledBorder: appTextFiledTransparentBorder(),
                            focusedBorder: appTextFiledTransparentBorder(),
                            errorBorder: appTextFiledErrorBorder(),
                          ),
                          items: List.generate(10, (index) {
                            return DropdownMenuItem(
                              value: (index + 1),
                              child: Text(
                                (index + 1).toString(),
                              ),
                            );
                          }),
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
