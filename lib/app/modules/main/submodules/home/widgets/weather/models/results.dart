import 'dart:ui';

import 'package:flutter/foundation.dart';

import 'forecast.dart';

class Results {
  int? temp;
  String? date;
  String? time;
  String? conditionCode;
  String? description;
  String? currently;
  String? cid;
  String? city;
  String? imgId;
  int? humidity;
  String? windSpeedy;
  String? sunrise;
  String? sunset;
  String? conditionSlug;
  String? cityName;
  List<Forecast>? forecast;
  double? latitude;
  double? longitude;

  Results({
    this.temp,
    this.date,
    this.time,
    this.conditionCode,
    this.description,
    this.currently,
    this.cid,
    this.city,
    this.imgId,
    this.humidity,
    this.windSpeedy,
    this.sunrise,
    this.sunset,
    this.conditionSlug,
    this.cityName,
    this.forecast,
    this.latitude,
    this.longitude,
  });

  @override
  String toString() {
    return 'Results(temp: $temp, date: $date, time: $time, conditionCode: $conditionCode, description: $description, currently: $currently, cid: $cid, city: $city, imgId: $imgId, humidity: $humidity, windSpeedy: $windSpeedy, sunrise: $sunrise, sunset: $sunset, conditionSlug: $conditionSlug, cityName: $cityName, forecast: $forecast, latitude: $latitude, longitude: $longitude)';
  }

  factory Results.fromJson(Map<String, dynamic> json) {
    return Results(
      temp: json['temp'] as int?,
      date: json['date'] as String?,
      time: json['time'] as String?,
      conditionCode: json['condition_code'] as String?,
      description: json['description'] as String?,
      currently: json['currently'] as String?,
      cid: json['cid'] as String?,
      city: json['city'] as String?,
      imgId: json['img_id'] as String?,
      humidity: json['humidity'] as int?,
      windSpeedy: json['wind_speedy'] as String?,
      sunrise: json['sunrise'] as String?,
      sunset: json['sunset'] as String?,
      conditionSlug: json['condition_slug'] as String?,
      cityName: json['city_name'] as String?,
      forecast: (json['forecast'] as List<dynamic>?)
          ?.map((e) => Forecast.fromJson(e as Map<String, dynamic>))
          .toList(),
      latitude: json['latitude'] as double?,
      longitude: json['longitude'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temp': temp,
      'date': date,
      'time': time,
      'condition_code': conditionCode,
      'description': description,
      'currently': currently,
      'cid': cid,
      'city': city,
      'img_id': imgId,
      'humidity': humidity,
      'wind_speedy': windSpeedy,
      'sunrise': sunrise,
      'sunset': sunset,
      'condition_slug': conditionSlug,
      'city_name': cityName,
      'forecast': forecast?.map((e) => e.toJson()).toList(),
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Results &&
        other.temp == temp &&
        other.date == date &&
        other.time == time &&
        other.conditionCode == conditionCode &&
        other.description == description &&
        other.currently == currently &&
        other.cid == cid &&
        other.city == city &&
        other.imgId == imgId &&
        other.humidity == humidity &&
        other.windSpeedy == windSpeedy &&
        other.sunrise == sunrise &&
        other.sunset == sunset &&
        other.conditionSlug == conditionSlug &&
        other.cityName == cityName &&
        listEquals(other.forecast, forecast) &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode {
    return hashValues(
      temp,
      date,
      time,
      conditionCode,
      description,
      currently,
      cid,
      city,
      imgId,
      humidity,
      windSpeedy,
      sunrise,
      sunset,
      conditionSlug,
      cityName,
      forecast,
      latitude,
      longitude,
    );
  }
}
