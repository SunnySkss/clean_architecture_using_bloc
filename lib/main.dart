import 'package:clean_architecture_using_bloc/core/services/injection_container.dart';
import 'package:clean_architecture_using_bloc/feature/home/presentatio/bloc/home_bloc.dart';
import 'package:clean_architecture_using_bloc/feature/home/presentatio/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>sl<HomeBloc>(),
      child:  MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home:  const HomeViews(),
        )
    );
  }
}

