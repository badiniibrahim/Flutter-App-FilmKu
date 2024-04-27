import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie/app/modules/details/widgets/movie_detail_item.dart';
import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController> {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.getMovieDetail(int.parse(Get.parameters["movieId"] ?? ""));
    return PopScope(
      canPop: true,
      child: Scaffold(
        body: Obx(() => _buildDetailBody(context)),
      ),
    );
  }

  Widget _buildDetailBody(BuildContext context) {
    return controller.state.isLoading
        ? Center(
            child: Platform.isAndroid
                ? const CircularProgressIndicator()
                : const CupertinoActivityIndicator(),
          )
        : MovieDetailItem(
            controller: controller,
          );
  }
}
