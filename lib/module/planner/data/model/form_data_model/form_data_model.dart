class FormDataModel {
  bool isCreate;
  int? id;
  String? name;
  String? disciption;
  String? priority;
  String? startDate;
  String? endDate;
  String? cover;
  List<String>? memberList;
  FormDataModel(
      {this.cover,
      this.disciption,
      this.endDate,
      this.id,
      this.isCreate = true,
      this.memberList,
      this.name,
      this.priority,
      this.startDate});
}
