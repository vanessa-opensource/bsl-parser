Перем ОбщийМодуль Экспорт;

Перем МодульОбъекта Экспорт;
Перем МодульМенеджера Экспорт;

Перем МодульОбычнойФормы Экспорт;
Перем МодульУправляемойФормы Экспорт;

Перем МодульКоманды Экспорт;

Перем МодульСеанса Экспорт;
Перем МодульОбычногоПриложения Экспорт;
Перем МодульУправляемогоПриложения Экспорт;
Перем МодульВнешнегоСоединения Экспорт;

Перем СоответствиеИмениФайлаИТИпаМодуля;
Перем СоответствиеИмениРодителяИТИпаМодуля;

///////////////////////////////////////////////////////////////////////////////////////////////

Функция ТипМодуляПоИмениФайла(ПолноеИмяФайла) Экспорт

	Файл = Новый Файл(ПолноеИмяФайла);
    ИмяБезРасширения = Файл.ИмяБезРасширения;
	Расширение = Файл.Расширение;
	
	ТипЭтогоМодуля = Неопределено;

	Если ИмяБезРасширения = "module" И ПустаяСтрока(Расширение) Тогда
		
		ТипЭтогоМодуля = МодульОбычнойФормы;
		
	ИначеЕсли ИмяБезРасширения = "Module" Тогда
		
		МассивЧастейИмени = СтрРазделить(ПолноеИмяФайла, "\");
		
		Если МассивЧастейИмени.Количество() > 3 Тогда
			
			Родитель = МассивЧастейИмени[МассивЧастейИмени.Количество() - 2];
			
			Если Родитель = "Ext" Тогда
				
				Родитель = МассивЧастейИмени[МассивЧастейИмени.Количество() - 4];
				
			Иначе
				
				Родитель = МассивЧастейИмени[МассивЧастейИмени.Количество() - 3];
				
				Если Родитель = "Ext" Тогда // Общие формы
				
					Родитель = МассивЧастейИмени[МассивЧастейИмени.Количество() - 5];
					
				КонецЕсли;
				
			КонецЕсли;
			
			ТипЭтогоМодуля = СоответствиеИмениРодителяИТИпаМодуля[Родитель];

		Иначе

			ВызватьИсключение "Ошибочная структура имени файла: " + ПолноеИмяФайла;
			
		КонецЕсли; 
		

	Иначе

		ТипЭтогоМодуля = СоответствиеИмениФайлаИТИпаМодуля[ИмяБезРасширения];
		
	КонецЕсли;

	Если ПустаяСтрока(ТипЭтогоМодуля) Тогда
		
		Сообщить("Не смогли определить тип модуля. " + ПолноеИмяФайла);

	КонецЕсли;	

	Возврат ТипЭтогоМодуля;

КонецФункции

Функция ЭтоМодульФормы(ТипПереданногоМодуля) Экспорт

	Возврат ТипПереданногоМодуля = ТипМодуля.МодульУправляемойФормы ИЛИ ТипПереданногоМодуля = ТипМодуля.МодульОбычнойФормы;
	
КонецФункции

///////////////////////////////////////////////////////////////////////////////////////////////

ОбщийМодуль = "ОбщийМодуль";

МодульОбъекта = "МодульОбъекта";
МодульМенеджера = "МодульМенеджера";

МодульОбычнойФормы = "МодульОбычнойФормы";
МодульУправляемойФормы = "МодульУправляемойФормы";

МодульКоманды = "МодульКоманды";

МодульСеанса = "МодульСеанса";
МодульОбычногоПриложения = "МодульОбычногоПриложения";
МодульУправляемогоПриложения = "МодульУправляемогоПриложения";
МодульВнешнегоСоединения = "МодульВнешнегоСоединения";

СоответствиеИмениФайлаИТИпаМодуля = Новый Соответствие();
СоответствиеИмениФайлаИТИпаМодуля.Вставить("CommandModule", МодульКоманды);
СоответствиеИмениФайлаИТИпаМодуля.Вставить("ManagedApplicationModule", МодульУправляемогоПриложения);
СоответствиеИмениФайлаИТИпаМодуля.Вставить("OrdinaryApplicationModule", МодульОбычногоПриложения);
СоответствиеИмениФайлаИТИпаМодуля.Вставить("SessionModule", МодульСеанса);
СоответствиеИмениФайлаИТИпаМодуля.Вставить("ExternalConnectionModule", МодульВнешнегоСоединения);
СоответствиеИмениФайлаИТИпаМодуля.Вставить("ManagerModule", МодульМенеджера);
СоответствиеИмениФайлаИТИпаМодуля.Вставить("ValueManagerModule", МодульМенеджера);
СоответствиеИмениФайлаИТИпаМодуля.Вставить("ObjectModule", МодульОбъекта);
СоответствиеИмениФайлаИТИпаМодуля.Вставить("RecordSetModule", МодульОбъекта);

СоответствиеИмениРодителяИТИпаМодуля = Новый Соответствие();
СоответствиеИмениРодителяИТИпаМодуля.Вставить("CommonModules", ОбщийМодуль);
СоответствиеИмениРодителяИТИпаМодуля.Вставить("CommonModule", ОбщийМодуль);
СоответствиеИмениРодителяИТИпаМодуля.Вставить("WebServices", МодульОбъекта);
СоответствиеИмениРодителяИТИпаМодуля.Вставить("WebService", МодульОбъекта);
СоответствиеИмениРодителяИТИпаМодуля.Вставить("HTTPServices", МодульОбъекта);
СоответствиеИмениРодителяИТИпаМодуля.Вставить("HTTPService", МодульОбъекта);
СоответствиеИмениРодителяИТИпаМодуля.Вставить("Forms", МодульУправляемойФормы);
СоответствиеИмениРодителяИТИпаМодуля.Вставить("Form", МодульУправляемойФормы);
СоответствиеИмениРодителяИТИпаМодуля.Вставить("CommonForms", МодульУправляемойФормы);
СоответствиеИмениРодителяИТИпаМодуля.Вставить("CommonForm", МодульУправляемойФормы);
