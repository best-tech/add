﻿//начало текста модуля

///////////////////////////////////////////////////
//Служебная часть
///////////////////////////////////////////////////


// контекст фреймворка Vanessa-Behavior
Перем Ванесса;

// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯВызвалОбычныйШагСценария()","ЯВызвалОбычныйШагСценария","Когда я вызвал обычный шаг сценария");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВКонтекстеЕстьЗначение(Парам01)","ВКонтекстеЕстьЗначение","Тогда в Контексте есть значение ""БылВызванСценарийИзСоседнейФичи""");

	Возврат ВсеТесты;
КонецФункции
	

// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ПолучитьМакет(ИмяМакета);
КонецФункции
	

// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////


// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры


// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	//чтобы сценарий падал на этапе разработки
	Ванесса.ПроверитьРавенство(Контекст.Свойство("БылВызванСценарийИзСоседнейФичи"),Истина,"Ожидали, что в Контекст есть свойство БылВызванСценарийИзСоседнейФичи");
КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////


//Когда я вызвал обычный шаг сценария
//@ЯВызвалОбычныйШагСценария()
Процедура ЯВызвалОбычныйШагСценария() Экспорт
	//ВызватьИсключение "Не реализовано.";
КонецПроцедуры



//Тогда в Контексте есть значение "БылВызванСценарийИзСоседнейФичи"
//@ВКонтекстеЕстьЗначение(Парам01)
Процедура ВКонтекстеЕстьЗначение(ИмяПараметра) Экспорт
	Ванесса.ПроверитьРавенство(Контекст.Свойство(ИмяПараметра),Истина,"Ожидали, что в Контекст есть свойство " + ИмяПараметра);
КонецПроцедуры

//окончание текста модуля  