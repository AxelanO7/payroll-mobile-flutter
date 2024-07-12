import 'package:json_annotation/json_annotation.dart';


part 'errors.g.dart';

@JsonSerializable()
class Errors {
      Errors();

  late dynamic email;
  late dynamic password;
  @JsonKey(name: 'password_confirmation') late dynamic passwordConfirmation;
  late dynamic recaptcha;
  late dynamic name;
  @JsonKey(name: 'wa_number') late dynamic waNumber;
  @JsonKey(name: 'accept_term_condition') late dynamic acceptTermCondition;
  @JsonKey(name: 'ref_code') late dynamic refCode;
  @JsonKey(name: 'current_password') late dynamic currentPassword;
  @JsonKey(name: 'new_password') late dynamic newPassword;
  @JsonKey(name: 'new_password_confirmation') late dynamic newPasswordConfirmation;
  late dynamic time;
  late dynamic code;
  @JsonKey(name: 'not_allowed') late dynamic notAllowed;
  @JsonKey(name: 'promo_code') late dynamic promoCode;
  late dynamic data;
  @JsonKey(name: 'no_wa') late dynamic noWa;
  late dynamic full;
  @JsonKey(name: 'otp_not_match') late dynamic otpNotMatch;
  @JsonKey(name: 'otp_false') late dynamic otpFalse;
  late dynamic phone;
  late dynamic username;

  factory Errors.fromJson(Map<String,dynamic> json) => _$ErrorsFromJson(json);
  Map<String, dynamic> toJson() => _$ErrorsToJson(this);
}
