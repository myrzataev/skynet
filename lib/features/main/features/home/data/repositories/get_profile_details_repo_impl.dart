import 'package:skynet/features/main/features/home/data/models/profile_details_model.dart';
import 'package:skynet/features/main/features/home/domain/repositories/get_profile_details_repo.dart';
import 'package:skynet/features/main/features/home/data/data_sources/get_profile_details_repo_usecase.dart';

class GetProfileDetailsRepoImpl implements GetProfileDetailsRepo{
  GetProfileDetailsUseCase useCase;
  GetProfileDetailsRepoImpl({required this.useCase, });
  @override
  Future<ProfileDetailsModel> getProfileDetails() {
    return useCase.getProfileDetails();
  }
  
}
