import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/components/app_elevated_button.dart';
import 'package:het/src/config/components/text_field_components.dart';
import 'package:het/src/config/theme/app_colors.dart';
import 'package:het/src/features/engineer/production/data/bodies/engineer_reject_body.dart';
import 'package:het/src/features/engineer/production/presentation/manager/engineer_production_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:toastification/toastification.dart';

class EngineerRejectTaskPage extends StatefulWidget {
  final int id;
  final String type;
  const EngineerRejectTaskPage({super.key, required this.id, required this.type});

  @override
  State<EngineerRejectTaskPage> createState() => _EngineerRejectTaskPageState();
}

class _EngineerRejectTaskPageState extends State<EngineerRejectTaskPage> {
  late final bloc = context.read<EngineerProductionBloc>();
  late final blocProduction = context.read<EngineerProductionBloc>();

  final form = FormGroup({
    'date': FormControl<DateTime>(validators: [Validators.required]),
    'comment': FormControl<String>(validators: [Validators.required]),
  });

  FormControl<DateTime> get date =>
      form.control('date') as FormControl<DateTime>;

  FormControl<String> get comment =>
      form.control('comment') as FormControl<String>;

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).rejectTask),
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
                        text: S.of(context).extend,
                        onClick: () {
                          if (form.valid) {
                            bloc.rejectTask(
                              EngineerRejectBody(
                                engineerClosingComment: comment.value,
                                deadline: DateFormat('yyyy-MM-dd').format(date.value ?? DateTime.now()),
                                id: widget.id,
                                type: widget.type
                              )
                            );
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
            if (state.isTaskRejected) {
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
                    S.of(context).rejectTask,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  ReactiveDateTimePicker(
                    formControl: date,
                    type: ReactiveDatePickerFieldType.date,
                    dateFormat: DateFormat('yyyy-MM-dd'),
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,
                      fillColor: Colors.white,
                      labelText: S.of(context).newTerm,
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
