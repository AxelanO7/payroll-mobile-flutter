// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presence.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Presence _$PresenceFromJson(Map<String, dynamic> json) => Presence()
  ..id = (json['id'] as num).toInt()
  ..teacherId = json['teacher_id'] as String
  ..approvedBy = json['approved_by'] as String?
  ..uuid = json['uuid'] as String
  ..clockIn = json['clock_in'] as String
  ..clockOut = json['clock_out'] as String
  ..ipAddress = json['ip_address']
  ..device = json['device'] as String
  ..latitudeIn = json['latitude_in'] as String
  ..longitudeIn = json['longitude_in'] as String
  ..latitudeOut = json['latitude_out'] as String?
  ..longitudeOut = json['longitude_out'] as String?
  ..distanceIn = (json['distance_in'] as num).toInt()
  ..distanceOut = (json['distance_out'] as num).toInt()
  ..photoIn = json['photo_in'] as String?
  ..photoOut = json['photo_out'] as String?
  ..presenceDate = json['presence_date'] as String
  ..status = json['status'] as String
  ..statusPresence = json['status_presence'] as String
  ..createdAt = json['created_at'] as String
  ..updatedAt = json['updated_at'] as String;

Map<String, dynamic> _$PresenceToJson(Presence instance) => <String, dynamic>{
      'id': instance.id,
      'teacher_id': instance.teacherId,
      'approved_by': instance.approvedBy,
      'uuid': instance.uuid,
      'clock_in': instance.clockIn,
      'clock_out': instance.clockOut,
      'ip_address': instance.ipAddress,
      'device': instance.device,
      'latitude_in': instance.latitudeIn,
      'longitude_in': instance.longitudeIn,
      'latitude_out': instance.latitudeOut,
      'longitude_out': instance.longitudeOut,
      'distance_in': instance.distanceIn,
      'distance_out': instance.distanceOut,
      'photo_in': instance.photoIn,
      'photo_out': instance.photoOut,
      'presence_date': instance.presenceDate,
      'status': instance.status,
      'status_presence': instance.statusPresence,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
