// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProfileModel _$$_ProfileModelFromJson(Map<String, dynamic> json) =>
    _$_ProfileModel(
      userName: json['user_name'] as String?,
      sex: json['sex'] as String?,
      birthday: json['birthday'] as String?,
      registeredDate: json['registered_date'] as String?,
      phoneNumber: json['phone_number'] as String?,
      publicIdImage: json['public_id_image'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
    );

Map<String, dynamic> _$$_ProfileModelToJson(_$_ProfileModel instance) =>
    <String, dynamic>{
      'user_name': instance.userName,
      'sex': instance.sex,
      'birthday': instance.birthday,
      'registered_date': instance.registeredDate,
      'phone_number': instance.phoneNumber,
      'public_id_image': instance.publicIdImage,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
    };
