import 'package:flutter/material.dart';
import 'package:flutter_netflix/widgets/responsive.dart';

import '../assets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffSet;

  const CustomAppBar({Key key, this.scrollOffSet = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color:
          Colors.black.withOpacity((scrollOffSet / 350).clamp(0, 1).toDouble()),
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
      child: Responsive(
        mobile: _CustomAppBarMobile(),
        desktop: _CustomAppBarDesktop(),
      ),
    );
  }
}

class _CustomAppBarDesktop extends StatelessWidget {
  const _CustomAppBarDesktop({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image(
            image: AssetImage(Assets.netflixLogo1),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                  onTap: () => print('Home'),
                  text: 'Home',
                ),
                _AppBarButton(
                  onTap: () => print('TV Shows'),
                  text: 'TV Shows',
                ),
                _AppBarButton(
                  onTap: () => print('Movies'),
                  text: 'Movies',
                ),
                _AppBarButton(
                  onTap: () => print('Latest'),
                  text: 'TV Shows',
                ),
                _AppBarButton(
                  onTap: () => print('My List'),
                  text: 'My List',
                ),
              ],
            ),
          ),
          Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.search),
                  color: Colors.white,
                  padding: EdgeInsets.zero,
                  iconSize: 28.0,
                  onPressed: () {
                    print('Search');
                  },
                ),
                _AppBarButton(
                  onTap: () => print('KIDS'),
                  text: 'KIDS',
                ),
                _AppBarButton(
                  onTap: () => print('DVD'),
                  text: 'DVD',
                ),
                IconButton(
                  icon: Icon(Icons.card_giftcard),
                  color: Colors.white,
                  padding: EdgeInsets.zero,
                  iconSize: 28.0,
                  onPressed: () {
                    print('Search');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.notifications),
                  color: Colors.white,
                  padding: EdgeInsets.zero,
                  iconSize: 28.0,
                  onPressed: () {
                    print('Search');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBarMobile extends StatelessWidget {
  const _CustomAppBarMobile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Image(
            image: AssetImage(Assets.netflixLogo0),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                  onTap: () => print('TV Shows'),
                  text: 'TV Shows',
                ),
                _AppBarButton(
                  onTap: () => print('Movies'),
                  text: 'Movies',
                ),
                _AppBarButton(
                  onTap: () => print('My List'),
                  text: 'My List',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String text;
  final Function onTap;

  const _AppBarButton({
    @required this.onTap,
    @required this.text,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
        ),
      ),
    );
  }
}
