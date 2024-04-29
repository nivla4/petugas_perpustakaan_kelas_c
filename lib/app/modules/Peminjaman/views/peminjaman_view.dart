import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:petugas_perpustakaan_kelas_c/app/data/model/response_pinjam.dart';

import '../../../routes/app_pages.dart';
import '../controllers/peminjaman_controller.dart';

class PeminjamanView extends GetView<PeminjamanController> {
  const PeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peminjaman View'),
        centerTitle: true,
      ),
        body: controller.obx((state) => ListView.separated(
          itemCount: state!.length,
          itemBuilder: (context, index){
            DataPinjam dataPinjam = state[index];
            return ListTile(
              title: Text("${dataPinjam.book?.judul}"),
              subtitle: Text("Tanggal Pinjam : ${dataPinjam.tanggalPinjam}\n Tanggal Pinjam : ${dataPinjam.tanggalKembali}\n Status : ${dataPinjam.status}"),
            );
          },
          separatorBuilder: (context, index)=> Divider(),
        ))
    );
  }
}
