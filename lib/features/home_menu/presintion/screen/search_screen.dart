import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:med_dos/core/local/app_local.dart';
import 'package:med_dos/core/utils/app_colors.dart';
import 'package:med_dos/core/utils/app_string.dart';
import 'package:med_dos/core/utils/commons.dart';
import 'package:med_dos/core/widget/custom_text_form_field.dart';
import 'package:med_dos/features/home/presentation/cubit/home_cubit.dart';
import 'package:med_dos/features/home_menu/presintion/cubit/search_cubit.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/component/doctor_item_component.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List searchTypy = ["specialization", "name", "city", "country"];
  int selectSearchType = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.medDose,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        elevation: 0,
      ),
      body: BlocConsumer<SearchCubit, SearchState>(
        listener: (context, state) {
          if (state is ErrorSearchState) {
            showToast(message: state.error, state: ToastState.error);
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Container(
                  height: 70,
                  padding: EdgeInsets.all(5),
                  child: ListView.builder(
                      itemBuilder: (_, i) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              selectSearchType = i;
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 100,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: selectSearchType == i
                                    ? AppColors.primary.withOpacity(0.5)
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      offset: Offset(3, 2),
                                      blurRadius: 15)
                                ]),
                            child: Center(
                              child: Text(searchTypy[i]),
                            ),
                          ),
                        );
                      },
                      itemCount: searchTypy.length,
                      scrollDirection: Axis.horizontal),
                ),
                TextFormField(
                  controller: BlocProvider.of<HomeCubit>(context).search,
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                  ),
                  onChanged: (s) {
                    BlocProvider.of<SearchCubit>(context)
                        .searchDoctor(s, selectSearchType);
                  },
                ),
                const SizedBox(height: 20),
                state is LoadedSearchState
                    ? Expanded(
                        child: ListView.builder(
                          itemCount: state.doctors.length,
                          itemBuilder: (context, index) => Padding(
                              padding: EdgeInsets.all(8),
                              child: DoctorItemComponent(
                                doctorModel: state.doctors[index],
                              )),
                        ),
                      )
                    : (state is LoadingSearchState
                        ? Container(
                            child: Center(
                              child: SpinKitFadingCircle(
                                color: AppColors.primary,
                              ),
                            ),
                          )
                        : Container()),
              ],
            ),
          );
        },
      ),
    );
  }
}
