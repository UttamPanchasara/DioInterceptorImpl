class UserEntity {
  String? fName;
  String? lName;
  String? email;

  UserEntity({this.email, this.fName, this.lName});

  UserEntity.fromMap(Map<String, dynamic> data){
    lName = data['lName'];
    fName = data['fName'];
    email = data['email'];
  }
}
