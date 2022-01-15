enum Subtype {
  bronzeSubscription,
  silverSubscription,
  goldSubscription,
  nonSubscription
}
class User {
  final int? id;
  final  String? name;
  final  String? email;
  final int? age;
  final String? password;
  final int? phoneNumber;
  final String? gendervalue;
  final String? socialStatusValue;
  final String? country;
  final String? marriedTypeValue;
  final String? skinColor;
  final String? annualIncomeValue;
  final String? job;
  final String? weight;
  final String? long;
  final String? imageUrl;
  Subtype? subtype;
  bool? acceptPolicy;
  final String? token;

  User({
    this.id,
    this.name,
    this.email = "",
    this.age = 0,
    this.password = "",
    this.phoneNumber,
    this.acceptPolicy = false,
    this.gendervalue,
    this.socialStatusValue,
    this.country,
    this.marriedTypeValue,
    this.skinColor,
    this.annualIncomeValue,
    this.job,
    this.weight,
    this.long,
    this.imageUrl = "",
    this.subtype = Subtype.nonSubscription,
    this.token = "",
  });
}
