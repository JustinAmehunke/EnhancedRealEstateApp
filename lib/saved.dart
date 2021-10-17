import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/saved_homes.dart';

import 'colorscheme.dart';
import 'listview_model.dart';

class SavedPage extends StatefulWidget {
  const SavedPage({ Key? key }) : super(key: key);
  @override
  State<SavedPage> createState() => _SavedPageState();
}

class _SavedPageState extends State<SavedPage> with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
    Tab(text: 'RIGHT'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Scaffold(
          // appBar: AppBar(
          //   title: Text('Launch',),
          //   actions: [IconButton(icon: Icon(Icons.share_outlined), onPressed: () {})],
          // ),
          body: Column(
            children: [
              // Container(
              //   margin: EdgeInsets.only(right:16, left: 16),
              //   padding: EdgeInsets.only(top: 30,bottom: 5,right:16, left: 16),
              //   child: Align(
              //       alignment: Alignment.topRight,
              //       child: InkWell(
              //           onTap:  () {
              //             Navigator.pushNamed(context, 'list_home');
              //           },
              //           child: Row(
              //             children: [
              //               Icon(
              //                 Icons.list,
              //                 color: Colors.grey.shade500,
              //               ),
              //               Text("List"),
              //             ],
              //           )
              //       ),
              //   ),
              // ),
              Container(
                height: 80,
                child: AppBar(
                  bottom: const TabBar(
                    tabs: [
                      Tab(text: 'Saved Homes',),
                      Tab(text: 'Saved Searches',),
                      Tab(text: 'Contacted',)
                    ],
                  ),
                ),
              ),
               Expanded(
                child: TabBarView(
                  children: [
                    listOfProperties(),
                    notificationList(),
                    Text('Tab 3')
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
notificationList() {

  List<ListViewModel> myNotificationsList=[
    ListViewModel(
      icon: Icon(Icons.favorite, color: Colors.red,size: 30),
      notification:  'Ofankor Barrier filling station',
    ),
    ListViewModel(
      icon: Icon(Icons.favorite, color: Colors.red, size: 30),
      notification:     'Odokor Been To Complex',
    ),
    ListViewModel(
      icon: Icon(Icons.favorite, color: Colors.red, size: 30),
      notification:    'Charles approved your request to join the group',
    ),
  ];

  return ListView.builder(
      itemCount: myNotificationsList.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            index == 0
                ? SizedBox(
              height: 10,
            )
                : GestureDetector(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     // builder: (context) => Profile(),
                //   ),
                // );
              },
              child: Container(
                height: 80,
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        myNotificationsList[index - 1].icon,
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                width: 270,
                                child: Text(
                                  myNotificationsList[index - 1].notification,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                )),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '14 October,2021',
                              style: TextStyle(color: primaryColor),
                            )
                          ],
                        )
                      ],
                    ),
                    Divider()
                  ],
                ),
              ),
            ),
          ],
        );
      });
}