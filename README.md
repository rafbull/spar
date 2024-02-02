

## Экран карточки товара приложения **"Мой Spar"**

Экран сделан на **UIKit** по архитектуре **MVP** с использованием паттерна **Builder**. Получение данных реализовано через моковую модель, вместо сетевого слоя.
#### Использованный стек:

- UIKit
- MVP
- `UITableViewDiffableDataSource`
- `UICollectionViewDiffableDataSource`
- Min iOS - 14

https://github.com/rafbull/test/assets/148709354/455c8f4e-cbb6-4370-bb3d-d4c34c2662d0

---

| ![SimulatorScreenShot_iPhone13Pro_01](https://github.com/rafbull/spar/assets/148709354/a28ee9ff-c835-48d3-b744-fd5383ddb2b4) | ![SimulatorScreenShot_iPhone13Pro_02](https://github.com/rafbull/spar/assets/148709354/4429d64a-5b3c-4b07-854a-f7d038f6f5dd) |
| --- | --- |
| ![SimulatorScreenShot_iPhone13Pro_03](https://github.com/rafbull/spar/assets/148709354/7aa116eb-9d2d-418c-9b9b-89f625876a1f) |  |

---

#### Что можно было бы улучшить (Тех. долг):
- Разбить  таблицу на несколько ячеек, а не на одну массивную `ItemTableViewCell`
- Можно было весь экран сделать с помощью `UICollectionView` и `UICollectionViewCompositionalLayout`, но я решил показать навык работы с `UITableView` и `UICollectionView`. 
- Продумать более лаконичный способ прокидывания данных в `BottomView`. Т.е. не прокидывать всю модель. 
- Сделать более гибкую настройку кастомной `MeasurementUnitsView` (₽/кг)
