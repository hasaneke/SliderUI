import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slider_ui/consts.dart';

class SliderPage extends StatefulWidget {
  const SliderPage({Key? key}) : super(key: key);

  @override
  State<SliderPage> createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  final PageController _sliderController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  @override
  void dispose() {
    _sliderController.dispose();
    super.dispose();
  }

  static final List _images = [
    "https://www.igeeksblog.com/wp-content/uploads/2022/06/How-to-download-iOS-16-Developer-Beta-on-iPhone.jpg",
    "https://cdn.alsgp0.fds.api.mi-img.com/middle.community.micommunitytr.bkt/9256b1435003341a1cc0445d2b3d5a02"
  ];
  final int _sliderCount = _images.length;
  int _sliderNow = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              _images[_sliderNow],
              fit: BoxFit.fill,
              opacity: const AlwaysStoppedAnimation(0.2),
            )),
        Scaffold(backgroundColor: Colors.transparent, appBar: _appBar(), body: _body(context)),
      ],
    );
  }

  Column _body(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: ProjectPaddings.horizontalSymtericPadding + ProjectPaddings.verticalPadding,
          child: Stack(
            children: [
              _sliderCard(context),
              _sliderDots(),
            ],
          ),
        )
      ],
    );
  }

  Positioned _sliderDots() {
    return Positioned(
      right: 10,
      bottom: 10,
      child: Row(
        children: [
          for (var i = 0; i < _sliderCount; i++) ...[
            _dot(i),
          ]
        ],
      ),
    );
  }

  Container _dot(int i) {
    return Container(
      width: 6,
      margin: const EdgeInsets.only(left: 5),
      height: 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: _sliderNow == i ? Colors.white : Colors.white54,
      ),
    );
  }

  SizedBox _sliderCard(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.2,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: _sliderCount,
        controller: _sliderController,
        onPageChanged: (index) {
          setState(() {
            _sliderNow = index;
          });
        },
        itemBuilder: (context, index) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(fit: BoxFit.fill, image: Image.network(_images[_sliderNow]).image),
            ),
          );
        },
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(40),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Theme(
              data: ThemeData(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
              ),
              child: DefaultTabController(
                length: ProjectTabs.tabs.length,
                child: TabBar(
                  labelPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  labelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  isScrollable: true,
                  padding: const EdgeInsets.all(0),
                  tabs: ProjectTabs.tabs,
                ),
              ),
            ),
          ),
        ),
      ),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      title: const TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search, color: Colors.white),
        ),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        IconButton(onPressed: () {}, icon: const Icon(Icons.add))
      ],
    );
  }
}
