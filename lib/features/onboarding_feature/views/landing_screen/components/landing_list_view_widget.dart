import '../../../../../file_export.dart';
import '../../../data/models/user_individual_model.dart';

class LandingListViewWidget extends StatelessWidget {
  final UserIndividualModel userIndividualModel;

  const LandingListViewWidget({Key? key, required this.userIndividualModel})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: 27.w, right: 22.w, bottom: 21.h, top: 25.h),
      decoration: BoxDecoration(
        color: AppColors.white1,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: AppColors.dividerColor),
        boxShadow: const [
          BoxShadow(
            color: AppColors.orange0,
            blurRadius: 2,
            offset: Offset(0, 0),
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        children: [
          ///name
          Text("Name: ${userIndividualModel.firstName!}",
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontSize: 16.sp),
              textAlign: TextAlign.center),
          SizedBox(
            height: 10.h,
          ),

          ///nationality
          Text("Nationality: ${userIndividualModel.nationality!}",
              style: Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.center),

          ///score
          Text("Score: ${userIndividualModel.score}",
              style: Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.center),

          ///descriptions
          SizedBox(
            height: 20,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: userIndividualModel.descriptions?.length,
              itemBuilder: (context, index) => Wrap(
                children: [
                  Text(
                      "${userIndividualModel.descriptions![index].description1!},"),
                  Text(userIndividualModel.descriptions![index].description2!),
                  Text(userIndividualModel.descriptions![index].description3!),
                ],
              ),
            ),
          ),

          ///placeOfBirth
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: userIndividualModel.placeOfBirth?.length,
            itemBuilder: (context, index) => Center(
                child: Text(userIndividualModel.placeOfBirth![index] ?? "")),
          ),
        ],
      ),
    );
  }
}
