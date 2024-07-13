import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_task/data/models/ProductDM.dart';
import 'package:route_task/domain/di/di.dart';
import 'package:route_task/domain/usecases/get_all_product_use_case.dart';
import 'package:route_task/ui/screens/home/home_view_model.dart';
import 'package:route_task/ui/utils/app_assets.dart';
import 'package:route_task/ui/utils/app_colors.dart';
import 'package:route_task/ui/widget/error_view.dart';
import 'package:route_task/ui/widget/loading_widget.dart';
import 'package:route_task/ui/widget/product.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = getIt<HomeViewModel>();
    viewModel.loadAllAssessment();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.only(left: 10,right: 10,top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Image(image: AssetImage(AppAssets.route)),
            const SizedBox(height: 13,),
            Row(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.06,
                  width: MediaQuery.of(context).size.width*0.86,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(
                        color: AppColors.primaryBlue), // Add border color here
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search,color: AppColors.primaryBlue,),
                      SizedBox(width: 10),
                      Text(
                        "What Do You Search For?",
                        style: TextStyle(
                           // fontFamily: 'Futura',
                            fontSize: 18,
                            color: AppColors.lightGrey
                        ),
                      ),
                    ],
                  ),
                ),
               const Spacer(),
                const Image(image: AssetImage(AppAssets.shopping))
              ],
            ),
            Expanded(
                child: BlocBuilder(
                  bloc: viewModel.getAllProductUseCase,
                  builder: (context, state) {
                    if (state is GetAllProductSuccess<List<Products>>) {
                      // Use ListView.builder to create a scrollable list
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of items per row
                          childAspectRatio: 0.7, // Aspect ratio of each item
                          crossAxisSpacing: 10, // Horizontal spacing between items
                          mainAxisSpacing: 10, // Vertical spacing between items
                        ),
                        itemBuilder: (context, index) {
                          return  Product(state.data![index]);
                        },
                        itemCount: state.data!.length, // Total number of items
                      );

                    } else if (state is GetAllProductFailure) {
                      return ErrorView(message: state.error);
                    } else {
                      return const LoadingWidget();
                    }
                  },
                )),

          ],
        ),
      ),
    );
  }
}
