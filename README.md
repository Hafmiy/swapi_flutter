# SWAPI Flutter
## Приложения для работы с REST на примере https://swapi.dev/

Приложение представляет собой двухстраничное приложение. Первая страница поиск по трём сущностям: люди, планеты и корабли. Есть возможность добавления каждой в избранное с последующим кешированием. Вторая странца это список избранных сущностей со списком фильмов в которых они появлялись.

## Требования
- Flutter 3.10.6
- Dart 3.0.6
- 64x битный эмулятор или устройство

## Сборка

```sh
git clone https://github.com/Hafmiy/swapi_flutter.git
cd swapi_flutter
flutter pub get
flutter pub run build_runner build
flutter gen-l10n
```