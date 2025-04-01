
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/components/app_elevated_button.dart';
import 'package:het/src/config/components/text_field_components.dart';
import 'package:het/src/config/theme/app_colors.dart';
import 'package:het/src/features/master/tasks/data/bodies/master_accept_body.dart';
import 'package:het/src/features/master/tasks/data/models/master_fitter_model.dart';
import 'package:het/src/features/master/tasks/presentation/manager/master_tasks_bloc.dart';
import 'package:reactive_dropdown_search/reactive_dropdown_search.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:toastification/toastification.dart';

class MasterAcceptTaskPage extends StatefulWidget {
  final int id;
  final String type;

  const MasterAcceptTaskPage(
      {super.key, required this.id, required this.type});

  @override
  State<MasterAcceptTaskPage> createState() =>
      _MasterAcceptTaskPageState();
}

class _MasterAcceptTaskPageState
    extends State<MasterAcceptTaskPage> {
  late final bloc = context.read<MasterTasksBloc>();
  final formAccept = FormGroup({
    'fitters': FormControl<List<MasterFitterModel>>(validators: [Validators.required]),
  });

  FormControl<List<MasterFitterModel>> get fitters => formAccept.control('fitters') as FormControl<List<MasterFitterModel>>;

  @override
  void initState() {
    super.initState();
    bloc.fitters();
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: formAccept,
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
              ReactiveFormConsumer(builder: (context, form, child) {
                return Expanded(
                    child: AppElevatedButton(
                        text: S.of(context).accept,
                        onClick: () {
                          if (formAccept.valid) {
                            bloc.acceptTask(MasterAcceptBody(
                              fitters: fitters.value?.map((e)=>e.id??0).toList(),
                              id: widget.id,
                              type: widget.type,
                            ));
                          } else {
                            formAccept.markAllAsTouched();
                          }
                        }));
              })
            ],
          )
        ],
        body: BlocConsumer<MasterTasksBloc, MasterTasksState>(
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
            if (state.isAccepted) {
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
                  ReactiveDropdownSearchMultiSelection<MasterFitterModel, MasterFitterModel>(
                    formControl: fitters,
                    dropdownDecoratorProps: DropDownDecoratorProps(
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
                    popupProps: PopupPropsMultiSelection.menu(
                      menuProps: MenuProps(borderRadius: BorderRadius.circular(6)),
                      showSelectedItems: false,
                    ),
                    validationMessages: {
                      'required': (error) =>
                      S.of(context).thefieldmustnotbeempty,
                    },
                    items: (_, __) => state.fitters?? [],
                    itemAsString: (item)=>item.fullName??'-',
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
