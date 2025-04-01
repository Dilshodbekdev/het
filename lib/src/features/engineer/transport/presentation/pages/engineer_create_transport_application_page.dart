import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/components/app_elevated_button.dart';
import 'package:het/src/config/components/text_field_components.dart';
import 'package:het/src/config/theme/app_colors.dart';
import 'package:het/src/features/engineer/production/presentation/manager/engineer_production_bloc.dart';
import 'package:het/src/features/engineer/transport/data/bodies/create_transport_application_body.dart';
import 'package:het/src/features/engineer/transport/presentation/manager/engineer_transport_bloc.dart';
import 'package:intl/intl.dart';
import 'package:reactive_date_time_picker/reactive_date_time_picker.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:toastification/toastification.dart';

class EngineerCreateTransportApplicationPage extends StatefulWidget {
  const EngineerCreateTransportApplicationPage({super.key});

  @override
  State<EngineerCreateTransportApplicationPage> createState() =>
      _EngineerCreateTransportApplicationPageState();
}

class _EngineerCreateTransportApplicationPageState
    extends State<EngineerCreateTransportApplicationPage> {
  late final bloc = context.read<EngineerTransportBloc>();
  late final blocProduction = context.read<EngineerProductionBloc>();

  final form = FormGroup({
    'type': FormControl<int>(validators: [Validators.required]),
    'date': FormControl<DateTime>(validators: [Validators.required]),
    'comment': FormControl<String>(validators: [Validators.required]),
    'address': FormControl<String>(validators: [Validators.required]),
  });

  FormControl<int> get type => form.control('type') as FormControl<int>;

  FormControl<DateTime> get date => form.control('date') as FormControl<DateTime>;

  FormControl<String> get comment => form.control('comment') as FormControl<String>;
  FormControl<String> get address => form.control('address') as FormControl<String>;

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: form,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).orderTransport),
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
                            bloc.createApplication(CreateTransportApplicationBody(
                              address: address.value,
                              description: comment.value,
                              type: type.value,
                              whenNeed: DateFormat('yyyy-MM-dd').format(date.value ?? DateTime.now()),
                            ));
                          } else {
                            form.markAllAsTouched();
                          }
                        }));
              })
            ],
          )
        ],
        body: BlocConsumer<EngineerTransportBloc, EngineerTransportState>(
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
              bloc.applications(
                '',
              );
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
                  ReactiveDateTimePicker(
                    formControl: date,
                    type: ReactiveDatePickerFieldType.date,
                    dateFormat: DateFormat('yyyy-MM-dd'),
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,
                      fillColor: Colors.white,
                      labelText: S.of(context).whenNeed,
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
