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
          leading: CircleAvatar(
            backgroundImage: NetworkImage(EndPoint.ImageUrl + widget.s.photo),
          ),
          title: Text(widget.s.firstName + " " + widget.s.lastName),
        ),
        body: BlocConsumer<MessagesCubit, MessagesState>(listener: (_, state) {
          if (state is ErrorMessages) {
            showToast(message: state.error, state: ToastState.error);
          }
        }, builder: (_, state) {
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
                _buildMessageInput(),
              ],
            );
          }
          return Container();
        }));
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
              //  padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: message.isMe ? Colors.blueAccent : Colors.grey[300],
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  message.message != null
                      ? Text(
                          message.message!,
                          style: TextStyle(
                            color: message.isMe ? Colors.white : Colors.black,
                          ),
                        )
                      : Container(),
                  SizedBox(
                    height: 10,
                  ),
                  message.image != ""
                      ? Container(
                    height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          image: DecorationImage(image: NetworkImage(EndPoint.ImageUrl+message.image!,),fit: BoxFit.fill)
                        ),

                      )
                      : Container(),
                      message.pdf!=""?Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.picture_as_pdf, color: message.isMe ? Colors.white : Colors.red),
                          SizedBox(width: 8),
                          Text(
                            'PDF Document',
                            style: TextStyle(color: message.isMe ? Colors.white : Colors.black),
                          ),
                        ],
                      ):Container()
                ])),
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

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Type a message',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
