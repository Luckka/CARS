import 'package:cars/app/modules/home/domain/entity/lead_entity.dart';

class LeadMapper extends LeadEntity{
  LeadMapper({required super.email, required super.username, required super.id, required super.phone});


  static Map<String, dynamic> toMap(LeadEntity leadEntity) {
    return <String, dynamic>{
      'username': leadEntity.username,
      'email': leadEntity.email,
      'phone': leadEntity.phone,
      'id': leadEntity.id,
    };
  }
   
  
  LeadEntity fromMap(Map<String,dynamic> map){
    return LeadEntity(email: email, username: username, id: id, phone: phone);
  }
  
}