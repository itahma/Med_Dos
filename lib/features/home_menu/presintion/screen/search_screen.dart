import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:med_dos/core/local/app_local.dart';
import 'package:med_dos/core/utils/app_string.dart';
import 'package:med_dos/core/widget/custom_text_form_field.dart';
import 'package:med_dos/features/home/presentation/cubit/home_cubit.dart';
import 'package:med_dos/features/home_menu/presintion/screen/docto_%20details/presentation/component/doctor_item_component.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CustomTextFormField(
              controller: BlocProvider.of<HomeCubit>(context).search,
              onTap: () {},
              hint: AppString.whatAreYouLookingFor.tr(context),
              icon: Icons.search,
              keyboardType: TextInputType.text,
              validate: (data) {
                if (data == null) {}
              },
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.all(8),
                  child: DoctorItemComponent(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}