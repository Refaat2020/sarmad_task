import 'package:sarmad_task/features/onboarding_feature/domain/cubit/landing_cubit.dart';

import '../../../../file_export.dart';
import 'components/landing_group_view_widget.dart';
import 'components/landing_list_view_widget.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);
  static const route = "/LandingScreen";

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<LandingCubit>().addScrollListener();
  }

  @override
  Widget build(BuildContext context) {
    final userIndividualModel = context.watch<LandingCubit>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Search for individual",
            style: Theme.of(context).textTheme.displayMedium),
        actions: [
          if (userIndividualModel.listOfUserIndividual.isNotEmpty)
            IconButton(
                onPressed: () {
                  userIndividualModel.changeView();
                },
                icon: const Icon(Icons.menu))
        ],
      ),
      body: SingleChildScrollView(
        controller: userIndividualModel.scrollController,
        child: Column(
          children: [
            const Divider(color: AppColors.dividerColor),

            ///search and change view button

            BlocBuilder<LandingCubit, LandingState>(
              builder: (context, state) {
                if (state is LandingLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is LandingEmpty) {
                  return Padding(
                    padding:
                        EdgeInsets.only(top: ScreenUtil().screenHeight / 6),
                    child: const Text("Nothing found"),
                  );
                }
                return userIndividualModel.listView == true
                    ? ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.only(
                            left: 16.w, right: 16.w, bottom: 16.h, top: 16.h),
                        itemBuilder: (context, index) {
                          return LandingListViewWidget(
                            userIndividualModel:
                                userIndividualModel.listOfUserIndividual[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 16.h,
                          );
                        },
                        itemCount: userIndividualModel.loadedItems.clamp(
                            0, userIndividualModel.listOfUserIndividual.length))
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 15.h,
                          crossAxisCount: 2,
                        ),
                        itemCount: userIndividualModel.loadedItems.clamp(
                            0, userIndividualModel.listOfUserIndividual.length),
                        padding: EdgeInsets.only(
                            left: 16.w, right: 16.w, bottom: 16.h, top: 16.h),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (_, index) => LandingGroupViewWidget(
                          userIndividualModel:
                              userIndividualModel.listOfUserIndividual[index],
                        ),
                      );
              },
            ),

            if (userIndividualModel.state is LandingPaginatedLoading)
              const Center(
                heightFactor: 4,
                child: CircularProgressIndicator(),
              )
          ],
        ),
      ),
    );
  }
}
