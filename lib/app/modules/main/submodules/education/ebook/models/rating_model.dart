import 'package:mobx/mobx.dart';
import 'rating.dart';

part 'rating_model.g.dart';

class RatingModel = _RatingModelBase with _$RatingModel;

abstract class _RatingModelBase extends Rating with Store {
  
  int? excluded;
	int? id;
	int? user;
	String? document;
	
  @observable
  double? rating;
	
  @observable
  String? comment;
	String? updatedAt;
	String? createdAt;

	_RatingModelBase({
		this.excluded, 
		this.id, 
		this.user, 
		this.document, 
		this.rating, 
		this.comment, 
		this.updatedAt, 
		this.createdAt
	});


  @action
  setRate(value) {
    rating = value;
    print(value);
  }

  @computed
  get getRate => rating;
}
