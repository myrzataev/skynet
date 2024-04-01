import 'package:skynet/features/main/features/home/data/models/profile_details_model.dart';

abstract class GetProfileDetailsRepo{
  Future<ProfileDetailsModel> getProfileDetails();
}