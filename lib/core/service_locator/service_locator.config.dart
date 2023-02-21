// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../module/auth/data/repository/auth_repository.dart' as _i4;
import '../../module/auth/presentation/logic/auth_controller.dart' as _i3;
import '../../module/meeting/presentaion/logic/meeting_controller.dart' as _i5;
import '../../module/notification/presentation/logic/notification_controller.dart'
    as _i6;
import '../../module/planner/presentation/logic/planner_controller.dart' as _i7;
import '../../module/profile/presentation/logic/profile_controller.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AuthController>(() => _i3.AuthController.init());
  gh.factory<_i4.AuthReposity>(() => _i4.AuthReposity());
  gh.factory<_i5.MeetingController>(() => _i5.MeetingController());
  gh.factory<_i6.NotificationController>(() => _i6.NotificationController());
  gh.factory<_i7.PlannerController>(() => _i7.PlannerController());
  gh.factory<_i8.ProfileController>(() => _i8.ProfileController());
  return get;
}
