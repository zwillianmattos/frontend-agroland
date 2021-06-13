import 'dart:ui';

import 'results.dart';

class Weather {
  String? by;
  bool? validKey;
  Results? results;
  bool? fromCache;

  Weather({
    this.by,
    this.validKey,
    this.results,
    this.fromCache,
  });

  @override
  String toString() {
    return 'Weather(by: $by, validKey: $validKey, results: $results,  fromCache: $fromCache)';
  }

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      by: json['by'] as String?,
      validKey: json['valid_key'] as bool?,
      results: json['results'] == null
          ? null
          : Results.fromJson(json['results'] as Map<String, dynamic>),
      fromCache: json['from_cache'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'by': by,
      'valid_key': validKey,
      'results': results?.toJson(),
      'from_cache': fromCache,
    };
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Weather &&
        other.by == by &&
        other.validKey == validKey &&
        other.results == results &&
        other.fromCache == fromCache;
  }

  @override
  int get hashCode {
    return hashValues(
      by,
      validKey,
      results,
      fromCache,
    );
  }
}
