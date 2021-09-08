import 'dart:async';

import 'package:dio/dio.dart' as dio;
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:taekwondo_app/configs/api.dart';
import 'package:taekwondo_app/models/atlet.dart';
import 'package:taekwondo_app/models/notification.dart';
import 'package:taekwondo_app/providers/providers.dart';
import 'package:taekwondo_app/shared/shared.dart';
import 'package:taekwondo_app/ui/components/rounded_date_input.dart';
import 'package:taekwondo_app/ui/components/rounded_input_field.dart';
import 'package:taekwondo_app/ui/screens/screens.dart';
import 'package:taekwondo_app/utils/commons.dart';
import 'package:get/get.dart';
import 'package:taekwondo_app/utils/widget_helpers.dart';

part 'notification_item.dart';
part 'map.dart';
part 'record_list.dart';
