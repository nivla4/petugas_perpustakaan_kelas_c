import 'package:get/get.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petugas_perpustakaan_kelas_c/app/data/constant/endpoint.dart';
import 'package:petugas_perpustakaan_kelas_c/app/data/provider/api_provider.dart';
import 'package:petugas_perpustakaan_kelas_c/app/data/provider/storage_provider.dart';
import 'package:dio/dio.dart' as dio;

import '../../../routes/app_pages.dart';

class AddBookController extends GetxController {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController judulController = TextEditingController();
  final TextEditingController penulisController = TextEditingController();
  final TextEditingController penerbitController = TextEditingController();
  final TextEditingController tahunController = TextEditingController();
  final loading = false.obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  add() async {loading(true);
  try{
    FocusScope.of(Get.context!).unfocus();
    formkey.currentState?.save();
    if (formkey.currentState!.validate()) {
      final response = await ApiProvider.instance().post(Endpoint.book,
          data: dio.FormData.fromMap(
              {"Judul": judulController.text.toString(),
                "Penulis": penulisController.text.toString(),
                "Penerbit": penerbitController.text.toString(),
                "Tahun Terbit": tahunController.text.toString()}));
      if (response.statusCode == 201) {
        await StorageProvider.write(StorageKey.status, "logged");
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.snackbar("Sorry", "Login Gagal", backgroundColor: Colors.orange);
      }
    }loading(false);
  }on dio.DioException catch (e) {loading(false);
  if (e.response != null) {
    if (e.response?.data != null){
      Get.snackbar("Sorry", "${e.response?.data['message']}", backgroundColor: Colors.orange);
    }
  }else {
    Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
  }
  } catch (e) {loading(false);
  Get.snackbar("Error0", e.toString(), backgroundColor: Colors.red);
  }
  }
  void increment() => count.value++;
}
