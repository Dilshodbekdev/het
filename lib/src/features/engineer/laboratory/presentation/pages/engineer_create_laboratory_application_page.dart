import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/components/app_elevated_button.dart';
import 'package:het/src/config/components/text_field_components.dart';
import 'package:het/src/config/theme/app_colors.dart';
import 'package:het/src/features/engineer/laboratory/data/bodies/create_laboratory_application_body.dart';
import 'package:het/src/features/engineer/laboratory/presentation/manager/engineer_laboratory_bloc.dart';
import 'package:het/src/features/engineer/production/data/bodies/paging_body.dart';
import 'package:het/src/features/engineer/production/data/models/het_objects_model.dart';
import 'package:het/src/features/engineer/production/presentation/manager/engineer_production_bloc.dart';
import 'package:high_q_paginated_drop_down/high_q_paginated_drop_down.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:toastification/toastification.dart';

class EngineerCreateLaboratoryApplicationPage extends StatefulWidget {
  const EngineerCreateLaboratoryApplicationPage({super.key});

  @override
  State<EngineerCreateLaboratoryApplicationPage> createState() =>
      _EngineerCreateLaboratoryApplicationPageState();
}

class _EngineerCreateLaboratoryApplicationPageState
    extends State<EngineerCreateLaboratoryApplicationPage> {
  late final bloc = context.read<EngineerLaboratoryBloc>();
  late final blocProduction = context.read<EngineerProductionBloc>();

  final form = FormGroup({
    'type': FormControl<int>(validators: [Validators.required]),
    'object': FormControl<int>(validators: [Validators.required]),
    'comment': FormControl<String>(validators: [Validators.required]),
    'address': FormControl<String>(validators: [Validators.required]),
  });

  FormControl<int> get type => form.control('type') as FormControl<int>;

  FormControl<int> get object => form.control('object') as FormControl<int>;

  FormControl<String> get comment => form.control('comment') as FormControl<String>;
  FormControl<String> get address => form.control('address') as FormControl<String>;

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
                            bloc.createApplication(CreateLaboratoryApplicationBody(
                              address: address.value,
                              applicationDescription: comment.value,
                              type: type.value,
                              hetObjectProperty: object.value
                            ));
                          } else {
                            form.markAllAsTouched();
                          }
                        }));
              })
            ],
          )
        ],
        body: BlocConsumer<EngineerLaboratoryBloc, EngineerLaboratoryState>(
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
            if (state.isCreated) {
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
                    items: state.applicationTypes
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
                  ReactiveTextField(
                    formControl: address,
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,
                      fillColor: Colors.white,
                      labelText: S.of(context).address,
                      border: appTextFiledTransparentBorder(),
                      enabledBorder: appTextFiledTransparentBorder(),
                      disabledBorder: appTextFiledTransparentBorder(),
                      focusedBorder: appTextFiledTransparentBorder(),
                      errorBorder: appTextFiledErrorBorder(),
                    ),
                    keyboardType: TextInputType.text,
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
                      final paginatedList = await blocProduction.hetObjects(
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
