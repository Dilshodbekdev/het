
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/components/app_elevated_button.dart';
import 'package:het/src/config/components/text_field_components.dart';
import 'package:het/src/config/theme/app_colors.dart';
import 'package:het/src/features/engineer/production/data/bodies/create_obxod_task_body.dart';
import 'package:het/src/features/engineer/production/data/bodies/create_remont_task_body.dart';
import 'package:het/src/features/engineer/production/data/bodies/paging_body.dart';
import 'package:het/src/features/engineer/production/data/models/het_objects_model.dart';
import 'package:het/src/features/engineer/production/presentation/manager/engineer_production_bloc.dart';
import 'package:high_q_paginated_drop_down/high_q_paginated_drop_down.dart';
import 'package:intl/intl.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:toastification/toastification.dart';

class EngineerFormTaskPage extends StatefulWidget {
  final int id;

  const EngineerFormTaskPage({super.key, required this.id});

  @override
  State<EngineerFormTaskPage> createState() => _EngineerFormTaskPageState();
}

class _EngineerFormTaskPageState extends State<EngineerFormTaskPage> {
  late final bloc = context.read<EngineerProductionBloc>();
  final form = FormGroup({
    'type': FormControl<String>(validators: [Validators.required]),
    'object': FormControl<int>(validators: [Validators.required]),
    'date': FormControl<DateTime>(validators: [Validators.required]),
    'comment': FormControl<String>(validators: [Validators.required]),
  });

  FormControl<String> get type => form.control('type') as FormControl<String>;

  FormControl<int> get object => form.control('object') as FormControl<int>;

  FormControl<DateTime> get date => form.control('date') as FormControl<DateTime>;

  FormControl<String> get comment => form.control('comment') as FormControl<String>;

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).formTask),
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
                        text: S.of(context).save,
                        onClick: () {
                          if (form.valid) {
                            if(type.value!='3'){
                              bloc.createRemontTask(CreateRemontTaskBody(
                                master: widget.id,
                                hetObjectProperty: object.value,
                                deadline: DateFormat('yyyy-MM-dd').format(date.value ?? DateTime.now()),
                                engineerOpeningComment: comment.value,
                                type: type.value,
                              ));
                            }else{
                              bloc.createObxodTask(CreateObxodTaskBody(
                                master: widget.id,
                                hetObjectProperty: object.value,
                                deadline: DateFormat('yyyy-MM-dd').format(date.value ?? DateTime.now()),
                                engineerOpeningComment: comment.value,
                                type: type.value,
                              ));
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
            if (state.isRemontTaskCreated) {
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
            if (state.isObxodTaskCreated) {
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
              context.pop();
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
                    S.of(context).information,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  ReactiveDropdownField(
                    formControl: type,
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
                    items: state.taskTypes
                            ?.map(
                              (e) => DropdownMenuItem(
                                value: e.id,
                                child: Text(
                                  e.name ?? '-',
                                ),
                              ),
                            )
                            .toList() ??
                        [],
                    validationMessages: {
                      'required': (error) =>
                          S.of(context).thefieldmustnotbeempty,
                    },
                  ),
                  HighQPaginatedDropdown<HetObject>.paginated(
                    backgroundDecoration: (child) => InputDecorator(
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
                      child: child,
                    ),
                    hasTrailingClearIcon: false,
                    trailingIcon: Icon(Icons.arrow_drop_down),
                    spaceBetweenDropDownAndItemsDialog: 0,
                    requestItemCount: 10,
                    isDialogExpanded: false,
                    showTextField: false,
                    paginatedRequest: (int page, String? searchText) async {
                      final paginatedList = await bloc.hetObjects(
                          PagingBody(page: page, search: searchText));
                      return paginatedList?.results?.map((e) {
                        return MenuItemModel(
                          value: e,
                          label: e.name ?? '-',
                          child: Text(
                            e.name ?? '-',
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
                    onChanged: (HetObject? value) async {
                      object.value = value?.id;
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
                      labelText: S.of(context).plannedDate,
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
