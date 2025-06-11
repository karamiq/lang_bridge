import '_models.dart';

part 'authentication_model.freezed.dart';
part 'authentication_model.g.dart';

@freezed
abstract class AuthenticationModel with _$AuthenticationModel {
  const AuthenticationModel._();

  @jsonSerializable
  const factory AuthenticationModel({
    required String uid,
    required String email,
    required String fullName,
    required String password,
    required DateTime createdAt,
    required int streak,
    required int points,

    // Id get isarId => fastHash(id!);
  }) = _AuthenticationModel;

  factory AuthenticationModel.fromJson(Map<String, dynamic> json) => _$AuthenticationModelFromJson(json);
}
