class Character {
  int id;
  String name;
  String status;
  String species;
  String gender;
  String image;
  Location origin;
  Location location;
  List<String> episode;
  DateTime created;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    required this.origin,
    required this.location,
    required this.episode,
    required this.created,
  });
}

class Location {
  String name;
  String url;

  Location({
    required this.name,
    required this.url,
  });
}