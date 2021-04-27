class Category {
  final String? id, type, imageUrl;
  Category({this.id, this.type, this.imageUrl});

  // factory Category.fromJson(x, id) {
  //   return Category(id: id, type: x["type"], imageUrl: x["imageUrl"]);
  // }

  // Map<String, dynamic> toJson() {
  //   return {
  //     "id": id,
  //     "type": type,
  //     "imageUrl": imageUrl,
  //   };
  // }
}
