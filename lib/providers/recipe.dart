class Recipe {
  final String id;
  final String name;
  final String images;
  final double rating;
  final String totalTime;
  final String description;
  final List preparationSteps;
  final String vidoeUrl;

  Recipe({
    this.id,
    this.name,
    this.images,
    this.rating,
    this.totalTime,
    this.description,
    this.preparationSteps,
    this.vidoeUrl,
  });

  factory Recipe.fromJson(dynamic json) {
    // print(json['videos']['snapshotUrl']);
    return Recipe(
      id: json['details']['id'] as String,
      name: json['details']['name'] as String,
      images: json['details']['images'][0]['hostedLargeUrl'] as String,
      rating: json['details']['rating'] as double,
      totalTime: json['details']['totalTime'] as String,
      description: json['description']['text'] as String,
      preparationSteps: json['preparationSteps'] as List,
      vidoeUrl:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    );
  }

  static List<Recipe> recipesFromSnapShot(List snapShot) {
    return snapShot.map((data) {
      return Recipe.fromJson(data);
    }).toList();
  }

  @override
  String toString() {
    return 'Recipe {name: $name,image: $images, rating: $rating, totalTime: $totalTime, description: $description}';
  }
}
