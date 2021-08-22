import 'dart:async';
import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:taekwondo_app/configs/api.dart';
import 'package:taekwondo_app/models/applications.dart';
import 'package:taekwondo_app/models/atlet.dart';
import 'package:taekwondo_app/models/berita_model.dart';
import 'package:taekwondo_app/models/club.dart';
import 'package:taekwondo_app/models/club_model.dart';
import 'package:taekwondo_app/models/user_model.dart';
import 'package:taekwondo_app/providers/providers.dart';
import 'package:taekwondo_app/ui/components/kelas_dropdown.dart';
import 'package:taekwondo_app/ui/components/my_shimmer.dart';
import 'package:taekwondo_app/ui/components/rounded_date_input.dart';
import 'package:taekwondo_app/ui/components/rounded_dropdown_input.dart';
import 'package:taekwondo_app/ui/components/rounded_input_field.dart';
import 'package:taekwondo_app/ui/components/rounded_password_field.dart';
import 'package:taekwondo_app/ui/components/text_field_container.dart';
import 'package:taekwondo_app/ui/widgets/widgets.dart';
import 'package:taekwondo_app/utils/commons.dart';
import 'package:taekwondo_app/utils/widget_helpers.dart';
import '../components/gradient_rounded_button.dart';
import '../components/kategori_dropdown.dart';
import 'package:taekwondo_app/shared/shared.dart';
import 'package:get/get.dart';

part 'home_screen.dart';
part 'splash_screen.dart';
part 'start_screen.dart';
part 'login_screen.dart';
part 'register_screen.dart';
part 'general_screen.dart';
part 'news_list_screen.dart';
part 'news_detail_screen.dart';
part 'profile_screen.dart';
part 'profile_edit_screen.dart';
part 'klub_screen.dart';
part 'user_detail_screen.dart';
part 'klub_edit_screen.dart';
part 'notifications_screen.dart';
part 'join_club_screen.dart';
part 'atlet_edit_screen.dart';
