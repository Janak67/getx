import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/screen/home/controller/home_controller.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '   Saved for later (item)',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            const Divider(),
            Obx(
              () {
                return Expanded(
                  child: ListView.builder(
                    itemCount: controller.cartList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.network(
                            '${controller.cartList[index].image}',
                            height: 100,
                            width: 100),
                        title: Text('${controller.cartList[index].title}'),
                        subtitle: Text(
                          '₹ ${controller.cartList[index].price}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            controller.cartList.removeAt(index);
                          },
                          icon: const Icon(Icons.delete),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            Obx(
              () => Align(
                alignment: Alignment.center,
                child: Text('Total Quantity : ${controller.cartList.length}',
                    style: const TextStyle(fontSize: 18)),
              ),
            ),
            Obx(
              () => Align(
                alignment: Alignment.center,
                child: Text('Total Price : ${controller.totalPrice}',
                    style: const TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
