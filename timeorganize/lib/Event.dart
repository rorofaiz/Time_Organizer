import 'package:flutter/material.dart';

class Event {
  final String name;
  final String? description;
  final DateTime from;
  final DateTime to;
  final Color backgroundColor;
  final bool isAllDay;
  final String? recurrenceRule;

  const Event({
    required this.name,
    this.description,
    required this.from,
    required this.to,
    required this.backgroundColor,
    required this.isAllDay,
    this.recurrenceRule,
  });
}
