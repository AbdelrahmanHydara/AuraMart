import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopx/core/services/bloc_observer_services.dart';
import 'package:shopx/shopx.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/services/get_it_services.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  /// Ensuring Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();
  /// Locking the app orientation to portrait only
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  /// To fix texts being hidden bug in flutter_screenutil in release mode
  await ScreenUtil.ensureScreenSize();
  /// Firebase initialization
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = Settings(
    persistenceEnabled: true,
  );
  /// Bloc observer setup
  Bloc.observer = BlocObserverServices();
  /// GetIt setup
  setupGetIt();
  /// Run the app
  runApp(
    const ShopX(),
  );
}
