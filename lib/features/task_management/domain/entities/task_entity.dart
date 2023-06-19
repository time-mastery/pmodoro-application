import "package:equatable/equatable.dart";

class TaskEntity extends Equatable {
  final int id;
  final String uid;
  final String title, description;
  final String category;
  final String deadLineTime;
  final String? doneTime;
  final bool done;

  const TaskEntity({
    required this.id,
    required this.title,
    required this.uid,
    required this.description,
    required this.deadLineTime,
    this.doneTime,
    required this.category,
    required this.done,
  });

  @override
  List<Object?> get props => [
        id,
        uid,
        title,
        description,
        deadLineTime,
        doneTime,
        done,
        category,
      ];

  @override
  String toString() {
    return """uid: $uid , id: $id , title: $title , description: $description ,
     deadLineTime: $deadLineTime , doneTime: $doneTime ,
     done: $done , category : $category""";
  }
}
