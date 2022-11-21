import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:training_1/controller/datacontroller.dart';
import 'package:training_1/main.dart';

class Data extends GetView<UserListController> {
  const Data({super.key});

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
                            Get.to(UserDetailsScreen(
                                id: controller.state![index]['id']));
                            /*  Navigator.push(
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
                            );*/
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

class Data1 extends GetView<UserDetailsController> {
  const Data1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: controller.obx(
        (state) => Center(
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
                  child: Image.network(controller.state["data"]["avatar"],
                      width: 150.0, height: 150.0),
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  child: Text(controller.state["data"]["first_name"],
                      style: const TextStyle(fontSize: 20)),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 15.0),
                  child: Text('Email : ${controller.state["data"]["email"]}',
                      style: const TextStyle(fontSize: 14)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
