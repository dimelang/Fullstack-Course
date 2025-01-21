class Taskgetrequest {
  final int id;
  final String title;
  final String description;
  final String priority;
  final bool status;

  // constructor
  Taskgetrequest(
      {required this.id,
      required this.title,
      required this.description,
      required this.priority,
      required this.status});

  // convert JSON to Task class
  factory Taskgetrequest.fromJson(Map<String, dynamic> json) {
    return Taskgetrequest(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        priority: json['priority'],
        status: json['status']);
  }

  // convert Task class to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'priority': priority,
      'status': status
    };
  }
}
