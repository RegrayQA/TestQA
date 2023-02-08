﻿#language: ru

Функционал: <Создание документа Заказ>

Как менеджер по закупкам я хочу
создание документа Заказ
чтобы оформить продажу 

Дано Я открыл новый сеанс TestClient или подключил уже существующий

Сценарий: Создание документа Заказ

* Открытие формы создания документа
	И я закрываю все окна клиентского приложения
	И В командном интерфейсе я выбираю 'Продажи' 'Заказы'
	Тогда открылось окно 'Заказы товаров'
	И я нажимаю на кнопку с именем 'ФормаСоздать'
	Тогда открылось окно 'Заказ (создание)'
* Заполнение шапки документа
	И из выпадающего списка с именем "Организация" я выбираю точное значение 'ООО "1000 мелочей"'
	И я нажимаю кнопку выбора у поля с именем "Покупатель"
	Тогда открылось окно 'Контрагенты'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	Тогда открылось окно 'Заказ (создание) *'
	И из выпадающего списка с именем "Склад" я выбираю точное значение 'Склад отдела продаж'
* Заполнение табличной части
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаСписок'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000031' | 'Босоножки'    |
	И в таблице "Список" я выбираю текущую строку
	И я нажимаю на кнопку с именем "ФормаЗаписать"
* Проверка заполнения табличной части
	Тогда таблица "Товары" стала равной:
		| 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'    |
		| 'Босоножки' | '1 800,00' | '1'          | '1 800,00' |

Сценарий:  Проверка расчета суммы документа Заказ при изменении количества и цены 

* Изменение количества в табличной части		
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2'
	И в таблице "Товары" я завершаю редактирование строки
	И я нажимаю на кнопку с именем "ФормаЗаписать"
* Проверка заполнения табличной части				
	Тогда таблица "Товары" стала равной:
		| 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'    |
		| 'Босоножки' | '1 800,00' | '2'          | '3 600,00' |
	И элемент формы 'Сумма (итог)' стал равен '3 600'
* Изменение цены в табличной части	
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" я выбираю текущую строку
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '1 000,00'
	И в таблице "Товары" я завершаю редактирование строки
	И я нажимаю на кнопку с именем "ФормаЗаписать"
* Проверка расчета Суммы 
	И я запоминаю значение поля "Цена" таблицы "Товары" как "$Цена1$"
	И я запоминаю значение поля "Количество" таблицы "Товары" как "$Количество1$"
	И я запоминаю значение выражения '$Цена1$*$Количество1$' в переменную "$Сумма1$"
	И я запоминаю значение поля с именем 'ТоварыИтогСумма' как '$ТоварыИтогСумма1$'
* Проверка заполнения табличной части
	Тогда таблица "Товары" стала равной:
		| 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'    |
		| 'Босоножки' | '1 000,00' | '2'          | '2 000,00' |
	И элемент формы 'Сумма (итог)' стал равен '2 000'
* Добавление нового товара в табличную часть
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000020' | 'Валенки'      |
	И в таблице "Список" я выбираю текущую строку
	И в таблице "Товары" я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
* Проверка изменения таблицы после добавления нового товара
	Тогда таблица "Товары" стала равной:
		| 'Товар'     | 'Цена'     | 'Количество' | 'Сумма'    |
		| 'Босоножки' | '1 000,00' | '2'          | '2 000,00' |
		| 'Валенки'   | '1 800,00' | '1'          | '1 800,00' |	
	И элемент формы 'Сумма (итог)' стал равен '3 800'
* Добавление услуги в табличную часть
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И я нажимаю на кнопку с именем 'ФормаДерево'
	И в таблице "Список" я разворачиваю строку:
		| 'Код'       | 'Наименование' |
		| '000000036' | 'Услуги'       |
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000037' | 'Доставка'     |
	И я нажимаю на кнопку с именем 'ФормаВыбрать'
	И в таблице "Товары" я завершаю редактирование строки
	И я нажимаю на кнопку с именем 'ФормаЗаписать'

Сценарий:   При добавлении Услуги в документ Заказ в поле Количество можно ввести значение 

* Проверка что в поле Количество можно ввести значение 
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '3'
	И я нажимаю на кнопку с именем 'ФормаЗаписать'
		
			
		
							