class Taskpostrequest {
  final String title;
  final String description;
  final String priority;
  final bool status;
  final int user_id;

  // constructor
  Taskpostrequest(
      {required this.title,
      required this.description,
      required this.priority,
      required this.status,
      required this.user_id});

  // convert JSON to Task class
  factory Taskpostrequest.fromJson(Map<String, dynamic> json) {
    return Taskpostrequest(
        title: json['title'],
        description: json['description'],
        priority: json['priority'],
        status: json['status'],
        user_id: json['user_id']);
  }

  // convert Task class to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'priority': priority,
      'status': status,
      'user_id': user_id
    };
  }
}
