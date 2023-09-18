library presentation.screens;

import 'dart:async';

import 'package:clean_architecture/config/functions/_functions.lib.dart';
import 'package:clean_architecture/presentation/controllers/criptocurrencies_riverpod_2.0/criptocurrencies_loading_riverpod2.0.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart' as localization;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../../config/variables/_variable.lib.dart';
import '../../domain/entities/_entities.lib.dart';
import '../controllers/criptocurrencies_riverpod/_criptocurrencies_riverpod.lib.dart';
import '../controllers/criptocurrencies_riverpod_2.0/criptocurrencies_riverpod2.0.dart';
import 'pages/criptocurrencies_bloc.dart';

part 'pages/criptocurrencies_riverpod.dart';
part 'pages/criptocurrencies_riverpod_2.0.dart';
part 'pages/home.dart';
part 'views/criptocurrencies.dart';
part 'widgets/dialog.dart';
part 'widgets/internet/dialog.dart';
part 'widgets/label.dart';
part 'widgets/table.dart';
