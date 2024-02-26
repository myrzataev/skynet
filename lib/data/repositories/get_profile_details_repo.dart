import 'package:skynet/data/models/profile_details_model.dart';

abstract class GetProfileDetailsRepo{
  Future<ProfileDetailsModel> getProfileDetails();
}