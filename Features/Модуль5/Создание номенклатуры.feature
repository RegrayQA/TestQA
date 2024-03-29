﻿#language: ru

@tree

Функционал: Создание элементов в справочнике Номенклатура

Как тестировщик я хочу
массово создать объекты в справочнике Номенклатура 
чтобы протестировать функционал  

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: создание элементов в справочнике Номенклатура

	И В командном интерфейсе я выбираю 'Справочники' 'Номенклатура'
	И Я запоминаю значение выражения '1' в переменную "Шаг"
	И я делаю 10 раз
		И Я запоминаю значение выражения '$Шаг$+1' в переменную "Шаг"
		И Я запоминаю значение выражения '"Товар"+$Шаг$' в переменную "Товар"
		И я проверяю или создаю для справочника "Items" объекты:
		| 'Ref'                                                               | 'DeletionMark' | 'Code' | 'ItemType'                                                          | 'Unit'                                                          | 'MainPricture' | 'Vendor' | 'ItemID' | 'PackageUnit' | 'Description_en' | 'Description_hash' | 'Description_ru' | 'Description_tr' | 'Height' | 'Length' | 'Volume' | 'Weight' | 'Width' |
		| '{"e1cib/data/Catalog.Items?ref=" + StrReplace(New UUID, "-", "")}' | 'False'        |        | 'e1cib/data/Catalog.ItemTypes?ref=b762b13668d0905011eb76684b9f6878' | 'e1cib/data/Catalog.Units?ref=2a868d687c2b41ff80c1030ac0c779b2' | ''             | ''       | ''       | ''            | '$Товар$'          | ''                 | ''               | ''               |          |          |          | 0.21     |         |


				