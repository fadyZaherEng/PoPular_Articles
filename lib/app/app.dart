
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:most_popular_articales/app/di.dart';
import 'package:most_popular_articales/domain/usecase/home_usecase.dart';
import 'package:most_popular_articales/presentation/modules/home/cubit/cubit.dart';
import 'package:most_popular_articales/presentation/modules/home/cubit/states.dart';
import 'package:most_popular_articales/presentation/modules/home/home_screen.dart';
import 'package:most_popular_articales/presentation/resources/theme_manager.dart';

import 'package:sizer/sizer.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  initHomeUseCase()async{
    await initHomeModule();
  }
  @override
  void initState() {
    super.initState();
    initHomeUseCase();
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppCubit>(
      create: (ctx) => AppCubit(instance<HomeUseCase>())..getPopularArticles(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (ctx,state){},
        builder: (ctx,state){
          return  Sizer(builder: (ctx,orentation,deviceType){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Most Popular Articles',
              theme: lightTheme(),
              home:HomeScreen(),
            );
          });
        },
      ),
    );
  }
}
