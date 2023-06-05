// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) {
  return _TaskModel.fromJson(json);
}

/// @nodoc
mixin _$TaskModel {
  @JsonKey(name: "id_ap")
  String? get idApp => throw _privateConstructorUsedError;
  @JsonKey(name: "id_ap")
  set idApp(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "id_task")
  String? get idTask => throw _privateConstructorUsedError;
  @JsonKey(name: "id_task")
  set idTask(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "isdone")
  bool? get isdone => throw _privateConstructorUsedError;
  @JsonKey(name: "isdone")
  set isdone(bool? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: "title")
  set title(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "status")
  set status(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "desciption")
  String? get desciption => throw _privateConstructorUsedError;
  @JsonKey(name: "desciption")
  set desciption(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "progress")
  String? get progress => throw _privateConstructorUsedError;
  @JsonKey(name: "progress")
  set progress(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "date")
  String? get date => throw _privateConstructorUsedError;
  @JsonKey(name: "date")
  set date(String? value) => throw _privateConstructorUsedError;
  @JsonKey(name: "priority")
  String? get priority => throw _privateConstructorUsedError;
  @JsonKey(name: "priority")
  set priority(String? value) => throw _privateConstructorUsedError;
  bool get isSelected => throw _privateConstructorUsedError;
  set isSelected(bool value) => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskModelCopyWith<TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskModelCopyWith<$Res> {
  factory $TaskModelCopyWith(TaskModel value, $Res Function(TaskModel) then) =
      _$TaskModelCopyWithImpl<$Res, TaskModel>;
  @useResult
  $Res call(
      {@JsonKey(name: "id_ap") String? idApp,
      @JsonKey(name: "id_task") String? idTask,
      @JsonKey(name: "isdone") bool? isdone,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "desciption") String? desciption,
      @JsonKey(name: "progress") String? progress,
      @JsonKey(name: "date") String? date,
      @JsonKey(name: "priority") String? priority,
      bool isSelected});
}

/// @nodoc
class _$TaskModelCopyWithImpl<$Res, $Val extends TaskModel>
    implements $TaskModelCopyWith<$Res> {
  _$TaskModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idApp = freezed,
    Object? idTask = freezed,
    Object? isdone = freezed,
    Object? title = freezed,
    Object? status = freezed,
    Object? desciption = freezed,
    Object? progress = freezed,
    Object? date = freezed,
    Object? priority = freezed,
    Object? isSelected = null,
  }) {
    return _then(_value.copyWith(
      idApp: freezed == idApp
          ? _value.idApp
          : idApp // ignore: cast_nullable_to_non_nullable
              as String?,
      idTask: freezed == idTask
          ? _value.idTask
          : idTask // ignore: cast_nullable_to_non_nullable
              as String?,
      isdone: freezed == isdone
          ? _value.isdone
          : isdone // ignore: cast_nullable_to_non_nullable
              as bool?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      desciption: freezed == desciption
          ? _value.desciption
          : desciption // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TaskModelCopyWith<$Res> implements $TaskModelCopyWith<$Res> {
  factory _$$_TaskModelCopyWith(
          _$_TaskModel value, $Res Function(_$_TaskModel) then) =
      __$$_TaskModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id_ap") String? idApp,
      @JsonKey(name: "id_task") String? idTask,
      @JsonKey(name: "isdone") bool? isdone,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "desciption") String? desciption,
      @JsonKey(name: "progress") String? progress,
      @JsonKey(name: "date") String? date,
      @JsonKey(name: "priority") String? priority,
      bool isSelected});
}

/// @nodoc
class __$$_TaskModelCopyWithImpl<$Res>
    extends _$TaskModelCopyWithImpl<$Res, _$_TaskModel>
    implements _$$_TaskModelCopyWith<$Res> {
  __$$_TaskModelCopyWithImpl(
      _$_TaskModel _value, $Res Function(_$_TaskModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idApp = freezed,
    Object? idTask = freezed,
    Object? isdone = freezed,
    Object? title = freezed,
    Object? status = freezed,
    Object? desciption = freezed,
    Object? progress = freezed,
    Object? date = freezed,
    Object? priority = freezed,
    Object? isSelected = null,
  }) {
    return _then(_$_TaskModel(
      idApp: freezed == idApp
          ? _value.idApp
          : idApp // ignore: cast_nullable_to_non_nullable
              as String?,
      idTask: freezed == idTask
          ? _value.idTask
          : idTask // ignore: cast_nullable_to_non_nullable
              as String?,
      isdone: freezed == isdone
          ? _value.isdone
          : isdone // ignore: cast_nullable_to_non_nullable
              as bool?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      desciption: freezed == desciption
          ? _value.desciption
          : desciption // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as String?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
      priority: freezed == priority
          ? _value.priority
          : priority // ignore: cast_nullable_to_non_nullable
              as String?,
      isSelected: null == isSelected
          ? _value.isSelected
          : isSelected // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TaskModel implements _TaskModel {
  _$_TaskModel(
      {@JsonKey(name: "id_ap") this.idApp,
      @JsonKey(name: "id_task") this.idTask,
      @JsonKey(name: "isdone") this.isdone,
      @JsonKey(name: "title") this.title,
      @JsonKey(name: "status") this.status,
      @JsonKey(name: "desciption") this.desciption,
      @JsonKey(name: "progress") this.progress,
      @JsonKey(name: "date") this.date,
      @JsonKey(name: "priority") this.priority,
      this.isSelected = false});

  factory _$_TaskModel.fromJson(Map<String, dynamic> json) =>
      _$$_TaskModelFromJson(json);

  @override
  @JsonKey(name: "id_ap")
  String? idApp;
  @override
  @JsonKey(name: "id_task")
  String? idTask;
  @override
  @JsonKey(name: "isdone")
  bool? isdone;
  @override
  @JsonKey(name: "title")
  String? title;
  @override
  @JsonKey(name: "status")
  String? status;
  @override
  @JsonKey(name: "desciption")
  String? desciption;
  @override
  @JsonKey(name: "progress")
  String? progress;
  @override
  @JsonKey(name: "date")
  String? date;
  @override
  @JsonKey(name: "priority")
  String? priority;
  @override
  @JsonKey()
  bool isSelected;

  @override
  String toString() {
    return 'TaskModel(idApp: $idApp, idTask: $idTask, isdone: $isdone, title: $title, status: $status, desciption: $desciption, progress: $progress, date: $date, priority: $priority, isSelected: $isSelected)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TaskModelCopyWith<_$_TaskModel> get copyWith =>
      __$$_TaskModelCopyWithImpl<_$_TaskModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TaskModelToJson(
      this,
    );
  }
}

abstract class _TaskModel implements TaskModel {
  factory _TaskModel(
      {@JsonKey(name: "id_ap") String? idApp,
      @JsonKey(name: "id_task") String? idTask,
      @JsonKey(name: "isdone") bool? isdone,
      @JsonKey(name: "title") String? title,
      @JsonKey(name: "status") String? status,
      @JsonKey(name: "desciption") String? desciption,
      @JsonKey(name: "progress") String? progress,
      @JsonKey(name: "date") String? date,
      @JsonKey(name: "priority") String? priority,
      bool isSelected}) = _$_TaskModel;

  factory _TaskModel.fromJson(Map<String, dynamic> json) =
      _$_TaskModel.fromJson;

  @override
  @JsonKey(name: "id_ap")
  String? get idApp;
  @JsonKey(name: "id_ap")
  set idApp(String? value);
  @override
  @JsonKey(name: "id_task")
  String? get idTask;
  @JsonKey(name: "id_task")
  set idTask(String? value);
  @override
  @JsonKey(name: "isdone")
  bool? get isdone;
  @JsonKey(name: "isdone")
  set isdone(bool? value);
  @override
  @JsonKey(name: "title")
  String? get title;
  @JsonKey(name: "title")
  set title(String? value);
  @override
  @JsonKey(name: "status")
  String? get status;
  @JsonKey(name: "status")
  set status(String? value);
  @override
  @JsonKey(name: "desciption")
  String? get desciption;
  @JsonKey(name: "desciption")
  set desciption(String? value);
  @override
  @JsonKey(name: "progress")
  String? get progress;
  @JsonKey(name: "progress")
  set progress(String? value);
  @override
  @JsonKey(name: "date")
  String? get date;
  @JsonKey(name: "date")
  set date(String? value);
  @override
  @JsonKey(name: "priority")
  String? get priority;
  @JsonKey(name: "priority")
  set priority(String? value);
  @override
  bool get isSelected;
  set isSelected(bool value);
  @override
  @JsonKey(ignore: true)
  _$$_TaskModelCopyWith<_$_TaskModel> get copyWith =>
      throw _privateConstructorUsedError;
}
