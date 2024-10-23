// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ChartDataColumnModel {
  ChartDataColumnModel({
    required this.duration,
    required this.method,
  });
  final Duration duration;
  final String method;

  ChartDataColumnModel copyWith({
    String? method,
    Duration? duration,
  }) {
    return ChartDataColumnModel(
      duration: duration ?? this.duration,
      method: method ?? this.method,
    );
  }

  factory ChartDataColumnModel.fromMap(Map<String, dynamic> map) {
    return ChartDataColumnModel(
      duration: map['duration'] ,
      method: map['method'] as String,
    );
  }

  factory ChartDataColumnModel.fromJson(String source) => ChartDataColumnModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ChartDataColumnModel(duration: $duration, method: $method)';

  @override
  bool operator ==(covariant ChartDataColumnModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.duration == duration &&
      other.method == method;
  }

  @override
  int get hashCode =>  duration.hashCode ^ method.hashCode;
} 
