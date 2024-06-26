class AddTaskModel {
  final String image, title, desc, priority;
  final String? dueDate;

  const AddTaskModel({
    required this.image,
    required this.title,
    required this.desc,
    required this.priority,
    this.dueDate,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    data['title'] = title;
    data['desc'] = desc;
    data['priority'] = priority;
    data['dueDate'] = dueDate;
    return data;
  }
}
