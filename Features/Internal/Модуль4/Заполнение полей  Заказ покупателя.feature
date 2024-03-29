﻿#language: ru

@tree

Функционал: заполнение полей Заказ покупателя

Как тестировщик я хочу
протестировать заполнение полей Заказа покупателя 
чтобы документ создавался корректно  

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: подготовительный сценарий (заказ покупателя)	
	Когда экспорт основных данных
	
Сценарий: заполнение полей Заказ покупателя	
	* Заполнение поля Партнер
		Дано Я открываю навигационную ссылку "e1cib/list/Document.SalesOrder"
		И я нажимаю на кнопку с именем 'FormCreate'
		И я нажимаю кнопку выбора у поля с именем "Partner"
		И в таблице "List" я перехожу к строке:
				| 'Наименование'               |
				| 'Клиент 1 (1 соглашение)' |
		И в таблице "List" я выбираю текущую строку
		И я нажимаю на кнопку с именем 'FormWrite'		
	* Проверка заполнения соглашения
		Тогда элемент формы с именем "Agreement" стал равен 'Соглашение с клиентами (расчет по документам + кредитный лимит)'
	* Проверка что Соглашение меняется при изменении партнера
		И я нажимаю кнопку выбора у поля с именем "Partner"
		И в таблице "List" я перехожу к строке:
				| 'Наименование'         |
				| 'Розничный покупатель' |
		И в таблице "List" я выбираю текущую строку
		И я нажимаю на кнопку с именем 'FormOK'
		И я нажимаю на кнопку с именем 'FormWrite'
		Тогда элемент формы с именем "Agreement" стал равен 'Розничное'
	* Проверка что Соглашение не заполнено при незаполненном партнере
		И в поле с именем 'Partner' я ввожу текст ''
		И я нажимаю на кнопку с именем 'FormWrite'
	* Проверка недоступности редактирования поля Контрагент	
		Если элемент "LegalName" не доступен для редактирования Тогда
				Тогда элемент формы с именем "LegalName" стал равен ''
		И я закрываю все окна клиентского приложения
			
							
		

