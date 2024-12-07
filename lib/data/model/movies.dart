import 'dart:convert';

Movies moviesFromJson(String str) => Movies.fromJson(json.decode(str));

String moviesToJson(Movies data) => json.encode(data.toJson());

class Movies {
  List<Movie> moviesList;
  Pagination pagination;

  Movies({
    required this.moviesList,
    required this.pagination,
  });

  factory Movies.fromJson(Map<String, dynamic> json) => Movies(
        moviesList:
            List<Movie>.from(json["data"].map((x) => Movie.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(moviesList.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
      };
}

class Movie {
  String id;
  String priority;
  String category;
  String name;
  Cover cover;
  MetaData metaData;
  List<Movie>? collections;
  List<Movie>? relateMovies;

  Movie({
    required this.id,
    required this.priority,
    required this.category,
    required this.name,
    required this.cover,
    required this.metaData,
    this.collections,
    this.relateMovies,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["id"],
        priority: json["priority"],
        category: json["category"],
        name: json["name"],
        cover: Cover.fromJson(json["cover"]),
        metaData: MetaData.fromJson(json["metaData"]),
        collections: (json['collections'] as List<dynamic>?)
            ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
            .toList(),
        relateMovies: (json['relateMovies'] as List<dynamic>?)
            ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "priority": priority,
        "category": category,
        "name": name,
        "cover": cover.toJson(),
        "metaData": metaData.toJson(),
        "collections": collections?.map((x) => x.toJson()).toList(),
        "relateMovies": relateMovies?.map((x) => x.toJson()).toList(),
      };
}

class Cover {
  String thumbnailUrl;
  String originalUrl;
  String trailerUrl;

  Cover({
    required this.thumbnailUrl,
    required this.originalUrl,
    required this.trailerUrl,
  });

  factory Cover.fromJson(Map<String, dynamic> json) => Cover(
        thumbnailUrl: json["thumbnailUrl"],
        originalUrl: json["originalUrl"],
        trailerUrl: json["trailerUrl"],
      );

  Map<String, dynamic> toJson() => {
        "thumbnailUrl": thumbnailUrl,
        "originalUrl": originalUrl,
        "trailerUrl": trailerUrl,
      };
}

class MetaData {
  int filmLength;
  int continueSeconds;

  MetaData({
    required this.filmLength,
    required this.continueSeconds,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) => MetaData(
        filmLength: json["filmLength"],
        continueSeconds: json["continueSeconds"],
      );

  Map<String, dynamic> toJson() => {
        "filmLength": filmLength,
        "continueSeconds": continueSeconds,
      };
}

class Pagination {
  int pageLimit;
  int totalPage;
  int totalRecords;

  Pagination({
    required this.pageLimit,
    required this.totalPage,
    required this.totalRecords,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        pageLimit: json["pageLimit"],
        totalPage: json["totalPage"],
        totalRecords: json["totalRecords"],
      );

  Map<String, dynamic> toJson() => {
        "pageLimit": pageLimit,
        "totalPage": totalPage,
        "totalRecords": totalRecords,
      };
}
