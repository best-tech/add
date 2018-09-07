﻿//начало текста модуля

///////////////////////////////////////////////////
//Служебная часть
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯВыпоняюШагСПараметеромКогдаКавычкиИдутРаньшеАпострофов(Парам01,Парам02)","ЯВыпоняюШагСПараметеромКогдаКавычкиИдутРаньшеАпострофов","Когда я выпоняю шаг с параметером когда кавычки ""кавычки"" идут раньше апострофов 'апострофы'");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВПеременнойКонтекстБудетЗначение(Парам01,Парам02)","ВПеременнойКонтекстБудетЗначение","Тогда в переменной контекст будет значение ""Знач1"" ""кавычки""");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯВыпоняюШагСПараметеромКогдаАпострофыИдутРаньшеКавычек(Парам01,Парам02)","ЯВыпоняюШагСПараметеромКогдаАпострофыИдутРаньшеКавычек","Когда я выпоняю шаг с параметером когда апострофы 'апострофы' идут раньше кавычек ""кавычки""");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//Когда я выпоняю шаг с параметером когда кавычки "кавычки" идут раньше апострофов 'апострофы'
//@ЯВыпоняюШагСПараметеромКогдаКавычкиИдутРаньшеАпострофов(Парам01,Парам02)
Процедура ЯВыпоняюШагСПараметеромКогдаКавычкиИдутРаньшеАпострофов(кавычки,апострофы) Экспорт
	Контекст.Вставить("Знач1",кавычки);
	Контекст.Вставить("Знач2",апострофы);
КонецПроцедуры

&НаКлиенте
//Тогда в переменной контекст будет значение "Знач1" "кавычки"
//@ВПеременнойКонтекстБудетЗначение(Парам01,Парам02)
Процедура ВПеременнойКонтекстБудетЗначение(ИмяПараметра,ЗначениеПараметра) Экспорт
	Ванесса.ПроверитьРавенство(Контекст[ИмяПараметра],ЗначениеПараметра,"Ожидали равнества параметров.");
КонецПроцедуры

//окончание текста модуля

&НаКлиенте
//Когда я выпоняю шаг с параметером когда апострофы 'апострофы' идут раньше кавычек "кавычки"
//@ЯВыпоняюШагСПараметеромКогдаАпострофыИдутРаньшеКавычек(Парам01,Парам02)
Процедура ЯВыпоняюШагСПараметеромКогдаАпострофыИдутРаньшеКавычек(апострофы,кавычки) Экспорт
	Контекст.Вставить("Знач1",апострофы);
	Контекст.Вставить("Знач2",кавычки);
КонецПроцедуры
