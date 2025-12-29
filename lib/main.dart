import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopx/core/services/bloc_observer_services.dart';
import 'package:shopx/shopx.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/services/get_it_services.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseFirestore.instance.settings = Settings(
    persistenceEnabled: true,
  );
  Bloc.observer = BlocObserverServices();
  setupGetIt();
  runApp(
    const ShopX(),
  );
}
