import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_breeds_app/blocs/dog_bloc.dart';
import 'package:dog_breeds_app/constants.dart';
import 'package:dog_breeds_app/models/dog.dart';
import 'package:dog_breeds_app/services/networking.dart';
import 'package:dog_breeds_app/widgets/custom_image.dart';
import 'package:dog_breeds_app/widgets/custom_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DogCard extends StatelessWidget {
  final Dog dog;
  final Function onTap;

  DogCard(this.dog, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          child: Card(
              elevation: 1,
              color: Theme.of(context).primaryColorLight,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: dog.isDownloading
                            ? CustomProgressIndicator()
                            : CustomImage(dog.imageUrls[0]),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: kAccentColor[100],
//                          borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        dog.name,
                        textAlign: TextAlign.center,
                        style: kAppBarTextStyle,
                      ),
                    )
                  ])),
        ),
      ),
    );
  }
}

//Card(
//        color: Theme.of(context).primaryColorLight,
//        child: Padding(
//          padding: EdgeInsets.all(kSmallMargin),
//          child: Column(
//            children: <Widget>[
//              dog.isDownloading
//                  ? CircularProgressIndicator()
//                  : CachedNetworkImage(
//                      imageUrl: dog.imageUrl,
//                      placeholder: (context, url) =>
//                          CircularProgressIndicator(),
//                      errorWidget: (context, url, error) =>
//                          Icon(Icons.broken_image),
//                    ),
//              Text(
//                dog.name,
//                style: Theme.of(context)
//                    .textTheme
//                    .headline6
//                    .copyWith(color: Colors.black87),
//              )
//            ],
//          ),
//        ),
//      )
