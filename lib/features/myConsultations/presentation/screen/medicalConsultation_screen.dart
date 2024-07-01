import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:med_dos/core/local/app_local.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/app_string.dart';
import 'package:med_dos/core/utils/commons.dart';
import 'package:med_dos/features/myConsultations/presentation/Consultions_Cubit/consulation_cubit.dart';
import 'dart:io';
import 'package:path/path.dart' as path;

class MedicalConsultation extends StatefulWidget {
  String id;
   MedicalConsultation({required this.id,Key? key}) : super(key: key);

  @override
  _MedicalConsultationState createState() => _MedicalConsultationState();
}

class _MedicalConsultationState extends State<MedicalConsultation> {
  final TextEditingController _textController = TextEditingController();
  int _characterCount = 0;
  final int _maxCharacters = 150;

  String? _pdfPath;
  String?_imagePath;
  @override
  void initState() {
    super.initState();
    _textController.addListener(_updateCharacterCount);
  }

  void _updateCharacterCount() {
    setState(() {
      _characterCount = _textController.text.length;
      if (_characterCount > _maxCharacters) {
        _textController.text =
            _textController.text.substring(0, _maxCharacters);
        _textController.selection = TextSelection.fromPosition(
            TextPosition(offset: _textController.text.length));
        _characterCount = _maxCharacters;
      }
    });
  }

  Future<void> _showAttachmentOptions() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: Text(AppString.chooseAnImageFromTheGallery.tr(context)),
                onTap: () {
                  Navigator.pop(context);
                  _getImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: Text(AppString.takeAPictureWithTheCamera.tr(context)),
                onTap: () {
                  Navigator.pop(context);
                  _getImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.attach_file),
                title: Text(AppString.uploadAPDFFile.tr(context)),
                onTap: () {
                  Navigator.pop(context);
                  _getPdfFile();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _imagePath=pickedFile.path;
         // Reset PDF if image is selected
      });
    }
  }

  Future<void> _getPdfFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (result != null) {
      setState(() {
        _pdfPath = result.files.single.path;
         // Reset image if PDF is selected
      });
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppString.medDose,
            style: Theme.of(context).textTheme.displayMedium),
        elevation: 0,
      ),
      body: BlocConsumer<ConsulationCubit, ConsulationState>(
          listener: (_, state) {
        if (state is ErrorSendConsulation) {
          showToast(message: state.error, state: ToastState.error);
        }
        if (state is succesSendConsulation) {
          showToast(message: state.message, state: ToastState.success);
        }
      }, builder: (_, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    AppString.explainYourConditionOrInquiryToTheDoctorBriefly
                        .tr(context),
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                    //textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _textController,
                    maxLines: 5,
                    maxLength: _maxCharacters,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                        fontSize: 16,
                      ),
                      hintText: AppString
                          .tellTheDoctorAboutTheSymptomsYouAreExperiencing
                          .tr(context),
                      border: const OutlineInputBorder(),
                      counterText: '',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      '$_characterCount / $_maxCharacters ' +
                          AppString.character.tr(context),
                      textAlign: TextAlign.right,
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: _showAttachmentOptions,
                    icon: const Icon(Icons.attach_file),
                    label: Text(AppString.attachAFile.tr(context)),
                  ),
                  const SizedBox(height: 16),
                  if (_imagePath != null)
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.file(
                             File(_imagePath!),
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppString.anImageHasBeenSelected
                                        .tr(context),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(path.basename(_imagePath!)),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                setState(() {
                                  _imagePath = null;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  if (_pdfPath != null)
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(Icons.picture_as_pdf,
                                size: 48, color: Colors.red),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    AppString.thePDFFileHasBeenSelected
                                        .tr(context),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(path.basename(_pdfPath!)),
                                ],
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                setState(() {
                                  _pdfPath = null;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    child: Text(AppString.confirm.tr(context)),
                    onPressed: () {
                      BlocProvider.of<ConsulationCubit>(context).createConsulation(widget.id, _textController.text, _imagePath!=null?_imagePath!:"",_pdfPath!=null?_pdfPath:"");
                      BlocProvider.of<ConsulationCubit>(context).getMyConsulation();
                      Navigator.of(context).pop();
                      },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
