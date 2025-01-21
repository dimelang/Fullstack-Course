class Taskputrequest {
  final String? title;
  final String? description;
  final String? priority;
  final bool? status;

  // constructor
  Taskputrequest({this.title, this.description, this.priority, this.status});

  // convert JSON to Task class
  factory Taskputrequest.fromJson(Map<String, dynamic> json) {
    return Taskputrequest(
        title: json['title'],
        description: json['description'],
        priority: json['priority'],
        status: json['status']);
  }

  // convert Task class to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'priority': priority,
      'status': status,
    };
  }
}
