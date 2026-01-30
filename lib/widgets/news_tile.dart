import 'package:flutter/material.dart';
import 'package:test4/models/article_model.dart';

// ignore: must_be_immutable
class NewsTile extends StatefulWidget {
  const NewsTile({super.key, required this.articleModel});

  final ArticleModel articleModel;

  @override
  State<NewsTile> createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[300],
              ),
            ),
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(8),
                child: widget.articleModel.image != null
                    ? Image.network(
                        widget.articleModel.image!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : SizedBox(),
              ),

              Text(
                widget.articleModel.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),

              widget.articleModel.description != null
                  ? GestureDetector(
                      onTap: () {
                        return setState(() {
                          tapped = !tapped;
                        });
                      },
                      child: Text(
                        widget.articleModel.description!,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.grey[700]),
                        overflow: TextOverflow.ellipsis,
                        maxLines: tapped ? 7878 : 2,
                      ),
                    )
                  : SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}
