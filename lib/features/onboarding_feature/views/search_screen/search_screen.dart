import 'package:sarmad_task/features/onboarding_feature/data/models/user_individual_model.dart';

import '../../../../file_export.dart';
import '../../domain/cubit/landing_cubit.dart';
import '../landing_screen/landing_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const route = "/SearchScreen";

  @override
  Widget build(BuildContext context) {
    final userIndividualModel = context.watch<LandingCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Search For Individual",
            style: Theme.of(context).textTheme.displayMedium),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 30.w, right: 30.w, top: 40.h),
        child: Form(
          key: userIndividualModel.searchUserFormKey,
          child: Column(
            children: [
              ///name
              RegularTextField(
                label: "FIRST NAME",
                hintText: "",
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "";
                  }
                  return null;
                },
                onSaved: (p0) {
                  return userIndividualModel.firstName = p0!;
                },
              ),
              SizedBox(height: 28.h),
              RegularTextField(
                label: "Middle NAME",
                hintText: "",
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "";
                  }
                  return null;
                },
                onSaved: (p0) {
                  return userIndividualModel.middleName = p0!;
                },
              ),
              SizedBox(height: 28.h),
              RegularTextField(
                label: "NATIONALITY",
                hintText: "",
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "";
                  }
                  return null;
                },
                onSaved: (p0) {
                  return userIndividualModel.nationalityName = p0!;
                },
              ),
              SizedBox(height: 28.h),
              BlocConsumer<LandingCubit, LandingState>(
                listener: (context, state) {
                  if (state is LandingDone || state is LandingEmpty) {
                    GoRouter.of(context).pushNamed(LandingScreen.route);
                  }
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      if (state is LandingError)
                        Text(state.errorMessage ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(color: AppColors.red1)),
                      SizedBox(
                        height: 10.h,
                      ),
                      AppButton(
                          height: 50.h,
                          width: ScreenUtil().screenWidth,
                          name: "Search ",
                          loading: state is LandingLoading,
                          textColors: AppColors.white1,
                          onTap: () {
                            if (userIndividualModel
                                .searchUserFormKey.currentState!
                                .validate()) {
                              userIndividualModel
                                  .searchUserFormKey.currentState!
                                  .save();
                              userIndividualModel
                                  .searchUserIndividual(UserIndividualModel(
                                firstName: userIndividualModel.firstName,
                                middleName: userIndividualModel.middleName,
                                nationality:
                                    userIndividualModel.nationalityName,
                              ));
                            }
                          },
                          containerColor: AppColors.orange0,
                          borderColor: AppColors.orange0,
                          radius: 8),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
