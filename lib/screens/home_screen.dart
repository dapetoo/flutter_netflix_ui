import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_netflix/cubits/cubits.dart';
import 'package:flutter_netflix/data/data.dart';
import 'package:flutter_netflix/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        context.bloc<AppBarCubit>().setOffset(_scrollController.offset);
      });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.cast),
        backgroundColor: Colors.grey[850],
      ),
      appBar: PreferredSize(
        child: BlocBuilder<AppBarCubit, double>(
            builder: (context, scrollOffset) => CustomAppBar(
                  scrollOffSet: scrollOffset,
                )),
        preferredSize: Size(screenSize.width, 50.0),
      ),
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: ContentHeader(featuredContent: sintelContent),
            ),
            SliverPadding(padding: EdgeInsets.only(top: 20.0)),
            SliverToBoxAdapter(
              key: PageStorageKey('previews'),
              child: Previews(title: 'Previews', contentList: previews),
            ),
            SliverToBoxAdapter(
              key: PageStorageKey('my_list'),
              child: ContentList(title: 'My List', contentList: myList),
            ),
            SliverToBoxAdapter(
              key: PageStorageKey('netflix_originals'),
              child: ContentList(
                  title: 'Netflix Originals',
                  contentList: originals,
                  isOriginals: true),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 20.0),
              sliver: SliverToBoxAdapter(
                key: PageStorageKey('trending'),
                child: ContentList(title: 'Trending', contentList: trending),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
