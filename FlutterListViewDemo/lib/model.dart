

class EventModel{
  String id;
  String userName;
  String url;
  String repoName;

  EventModel(json)
  {
    this.id = json["id"];
    this.userName = json["actor"]["login"];
    this.url = json["actor"]["avatar_url"];
    this.repoName = json["repo"]["name"];
  }
}