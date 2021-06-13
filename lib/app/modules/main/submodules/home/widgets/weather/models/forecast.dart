import 'dart:ui';

class Forecast {
  String? date;
  String? weekday;
  int? max;
  int? min;
  String? description;
  String? condition;

  Forecast({
    this.date,
    this.weekday,
    this.max,
    this.min,
    this.description,
    this.condition,
  });

  @override
  String toString() {
    return 'Forecast(date: $date, weekday: $weekday, max: $max, min: $min, description: $description, condition: $condition)';
  }

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      date: json['date'] as String?,
      weekday: json['weekday'] as String?,
      max: json['max'] as int?,
      min: json['min'] as int?,
      description: json['description'] as String?,
      condition: json['condition'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'weekday': weekday,
      'max': max,
      'min': min,
      'description': description,
      'condition': condition,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Forecast &&
        other.date == date &&
        other.weekday == weekday &&
        other.max == max &&
        other.min == min &&
        other.description == description &&
        other.condition == condition;
  }

  @override
  int get hashCode {
    return hashValues(
      date,
      weekday,
      max,
      min,
      description,
      condition,
    );
  }
}
