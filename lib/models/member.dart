class Member {
  int id;
  String name;
  double balance;
  String contactInfo;
  String paymentHistory;
  String foodPreferences;
  String attendance;
  String profilePicture;
  double totalDeposited;
  double totalFoodConsumed;
  String description;

  Member({
    this.id,
    this.name,
    this.balance,
    this.contactInfo,
    this.paymentHistory,
    this.foodPreferences,
    this.attendance,
    this.profilePicture,
    this.totalDeposited,
    this.totalFoodConsumed,
    this.description,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name,
      'balance': balance,
      'contactInfo': contactInfo,
      'paymentHistory': paymentHistory,
      'foodPreferences': foodPreferences,
      'attendance': attendance,
      'profilePicture': profilePicture,
      'totalDeposited': totalDeposited,
      'totalFoodConsumed': totalFoodConsumed,
      'description': description,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  Member.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    balance = map['balance'];
    contactInfo = map['contactInfo'];
    paymentHistory = map['paymentHistory'];
    foodPreferences = map['foodPreferences'];
    attendance = map['attendance'];
    profilePicture = map['profilePicture'];
    totalDeposited = map['totalDeposited'];
    totalFoodConsumed = map['totalFoodConsumed'];
    description = map['description'];
  }
}
