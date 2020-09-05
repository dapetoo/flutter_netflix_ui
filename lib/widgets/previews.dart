import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_netflix/models/models.dart';

class Previews extends StatelessWidget {
  final List<Content> contentList;
  final String title;

  const Previews({Key key, @required this.contentList, @required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 165.0,
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            itemBuilder: (BuildContext context, int index) {
              final Content content = contentList[index];
              return GestureDetector(
                onTap: () => print(content.name),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: content.color, width: 4.0),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(content.imageUrl))),
                      height: 130.0,
                      width: 130.0,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            stops: [0, 0.25, 1],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black87,
                              Colors.black45,
                              Colors.transparent
                            ]),
                        shape: BoxShape.circle,
                        border: Border.all(color: content.color, width: 4.0),
                      ),
                      height: 130.0,
                      width: 130.0,
                    ),
                    Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: SizedBox(
                          child: Image.asset(content.titleImageUrl),
                          height: 60.0,
                        ))
                  ],
                ),
              );
            },
            itemCount: contentList.length,
            scrollDirection: Axis.horizontal,
          ),
        )
      ],
    );
  }
}
