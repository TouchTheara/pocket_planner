// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  factory ProfileModel({
    @JsonKey(name: "user_name") String? userName,
    @JsonKey(name: "sex") String? sex,
    @JsonKey(name: "birthday") String? birthday,
    @JsonKey(name: "registered_date") String? registeredDate,
    @JsonKey(name: "phone_number") String? phoneNumber,
    @JsonKey(name: "public_id_image") String? publicIdImage,
    @JsonKey(name: "first_name") String? firstName,
    @JsonKey(name: "last_name") String? lastName,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}
