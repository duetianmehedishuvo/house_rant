class Property{
  String id;
  String propertyName;
  String propertyPrice;
  String propertyDesc;
  String propertyLocation;
  String image;

  Property({
    this.id,
    this.propertyName,
    this.propertyPrice,
    this.propertyDesc,
    this.image,
    this.propertyLocation
  });

  static Property fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['builtUpArea'],
      propertyName: json['Overview']['room'],
      propertyPrice: json['monthlyRent'],
      propertyDesc: json['description'],
      propertyLocation: json['Address']['city'],
      image: json['houseImages'][0],
    );
  }


}