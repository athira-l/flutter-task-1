import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_1/controller/datacontroller.dart';
import 'package:training_1/main.dart';

class Data extends GetView<DataController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
        (state) => CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              backgroundColor: Colors.green,
              floating: true,
              pinned: false,
              snap: false,
              title: Text('User List'),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, int index) {
                  return Card(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(controller.state![index]["first_name"] +
                              " " +
                              controller.state![index]["last_name"]),
                          subtitle: Text(controller.state![index]["email"]),
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                controller.state![index]["avatar"]),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                  name: controller.state![index]['first_name'] +
                                      " " +
                                      controller.state![index]['last_name'],
                                  email: controller.state![index]['email'],
                                  avatar: controller.state![index]['avatar'],
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  );
                },
                childCount: controller.state?.length ?? 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
