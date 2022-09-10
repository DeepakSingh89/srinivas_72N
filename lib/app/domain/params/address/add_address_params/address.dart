class Address {
  String? addresstype;
  String? flatHousenumber;
  String? floorNumber;
  String? towerNumber;
  String? buildingApartmentname;
  String? address;
  String? landmarkArea;
  String? phone;
  String? name;
  String? user;

  Address({
    this.addresstype,
    this.flatHousenumber,
    this.floorNumber,
    this.towerNumber,
    this.buildingApartmentname,
    this.address,
    this.landmarkArea,
    this.phone,
    this.name,
    this.user,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        addresstype: json['addresstype'] as String?,
        flatHousenumber: json['flat_housenumber'] as String?,
        floorNumber: json['floor_number'] as String?,
        towerNumber: json['tower_number'] as String?,
        buildingApartmentname: json['building_apartmentname'] as String?,
        address: json['address'] as String?,
        landmarkArea: json['landmark_area'] as String?,
        phone: json['phone'] as String?,
        name: json['name'] as String?,
        user: json['user'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'addresstype': addresstype,
        'flat_housenumber': flatHousenumber,
        'floor_number': floorNumber,
        'tower_number': towerNumber,
        'building_apartmentname': buildingApartmentname,
        'address': address,
        'landmark_area': landmarkArea,
        'phone': phone,
        'name': name,
        'user': user,
      };
}
