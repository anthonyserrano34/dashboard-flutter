class UserDetails {
  String? email;
  String? password;
  List<Games>? games;
  String? name;

  UserDetails({this.email, this.password, this.games, this.name});

  UserDetails.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    if (json['games'] != null) {
      games = <Games>[];
      json['games'].forEach((v) {
        games!.add(new Games.fromJson(v));
      });
    }
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    if (this.games != null) {
      data['games'] = this.games!.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    return data;
  }
}

class Games {
  String? name;
  List<String>? domains;
  List<String>? eventedDomains;

  Games({this.name, this.domains, this.eventedDomains});

  Games.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    domains = json['domains'].cast<String>();
    eventedDomains = json['eventedDomains'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['domains'] = this.domains;
    data['eventedDomains'] = this.eventedDomains;
    return data;
  }
}
