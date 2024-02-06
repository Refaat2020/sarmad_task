import '../../../../../file_export.dart';
import '../../../data/models/user_individual_model.dart';

class LandingGroupViewWidget extends StatelessWidget {
  final UserIndividualModel userIndividualModel;

  const LandingGroupViewWidget({
    super.key,
    required this.userIndividualModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.h, top: 16.h),
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
          Text(
            "Name: ${userIndividualModel.firstName!}",
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(fontSize: 14.sp),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.clip,
          ),
          Text("Nationality:${userIndividualModel.nationality!}",
              style: Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.center),
          Text("Score:${userIndividualModel.score}",
              style: Theme.of(context).textTheme.displaySmall,
              textAlign: TextAlign.center),
          Expanded(
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
          Expanded(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: userIndividualModel.placeOfBirth?.length,
              itemBuilder: (context, index) => Center(
                  child: Text(userIndividualModel.placeOfBirth![index] ?? "")),
            ),
          ),
        ],
      ),
    );
  }
}
