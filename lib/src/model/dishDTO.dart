class Dish {
  String _id;
  String _name;
  String _description;
  String _restaurantName;
  String _imgUrl;
  String _rating;
  int _price;
  int _offerPrice;

  Dish(this._id, this._name, this._description, this._restaurantName, this._imgUrl, this._rating, this._price, this._offerPrice);

  String get id => _id;
  String get name => _name;
  String get description => _description;
  String get restaurantName => _restaurantName;
  String get imgUrl => _imgUrl;
  String get rating => _rating;
  int get price => _price;
  int get offerPrice => _offerPrice;

}