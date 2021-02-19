/// id : "2baf70d1-42bb-4437-b551-e5fed5a87abe"
/// title : "Castle in the Sky"
/// description : "The orphan Sheeta inherited a mysterious crystal that links her to the mythical sky-kingdom of Laputa. With the help of resourceful Pazu and a rollicking band of sky pirates, she makes her way to the ruins of the once-great civilization. Sheeta and Pazu must outwit the evil Muska, who plans to use Laputa's science to make himself ruler of the world."
/// director : "Hayao Miyazaki"
/// producer : "Isao Takahata"
/// release_date : "1986"
/// rt_score : "95"
/// people : ["https://ghibliapi.herokuapp.com/people/"]
/// species : ["https://ghibliapi.herokuapp.com/species/af3910a6-429f-4c74-9ad5-dfe1c4aa04f2"]
/// locations : ["https://ghibliapi.herokuapp.com/locations/"]
/// vehicles : ["https://ghibliapi.herokuapp.com/vehicles/"]
/// url : "https://ghibliapi.herokuapp.com/films/2baf70d1-42bb-4437-b551-e5fed5a87abe"

class MovieModel {
  String _id;
  String _title;
  String _description;
  String _director;
  String _producer;
  String _releaseDate;
  String _rtScore;
  List<String> _people;
  List<String> _species;
  List<String> _locations;
  List<String> _vehicles;
  String _url;

  String get id => _id;
  String get title => _title;
  String get description => _description;
  String get director => _director;
  String get producer => _producer;
  String get releaseDate => _releaseDate;
  String get rtScore => _rtScore;
  List<String> get people => _people;
  List<String> get species => _species;
  List<String> get locations => _locations;
  List<String> get vehicles => _vehicles;
  String get url => _url;

  MovieModel({
      String id, 
      String title, 
      String description, 
      String director, 
      String producer, 
      String releaseDate, 
      String rtScore, 
      List<String> people, 
      List<String> species, 
      List<String> locations, 
      List<String> vehicles, 
      String url}){
    _id = id;
    _title = title;
    _description = description;
    _director = director;
    _producer = producer;
    _releaseDate = releaseDate;
    _rtScore = rtScore;
    _people = people;
    _species = species;
    _locations = locations;
    _vehicles = vehicles;
    _url = url;
}

  MovieModel.fromJson(dynamic json) {
    _id = json["id"];
    _title = json["title"];
    _description = json["description"];
    _director = json["director"];
    _producer = json["producer"];
    _releaseDate = json["release_date"];
    _rtScore = json["rt_score"];
    _people = json["people"] != null ? json["people"].cast<String>() : [];
    _species = json["species"] != null ? json["species"].cast<String>() : [];
    _locations = json["locations"] != null ? json["locations"].cast<String>() : [];
    _vehicles = json["vehicles"] != null ? json["vehicles"].cast<String>() : [];
    _url = json["url"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["title"] = _title;
    map["description"] = _description;
    map["director"] = _director;
    map["producer"] = _producer;
    map["releaseDate"] = _releaseDate;
    map["rtScore"] = _rtScore;
    map["people"] = _people;
    map["species"] = _species;
    map["locations"] = _locations;
    map["vehicles"] = _vehicles;
    map["url"] = _url;
    return map;
  }

}