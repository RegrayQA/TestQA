﻿#language: ru

@tree

Функционал: Условие на заполнение поля Организация в заказе кдиента

Как тестировщик я хочу
проверить условие заполнения поля Организация в заказе кдиента 
чтобы протестировать функцтионал   

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: условие на заполнение поля Организация в заказе кдиента
	И я закрываю все окна клиентского приложения	
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы покупателей'
	И я нажимаю на кнопку с именем 'FormCreate'
	И я нажимаю кнопку выбора у поля с именем "Partner"
	И в таблице "List" я перехожу к строке:
			| 'Код' | 'Наименование'            |
			| '2'   | 'Клиент 2 (2 соглашения)' |
	И в таблице "List" я выбираю текущую строку
	И в таблице "ItemList" я активизирую поле с именем "ItemListLineNumber"
	Тогда элемент формы с именем "Agreement" стал равен ''
	Если поле с именем "Company" заполнено тогда
		И я запоминаю значение поля с именем 'Company' как 'Организация'
	Иначе	
		И я нажимаю кнопку выбора у поля с именем "Agreement"	
		И в таблице "List" я активизирую поле с именем "Description"
		И в таблице "List" я перехожу к строке:
		| 'Код' | 'Наименование'                                        |
		| '2'   | 'Индивидуальное соглашение 1 (расчет по соглашениям)' |		
		И в таблице "List" я выбираю текущую строку
		И в таблице "ItemList" я активизирую поле с именем "ItemListLineNumber"
	Тогда элемент формы с именем "Company" стал равен 'Собственная компания 1'
		