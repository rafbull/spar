

## Экран карточки товара приложения **"Мой Spar"**

Экран сделан на **UIKit** по архитектуре **MVP** с использованием паттерна **Builder**. Получение данных реализовано через моковую модель, вместо сетевого слоя.
#### Использованный стек:

- UIKit
- MVP
- `UITableViewDiffableDataSource`
- `UICollectionViewDiffableDataSource`
- Min iOS - 14

![[Simulator Screen Recording - iPhone 13 Pro - 2024-02-02 at 19.50.42.mp4]](Screenshots/Simulator Screen Recording - iPhone 13 Pro - 2024-02-02 at 19.50.42.mp4)

![[Simulator Screen Shot - iPhone 13 Pro - 2024-02-02 at 19.49.19.png | 200]](Screenshots/Simulator Screen Shot - iPhone 13 Pro - 2024-02-02 at 19.49.19.png)

![[Simulator Screen Shot - iPhone 13 Pro - 2024-02-02 at 19.49.50.png | 200]](Screenshots/Simulator Screen Shot - iPhone 13 Pro - 2024-02-02 at 19.49.50.png)

![[Simulator Screen Shot - iPhone 13 Pro - 2024-02-02 at 19.49.59.png | 200]](Screenshots/Simulator Screen Shot - iPhone 13 Pro - 2024-02-02 at 19.49.59.png)

#### Что можно было бы улучшить (Тех. долг):
- Разбить  таблицу на несколько ячеек, а не на одну массивную `ItemTableViewCell`
- Можно было весь экран сделать с помощью `UICollectionView` и `UICollectionViewCompositionalLayout`, но я решил показать навык работы с `UITableView` и `UICollectionView`. 
- Продумать более лаконичный способ прокидывания данных в `BottomView`. Т.е. не прокидывать всю модель. 
- Сделать более гибкую настойку кастомной `MeasurementUnitsView` (₽/кг)
