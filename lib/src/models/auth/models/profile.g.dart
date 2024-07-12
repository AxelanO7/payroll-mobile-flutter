// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile()
  ..uuid = json['uuid'] as String
  ..id = (json['id'] as num).toInt()
  ..fullname = json['fullname'] as String
  ..position = json['position'] as String
  ..photos = json['photos'] as String
  ..email = json['email'] as String
  ..address = json['address'] as String
  ..joinedAt = json['joined_at'] as String
  ..lastEducation = json['last_education'] as String
  ..religion = json['religion'] as String
  ..type = json['type'] as String
  ..placeOfBirth = json['place_of_birth'] as String
  ..dateOfBirth = json['date_of_birth'] as String
  ..gender = json['gender'] as String
  ..accountStatus = json['account_status'] as String;

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'id': instance.id,
      'fullname': instance.fullname,
      'position': instance.position,
      'photos': instance.photos,
      'email': instance.email,
      'address': instance.address,
      'joined_at': instance.joinedAt,
      'last_education': instance.lastEducation,
      'religion': instance.religion,
      'type': instance.type,
      'place_of_birth': instance.placeOfBirth,
      'date_of_birth': instance.dateOfBirth,
      'gender': instance.gender,
      'account_status': instance.accountStatus,
    };
