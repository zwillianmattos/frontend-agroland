// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RatingModel on _RatingModelBase, Store {
  Computed<dynamic>? _$getRateComputed;

  @override
  dynamic get getRate =>
      (_$getRateComputed ??= Computed<dynamic>(() => super.getRate,
              name: '_RatingModelBase.getRate'))
          .value;

  final _$ratingAtom = Atom(name: '_RatingModelBase.rating');

  @override
  double? get rating {
    _$ratingAtom.reportRead();
    return super.rating;
  }

  @override
  set rating(double? value) {
    _$ratingAtom.reportWrite(value, super.rating, () {
      super.rating = value;
    });
  }

  final _$commentAtom = Atom(name: '_RatingModelBase.comment');

  @override
  String? get comment {
    _$commentAtom.reportRead();
    return super.comment;
  }

  @override
  set comment(String? value) {
    _$commentAtom.reportWrite(value, super.comment, () {
      super.comment = value;
    });
  }

  final _$_RatingModelBaseActionController =
      ActionController(name: '_RatingModelBase');

  @override
  dynamic setRate(dynamic value) {
    final _$actionInfo = _$_RatingModelBaseActionController.startAction(
        name: '_RatingModelBase.setRate');
    try {
      return super.setRate(value);
    } finally {
      _$_RatingModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
rating: ${rating},
comment: ${comment},
getRate: ${getRate}
    ''';
  }
}
