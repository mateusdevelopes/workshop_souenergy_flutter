class InverterModel {
  String? id;
  String? brand;
  String? name;
  String? avatar;
  String? description;

  InverterModel(
      {this.id, this.brand, this.name, this.avatar, this.description});

  InverterModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brand = json['brand'];
    name = json['name'];
    avatar = json['avatar'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['brand'] = this.brand;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['description'] = this.description;
    return data;
  }
}