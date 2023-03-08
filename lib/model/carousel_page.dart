class CarouselPage {
  final String id;
  final String imgPath;
  final String companyId;

  CarouselPage({
    required this.id,
    required this.imgPath,
    required this.companyId,
  });

  CarouselPage.fromJson({
    required Map<String, dynamic> json,
  })  : id = json['id'],
        imgPath = json['imgPath'],
        companyId = json['companyId'];
}
