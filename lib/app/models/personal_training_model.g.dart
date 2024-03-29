// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_training_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalTrainingModel _$PersonalTrainingModelFromJson(
        Map<String, dynamic> json) =>
    PersonalTrainingModel(
      avatar: json['avatar'] as String?,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      crefType: json['crefType'] as String,
      crefNumber: json['crefNumber'] as int,
      id: json['id'] as int?,
      createTime: json['createTime'] == null
          ? null
          : DateTime.parse(json['createTime'] as String),
      updateTime: json['updateTime'] == null
          ? null
          : DateTime.parse(json['updateTime'] as String),
    );

Map<String, dynamic> _$PersonalTrainingModelToJson(
    PersonalTrainingModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('createTime', instance.createTime?.toIso8601String());
  writeNotNull('updateTime', instance.updateTime?.toIso8601String());
  val['avatar'] = instance.avatar;
  val['fullName'] = instance.fullName;
  val['email'] = instance.email;
  writeNotNull('password', BaseModel.toNull(instance.password));
  val['crefType'] = instance.crefType;
  val['crefNumber'] = instance.crefNumber;
  return val;
}
