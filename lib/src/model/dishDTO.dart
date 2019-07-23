class Dish {
  String _id;
  String _name;
  String _description;
  String _restaurantName;
  String _imgUrl;
  double _rating;
  int _reviews;
  int _price;
  int _offerPrice;
  bool _isInOffer;
  bool _isEnabled;

  Dish(
      this._id,
      this._name,
      this._description,
      this._restaurantName,
      this._imgUrl,
      this._rating,
      this._reviews,
      this._price,
      this._offerPrice,
      this._isInOffer,
      this._isEnabled);

  String get id => _id;
  String get name => _name;
  String get description => _description;
  String get restaurantName => _restaurantName;
  String get imgUrl => _imgUrl;
  double get rating => _rating;
  int get reviews => _reviews;
  int get price => _price;
  int get offerPrice => _offerPrice;
  bool get isInOffer => _isInOffer;
  bool get isEnabled => _isEnabled;
}
