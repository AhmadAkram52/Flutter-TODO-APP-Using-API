import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TShimmer {
  static Shimmer listShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade500,
      highlightColor: Colors.pink.shade300,
      child: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: ListTile(
                  leading: const CircleAvatar(
                      foregroundColor: Colors.white, child: Text(" ")),
                  title: Container(
                    color: Colors.white,
                    height: 10,
                  ),
                  subtitle: Container(
                    color: Colors.white,
                    height: 10,
                  ),
                  trailing: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  )),
            );
          }),
    );
  }
}
