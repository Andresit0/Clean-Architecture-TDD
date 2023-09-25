# INSTRUCTIONS


## FUNCTIONS
1. Each function needs to start with words `Custom` and finish with the word `Func` (eg: `CustomDialogFunc`).
2. Every function should be `part of config.functions`.
3. Should be access by `CustomFunctions`.
4. Inside `_functions.dart` use all functions as static and use this file to call all functions and its methods.

## VARIABLES
1. Each variable needs to start with word `CustomConst` or `CustomDyn` (eg: `CustomConstThemeApp`).
2. Every function should be `part of config.variables`.
3. Should be access by `CustomVariables`.
4. Inside `_variables.dart` use all variables as static and use this file to call all of them.

## DOMAIN & INFRASTRUCTURE
1. Each class should finish with the name Datasource, Entity, Repository, Model, Mapper, etc., as folders that contains them.
2. Domain should contains abstract classes that are implemented inside the infrastructure.
3. The model is created through the use of services.
4. The entity is created with the variables that will be used from the services.
5. The mappers are used to gives the information at the entity through the model.
6. The repository implementation connects with the presentation layer through controllers created inside the presentation layer.

## PRESENTATION
1. Contains a state manager inside folder `controllers`.
2. Data used for each widget comes from controllers.

## RIVERPOD 2.0
1. Open the terminal to install:
```
flutter pub add \
flutter_riverpod \
riverpod_annotation \
dev:riverpod_generator \
dev:build_runner \
dev:custom_lint \
dev:riverpod_lint
```
2. Keep running: ```dart run build_runner watch```

## TESTING
1. The test folder should contains same folders than lib. 
2. Each test file should has same name concatenate with `_test` word (eg: example_test.dart).
3. Files that works with `import 'package:mockito/mockito.dart';` package could has `@GenerateMocks([class])` or `@GenerateNiceMocks([MockSpec<className>(as: #MockClassName)])` to create mockito files. Furthermore, to create autogenrated mockito files run:

    ```flutter pub run  build_runner build --delete-conflicting-outputs```
    
4. Files that works with `mocktail` needs:

    ```import 'package:mocktail/mocktail.dart'; ```

    ```class MockClassName extends Mock implements MockClassName {}```

5. To run integration test (one by one) edit and run:

Mac:
    ```sh integrationTestRunner.sh```

Linux:
    ```./integrationTestRunner.sh```