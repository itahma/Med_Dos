import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:med_dos/core/local/app_local.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/app_string.dart';
import 'dart:io';
import 'package:path/path.dart' as path;


class MedicalConsultation extends StatefulWidget {
  const MedicalConsultation({Key? key}) : super(key: key);

  @override
  _MedicalConsultationState createState() => _MedicalConsultationState();
}

class _MedicalConsultationState extends State<MedicalConsultation> {
  final TextEditingController _textController = TextEditingController();
  int _characterCount = 0;
  final int _maxCharacters = 150;
  File? _image;
  String? _pdfPath;

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
                title:  Text(AppString.chooseAnImageFromTheGallery.tr(context)),
                onTap: () {
                  Navigator.pop(context);
                  _getImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title:  Text(AppString.takeAPictureWithTheCamera.tr(context)),
                onTap: () {
                  Navigator.pop(context);
                  _getImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.attach_file),
                title:  Text(AppString.uploadAPDFFile.tr(context)),
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
        _image = File(pickedFile.path);
        _pdfPath = null; // Reset PDF if image is selected
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
        _image = null; // Reset image if PDF is selected
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                 Text(
                  AppString.explainYourConditionOrInquiryToTheDoctorBriefly.tr(context),
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  //textAlign: TextAlign.right,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _textController,
                  maxLines: 5,
                  maxLength: _maxCharacters,
                  decoration:  InputDecoration(
                    hintStyle: TextStyle(fontSize: 16,),
                    hintText: AppString.tellTheDoctorAboutTheSymptomsYouAreExperiencing.tr(context),
                    border: const OutlineInputBorder(),
                    counterText: '',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    '$_characterCount / $_maxCharacters '+AppString.character.tr(context),
                    textAlign: TextAlign.right,
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: _showAttachmentOptions,
                  icon: const Icon(Icons.attach_file),
                  label:  Text(AppString.attachAFile.tr(context)),
                ),
                const SizedBox(height: 16),
                if (_image != null)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Image.file(
                            _image!,
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
                                  AppString.anImageHasBeenSelected.tr(context),
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(path.basename(_image!.path)),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              setState(() {
                                _image = null;
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
                                  AppString.thePDFFileHasBeenSelected.tr(context),
                                  style: const TextStyle(fontWeight: FontWeight.bold),
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
                  child:  Text(AppString.confirm.tr(context)),
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: AppColors.primary,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
