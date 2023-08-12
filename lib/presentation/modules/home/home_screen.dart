import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most_popular_articales/domain/models/most_poplar_articles_response/Result.dart';
import 'package:most_popular_articales/presentation/modules/details/details_screen.dart';
import 'package:most_popular_articales/presentation/modules/home/cubit/cubit.dart';
import 'package:most_popular_articales/presentation/modules/home/cubit/states.dart';
import 'package:most_popular_articales/presentation/resources/components/components.dart';

class HomeScreen extends StatelessWidget {
  var scrollController = ScrollController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (ctx, state) {},
      builder: (ctx, state) {
        return Scaffold(
          appBar: appBar(),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: ConditionalBuilder(
              condition:
                  AppCubit.get(context).popularArticlesResponse != null &&
                      AppCubit.get(context)
                          .popularArticlesResponse!
                          .results!
                          .isNotEmpty,
              builder: (context) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return listItem(
                        AppCubit.get(context)
                            .popularArticlesResponse!
                            .results![index],
                        context);
                  },
                  physics: const BouncingScrollPhysics(),
                  controller: scrollController,
                  itemCount: AppCubit.get(context)
                      .popularArticlesResponse!
                      .results!
                      .length,
                );
              },
              fallback: (context) => const Center(
                child: CircularProgressIndicator(color: Color(0xFF45E3C2)),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget listItem(Result result, context) {
    return InkWell(
      onTap: () {
        navigateToWithReturn(context, DetailsScreen(result));
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            Row(
              children: [
                getArticleImage(result,context),
                const SizedBox(
                  width: 5,
                ),
                getArticleTitleAndByline(result,context),
                const SizedBox(
                  width: 5,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ))
              ],
            ),
            getPublishedDate(result),
          ],
        ),
      ),
    );
  }
  PreferredSizeWidget appBar() {
    return AppBar(
      elevation: 0.0,
      leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
      title: const Text(
        "NY Times Most Popular",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 19,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      titleSpacing: 0,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
      ],
    );
  }
  Widget getPublishedDate(result) {
    return Padding(
      padding: const EdgeInsets.only(right: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Icon(
            Icons.calendar_month,
            color: Colors.grey,
            size: 18,
          ),
          Text(result.published_date),
        ],
      ),
    );
  }
  Widget getArticleImage(Result result, context) {
    return  (result.media != null &&
        result.media!.isNotEmpty &&
        result.media![0].mediaMetadataRes != null &&
        result.media![0].mediaMetadataRes!.isNotEmpty &&
        result.media![0].mediaMetadataRes![0] != null)
        ? CircleAvatar(
      backgroundColor: Colors.white,
      radius: 30,
      backgroundImage: NetworkImage(
          result.media![0].mediaMetadataRes![0].url),
    )
        : const CircleAvatar(
      backgroundColor: Colors.white,
      radius: 30,
      backgroundImage: AssetImage("assets/images/temp.jpg"),
    );
  }
  Widget getArticleTitleAndByline(Result result, context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            result.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            result.byline,
            style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: Colors.grey),
          ),
        ],
      ),
    );
 }
}
