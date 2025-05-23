
#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура Печать(Команда)
	
	КоллекцияПечатныхФорм = УправлениеПечатьюКлиент.НоваяКоллекцияПечатныхФорм("Билет");
	ВыполнитьПечать(КоллекцияПечатныхФорм);
	УправлениеПечатьюКлиент.ПечатьДокументов(КоллекцияПечатныхФорм);
	
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаСервере
Процедура ВыполнитьПечать(КоллекцияПечатныхФорм)
	
	КоллекцияПечатныхФормТаблица = Новый ТаблицаЗначений;
	
	КолонкиТаблицы = УправлениеПечатьюКлиентСервер.ИменаПолейКоллекцииПечатныхФорм();
	Для Каждого ИмяКолонки Из КолонкиТаблицы Цикл
		КоллекцияПечатныхФормТаблица.Колонки.Добавить(ИмяКолонки);
	КонецЦикла;
	
	Для Каждого ПечатнаяФорма Из КоллекцияПечатныхФорм Цикл
		ЗаполнитьЗначенияСвойств(КоллекцияПечатныхФормТаблица.Добавить(), ПечатнаяФорма);
	КонецЦикла;
	
	ОбработкаОбъект = РеквизитФормыВЗначение("Объект");
	ОбработкаОбъект.Печать(ДокументНаПечать, 
		КоллекцияПечатныхФормТаблица,
		Новый СписокЗначений,
		Новый Структура);
		
	КоллекцияПечатныхФорм = ОбщегоНазначения.ТаблицаЗначенийВМассив(КоллекцияПечатныхФормТаблица);
	
КонецПроцедуры

#КонецОбласти

