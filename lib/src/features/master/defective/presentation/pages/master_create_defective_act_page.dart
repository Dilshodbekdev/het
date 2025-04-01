
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/components/app_container.dart';
import 'package:het/src/config/components/app_elevated_button.dart';
import 'package:het/src/config/components/text_field_components.dart';
import 'package:het/src/config/theme/app_colors.dart';
import 'package:het/src/config/theme/text_styles.dart';
import 'package:het/src/features/engineer/production/data/bodies/paging_body.dart';
import 'package:het/src/features/engineer/production/data/models/het_objects_model.dart';
import 'package:het/src/features/engineer/production/presentation/manager/engineer_production_bloc.dart';
import 'package:het/src/features/master/defective/data/bodies/create_defective_act_body.dart';
import 'package:het/src/features/master/defective/presentation/manager/master_defective_act_bloc.dart';
import 'package:het/src/features/master/tasks/data/models/master_fitter_model.dart';
import 'package:het/src/features/master/tasks/presentation/manager/master_tasks_bloc.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart' as reactive_search;
import 'package:high_q_paginated_drop_down/high_q_paginated_drop_down.dart' as high_q_dropdown;
import 'package:reactive_forms/reactive_forms.dart';
import 'package:toastification/toastification.dart';

class MasterCreateDefectiveActPage extends StatefulWidget {
  final int id;

  const MasterCreateDefectiveActPage({super.key, required this.id});

  @override
  State<MasterCreateDefectiveActPage> createState() =>
      _MasterCreateDefectiveActPageState();
}

class _MasterCreateDefectiveActPageState
    extends State<MasterCreateDefectiveActPage> {
  late final bloc = context.read<MasterDefectiveActBloc>();
  late final blocProduction = context.read<EngineerProductionBloc>();
  late final blocMaster = context.read<MasterTasksBloc>();
  final form = FormGroup({
    'object': FormControl<int>(validators: [Validators.required]),
    'fitters': FormControl<List<MasterFitterModel>>(validators: [Validators.required]),
    'comment': FormControl<String>(validators: [Validators.required]),
    'defect_works': FormArray([]),
  });

  FormControl<int> get object => form.control('object') as FormControl<int>;
  FormControl<List<MasterFitterModel>> get fitters =>
      form.control('fitters') as FormControl<List<MasterFitterModel>>;
  FormControl<String> get comment =>
      form.control('comment') as FormControl<String>;

  FormArray get defectWorks => form.control('defect_works') as FormArray;

  FormGroup _getDefectWorkByIndex(int index) {
    final group = defectWorks.controls[index] as FormGroup;
    return group;
  }

  @override
  void initState() {
    super.initState();
    bloc.defectWorkUnits();
    blocMaster.fitters();
    if(widget.id==0){
      defectWorks.add(FormGroup({
        'name': FormControl<String>(validators: [Validators.required]),
        'unit': FormControl<int>(validators: [Validators.required]),
        'quantity': FormControl<int>(validators: [Validators.required]),
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).addDefectiveAct),
        ),
        persistentFooterAlignment: AlignmentDirectional.center,
        persistentFooterButtons: [
          Row(
            spacing: 16.0,
            children: [
              ReactiveFormConsumer(builder: (context, form1, child) {
                return Expanded(
                    child: AppElevatedButton(
                        text: S.of(context).save,
                        bgColor: Colors.white,
                        textColor: AppColors.mainColor,
                        onClick: () {
                          if (form.valid) {
                            List<DefectWorks> defectWorkList=[];
                            defectWorks.controls.asMap().forEach((key1, value1){
                              final defectWork = value1 as FormGroup;
                              final name = defectWork.control('name') as FormControl<String>;
                              final unit = defectWork.control('unit') as FormControl<int>;
                              final quantity = defectWork.control('quantity') as FormControl<int>;

                              defectWorkList.add(
                                  DefectWorks(
                                    quantity: quantity.value,
                                    unit: unit.value,
                                    name: name.value,
                                  )
                              );
                            });

                            if(widget.id!=0){
                              bloc.createDefectiveAct(CreateDefectiveActBody(
                                defectWorks: defectWorkList,
                                fitters: fitters.value?.map((e)=>e.id??0).toList(),
                                masterComment: comment.value,
                                hetObjectProperty: object.value,
                                id: widget.id,
                                tempSave: false,
                              ));
                            }else{
                              bloc.updateDefectiveAct(CreateDefectiveActBody(
                                defectWorks: defectWorkList,
                                fitters: fitters.value?.map((e)=>e.id??0).toList(),
                                masterComment: comment.value,
                                hetObjectProperty: object.value,
                                id: widget.id,
                                tempSave: false,
                              ));
                            }
                          } else {
                            form.markAllAsTouched();
                          }
                        }));
              }),
              ReactiveFormConsumer(builder: (context, form1, child) {
                return Expanded(
                    child: AppElevatedButton(
                        text: S.of(context).sent,
                        onClick: () {
                          if (form.valid) {
                            List<DefectWorks> defectWorkList=[];
                            defectWorks.controls.asMap().forEach((key1, value1){
                              final defectWork = value1 as FormGroup;
                              final name = defectWork.control('name') as FormControl<String>;
                              final unit = defectWork.control('unit') as FormControl<int>;
                              final quantity = defectWork.control('quantity') as FormControl<int>;

                              defectWorkList.add(
                                  DefectWorks(
                                    quantity: quantity.value,
                                    unit: unit.value,
                                    name: name.value,
                                  )
                              );
                            });

                            if(widget.id!=0){
                              bloc.createDefectiveAct(CreateDefectiveActBody(
                                defectWorks: defectWorkList,
                                fitters: fitters.value?.map((e)=>e.id??0).toList(),
                                masterComment: comment.value,
                                hetObjectProperty: object.value,
                                id: widget.id,
                                tempSave: false,
                              ));
                            }else{
                              bloc.updateDefectiveAct(CreateDefectiveActBody(
                                defectWorks: defectWorkList,
                                fitters: fitters.value?.map((e)=>e.id??0).toList(),
                                masterComment: comment.value,
                                hetObjectProperty: object.value,
                                id: widget.id,
                                tempSave: false,
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
        body: BlocConsumer<MasterDefectiveActBloc, MasterDefectiveActState>(
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
            if (state.isUpdated) {
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
            if(state.isDetails){
              if(widget.id!=0){
                List<MasterFitterModel> fitter=[];
                state.defectiveActDetails?.fitters?.forEach((item){
                  fitter.add(MasterFitterModel(
                    id: item.fitterId,
                    fullName: item.fullName,
                  ));
                });
                fitters.value=fitter;
                comment.value=state.defectiveActDetails?.masterComment;
                object.value=state.defectiveActDetails?.hetObjectProperty?.id;

                state.defectiveActDetails?.defectWorks?.forEach((action){
                  defectWorks.add(
                      FormGroup({
                        'name': FormControl<String>(validators: [Validators.required],value: action.name),
                        'unit': FormControl<int>(validators: [Validators.required],value: action.unit?.id),
                        'quantity': FormControl<int>(validators: [Validators.required],value: action.quantity),
                      })
                  );
                });
              }
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: 16.0,
                children: [
                  Text(
                    S.of(context).information,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  if(!state.isLoading)
                  high_q_dropdown.HighQPaginatedDropdown<HetObject>.paginated(
                    backgroundDecoration: (child) => InputDecorator(
                      decoration: InputDecoration(
                        filled: true,
                        isDense: true,
                        fillColor: Colors.white,
                        labelText: S.of(context).object,
                        border: appTextFiledTransparentBorder(),
                        enabledBorder: appTextFiledTransparentBorder(),
                        disabledBorder: appTextFiledTransparentBorder(),
                        focusedBorder: appTextFiledTransparentBorder(),
                        errorBorder: appTextFiledErrorBorder(),
                      ),
                      child: child,
                    ),
                    initialValue: widget.id!=0? high_q_dropdown.MenuItemModel(
                      value: HetObject(
                        id: state.defectiveActDetails?.hetObjectProperty?.id,
                        name: state.defectiveActDetails?.hetObjectProperty?.name,
                      ),
                      label: state.defectiveActDetails?.hetObjectProperty?.name??'-',
                      child: Text(
                        state.defectiveActDetails?.hetObjectProperty?.name??'-',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ):null,
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
                        return high_q_dropdown.MenuItemModel(
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
                  BlocBuilder<MasterTasksBloc, MasterTasksState>(
                    builder: (context, state) {
                      return reactive_search.ReactiveDropdownSearchMultiSelection<
                          MasterFitterModel, MasterFitterModel>(
                        formControl: fitters,
                        dropdownDecoratorProps: reactive_search.DropDownDecoratorProps(
                          decoration: InputDecoration(
                            filled: true,
                            isDense: true,
                            fillColor: Colors.white,
                            labelText: S.of(context).fitters,
                            border: appTextFiledTransparentBorder(),
                            enabledBorder: appTextFiledTransparentBorder(),
                            disabledBorder: appTextFiledTransparentBorder(),
                            focusedBorder: appTextFiledTransparentBorder(),
                            errorBorder: appTextFiledErrorBorder(),
                          ),
                        ),
                        compareFn: (item1, item2) => item1.id == item2.id,
                        popupProps: reactive_search.PopupPropsMultiSelection.menu(
                          menuProps: reactive_search.MenuProps(
                              borderRadius: BorderRadius.circular(6)),
                          showSelectedItems: false,
                        ),
                        validationMessages: {
                          'required': (error) =>
                              S.of(context).thefieldmustnotbeempty,
                        },
                        items: (_, __) => state.fitters ?? [],
                        itemAsString: (item) => item.fullName ?? '-',
                      );
                    },
                  ),
                  ReactiveTextField(
                    formControl: comment,
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,
                      fillColor: Colors.white,
                      labelText: S.of(context).comments,
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
                  ReactiveFormArray(
                      formArray: defectWorks,
                      builder: (context, array, child){
                        return Column(
                          children: List.generate(defectWorks.controls.length, (questionIndex){
                            final defectWork =_getDefectWorkByIndex(questionIndex);
                            return AppContainer(
                              margin: EdgeInsets.only(top: 16.0),
                              padding: EdgeInsets.only(bottom: 16.0,right: 16.0,left: 16.0),
                              child: Column(
                                spacing: 8.0,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "${++questionIndex}. ${S.of(context).defectiveAct}",
                                        style: CustomTextStyle.h18SB,
                                      ),
                                      const Spacer(),
                                      IconButton(onPressed: (){
                                        if(defectWorks.controls.length>1){
                                          defectWorks.remove(defectWork);
                                        }else{
                                         // snackBar(S.of(context).theremustbeatleastonequestion);
                                        }
                                      }, icon: const Icon(Icons.clear,color: AppColors.mainRedColor,))
                                    ],
                                  ),
                                  ReactiveTextField(
                                    formControl: defectWork.control('name') as FormControl<String>,
                                    decoration: InputDecoration(
                                      filled: true,
                                      isDense: true,
                                      fillColor: Colors.white,
                                      labelText: S.of(context).name,
                                      border: appTextFiledBorder(),
                                      enabledBorder: appTextFiledBorder(),
                                      disabledBorder: appTextFiledBorder(),
                                      focusedBorder: appTextFiledBorder(),
                                      errorBorder: appTextFiledErrorBorder(),
                                    ),
                                    validationMessages: {
                                      'required': (error) =>
                                      S.of(context).thefieldmustnotbeempty,
                                    },
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: ReactiveTextField(
                                          formControl: defectWork.control('quantity') as FormControl<int>,
                                          decoration: InputDecoration(
                                            filled: true,
                                            isDense: true,
                                            fillColor: Colors.white,
                                            labelText: S.of(context).quantity,
                                            border: appTextFiledBorder(),
                                            enabledBorder: appTextFiledBorder(),
                                            disabledBorder: appTextFiledBorder(),
                                            focusedBorder: appTextFiledBorder(),
                                            errorBorder: appTextFiledErrorBorder(),
                                          ),
                                          keyboardType: TextInputType.number,
                                          minLines: 1,
                                          maxLines: null,
                                          validationMessages: {
                                            'required': (error) =>
                                            S.of(context).thefieldmustnotbeempty,
                                          },
                                        ),
                                      ),
                                      const Gap(8),
                                      Expanded(
                                        child: ReactiveDropdownField(
                                          formControl: defectWork.control('unit') as FormControl<int>,
                                          decoration: InputDecoration(
                                            filled: true,
                                            isDense: true,
                                            fillColor: Colors.white,
                                            labelText: S.of(context).reasonFor,
                                            border: appTextFiledBorder(),
                                            enabledBorder: appTextFiledBorder(),
                                            disabledBorder: appTextFiledBorder(),
                                            focusedBorder: appTextFiledBorder(),
                                            errorBorder: appTextFiledErrorBorder(),
                                          ),
                                          items:
                                          List.generate(state.defectiveWorkUnits?.length ?? 0, (index) {
                                            return DropdownMenuItem(
                                              value: state.defectiveWorkUnits?[index].id,
                                              child: Text(state.defectiveWorkUnits?[index].name ?? '-'),
                                            );
                                          }),
                                          validationMessages: {
                                            'required': (error) =>
                                            S.of(context).thefieldmustnotbeempty,
                                          },
                                        ),
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            );
                          }),
                        );
                      }),
                  OutlinedButton.icon(
                      onPressed: (){
                        defectWorks.add(FormGroup({
                          'name': FormControl<String>(validators: [Validators.required]),
                          'unit': FormControl<int>(validators: [Validators.required]),
                          'quantity': FormControl<int>(validators: [Validators.required]),
                        }));
                      },
                      label: Text(S.of(context).add),
                    icon: Icon(Icons.add),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
