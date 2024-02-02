import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/screen/home/controller/home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    controller.getProductData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            'Product',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed('cart');
              },
              icon: const Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: Obx(
          () {
            return ListView.builder(
              itemCount: controller.productList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Get.toNamed('detail',
                        arguments: controller.productList[index]);
                  },
                  child: Container(
                    width: double.infinity,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      children: [
                        Image.network('${controller.productList[index].image}',
                            height: 150, width: 120),
                        const SizedBox(width: 10),
                        // Text(
                        //   '${controller.productList[index].title}',
                        //   overflow: TextOverflow.ellipsis,
                        // ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
