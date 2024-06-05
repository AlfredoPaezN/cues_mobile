// To parse this JSON data, do
//
//     final schedule = scheduleFromJson(jsonString);

import 'dart:convert';

Schedule scheduleFromJson(String str) =>
    Schedule.fromJson(json.decode(str) as Map<String, dynamic>);

String scheduleToJson(Schedule data) => json.encode(data.toJson());

class Schedule {
  Schedule({
    required this.day,
    required this.subject,
    required this.semester,
    required this.teacher,
    required this.pparcial,
    required this.sparcial,
    required this.tparcial,
    required this.inter,
    required this.definitiva,
    this.startTime,
    this.email,
    this.endTime,
    this.code,
    this.group,
    this.room,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        day: json['day'] as String,
        startTime: json['startTime'] as String,
        endTime: json['endTime'] as String,
        code: json['code'] as String,
        subject: json['subject'] as String,
        group: json['group'] as String,
        room: json['room'] as String,
        semester: json['semester'] as String,
        teacher: json['teacher'] as String,
        email: json['email'] as String,
        pparcial: json['pparcial'] as String,
        sparcial: json['sparcial'] as String,
        tparcial: json['tparcial'] as String,
        inter: json['inter'] as String,
        definitiva: json['definitiva'] as String,
      );
  String day;
  String? startTime;
  String? endTime;
  String? code;

  String pparcial;
  String sparcial;
  String tparcial;
  String inter;
  String definitiva;
  String subject;
  String? group;
  String? room;
  String semester;
  String teacher;
  String? email;

  Map<String, dynamic> toJson() => {
        'day': day,
        'startTime': startTime,
        'endTime': endTime,
        'code': code,
        'pparcial': pparcial,
        'sparcial': sparcial,
        'tparcial': tparcial,
        'inter': inter,
        'definitiva': definitiva,
        'subject': subject,
        'group': group,
        'room': room,
        'semester': semester,
        'teacher': teacher,
        'email': email,
      };
}
