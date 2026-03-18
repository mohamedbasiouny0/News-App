import 'package:flutter/material.dart';
import 'package:test4/models/artical_model/article_model.dart';
import 'package:test4/widgets/cached_N_I.dart';
import 'package:test4/widgets/url_launcher.dart';

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
              GestureDetector(
                onTap: () =>
                    UrlLauncher.launcherUrl(url: widget.articleModel.url!),
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(8),
                  child: widget.articleModel.urlToImage != null
                      ? CachedNI(imagePath: widget.articleModel.urlToImage!)
                      : SizedBox(),
                ),
              ),
              Text(
                widget.articleModel.title!,
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
