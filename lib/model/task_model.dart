class TaskModel {
  String? id;
  String? description;
  String? title;

  TaskModel({this.id, this.description, this.title});

  TaskModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['title'] = this.title;
    return data;
  }
}