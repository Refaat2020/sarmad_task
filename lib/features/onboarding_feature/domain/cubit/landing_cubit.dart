import 'package:sarmad_task/core/extensions/task_excuter.dart';
import 'package:sarmad_task/features/onboarding_feature/domain/use_case/landing_use_case.dart';

import '../../../../file_export.dart';
import '../../data/models/user_individual_model.dart';

part 'landing_state.dart';

class LandingCubit extends Cubit<LandingState> {
  LandingCubit(this._landingUseCase) : super(LandingInitial());

  bool listView = false;
  String? firstName;
  String? middleName;
  String? nationalityName;
  final searchUserFormKey = GlobalKey<FormState>();

  List<UserIndividualModel> listOfUserIndividual = [];
  final LandingUseCase _landingUseCase;

  final ScrollController scrollController = ScrollController();
  final _chunkSize = 10;
  int loadedItems = 10;
  final bool _isLoadingMore = false;
  addScrollListener() {
    scrollController.addListener(() async {
      final endOfScroll =
          scrollController.offset == scrollController.position.maxScrollExtent;
      if (endOfScroll && !_isLoadingMore) {
        _loadMoreItems();
      }
    });
  }

  Future<void> _loadMoreItems() async {
    if (!_isLoadingMore && loadedItems < listOfUserIndividual.length) {
      emit(LandingPaginatedLoading());
      await Future.delayed(
        const Duration(milliseconds: 600),
        () {
          loadedItems += _chunkSize;
          emit(LandingPaginatedDone());
        },
      );
    }
  }

  void changeView() {
    listView = !listView;
    emit(LandingInitial());
  }

  Future<void> searchUserIndividual(UserIndividualModel individualModel) async {
    emit(LandingLoading());
    var result = _landingUseCase.searchForIndividual(individualModel);
    await result.execute(
      onFailed: (failed) => emit(LandingError(errorMessage: failed.message)),
      onSuccess: (value) {
        listOfUserIndividual = value;
        if (listOfUserIndividual.length % 10 == 0) {
          loadedItems = 10;
        }
        if (listOfUserIndividual.isEmpty) {
          emit(LandingEmpty());
          return;
        }
        emit(LandingDone());
      },
    );
  }
}
