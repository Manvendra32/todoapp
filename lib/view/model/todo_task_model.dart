import 'dart:convert';

class Task {
  String title;
  bool isCompleted;
  String priority; // "High", "Medium", or "Low"

  Task({
    required this.title,
    this.isCompleted = false,
    this.priority = 'Medium',
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isCompleted': isCompleted,
      'priority': priority,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'],
      isCompleted: map['isCompleted'],
      priority: map['priority'] ?? 'Medium',
    );
  }

  static String encode(List<Task> tasks) =>
      json.encode(tasks.map((t) => t.toMap()).toList());

  static List<Task> decode(String tasks) =>
      (json.decode(tasks) as List<dynamic>)
          .map<Task>((item) => Task.fromMap(item))
          .toList();
}

