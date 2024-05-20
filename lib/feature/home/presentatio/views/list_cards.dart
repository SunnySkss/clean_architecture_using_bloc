import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_architecture_using_bloc/feature/home/domain/entity/user_entity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListCards extends StatelessWidget {
  const ListCards({super.key,required this.userData});
  final UserData userData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).primaryColor.withOpacity(.05),
              blurRadius: 1,
              spreadRadius: 1,blurStyle: BlurStyle.solid
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CachedNetworkImage(
                imageUrl: userData.image,
                placeholder: (context,url)=>const Center(child: CupertinoActivityIndicator()),
                width: 100,
                height: 100,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userData.userName),
                    Text(userData.species),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
