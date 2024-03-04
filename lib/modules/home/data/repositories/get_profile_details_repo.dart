import 'package:skynet/modules/home/data/models/profile_details_model.dart';

abstract class GetProfileDetailsRepo{
  Future<ProfileDetailsModel> getProfileDetails();
}