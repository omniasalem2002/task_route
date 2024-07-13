import 'package:flutter/material.dart';
import 'package:route_task/data/models/ProductDM.dart';
import 'package:route_task/ui/utils/app_colors.dart';

class Product extends StatelessWidget {
  final Products product;

  const Product(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        border: Border.all(
          color: AppColors.primaryBlue,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: product.images?.length ?? 0,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height *0.16,
                      width: MediaQuery.of(context).size.width *0.4,
                      child: Image.network(
                        product.images![index],
                        fit: BoxFit.cover, // Ensure the image covers the container
                        errorBuilder: (BuildContext context, Object error,
                            StackTrace? stackTrace) {
                          return const Center(
                            child: Text('Failed to load image'),
                          );
                        },
                      ),
                    ),
                     Positioned(
                      top: 10,
                      right: 10,
                      child: Container(
                        child: Icon(
                          Icons.favorite_border,
                          color: AppColors.primaryBlue,
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(height: 3),
          Text(
            product.title ?? "What Do You Search For?",
            style: const TextStyle(
              fontSize: 18,
              color: AppColors.blackColor,
            ),
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              const Text("EGP"),
              Text(
                product.price.toString(),
                style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Row(
            children: [
              const Text("Review "),
              Text("(${product.rating.toString()})"),
             const Icon(
                Icons.star,
                color: Colors.yellow, // Use yellow color for gold effect
                size: 24.0, // Set the size of the icon as needed
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: AppColors.primaryBlue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.add,
                  color: AppColors.whiteColor,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
