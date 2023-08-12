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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    article.title,
                    maxLines: 100,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    article.abstracts,
                    maxLines: 1000,
                    style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                        color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        article.byline ?? "By Line _",
                        maxLines: 5,
                        style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 11,
                            color: Colors.black),
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
                  getArticleImage(context),
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
                        : "Description Not Found----> Open Closed principle : Open for extension but close for modification Make abstract class Then create class to need methods in it and implement it And when I use it create object from abstract class but it is pointer on implement classes So when I need another class only create new class(open for extension) but not modified in class with if condition for new class if not use abstract class or interface (closed modification) Used in app Always used abstract class and classes implement it Open Closed principle : Open for extension but close for modification Make abstract class Then create class to need methods in it and implement it And when I use it create object from abstract class but it is pointer on implement classes So when I need another class only create new class(open for extension) but not modified in class with if condition for new class if not use abstract class or interface (closed modification) Used in app Always used abstract class and classes implement it Open Closed principle : Open for extension but close for modification Make abstract class Then create class to need methods in it and implement it And when I use it create object from abstract class but it is pointer on implement classes So when I need another class only create new class(open for extension) but not modified in class with if condition for new class if not use abstract class or interface (closed modification) Used in app Always used abstract class and classes implement it",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black.withOpacity(0.7),
                    ),
                    maxLines: 1000000,
                  ),
                ],
              ),
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
  Widget articleImageFoundOrNot(context, ImageProvider imageProvider) {
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

  Widget getArticleImage(BuildContext context) {
    return (article.media != null &&
            article.media!.isNotEmpty &&
            article.media![0].mediaMetadataRes != null &&
            article.media![0].mediaMetadataRes!.isNotEmpty &&
            article.media![0].mediaMetadataRes!.length == 3 &&
            article.media![0].mediaMetadataRes![2] != null)
        ? articleImageFoundOrNot(
            context,
            NetworkImage(
              article.media![0].mediaMetadataRes![2].url,
            ),
          )
        : articleImageFoundOrNot(
            context,
            const AssetImage("assets/images/temp.jpg"),
          );
  }
}
