class RMequipmentModel {
  int? id;
  String? name;
  String? brand;
  String? photo;
  String? localphoto;
  int? repertory;

  int? createTime;

  RMequipmentModel(
      {this.id,
      this.name,
      this.brand,
      this.repertory,
      this.createTime,
      this.photo,
      this.localphoto});

  RMequipmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    brand = json['brand'];
    photo = json['photo'];
    localphoto = json['localphoto'];
    repertory = json['repertory'];
    createTime = json["createTime"];
  }
}

class RMrentalModel {
  int? id;
  String? name;
  String? brand;
  String? photo;
  String? localphoto;
  int? repertory;
  int? days;
  String? rentalName;
  String? rentalphone;
  int? createTime;
  int? type;
  int? overdue;

  RMrentalModel(
      {this.id,
      this.name,
      this.brand,
      this.repertory,
      this.createTime,
      this.photo,
      this.localphoto,
      this.days,
      this.rentalName,
      this.rentalphone,
      this.type,this.overdue});

  RMrentalModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    brand = json['brand'];
    photo = json['photo'];
    localphoto = json['localphoto'];
    repertory = json['repertory'];
    days = json['days'];
    overdue = json["overdue"];
    type = json['type'];
    rentalName = json['rentalName'];
    rentalphone = json['rentalphone'];
    createTime = json["createTime"];
  }
}
