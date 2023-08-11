import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most_popular_articales/domain/models/most_poplar_articles_response/Result.dart';
import 'package:most_popular_articales/presentation/modules/home/cubit/cubit.dart';
import 'package:most_popular_articales/presentation/modules/home/cubit/states.dart';

class DetailsScreen extends StatelessWidget {
  Result article;

  DetailsScreen(this.article, {super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (ctx, state) {},
      builder: (ctx, state) {
        return Scaffold(
          appBar: appBar(context),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    article.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Flexible(
                  child: Text(
                    article.abstracts,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        article.byline?? "By Line _",
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 11,
                            color: Colors.black),
                      ),
                    ),
                    Text(
                      article.published_date,
                      style: const TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 11,
                          color: Colors.black),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                (article.media != null &&
                        article.media!.isNotEmpty &&
                        article.media![0].mediaMetadataRes != null &&
                        article.media![0].mediaMetadataRes!.isNotEmpty &&
                        article.media![0].mediaMetadataRes!.length == 3 &&
                        article.media![0].mediaMetadataRes![2] != null
                ) ? articleImage(
                        context,
                        NetworkImage(
                          article.media![0].mediaMetadataRes![2].url,
                        ),
                      )
                    : articleImage(
                        context,
                        const AssetImage("assets/images/temp.jpg"),
                      ),
                Center(
                  child: Text(
                    "Source: ${article.source}",
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 11,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  article.media != null &&
                          article.media!.isNotEmpty &&
                          article.media![0].caption != ""
                      ? article.media![0].caption
                      : "Description Not Found",
                  maxLines: 1000,
                  style:  TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  PreferredSizeWidget appBar(context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      title: const Text(
        "NY Times Most Popular",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      titleSpacing: 0,
    );
  }

  Widget articleImage(context, ImageProvider imageProvider) {
    return ClipRRect(
      borderRadius: const BorderRadiusDirectional.all(Radius.circular(20)),
      child: Image(
        image: imageProvider,
        height: MediaQuery.sizeOf(context).height * 0.35,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
