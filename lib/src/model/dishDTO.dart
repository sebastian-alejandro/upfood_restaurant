class Dish {
  String _id;
  String _name;
  String _description;
  String _restaurantName;
  int _price;
  int _offerPrice;

  Dish(this._id, this._name, this._description, this._price, this._offerPrice, this._restaurantName);

  String get id => _id;
  String get name => _name;
  String get description => _description;
  String get restaurantName => _restaurantName;
  int get price => _price;
  int get offerPrice => _offerPrice;

}