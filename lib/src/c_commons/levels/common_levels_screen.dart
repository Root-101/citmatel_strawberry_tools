import 'package:flutter/material.dart';
import 'package:page_view_indicators/page_view_indicators.dart';

class CommonsLevelsScreen<LevelDomain> extends StatelessWidget {
  final List<LevelDomain> levelsFindAll;

  final Function(LevelDomain levelDomain) buildSingleLevel;

  //for page view and indicators
  final _pageController = PageController();
  final _currentPageNotifier = ValueNotifier<int>(0);

  CommonsLevelsScreen({
    required this.levelsFindAll,
    required this.buildSingleLevel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ArrowPageIndicator(
        iconSize: 25,
        isInside: true,
        pageController: _pageController,
        currentPageNotifier: _currentPageNotifier,
        itemCount: levelsFindAll.length,
        child: Stack(
          children: <Widget>[
            _buildPageView(),
            _buildCircleIndicator(),
          ],
        ),
      ),
    );
  }

  _buildPageView() {
    return PageView.builder(
      itemCount: levelsFindAll.length,
      controller: _pageController,
      itemBuilder: (BuildContext context, int index) {
        return Function.apply(
          buildSingleLevel,
          [levelsFindAll[index]],
        );
      },
      onPageChanged: (int index) {
        _currentPageNotifier.value = index;
      },
    );
  }

  _buildCircleIndicator() {
    return Positioned(
      left: 0.0,
      right: 0.0,
      bottom: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CirclePageIndicator(
          size: 10,
          selectedSize: 12,
          itemCount: levelsFindAll.length,
          currentPageNotifier: _currentPageNotifier,
        ),
      ),
    );
  }
}
