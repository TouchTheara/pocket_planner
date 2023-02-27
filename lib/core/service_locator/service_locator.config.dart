// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../module/meeting/data/repository/meeting_repository.dart' as _i8;
import '../../module/meeting/presentaion/logic/meeting_controller.dart' as _i7;
import '../../module/notification/data/repository/notification_repository.dart'
    as _i10;
import '../../module/notification/presentation/logic/notification_controller.dart'
    as _i9;
import '../../module/planner/data/repository/planner_repository.dart' as _i12;
import '../../module/planner/presentation/logic/planner_controller.dart'
    as _i11;
import '../../module/profile/data/repository/profile_repository.dart' as _i14;
import '../../module/profile/presentation/logic/profile_controller.dart'
    as _i13;
import '../../util/helper/api_base_helper.dart' as _i3;
import '../../util/helper/dio_bese_helper.dart' as _i6;
import '../auth/data/repository/auth_repository.dart' as _i5;
import '../auth/presentation/logic/auth_controller.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i3.ApiBaseHelper>(() => _i3.ApiBaseHelper());
  gh.factory<_i4.AuthController>(() => _i4.AuthController.init());
  gh.factory<_i5.AuthReposity>(() => _i5.AuthReposity());
  gh.factory<_i6.DioBaseHelper>(() => _i6.DioBaseHelper());
  gh.factory<_i7.MeetingController>(() => _i7.MeetingController());
  gh.factory<_i8.MeetingReposity>(() => _i8.MeetingReposity());
  gh.factory<_i9.NotificationController>(() => _i9.NotificationController());
  gh.factory<_i10.NotificationReposity>(() => _i10.NotificationReposity());
  gh.factory<_i11.PlannerController>(() => _i11.PlannerController.init());
  gh.factory<_i12.PlannerRepository>(() => _i12.PlannerRepository());
  gh.factory<_i13.ProfileController>(() => _i13.ProfileController());
  gh.factory<_i14.ProfileRepository>(() => _i14.ProfileRepository());
  return get;
}
