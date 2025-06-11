// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginHash() => r'582adfb08e6bc868dc31f9dcef438592f060ad63';

/// See also [Login].
@ProviderFor(Login)
final loginProvider = AutoDisposeAsyncNotifierProvider<Login,
    AsyncX<AuthenticationModel>>.internal(
  Login.new,
  name: r'loginProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loginHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Login = AutoDisposeAsyncNotifier<AsyncX<AuthenticationModel>>;
String _$signupHash() => r'34f01e14c9edcba3df34e8193710ce70a082482d';

/// See also [Signup].
@ProviderFor(Signup)
final signupProvider = AutoDisposeAsyncNotifierProvider<Signup,
    AsyncX<AuthenticationModel>>.internal(
  Signup.new,
  name: r'signupProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$signupHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Signup = AutoDisposeAsyncNotifier<AsyncX<AuthenticationModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
