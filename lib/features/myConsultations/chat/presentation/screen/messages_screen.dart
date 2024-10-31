import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:med_dos/core/database/api/end_points.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/commons.dart';
import 'package:med_dos/features/myConsultations/chat/data/model/message.dart';
import 'package:med_dos/features/myConsultations/chat/presentation/messages_Cubit/messages_cubit.dart';
import 'package:med_dos/features/myConsultations/data/model/Consultation.dart';
import 'package:med_dos/features/myConsultations/presentation/screen/medicalConsultation_screen.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:photo_view/photo_view.dart';

class MessagesScreen extends StatefulWidget {
  final Consultations s;

  const MessagesScreen({super.key, required this.s});

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<MessagesCubit>(context).getMessages(widget.s.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.s.firstName + " " + widget.s.lastName),
      ),
      body: BlocConsumer<MessagesCubit, MessagesState>(
        listener: (_, state) {
          if (state is ErrorMessages) {
            showToast(message: state.error, state: ToastState.error);
          }
        },
        builder: (_, state) {
          if (state is LoadingMessages) {
            return Container(
              child: Center(
                child: SpinKitFadingCircle(
                  color: AppColors.primary,
                ),
              ),
            );
          }
          if (state is LoadedMessages) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.messages.length,
                    itemBuilder: (context, index) {
                      return _buildMessage(state.messages[index]);
                    },
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>MedicalConsultation(id: widget.s.id))).then((value) =>
            BlocProvider.of<MessagesCubit>(context).getMessages(widget.s.id)
        );
      },child: Icon(Icons.send),),
    );
  }

  Widget _buildMessage(Message message) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment:
          message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              width: 250,
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: message.isMe ? AppColors.primary : Colors.grey[300],
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (message.message != null)
                    Text(
                      message.message!,
                      style: TextStyle(
                        color: message.isMe ? Colors.white : Colors.black,
                      ),
                    ),
                  SizedBox(height: 10),
                  if (message.image != "")
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(
                            image: NetworkImage(
                              EndPoint.ImageUrl + message.image!,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  if (message.pdf != "")
                    GestureDetector(
                     // onTap: () => _showPDF(EndPoint.ImageUrl + message.pdf!),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.picture_as_pdf,
                              color: message.isMe ? Colors.white : Colors.red),
                          SizedBox(width: 8),
                          Text(
                            'View PDF',
                            style: TextStyle(
                              color: message.isMe ? Colors.white : Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              DateFormat('h:mm a').format(DateTime.parse(message.createdAt)),
              style: TextStyle(fontSize: 12.0, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

//   void _showPDF(String pdfUrl) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) => PDFViewerScreen(pdfUrl: pdfUrl),
//       ),
//     );
//   }
// }
//
// class PDFViewerScreen extends StatefulWidget {
//   final String pdfUrl;
//
//   PDFViewerScreen({required this.pdfUrl});
//
//   @override
//   _PDFViewerScreenState createState() => _PDFViewerScreenState();
// }
//
// class _PDFViewerScreenState extends State<PDFViewerScreen> {
//   late final WebViewController controller;
//
//   @override
//   void initState() {
//     super.initState();
//    // controller = WebViewController()
//      // ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(const Color(0x00000000))
//       ..setNavigationDelegate(
//       //  NavigationDelegate(
//           onProgress: (int progress) {
//             // Update loading bar.
//           },
//           onPageStarted: (String url) {},
//           onPageFinished: (String url) {},
//        //   onWebResourceError: (WebResourceError error) {},
//         ),
//       )
//       ..loadRequest(Uri.parse('https://docs.google.com/gview?embedded=true&url=${widget.pdfUrl}'));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('عارض PDF'),
//       ),
//      // body: WebViewWidget(controller: controller),
//     );
//   }
}
