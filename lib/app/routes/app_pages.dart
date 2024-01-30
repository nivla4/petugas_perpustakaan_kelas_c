import 'package:get/get.dart';

import '../modules/Book/bindings/book_binding.dart';
import '../modules/Book/views/book_view.dart';
import '../modules/Login/bindings/login_binding.dart';
import '../modules/Login/views/login_view.dart';
import '../modules/Peminjaman/bindings/peminjaman_binding.dart';
import '../modules/Peminjaman/views/peminjaman_view.dart';
import '../modules/add_book/bindings/add_book_binding.dart';
import '../modules/add_book/views/add_book_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.BOOK,
      page: () => const BookView(),
      binding: BookBinding(),
    ),
    GetPage(
      name: _Paths.ADD_BOOK,
      page: () => const AddBookView(),
      binding: AddBookBinding(),
    ),
    GetPage(
      name: _Paths.PEMINJAMAN,
      page: () => const PeminjamanView(),
      binding: PeminjamanBinding(),
    ),
  ];
}
