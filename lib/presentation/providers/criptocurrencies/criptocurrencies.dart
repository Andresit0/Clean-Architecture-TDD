library presentation.providers.criptocurrencies;

import 'package:clean_architecture/domain/entities/criptocurrency_entity.dart';
import 'package:clean_architecture/infrastructure/datasources/criptocurrency_datasource_imp.dart';
import 'package:clean_architecture/infrastructure/repositories/criptocurrency_repository_imp.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../config/variables/variable.lib.dart';

part 'criptocurrencies_callback.dart';
part 'criptocurrencies_provider_notifier.dart';
part 'criptocurrencies_provider.dart';
part 'criptocurrencies_repository_provider.dart';
