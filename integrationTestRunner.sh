#!/bin/sh

flutter drive --driver=integration_test.dart --target=integration_test/bloc_test.dart -d macos
flutter drive --driver=integration_test.dart --target=integration_test/cubit_test.dart -d macos
flutter drive --driver=integration_test.dart --target=integration_test/riverpod_test.dart -d macos
flutter drive --driver=integration_test.dart --target=integration_test/riverpod_2.0_test.dart -d macos
flutter drive --driver=integration_test.dart --target=integration_test/provider_test.dart -d macos
flutter drive --driver=integration_test.dart --target=integration_test/stream_test.dart -d macos