class HomeModel {
  String? status;
  int? totalResults;
  List<ArticalModel>? articles = [];

  HomeModel({this.status, this.totalResults, this.articles});

  HomeModel newsFromJson(Map m1) {
    status = m1['status'];
    totalResults = m1['totalResults'];
    List aList = m1['articles'];
    articles = aList.map((e) => ArticalModel().articalFromJson(e)).toList();
    HomeModel homeModel = HomeModel(
        status: status, totalResults: totalResults, articles: articles);
    return homeModel;
  }
}

class ArticalModel {
  String? author, title, description, url, urlToImage, publishedAt, content;
  SorceModel? sorceModel;

  ArticalModel(
      {this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content,
      this.sorceModel});

  ArticalModel articalFromJson(Map m1) {
    sorceModel = SorceModel().sourceFromJson(m1['source']);
    description = m1['description'];
    title = m1['title'];
    urlToImage = m1['urlToImage'];
    author = m1['author'];
    content = m1['content'];
    publishedAt = m1['publishedAt'];
    url=m1['url'];
    ArticalModel articalModel = ArticalModel(
        description: description,
        title: title,
        urlToImage: urlToImage,
        publishedAt: publishedAt,
        content: content,
        url: url,
        author: author,
        sorceModel: sorceModel);
    return articalModel;
  }
}

class SorceModel {
  String? id, name;

  SorceModel({this.id, this.name});

  SorceModel sourceFromJson(Map m1) {
    id = m1['id'];
    name = m1['name'];

    SorceModel sorceModel = SorceModel(id: id, name: name);
    return sorceModel;
  }
}
