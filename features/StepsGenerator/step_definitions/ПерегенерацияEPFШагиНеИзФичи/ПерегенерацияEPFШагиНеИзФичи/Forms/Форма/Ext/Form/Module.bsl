﻿//начало текста модуля
&НаКлиенте
Перем Ванесса;
 
&НаКлиенте
Перем Контекст Экспорт;
 
&НаКлиенте
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ОжидаемыйФайлФичаДляПерегенерацияEPFШагиНеИзФичиУжеСуществует()","ОжидаемыйФайлФичаДляПерегенерацияEPFШагиНеИзФичиУжеСуществует","И ожидаемый файл ФичаДляПерегенерацияEPFШагиНеИзФичи уже существует");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"СгенерированныйEpfПрошелПроверкуНаКорректностьПослеПерегенерацииЧтоВНёмОсталисьШагиНеИзФичи()","СгенерированныйEpfПрошелПроверкуНаКорректностьПослеПерегенерацииЧтоВНёмОсталисьШагиНеИзФичи","И сгенерированный epf прошел проверку на корректность после перегенерации, что в нём остались шаги не из фичи");

	Возврат ВсеТесты;
КонецФункции

&НаКлиенте
Процедура ПередНачаломСценария() Экспорт
	ИмяОжидаемогоФайла = Ванесса.Объект.КаталогИнструментов + "\features\Support\Templates\step_definitions\ФичаДляПерегенерацияEPFШагиНеИзФичи.epf";
	Контекст.Вставить("ИмяОжидаемогоФайла",ИмяОжидаемогоФайла);
	ФайлПроверкаСуществования = Новый Файл(ИмяОжидаемогоФайла);
	Если Ванесса.ФайлСуществуетКомандаСистемы(ИмяОжидаемогоФайла) Тогда
		Ванесса.УдалитьФайлыКомандаСистемы(ИмяОжидаемогоФайла);
	КонецЕсли;	 
	
КонецПроцедуры

&НаКлиенте
Процедура ПередОкончаниемСценария() Экспорт
	ИмяОжидаемогоФайла = Контекст.ИмяОжидаемогоФайла;
	ФайлПроверкаСуществования = Новый Файл(ИмяОжидаемогоФайла);
	Если Ванесса.ФайлСуществуетКомандаСистемы(ИмяОжидаемогоФайла) Тогда
		Ванесса.УдалитьФайлыКомандаСистемы(ИмяОжидаемогоФайла);
	КонецЕсли;	 
	
	//безусловное закрытие формы если она осталась
	Попытка
	    ОткрытаяФормаVanessaBehavoir = Контекст.ОткрытаяФормаVanessaBehavoir;
		ОткрытаяФормаVanessaBehavoir.Закрыть();
	Исключение
	
	КонецПопытки;
КонецПроцедуры

&НаСервере
Функция ПолучитьМакетСервер(Имямакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(Имямакета);
КонецФункции	


//И ожидаемый файл ФичаДляПерегенерацияEPFШагиНеИзФичи уже существует
//@ОжидаемыйФайлФичаДляПерегенерацияEPFШагиНеИзФичиУжеСуществует()
&НаКлиенте
Процедура ОжидаемыйФайлФичаДляПерегенерацияEPFШагиНеИзФичиУжеСуществует() Экспорт
	ИмяОжидаемогоФайла = Контекст.ИмяОжидаемогоФайла;
	ФайлСуществует = Ванесса.ФайлСуществуетКомандаСистемы(ИмяОжидаемогоФайла);
	
	Если ФайлСуществует Тогда
		УдалитьФайлы(ИмяОжидаемогоФайла);
	КонецЕсли;	 
	
	ФайлСуществует = Ванесса.ФайлСуществуетКомандаСистемы(ИмяОжидаемогоФайла);
	
	Ванесса.ПроверитьНеРавенство(ФайлСуществует,Истина,"В этот момент Файл " + ИмяОжидаемогоФайла + " НЕ должен существовать.");
	
	
	Макет = ПолучитьМакетСервер("Макет");
	Макет.Записать(ИмяОжидаемогоФайла);
	
	ФайлСуществует = Ванесса.ФайлСуществуетКомандаСистемы(ИмяОжидаемогоФайла);
	Ванесса.ПроверитьРавенство(ФайлСуществует,Истина,"Файл " + ИмяОжидаемогоФайла + " должен существовать.");
КонецПроцедуры


//И сгенерированный epf прошел проверку на корректность после перегенерации, что в нём остались шаги не из фичи
//@СгенерированныйEpfПрошелПроверкуНаКорректностьПослеПерегенерацииЧтоВНёмОсталисьШагиНеИзФичи()
&НаКлиенте
Процедура СгенерированныйEpfПрошелПроверкуНаКорректностьПослеПерегенерацииЧтоВНёмОсталисьШагиНеИзФичи() Экспорт
	ИмяОжидаемогоФайла = Контекст.ИмяОжидаемогоФайла;
	ИмяОбработки       = Ванесса.ПодключитьВнешнююОбработкуКлиент(ИмяОжидаемогоФайла);
	ФормаОбработки     = ПолучитьФорму("ВнешняяОбработка." + ИмяОбработки + ".Форма.Форма",,,Истина);
	
	ЭкспортируемыеШаги = ФормаОбработки.ПолучитьСписокТестов(Ванесса);
	
	Нашли = Ложь;
	Для каждого Элем Из ЭкспортируемыеШаги Цикл
		Если НРег(Элем.Снипет) = НРег("ТестовыйШаг()") Тогда
			Нашли = Истина;
		КонецЕсли;	 
	КонецЦикла;
	
	Если Не Нашли Тогда
		ВызватьИсключение "Не найден шаг ТестовыйШаг после перегенерации EPF";
	КонецЕсли;	 
КонецПроцедуры

//окончание текста модуля