import 'dart:math';

import 'package:flutter/material.dart' hide Router;
import 'package:myapp/bean/movie_long_comments_entity.dart';
import 'package:myapp/movie/rating_bar.dart';
import 'package:myapp/movie/constant.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

///电影长评论
class LongCommentWidget extends StatelessWidget {
  final MovieLongCommentsEntity movieLongCommentsEntity;

  LongCommentWidget({Key key, @required this.movieLongCommentsEntity})
      : assert(movieLongCommentsEntity != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return LongCommentTabView(
      movieLongCommentsEntity: movieLongCommentsEntity,
    );
  }
}

class LongCommentTabView extends StatefulWidget {
  final MovieLongCommentsEntity movieLongCommentsEntity;

  LongCommentTabView({Key key, @required this.movieLongCommentsEntity})
      : super(key: key);

  @override
  _LongCommentTabViewState createState() => _LongCommentTabViewState();
}

class _LongCommentTabViewState extends State<LongCommentTabView>
    with SingleTickerProviderStateMixin {
  // final List<String> list = ['影评'];
  final List<String> dataList = [
    'It was going to be a lonely trip back',
    '',
    '影评3',
    'by your side',
    '起早挤地铁什么的 最(〃＞皿＜)',
    '影评6',
    '',
    '等雨停',
    '',
    'にほんご',
    '有机会一起看🛬',
    '',
    '',
    '',
    'wow😯',
    '',
    '',
    '卡比兽',
  ];
  ScrollController _scrollController = new ScrollController();
  int _lastTargetIndex = 0;

  TabController controller;
  Color selectColor, unselectedColor;
  TextStyle selectStyle, unselectedStyle;

  @override
  void initState() {
    controller = TabController(length: 1, vsync: this);
    selectColor = Colors.black;
    unselectedColor = Color.fromARGB(255, 117, 117, 117);
    selectStyle = TextStyle(fontSize: 15, color: selectColor);
    unselectedStyle = TextStyle(fontSize: 15, color: selectColor);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 6.0,
          width: 45.0,
          margin: const EdgeInsets.only(top: 10.0),
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 214, 215, 218),
              borderRadius: BorderRadius.all(const Radius.circular(5.0))),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 15),
          child: Text(
            'Today List',
            style: TextStyle(
                fontSize: 20.0,
                color: Colors.black,
                fontFamily: "MarkaziText",
                fontWeight: FontWeight.bold),
          ),
        ),
        // Container(
        //   padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
        //   child: TabBar(
        //     tabs: list
        //         .map((item) => Padding(
        //               padding:
        //                   const EdgeInsets.only(bottom: Constant.TAB_BOTTOM),
        //               child: Text(item),
        //             ))
        //         .toList(),
        //     isScrollable: true,
        //     indicatorColor: selectColor,
        //     labelColor: selectColor,
        //     labelStyle: selectStyle,
        //     unselectedLabelColor: unselectedColor,
        //     unselectedLabelStyle: unselectedStyle,
        //     indicatorSize: TabBarIndicatorSize.label,
        //     controller: controller,
        //   ),
        //   alignment: Alignment.centerLeft,
        // ),
        Expanded(
            child: TabBarView(
          children: <Widget>[
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: showGridWidget(),

              // child: dataList
              //       .asMap()
              //       .keys
              //       .map((index) => _buildDraggableItem(index))
              //       .toList(),
              // child: ListView.builder(
              //   itemBuilder: (BuildContext context, int index) {
              //     return Column(
              //       children: <Widget>[
              //         Container(
              //           child: getItem(
              //               widget.movieLongCommentsEntity.reviews[index]),
              //           padding: const EdgeInsets.only(
              //               left: Constant.MARGIN_LEFT,
              //               right: Constant.MARGIN_RIGHT),
              //           color: Colors.white,
              //         ),
              //         Container(
              //           height: 10.0,
              //           color: Colors.transparent,
              //         )
              //       ],
              //     );
              //   },
              //   physics: const ClampingScrollPhysics(),
              //   itemCount: widget.movieLongCommentsEntity.reviews.length,
              // ),
            ),
          ],
          controller: controller,
        ))
      ],
    );
  }

  showGridWidget() {
    return Container(
      color: const Color.fromARGB(255, 243, 244, 248),
      // padding: const EdgeInsets.all(0.0),
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 1.0,
        childAspectRatio: 1 / 1.2,
        controller: _scrollController,
        children: dataList
            .asMap()
            .keys
            .map((index) => _buildDraggableItem(index))
            .toList(),
      ),

      // child: GridView.custom(
      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //       crossAxisCount: 3,
      //       mainAxisSpacing: 1.0,
      //       crossAxisSpacing: 1.0,
      //       childAspectRatio: 1 / 1.2,
      //     ),
      //     childrenDelegate: SliverChildBuilderDelegate((context, position) {
      //       return
      //     }, childCount: 20)),
    );
  }

  Widget _buildDraggableItem(int index) {
    // TODO LongPressDraggable 继承自 Draggable，因此用法和 Draggable 完全一样，
    // TODO 唯一的区别就是 LongPressDraggable 触发拖动的方式是长按，而 Draggable 触发拖动的方式是按下
    return LongPressDraggable(
      // TODO 传递给 DragTarget 的数据
      data: index,
      // TODO 拖动时跟随移动的 widget
      feedback: Container(
        width: 120,
        height: 120,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Image.asset(
                  'assets/images/ic_me_journal.png',
                  width: 20.0,
                  height: 20.0,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  '拖拽中',
                ),
              ),
            )
          ],
        ),
      ),

      // TODO 用 DragTarget 包裹，表示可作为拖动的最终目标，<int>表示传递数据 data 的类型
      child: DragTarget<int>(
        builder: (context, data, rejects) {
          return _buildItem(dataList[index], isDragging: false, index: index);
        },
        // 手指拖着一个widget从另一个widget头上滑走时会调用
        onLeave: (data) {
          // print('---$data is Leaving item $index---');
        },
        // 松手时，是否需要将数据给这个widget，因为需要在拖动时改变UI，所以在这里直接修改数据源
        onWillAccept: (data) {
          // print('---(target)$index will accept item (drag)$data---');
          // TODO 跨度超过一行数量，就是判定可以上/下滑动
          if ((index - _lastTargetIndex).abs() >= 3 && _lastTargetIndex >= 0) {
            if (_scrollController.offset == 0 && index < _lastTargetIndex) {
            } else if (_scrollController.offset ==
                    _scrollController.position.maxScrollExtent &&
                index > _lastTargetIndex) {
            } else {
              _scrollController.animateTo(((index / 3).ceil() - 1) * 80.0,
                  duration: new Duration(milliseconds: 200),
                  curve: Curves.ease); // 80为item高度
            }
          }
          setState(() {
            _lastTargetIndex = index;
          });
          return true;
        },
        // 松手时，如果onWillAccept返回true，那么就会调用
        onAccept: (data) {
          // TODO 松手时交换数据并刷新 UI
          setState(() {
            final dragTemp = dataList[index];
            final targetTemp = dataList[data];
            dataList.replaceRange(data, data + 1, [dragTemp]);
            dataList.replaceRange(index, index + 1, [targetTemp]);
            _lastTargetIndex = -1;
          });
        },
      ),
      // /*// 开始拖动时回调
      // onDragStarted: () {
      //   print('---1---onDragStarted');
      // },
      // // 拖动结束时回调
      // onDragEnd: (DraggableDetails details) {
      //   print('---2---onDragEnd:$details');
      // },
      // // 未拖动到DragTarget控件上时回调
      // onDraggableCanceled: (Velocity velocity, Offset offset) {
      //   print('---3---onDraggableCanceled velocity:$velocity,offset:$offset');
      // },
      // // 拖动到DragTarget控件上时回调
      // onDragCompleted: () {
      //   print('---4---onDragCompleted');
      // },
      // */
    );
  }

  Widget _buildItem(String item, {bool isDragging, int index}) {
    return Container(
      // shadowColor: Colors.white,
      // clipBehavior: Clip.antiAlias,
      // margin: const EdgeInsets.all(0.0),
      // shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(4.0)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        color: index % 2 == 1 && item.length > 0
            ? Colors.white
            : Color.fromARGB(255, 250, 250, 250),
      ),
      // color: index % 2 == 1 ? Colors.white : Color.fromARGB(255, 245, 245, 245),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          // Image.network(
          //   'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fyouimg1.c-ctrip.com%2Ftarget%2Ftg%2F601%2F164%2F039%2Fa9e3040da3594dbcab7723278dfb7cdc.jpg&refer=http%3A%2F%2Fyouimg1.c-ctrip.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1619079548&t=7bef3e2db0329ae20faa9c386d62fe80',
          //   fit: BoxFit.cover,
          // ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                index % 2 == 1 && item.length > 0
                    ? '🎧'
                    : (index % 5 == 1 ? '🎵' : ''),
                style: TextStyle(
                    fontFamily: "MarkaziText", fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                index % 2 == 1 && item.length > 0
                    ? item
                    : (index % 5 == 1 ? '' : item),
                style: TextStyle(
                  fontFamily: "MarkaziText",
                  fontWeight: FontWeight.bold,
                  color: index % 2 == 1
                      ? Colors.black
                      : Color.fromARGB(255, 200, 200, 200),
                ),
              ),
              // decoration: BoxDecoration(
              //     color: Colors.amberAccent,
              //     borderRadius: BorderRadius.only(
              //         bottomLeft: Radius.circular(16))),
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomRight,
          //   child: Container(
          //     padding: EdgeInsets.all(10.0),
          //     child: Text(
          //       index.toString(),
          //       style: TextStyle(
          //         fontFamily: "MarkaziText",
          //         fontWeight: FontWeight.bold,
          //         color: index % 2 == 1
          //             ? Colors.black
          //             : Color.fromARGB(255, 200, 200, 200),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget getItem(MovieLongCommentReviews review) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 7.0, right: 5.0),
                child: CircleAvatar(
                  radius: 10.0,
                  backgroundImage: NetworkImage(review.author.avatar),
                  backgroundColor: Colors.white,
                ),
              ),
              Padding(
                child: Text(review.author.name),
                padding: const EdgeInsets.only(right: 5.0),
              ),
              RatingBar(
                ((review.rating.value * 1.0) / (review.rating.max * 1.0)) *
                    10.0,
                size: 11.0,
                fontSize: 0.0,
              )
            ],
          ),
          Text(
            review.title,
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Text(
              review.content,
              softWrap: true,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14.0, color: Color(0xff333333)),
            ),
          ),
          Padding(
            child: Text(
                '${getUsefulCount(review.commentsCount)}回复 · ${getUsefulCount(review.usefulCount)} 有用'),
            padding: const EdgeInsets.only(bottom: 10.0),
          ),
        ],
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return WebviewScaffold(
            url: review.shareUrl,
            appBar: new AppBar(
              backgroundColor: Colors.green,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 7.0, right: 5.0),
                    child: CircleAvatar(
                      radius: 10.0,
                      backgroundImage: NetworkImage(review.author.avatar),
                      backgroundColor: Colors.white,
                    ),
                  ),
                  Padding(
                    child: Text(review.author.name),
                    padding: const EdgeInsets.only(right: 5.0),
                  ),
                ],
              ),
            ),
          );
        }));
      },
    );
  }

  ///将34123转成3.4k
  getUsefulCount(int usefulCount) {
    double a = usefulCount / 1000;
    if (a < 1.0) {
      return usefulCount;
    } else {
      return '${a.toStringAsFixed(1)}k'; //保留一位小数
    }
  }
}
