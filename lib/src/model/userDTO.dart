class User {
  String _id;
  String _name;
  String _lastName;
  String _email;
  String _password;
  int _followersCount;
  int _followingCount;
  int _reviews;
  bool _isEnabled;

  User(
      this._id,
      this._name,
      this._lastName,
      this._email,
      this._password,
      this._followersCount,
      this._followingCount,
      this._reviews,
      this._isEnabled);

  String get id => _id;
  String get name => _name;
  String get lastName => _lastName;
  String get email => _email;
  String get password => _password;
  int get followersCount => _followersCount;
  int get followingCount => _followingCount;
  int get reviews => _reviews;
  bool get isEnabled => _isEnabled;
}