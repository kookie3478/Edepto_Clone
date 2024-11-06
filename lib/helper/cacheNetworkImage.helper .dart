import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CacheNetworkImageHelper {
  static CachedNetworkImage getImage(String url,{double borderRadius = 100,BoxFit boxFit = BoxFit.cover}) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => const CupertinoActivityIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error, color: context.theme.colorScheme.outline,),
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          image: DecorationImage(
            image: imageProvider,
            fit: boxFit,
          ),
        ),
      )
    );
  }
}