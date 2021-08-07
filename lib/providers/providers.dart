import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:taekwondo_app/configs/api.dart';
import 'package:taekwondo_app/models/berita_model.dart';
import 'package:taekwondo_app/models/club_model.dart';
import 'package:taekwondo_app/models/join_club_response.dart';
import 'package:taekwondo_app/models/notification.dart';
import 'package:taekwondo_app/models/user_model.dart';
import 'package:taekwondo_app/services/services.dart';
import 'package:taekwondo_app/ui/screens/screens.dart';
import 'package:taekwondo_app/shared/shared.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:taekwondo_app/utils/widget_helpers.dart';

part 'auth_provider.dart';
part 'join_club_provider.dart';
part 'settings_provider.dart';
part 'news_provider.dart';
part 'notif_provider.dart';
part 'club_provider.dart';
