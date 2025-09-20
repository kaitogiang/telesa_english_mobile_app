// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:google_sign_in/google_sign_in.dart' as _i116;
import 'package:injectable/injectable.dart' as _i526;
import 'package:telesa_english_app/core/config/external_injectable.dart'
    as _i327;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final externalInjectable = _$ExternalInjectable();
    gh.lazySingleton<_i59.FirebaseAuth>(() => externalInjectable.firebaseAuth);
    gh.lazySingleton<_i116.GoogleSignIn>(() => externalInjectable.googleSigIn);
    return this;
  }
}

class _$ExternalInjectable extends _i327.ExternalInjectable {}
