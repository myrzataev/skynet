import 'package:skynet/modules/home/data/models/profile_details_model.dart';
import 'package:skynet/modules/home/data/repositories/get_profile_details_repo.dart';
import 'package:skynet/modules/home/domain/usecase/get_profile_details_repo_usecase.dart';

class GetProfileDetailsRepoImpl implements GetProfileDetailsRepo{
  GetProfileDetailsUseCase useCase;
  GetProfileDetailsRepoImpl({required this.useCase});
  @override
  Future<ProfileDetailsModel> getProfileDetails() {
    return useCase.getProfileDetails();
  }
  
}
