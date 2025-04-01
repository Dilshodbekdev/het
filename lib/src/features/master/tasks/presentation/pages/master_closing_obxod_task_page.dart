import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:het/generated/l10n.dart';
import 'package:het/src/config/components/app_elevated_button.dart';
import 'package:het/src/config/components/text_field_components.dart';
import 'package:het/src/config/theme/app_colors.dart';
import 'package:het/src/features/engineer/production/presentation/manager/engineer_production_bloc.dart';
import 'package:het/src/features/master/tasks/data/bodies/master_close_body.dart';
import 'package:het/src/features/master/tasks/presentation/manager/master_tasks_bloc.dart';
import 'package:open_file/open_file.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:toastification/toastification.dart';

class MasterClosingObxodTaskPage extends StatefulWidget {
  final int id;
  final String type;

  const MasterClosingObxodTaskPage(
      {super.key, required this.id, required this.type});

  @override
  State<MasterClosingObxodTaskPage> createState() =>
      _MasterClosingObxodTaskPageState();
}

class _MasterClosingObxodTaskPageState
    extends State<MasterClosingObxodTaskPage> {
  late final bloc = context.read<MasterTasksBloc>();
  late final blocProduction = context.read<EngineerProductionBloc>();
  File? selectedFile;

  final form = FormGroup({
    'result': FormControl<String>(validators: [Validators.required]),
    'comment': FormControl<String>(validators: [Validators.required]),
  });

  FormControl<String> get result =>
      form.control('result') as FormControl<String>;

  FormControl<String> get comment =>
      form.control('comment') as FormControl<String>;

  @override
  void initState() {
    super.initState();
    bloc.results(widget.type);
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
                            bloc.closeTask(MasterCloseBody(
                              result_obxod: int.parse(result.value ?? '0'),
                              master_comment: comment.value,
                              document_master: selectedFile,
                              type: widget.type,
                              id: widget.id,
                            ));
                          } else {
                            form.markAllAsTouched();
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
            if (state.isClosed) {
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
                  ReactiveDropdownField(
                    formControl: result,
                    decoration: InputDecoration(
                      filled: true,
                      isDense: true,
                      fillColor: Colors.white,
                      labelText: S.of(context).typeOfRepair,
                      border: appTextFiledTransparentBorder(),
                      enabledBorder: appTextFiledTransparentBorder(),
                      disabledBorder: appTextFiledTransparentBorder(),
                      focusedBorder: appTextFiledTransparentBorder(),
                      errorBorder: appTextFiledErrorBorder(),
                    ),
                    items: List.generate(state.results?.length ?? 0, (index) {
                      return DropdownMenuItem(
                        value: state.results?[index].id,
                        child: Text(state.results?[index].name ?? '-'),
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
                  Text(
                    S.of(context).dataequipmentmaintenancerepairsandtesting,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (selectedFile != null) {
                        OpenFile.open(selectedFile?.path);
                      } else {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['pdf', 'doc', 'docx'],
                        );
                        if (result != null &&
                            result.files.single.path != null) {
                          int bytes =
                              await File(result.files.single.path!).length();
                          debugPrint(result.files.single.path);
                          if (bytes <= 5242880) {
                            setState(() {
                              selectedFile = File(result.files.single.path!);
                            });
                          } else {
                            toastification.show(
                                title: Text(
                                  'S.of(context).filesizeshouldnotexceed3MB',
                                  style: const TextStyle(fontSize: 16),
                                  maxLines: 4,
                                ),
                                type: ToastificationType.error,
                                alignment: Alignment.bottomCenter,
                                showProgressBar: false,
                                style: ToastificationStyle.fillColored,
                                autoCloseDuration: Duration(seconds: 3),
                                primaryColor: Colors.redAccent);
                          }
                        } else {
                          /// User canceled the picker
                        }
                      }
                    },
                    child: DottedBorder(
                      dashPattern: const [8, 8],
                      strokeWidth: 1,
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(10),
                      color: Colors.grey,
                      child: state.isLoading
                          ? const LinearProgressIndicator(
                              color: AppColors.mainColor,
                            )
                          : Container(
                              height: 40,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: selectedFile == null
                                  ? Row(
                                      children: [
                                        const Icon(
                                          Icons.file_upload_outlined,
                                        ),
                                        const Gap(8),
                                        Text(
                                          S.of(context).download,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 14,
                                            color: AppColors.mainColor,
                                          ),
                                        )
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            selectedFile?.path
                                                    .split('/')
                                                    .last ??
                                                '-',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 14,
                                              color: AppColors.mainColor,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                selectedFile = null;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.delete_outline,
                                              color: AppColors.mainRedColor,
                                            ))
                                      ],
                                    ),
                            ),
                    ),
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
