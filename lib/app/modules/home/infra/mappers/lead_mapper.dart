import 'package:cars/app/modules/home/domain/entity/lead_entity.dart';

class LeadMapper extends LeadEntity{
  LeadMapper({required super.email, required super.username, required super.phone, required super.id});


   Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'phone': phone,
    };
  }
   
  
  factory LeadMapper.fromMap(Map<String,dynamic> map){
    return LeadMapper(email: map['email'], username: map['username'], phone: map['phone'],id: map['id']);
  }
  
}