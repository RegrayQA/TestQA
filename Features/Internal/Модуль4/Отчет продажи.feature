﻿#language: ru

@tree

Функционал: отображение возвратов в отчете D2001 Продажи

Как тестировщик я хочу
проверить отображение возвратов в отчете Продажи 
чтобы убедиться что отчет формируется корректно   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: подготовка данных
	Когда экспорт основных данных 
	Когда загрузка документов

	И я выполняю код встроенного языка на сервере
		"""bsl
			Документы.SalesOrder.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
			Документы.SalesOrder.НайтиПоНомеру(2).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
			Документы.SalesOrder.НайтиПоНомеру(3).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
			Документы.SalesReturn.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
			Документы.SalesInvoice.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
			Документы.SalesInvoice.НайтиПоНомеру(2).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
			Документы.SalesInvoice.НайтиПоНомеру(3).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
			Документы.RetailReturnReceipt.НайтиПоНомеру(1).ПолучитьОбъект().Записать(РежимЗаписиДокумента.Проведение);
		"""
		
	Сценарий: отображение возвратов в отчете Продажи

	* Формирование отчета D2001 Продажи	
		И В командном интерфейсе я выбираю 'Отчеты' 'D2001 Продажи'
		И я нажимаю на кнопку с именем 'FormChangeVariant'
		И в таблице "SettingsComposerSettings" я перехожу к строке:
			| 'Использование' | 'Структура отчета' |
			| 'Да'            | 'Характеристика'   |
		И я перехожу к закладке с именем "GroupFieldsSettings"
		И я перехожу к закладке с именем "SelectedFieldsSettingsOff"
		И я перехожу к закладке с именем "FilterSettingsOff"
		И я перехожу к закладке с именем "OrderSettingsOff"
		И я перехожу к закладке с именем "ConditionalAppearanceSettingsOff"
		И я перехожу к закладке с именем "OutputParametersSettingsOff"
		И в таблице "SettingsComposerSettings" я нажимаю на кнопку с именем 'SettingsComposerSettingsContextMenuAddGroup'
		И я нажимаю кнопку выбора у поля с именем "Field"
		И в таблице "Source" я перехожу к строке:
			| 'Доступные поля' |
			| 'Регистратор'    |
		И в таблице "Source" я выбираю текущую строку
		И я нажимаю на кнопку с именем 'OK'
		И я нажимаю на кнопку с именем 'FormEndEdit'
		И я нажимаю на кнопку с именем 'FormGenerate'
		Дано Табличный документ "Result" равен макету "МакетПродажи" по шаблону		
		И в табличном документе 'Result' я перехожу к ячейке "R20C1"
		И в табличном документе 'Result' я перехожу к ячейке "R23C1"
		И в табличном документе 'Result' я перехожу к ячейке "R30C1"
		И я закрываю все окна клиентского приложения
		
				
		
						