// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Главная`
  String get main {
    return Intl.message(
      'Главная',
      name: 'main',
      desc: '',
      args: [],
    );
  }

  /// `Задачи`
  String get tasks {
    return Intl.message(
      'Задачи',
      name: 'tasks',
      desc: '',
      args: [],
    );
  }

  /// `Дефектний акт`
  String get defectiveAct {
    return Intl.message(
      'Дефектний акт',
      name: 'defectiveAct',
      desc: '',
      args: [],
    );
  }

  /// `Изменить язык`
  String get changeLanguage {
    return Intl.message(
      'Изменить язык',
      name: 'changeLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Выход`
  String get logout {
    return Intl.message(
      'Выход',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Все задачи`
  String get allTasks {
    return Intl.message(
      'Все задачи',
      name: 'allTasks',
      desc: '',
      args: [],
    );
  }

  /// `В процессе`
  String get inProccess {
    return Intl.message(
      'В процессе',
      name: 'inProccess',
      desc: '',
      args: [],
    );
  }

  /// `В ожидание`
  String get inAnticipation {
    return Intl.message(
      'В ожидание',
      name: 'inAnticipation',
      desc: '',
      args: [],
    );
  }

  /// `Завершенные`
  String get complated {
    return Intl.message(
      'Завершенные',
      name: 'complated',
      desc: '',
      args: [],
    );
  }

  /// `Текущие задачи`
  String get currentTasks {
    return Intl.message(
      'Текущие задачи',
      name: 'currentTasks',
      desc: '',
      args: [],
    );
  }

  /// `Новые`
  String get new1 {
    return Intl.message(
      'Новые',
      name: 'new1',
      desc: '',
      args: [],
    );
  }

  /// `Ждет подтверждения`
  String get awaitingConfirmation {
    return Intl.message(
      'Ждет подтверждения',
      name: 'awaitingConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Отклоненные`
  String get rejected {
    return Intl.message(
      'Отклоненные',
      name: 'rejected',
      desc: '',
      args: [],
    );
  }

  /// `История`
  String get story {
    return Intl.message(
      'История',
      name: 'story',
      desc: '',
      args: [],
    );
  }

  /// `Тип работы:`
  String get typeOfWork {
    return Intl.message(
      'Тип работы:',
      name: 'typeOfWork',
      desc: '',
      args: [],
    );
  }

  /// `Срок выполнения:`
  String get completionDate {
    return Intl.message(
      'Срок выполнения:',
      name: 'completionDate',
      desc: '',
      args: [],
    );
  }

  /// `Подробнее`
  String get details {
    return Intl.message(
      'Подробнее',
      name: 'details',
      desc: '',
      args: [],
    );
  }

  /// `Основные данные`
  String get basicData {
    return Intl.message(
      'Основные данные',
      name: 'basicData',
      desc: '',
      args: [],
    );
  }

  /// `Адрес`
  String get address {
    return Intl.message(
      'Адрес',
      name: 'address',
      desc: '',
      args: [],
    );
  }

  /// `Объект`
  String get object {
    return Intl.message(
      'Объект',
      name: 'object',
      desc: '',
      args: [],
    );
  }

  /// `Статус`
  String get status {
    return Intl.message(
      'Статус',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Комментарии`
  String get comments {
    return Intl.message(
      'Комментарии',
      name: 'comments',
      desc: '',
      args: [],
    );
  }

  /// `Паспорт`
  String get passport {
    return Intl.message(
      'Паспорт',
      name: 'passport',
      desc: '',
      args: [],
    );
  }

  /// `Принять`
  String get accept {
    return Intl.message(
      'Принять',
      name: 'accept',
      desc: '',
      args: [],
    );
  }

  /// `Назад`
  String get back {
    return Intl.message(
      'Назад',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Принять заявки`
  String get acceptTask {
    return Intl.message(
      'Принять заявки',
      name: 'acceptTask',
      desc: '',
      args: [],
    );
  }

  /// `Сохранить`
  String get save {
    return Intl.message(
      'Сохранить',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Maydon bo‘sh qolmasligi kerak`
  String get thefieldmustnotbeempty {
    return Intl.message(
      'Maydon bo‘sh qolmasligi kerak',
      name: 'thefieldmustnotbeempty',
      desc: '',
      args: [],
    );
  }

  /// `Монтеры`
  String get fitters {
    return Intl.message(
      'Монтеры',
      name: 'fitters',
      desc: '',
      args: [],
    );
  }

  /// `Закрытие заявки`
  String get closingTask {
    return Intl.message(
      'Закрытие заявки',
      name: 'closingTask',
      desc: '',
      args: [],
    );
  }

  /// `Управление производственным образом`
  String get productionManagement {
    return Intl.message(
      'Управление производственным образом',
      name: 'productionManagement',
      desc: '',
      args: [],
    );
  }

  /// `Заявка в лабораторию`
  String get applicationToLabaratory {
    return Intl.message(
      'Заявка в лабораторию',
      name: 'applicationToLabaratory',
      desc: '',
      args: [],
    );
  }

  /// `Бронь техники`
  String get equipmentReservation {
    return Intl.message(
      'Бронь техники',
      name: 'equipmentReservation',
      desc: '',
      args: [],
    );
  }

  /// `Должность:`
  String get jobTitle {
    return Intl.message(
      'Должность:',
      name: 'jobTitle',
      desc: '',
      args: [],
    );
  }

  /// `Поиск...`
  String get search {
    return Intl.message(
      'Поиск...',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Отдел:`
  String get department {
    return Intl.message(
      'Отдел:',
      name: 'department',
      desc: '',
      args: [],
    );
  }

  /// `Кол-во задач:`
  String get numberOfTasks {
    return Intl.message(
      'Кол-во задач:',
      name: 'numberOfTasks',
      desc: '',
      args: [],
    );
  }

  /// `Не начинался`
  String get didntStart {
    return Intl.message(
      'Не начинался',
      name: 'didntStart',
      desc: '',
      args: [],
    );
  }

  /// `Описание`
  String get description {
    return Intl.message(
      'Описание',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Сформировать задачу`
  String get formTask {
    return Intl.message(
      'Сформировать задачу',
      name: 'formTask',
      desc: '',
      args: [],
    );
  }

  /// `Информации`
  String get information {
    return Intl.message(
      'Информации',
      name: 'information',
      desc: '',
      args: [],
    );
  }

  /// `Тип заявки`
  String get typeApplication {
    return Intl.message(
      'Тип заявки',
      name: 'typeApplication',
      desc: '',
      args: [],
    );
  }

  /// `Время планируемого ремонта`
  String get plannedDate {
    return Intl.message(
      'Время планируемого ремонта',
      name: 'plannedDate',
      desc: '',
      args: [],
    );
  }

  /// `Сохранено успешно.`
  String get savedSuccessfully {
    return Intl.message(
      'Сохранено успешно.',
      name: 'savedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Заказать транспорт`
  String get orderTransport {
    return Intl.message(
      'Заказать транспорт',
      name: 'orderTransport',
      desc: '',
      args: [],
    );
  }

  /// `Когда нужна (Дата и время с по)`
  String get whenNeed {
    return Intl.message(
      'Когда нужна (Дата и время с по)',
      name: 'whenNeed',
      desc: '',
      args: [],
    );
  }

  /// `Посмотреть`
  String get look {
    return Intl.message(
      'Посмотреть',
      name: 'look',
      desc: '',
      args: [],
    );
  }

  /// `Удалить`
  String get delete {
    return Intl.message(
      'Удалить',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Капитальный ремонт`
  String get capitalRepair {
    return Intl.message(
      'Капитальный ремонт',
      name: 'capitalRepair',
      desc: '',
      args: [],
    );
  }

  /// `Текущий ремонт`
  String get currentRepair {
    return Intl.message(
      'Текущий ремонт',
      name: 'currentRepair',
      desc: '',
      args: [],
    );
  }

  /// `Обход`
  String get bypass {
    return Intl.message(
      'Обход',
      name: 'bypass',
      desc: '',
      args: [],
    );
  }

  /// `Аварийный ремонт`
  String get emergencyRepair {
    return Intl.message(
      'Аварийный ремонт',
      name: 'emergencyRepair',
      desc: '',
      args: [],
    );
  }

  /// `Номер инвентаря`
  String get inventoryNumber {
    return Intl.message(
      'Номер инвентаря',
      name: 'inventoryNumber',
      desc: '',
      args: [],
    );
  }

  /// `Дата ввода в эксплуатацию`
  String get dateOfCommissioning {
    return Intl.message(
      'Дата ввода в эксплуатацию',
      name: 'dateOfCommissioning',
      desc: '',
      args: [],
    );
  }

  /// `Тип объекта`
  String get objectType {
    return Intl.message(
      'Тип объекта',
      name: 'objectType',
      desc: '',
      args: [],
    );
  }

  /// `Напряжение`
  String get voltage {
    return Intl.message(
      'Напряжение',
      name: 'voltage',
      desc: '',
      args: [],
    );
  }

  /// `Сечение`
  String get section {
    return Intl.message(
      'Сечение',
      name: 'section',
      desc: '',
      args: [],
    );
  }

  /// `Тип кабеля`
  String get cableType {
    return Intl.message(
      'Тип кабеля',
      name: 'cableType',
      desc: '',
      args: [],
    );
  }

  /// `Длинна`
  String get cableLength {
    return Intl.message(
      'Длинна',
      name: 'cableLength',
      desc: '',
      args: [],
    );
  }

  /// `Данные о профилактике, ремонтах и испытаниях оборудования`
  String get dataonequipmentmaintenancerepairsandtesting {
    return Intl.message(
      'Данные о профилактике, ремонтах и испытаниях оборудования',
      name: 'dataonequipmentmaintenancerepairsandtesting',
      desc: '',
      args: [],
    );
  }

  /// `Причина повреждения`
  String get causeOfDamage {
    return Intl.message(
      'Причина повреждения',
      name: 'causeOfDamage',
      desc: '',
      args: [],
    );
  }

  /// `Результаты ремонта`
  String get resultRemont {
    return Intl.message(
      'Результаты ремонта',
      name: 'resultRemont',
      desc: '',
      args: [],
    );
  }

  /// `Кто работал`
  String get whoWorked {
    return Intl.message(
      'Кто работал',
      name: 'whoWorked',
      desc: '',
      args: [],
    );
  }

  /// `Комментарий мастера`
  String get mastersComment {
    return Intl.message(
      'Комментарий мастера',
      name: 'mastersComment',
      desc: '',
      args: [],
    );
  }

  /// `Отклонить`
  String get reject {
    return Intl.message(
      'Отклонить',
      name: 'reject',
      desc: '',
      args: [],
    );
  }

  /// `Отклонить работу`
  String get rejectTask {
    return Intl.message(
      'Отклонить работу',
      name: 'rejectTask',
      desc: '',
      args: [],
    );
  }

  /// `Продлить`
  String get extend {
    return Intl.message(
      'Продлить',
      name: 'extend',
      desc: '',
      args: [],
    );
  }

  /// `Новый срок`
  String get newTerm {
    return Intl.message(
      'Новый срок',
      name: 'newTerm',
      desc: '',
      args: [],
    );
  }

  /// `Результаты обхода`
  String get resultObxod {
    return Intl.message(
      'Результаты обхода',
      name: 'resultObxod',
      desc: '',
      args: [],
    );
  }

  /// `Закрытие заявки`
  String get closeTask {
    return Intl.message(
      'Закрытие заявки',
      name: 'closeTask',
      desc: '',
      args: [],
    );
  }

  /// `Оценка`
  String get grade {
    return Intl.message(
      'Оценка',
      name: 'grade',
      desc: '',
      args: [],
    );
  }

  /// `Мастер`
  String get master {
    return Intl.message(
      'Мастер',
      name: 'master',
      desc: '',
      args: [],
    );
  }

  /// `Срок`
  String get term {
    return Intl.message(
      'Срок',
      name: 'term',
      desc: '',
      args: [],
    );
  }

  /// `Заявки`
  String get applications {
    return Intl.message(
      'Заявки',
      name: 'applications',
      desc: '',
      args: [],
    );
  }

  /// `Техники`
  String get transports {
    return Intl.message(
      'Техники',
      name: 'transports',
      desc: '',
      args: [],
    );
  }

  /// `От кого`
  String get fromWhom {
    return Intl.message(
      'От кого',
      name: 'fromWhom',
      desc: '',
      args: [],
    );
  }

  /// `Кто запросил`
  String get whoRequested {
    return Intl.message(
      'Кто запросил',
      name: 'whoRequested',
      desc: '',
      args: [],
    );
  }

  /// `Назначенное время`
  String get appointedTime {
    return Intl.message(
      'Назначенное время',
      name: 'appointedTime',
      desc: '',
      args: [],
    );
  }

  /// `Закрыт`
  String get closed {
    return Intl.message(
      'Закрыт',
      name: 'closed',
      desc: '',
      args: [],
    );
  }

  /// `Подтвердить`
  String get comfirm {
    return Intl.message(
      'Подтвердить',
      name: 'comfirm',
      desc: '',
      args: [],
    );
  }

  /// `Номер`
  String get number {
    return Intl.message(
      'Номер',
      name: 'number',
      desc: '',
      args: [],
    );
  }

  /// `Начало`
  String get start {
    return Intl.message(
      'Начало',
      name: 'start',
      desc: '',
      args: [],
    );
  }

  /// `Конец`
  String get end {
    return Intl.message(
      'Конец',
      name: 'end',
      desc: '',
      args: [],
    );
  }

  /// `Все`
  String get all {
    return Intl.message(
      'Все',
      name: 'all',
      desc: '',
      args: [],
    );
  }

  /// `Свободен`
  String get free {
    return Intl.message(
      'Свободен',
      name: 'free',
      desc: '',
      args: [],
    );
  }

  /// `Занять`
  String get borrow {
    return Intl.message(
      'Занять',
      name: 'borrow',
      desc: '',
      args: [],
    );
  }

  /// `Ремонт`
  String get repair {
    return Intl.message(
      'Ремонт',
      name: 'repair',
      desc: '',
      args: [],
    );
  }

  /// `Тип транспорта`
  String get typeTransport {
    return Intl.message(
      'Тип транспорта',
      name: 'typeTransport',
      desc: '',
      args: [],
    );
  }

  /// `Организация`
  String get organization {
    return Intl.message(
      'Организация',
      name: 'organization',
      desc: '',
      args: [],
    );
  }

  /// `Результаты`
  String get Results {
    return Intl.message(
      'Результаты',
      name: 'Results',
      desc: '',
      args: [],
    );
  }

  /// `Соответствует норме`
  String get complieswiththenorm {
    return Intl.message(
      'Соответствует норме',
      name: 'complieswiththenorm',
      desc: '',
      args: [],
    );
  }

  /// `Соответствует`
  String get corresponds {
    return Intl.message(
      'Соответствует',
      name: 'corresponds',
      desc: '',
      args: [],
    );
  }

  /// `Не соответствует`
  String get nocorresponds {
    return Intl.message(
      'Не соответствует',
      name: 'nocorresponds',
      desc: '',
      args: [],
    );
  }

  /// `Причина отказа`
  String get reasonforrefusal {
    return Intl.message(
      'Причина отказа',
      name: 'reasonforrefusal',
      desc: '',
      args: [],
    );
  }

  /// `Загрузить`
  String get download {
    return Intl.message(
      'Загрузить',
      name: 'download',
      desc: '',
      args: [],
    );
  }

  /// `Причина по.`
  String get reasonFor {
    return Intl.message(
      'Причина по.',
      name: 'reasonFor',
      desc: '',
      args: [],
    );
  }

  /// `Данные о профилактике, ремонтах и испытаниях оборудования`
  String get dataequipmentmaintenancerepairsandtesting {
    return Intl.message(
      'Данные о профилактике, ремонтах и испытаниях оборудования',
      name: 'dataequipmentmaintenancerepairsandtesting',
      desc: '',
      args: [],
    );
  }

  /// `Вид ремон.`
  String get typeOfRepair {
    return Intl.message(
      'Вид ремон.',
      name: 'typeOfRepair',
      desc: '',
      args: [],
    );
  }

  /// `Отправленные`
  String get sent {
    return Intl.message(
      'Отправленные',
      name: 'sent',
      desc: '',
      args: [],
    );
  }

  /// `Черновик`
  String get draft {
    return Intl.message(
      'Черновик',
      name: 'draft',
      desc: '',
      args: [],
    );
  }

  /// `Редактировать`
  String get edit {
    return Intl.message(
      'Редактировать',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Утверждено`
  String get approved {
    return Intl.message(
      'Утверждено',
      name: 'approved',
      desc: '',
      args: [],
    );
  }

  /// `Дата создания документа`
  String get documentCreationDate {
    return Intl.message(
      'Дата создания документа',
      name: 'documentCreationDate',
      desc: '',
      args: [],
    );
  }

  /// `Наименование`
  String get name {
    return Intl.message(
      'Наименование',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Ед. из.`
  String get unitOf {
    return Intl.message(
      'Ед. из.',
      name: 'unitOf',
      desc: '',
      args: [],
    );
  }

  /// `Кол.`
  String get qty {
    return Intl.message(
      'Кол.',
      name: 'qty',
      desc: '',
      args: [],
    );
  }

  /// `Добавить дефектный акт`
  String get addDefectiveAct {
    return Intl.message(
      'Добавить дефектный акт',
      name: 'addDefectiveAct',
      desc: '',
      args: [],
    );
  }

  /// `Добавить`
  String get add {
    return Intl.message(
      'Добавить',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Количество`
  String get quantity {
    return Intl.message(
      'Количество',
      name: 'quantity',
      desc: '',
      args: [],
    );
  }

  /// `Единица измерения`
  String get unitOfMeasurement {
    return Intl.message(
      'Единица измерения',
      name: 'unitOfMeasurement',
      desc: '',
      args: [],
    );
  }

  /// `Дата и время`
  String get dateAndTime {
    return Intl.message(
      'Дата и время',
      name: 'dateAndTime',
      desc: '',
      args: [],
    );
  }

  /// `{index} квартал`
  String quarter(int index) {
    return Intl.message(
      '$index квартал',
      name: 'quarter',
      desc: 'quarter index',
      args: [index],
    );
  }

  /// `Общий`
  String get total {
    return Intl.message(
      'Общий',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `АО РЭС Виртуальный рабочий энергетика`
  String get appTitle {
    return Intl.message(
      'АО РЭС Виртуальный рабочий энергетика',
      name: 'appTitle',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'uz'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
