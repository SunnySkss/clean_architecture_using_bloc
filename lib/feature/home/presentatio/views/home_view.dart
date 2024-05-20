
import 'package:clean_architecture_using_bloc/feature/home/presentatio/bloc/home_bloc.dart';
import 'package:clean_architecture_using_bloc/feature/home/presentatio/bloc/home_event.dart';
import 'package:clean_architecture_using_bloc/feature/home/presentatio/bloc/home_state.dart';
import 'package:clean_architecture_using_bloc/feature/home/presentatio/views/list_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViews extends StatefulWidget {
  const HomeViews({super.key});
  @override
  State<HomeViews> createState() => _HomeViewsState();
}

class _HomeViewsState extends State<HomeViews> {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home"),
      ),
      body: BlocConsumer<HomeBloc,HomeUserState>(
          listener: (cntxt,state){
            if(state.currentState == HomeStates.error){
               print("Something went wrong , Please try after some time");
               showDialog(context: context, builder: (cntxt){
                 return AlertDialog(
                   title: const Text("Please check internet connection"),
                   actions: [
                     TextButton(
                         onPressed: () {
                          getData();
                          Navigator.pop(cntxt);
                       },
                      child: const Text("Load again")
                     )
                   ],
                 );
               });
            }
          },
          builder: (context, state) {
            if(state.currentState == HomeStates.initial) {
              return const Center(child: Text("Click On Button"));
            }
            if(state.currentState == HomeStates.loaded) {
              return ListView.builder(
                  itemCount: state.characterList.length,
                  shrinkWrap: true,
                  itemBuilder: (cntxt,index){
                    return ListCards(userData:state.characterList[index]);
                  });
            }
            if(state.currentState == HomeStates.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Container();
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getData,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  getData() {
    BlocProvider.of<HomeBloc>(context).add(const HomeUserLoadingEvent());
  }
}
