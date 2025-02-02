// @strict-types

#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ОбработчикиСобытий

Процедура ПередЗаписью(Отказ)
	
	Если ОбменДанными.Загрузка Тогда
		Возврат;
	КонецЕсли;
	
	НомерТелефонаКИ = "";
	ВидКИ = УправлениеКонтактнойИнформацией.ВидКонтактнойИнформацииПоИмени("ТелефонКлиента");
	
	Для Каждого Строка Из КонтактнаяИнформация Цикл
		Если Строка.Вид = ВидКИ Тогда
			НомерТелефонаКИ = Строка.Представление;
		КонецЕсли;
	КонецЦикла;
	
	НормализованныйТелефон = НомераТелефоновКлиентСервер.НормализованныйНомерТелефона(НомерТелефонаКИ, Истина);
	
КонецПроцедуры

#КонецОбласти

#КонецЕсли
