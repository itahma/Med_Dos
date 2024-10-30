import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:med_dos/core/database/api/end_points.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/commons.dart';
import 'package:med_dos/features/myConsultations/chat/presentation/screen/messages_screen.dart';
import 'package:med_dos/features/myConsultations/data/model/Consultation.dart';
import 'package:med_dos/features/myConsultations/presentation/Consultions_Cubit/consulation_cubit.dart';

class MyConsultations extends StatelessWidget {
  const MyConsultations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: ()async{
        BlocProvider.of<ConsulationCubit>(context).getMyConsulation();
      },
      child: BlocConsumer<ConsulationCubit, ConsulationState>(
          listener: (_, state) {
        if (state is ErrorConsulation) {
          showToast(message: state.error, state: ToastState.error);
        }
      }, builder: (_, state) {
        if (state is LoadingConsulation) {
          return Container(
            child: Center(
              child: SpinKitFadingCircle(
                color: AppColors.primary,
              ),
            ),
          );
        }
        if (state is LoadedConsulation) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                  AppColors.primary.withOpacity(.8),
                  AppColors.primary
                ])),
            child: Container(padding: EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: state.consulation.length,
                itemBuilder: (context, index) {
                  return _buildChatItem(state.consulation[index],context);
                },
              ),
            ),
          );
        }
        return Container();
      }),
    );
  }

  Widget _buildChatItem(Consultations con,context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>MessagesScreen(s:con)));
      },
      child: Container(
        padding: EdgeInsets.all(5),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white.withOpacity(0.5),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  offset: Offset(2, 3),
                  blurRadius: 15)
            ]),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(EndPoint.ImageUrl + con.photo),
          ),
          title: Text(con.firstName + " " + con.lastName,style: TextStyle(fontSize: 20),),
          subtitle: Text("10:30 PM",style: TextStyle(color: Colors.grey),),
        ),
      ),
    );
  }
}
