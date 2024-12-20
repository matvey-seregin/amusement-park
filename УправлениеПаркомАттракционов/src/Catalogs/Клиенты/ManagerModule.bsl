
#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область СлужебныйПрограммныйИнтерфейс

Процедура ПеренестиТелефонВКонтактнуюИнформацию(ПараметрыОбработки) Экспорт
	
	ПараметрыОбработки.ОбработкаЗавершена = Ложь;
	
	ВидКИТелефонКлиента = УправлениеКонтактнойИнформацией.ВидКонтактнойИнформацииПоИмени("ТелефонКлиента");
	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ ПЕРВЫЕ 50
		|	Клиенты.Ссылка
		|ИЗ
		|	Справочник.Клиенты КАК Клиенты
		|		ЛЕВОЕ СОЕДИНЕНИЕ Справочник.Клиенты.КонтактнаяИнформация КАК КлиентыКонтактнаяИнформация
		|		ПО Клиенты.Ссылка = КлиентыКонтактнаяИнформация.Ссылка
		|		И КлиентыКонтактнаяИнформация.Вид = &ВидКИТелефонКлиента
		|ГДЕ
		|	Клиенты.НормализованныйТелефон <> """"
		|	И КлиентыКонтактнаяИнформация.Ссылка ЕСТЬ NULL";
		
	Запрос.УстановитьПараметр("ВидКИТелефонКлиента", ВидКИТелефонКлиента);
		
	РезультатЗапроса = Запрос.Выполнить();
	
	Если РезультатЗапроса.Пустой() Тогда
		ПараметрыОбработки.ОбработкаЗавершена = Истина;
		Возврат;
	КонецЕсли;
		
	Выборка = РезультатЗапроса.Выбрать();
	
	Пока Выборка.Следующий() Цикл
		
		СпрОбъект = Выборка.Ссылка.ПолучитьОбъект();
		
		КонтактнаяИнформация = УправлениеКонтактнойИнформацией.НоваяКонтактнаяИнформация();
		НоваяСтрока = КонтактнаяИнформация.Добавить();
		НоваяСтрока.Вид = ВидКИТелефонКлиента;
		НоваяСтрока.Представление = СпрОбъект.НормализованныйТелефон;
		НоваяСтрока.Объект = СпрОбъект;
		
		УправлениеКонтактнойИнформацией.УстановитьКонтактнуюИнформациюОбъекта(СпрОбъект, КонтактнаяИнформация, Ложь);
		
		ОбновлениеИнформационнойБазы.ЗаписатьОбъект(СпрОбъект);				
		
	КонецЦикла;
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции



#КонецОбласти

#КонецЕсли