import 'package:flutter/material.dart';
import 'package:estore/setup/setup.dart';
import 'package:estore/models/models.dart';

class ProductImages extends StatefulWidget {
  final Product? product;
  const ProductImages({Key? key, @required this.product});
  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getPropScreenWidth(240),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: widget.product!.id.toString(),
              child: Image.asset(widget.product!.images![selectedImage]),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(widget.product!.images!.length,
                (index) => productPreview(index))
          ],
        ),
      ],
    );
  }

  GestureDetector productPreview(int? index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index!;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(8),
        height: getPropScreenHeight(50),
        width: getPropScreenWidth(50),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0),
          ),
        ),
        child: Image.asset(widget.product!.images![index!]),
      ),
    );
  }
}
