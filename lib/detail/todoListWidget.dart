import 'package:flutter/material.dart' hide Router;

class TodoListView extends StatefulWidget {
  final List todoList;

  TodoListView({Key key, @required this.todoList}) : super(key: key);

  @override
  _TodoListViewState createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView>
    with SingleTickerProviderStateMixin {
  final List<String> list = ['影评', '话题', '讨论'];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
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
        Expanded(
            child: Row(
          children: <Widget>[
            MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        child: getItem(),
                        color: Colors.white,
                      ),
                      Container(
                        height: 10.0,
                        color: Colors.transparent,
                      )
                    ],
                  );
                },
                physics: const ClampingScrollPhysics(),
                itemCount: 20,
              ),
            ),
          ],
        )),
      ],
    );
  }

  Widget getItem() {
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
                  // backgroundImage: NetworkImage(review.author.avatar),
                  backgroundColor: Colors.white,
                ),
              ),
              Padding(
                child: Text('review.author.name'),
                padding: const EdgeInsets.only(right: 5.0),
              ),
              // RatingBar(
              //   ((review.rating.value * 1.0) / (review.rating.max * 1.0)) *
              //       10.0,
              //   size: 11.0,
              //   fontSize: 0.0,
              // )
            ],
          ),
          Text(
            'review.title',
            style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Text(
              'review.content',
              softWrap: true,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14.0, color: Color(0xff333333)),
            ),
          ),
          Padding(
            child: Text('有用'),
            padding: const EdgeInsets.only(bottom: 10.0),
          ),
        ],
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          // return WebviewScaffold(
          //   url: review.shareUrl,
          //   appBar: new AppBar(
          //     backgroundColor: Colors.green,
          //     title: Row(
          //       mainAxisAlignment: MainAxisAlignment.start,
          //       children: <Widget>[
          //         Padding(
          //           padding: const EdgeInsets.only(
          //               top: 10.0, bottom: 7.0, right: 5.0),
          //           child: CircleAvatar(
          //             radius: 10.0,
          //             backgroundImage: NetworkImage(review.author.avatar),
          //             backgroundColor: Colors.white,
          //           ),
          //         ),
          //         Padding(
          //           child: Text(review.author.name),
          //           padding: const EdgeInsets.only(right: 5.0),
          //         ),
          //       ],
          //     ),
          //   ),
          // );
        }));
      },
    );
  }
}
