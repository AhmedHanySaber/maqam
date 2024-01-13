class Location{
  final String location;

  Location({required this.location});
  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      location: json['location'],
    );
  }

}