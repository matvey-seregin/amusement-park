
#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда


#Область СлужебныйПрограммныйИнтерфейс

// Параметры:
//   Настройки - см. ВариантыОтчетовПереопределяемый.НастроитьВариантыОтчетов.Настройки.
//   НастройкиОтчета - см. ВариантыОтчетов.ОписаниеОтчета.
//
Процедура НастроитьВариантыОтчета(Настройки, НастройкиОтчета) Экспорт
    
    НастройкиВарианта = 
    	ВариантыОтчетов.ОписаниеВарианта(Настройки, Метаданные.Отчеты.ДетализацияПосещений, "ДетализацияПосещений");
    НастройкиВарианта.Описание = НСтр(
    	"ru = 'Детальный список посещений аттракционов посетителями. 
    	|Аналог формы списка документа.'");
    НастройкиВарианта.Размещение.Вставить(ВариантыОтчетовКлиентСервер.ИдентификаторНачальнойСтраницы());
    
КонецПроцедуры

#КонецОбласти



#КонецЕсли
