import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/screen/home/controller/home_controller.dart';
import 'package:getx/screen/home/model/home_model.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  HomeController controller = Get.put(HomeController());
  HomeModel model = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  '${model.image}',
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  width: double.infinity,
                ),
                const SizedBox(height: 15),
                Text(
                  '${model.title}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      '${model.category}',
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    const Spacer(),
                    Text('${model.ratingModel!.rate}'),
                    const Icon(Icons.star, color: Colors.amber),
                  ],
                ),
                const SizedBox(height: 15),
                const Text(
                  'Description',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${model.description}',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Quantity',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Text(
                  '-     1    +',
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 15),
                Text(
                  '₹ ${model.price}',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      controller.cartList.add(model);
                      Get.back();
                      Get.snackbar('Add to Cart', 'Success',
                          duration: const Duration(milliseconds: 1000));
                    },
                    child: const Text('Add to Cart'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
