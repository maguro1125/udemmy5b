// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ArticleRecord extends DataClass implements Insertable<ArticleRecord> {
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final String publishData;
  final String content;
  ArticleRecord(
      {@required this.title,
      @required this.description,
      @required this.url,
      @required this.urlToImage,
      @required this.publishData,
      @required this.content, publishDate});
  factory ArticleRecord.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    return ArticleRecord(
      title:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}title']),
      description: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}description']),
      url: stringType.mapFromDatabaseResponse(data['${effectivePrefix}url']),
      urlToImage: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}url_to_image']),
      publishData: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}publish_data']),
      content:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}content']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || title != null) {
      map['title'] = Variable<String>(title);
    }
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || urlToImage != null) {
      map['url_to_image'] = Variable<String>(urlToImage);
    }
    if (!nullToAbsent || publishData != null) {
      map['publish_data'] = Variable<String>(publishData);
    }
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    return map;
  }

  ArticleRecordsCompanion toCompanion(bool nullToAbsent) {
    return ArticleRecordsCompanion(
      title:
          title == null && nullToAbsent ? const Value.absent() : Value(title),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      urlToImage: urlToImage == null && nullToAbsent
          ? const Value.absent()
          : Value(urlToImage),
      publishData: publishData == null && nullToAbsent
          ? const Value.absent()
          : Value(publishData),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
    );
  }

  factory ArticleRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return ArticleRecord(
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      url: serializer.fromJson<String>(json['url']),
      urlToImage: serializer.fromJson<String>(json['urlToImage']),
      publishData: serializer.fromJson<String>(json['publishData']),
      content: serializer.fromJson<String>(json['content']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'url': serializer.toJson<String>(url),
      'urlToImage': serializer.toJson<String>(urlToImage),
      'publishData': serializer.toJson<String>(publishData),
      'content': serializer.toJson<String>(content),
    };
  }

  ArticleRecord copyWith(
          {String title,
          String description,
          String url,
          String urlToImage,
          String publishData,
          String content}) =>
      ArticleRecord(
        title: title ?? this.title,
        description: description ?? this.description,
        url: url ?? this.url,
        urlToImage: urlToImage ?? this.urlToImage,
        publishData: publishData ?? this.publishData,
        content: content ?? this.content,
      );
  @override
  String toString() {
    return (StringBuffer('ArticleRecord(')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('url: $url, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('publishData: $publishData, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      title.hashCode,
      $mrjc(
          description.hashCode,
          $mrjc(
              url.hashCode,
              $mrjc(urlToImage.hashCode,
                  $mrjc(publishData.hashCode, content.hashCode))))));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is ArticleRecord &&
          other.title == this.title &&
          other.description == this.description &&
          other.url == this.url &&
          other.urlToImage == this.urlToImage &&
          other.publishData == this.publishData &&
          other.content == this.content);
}

class ArticleRecordsCompanion extends UpdateCompanion<ArticleRecord> {
  final Value<String> title;
  final Value<String> description;
  final Value<String> url;
  final Value<String> urlToImage;
  final Value<String> publishData;
  final Value<String> content;
  const ArticleRecordsCompanion({
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.url = const Value.absent(),
    this.urlToImage = const Value.absent(),
    this.publishData = const Value.absent(),
    this.content = const Value.absent(),
  });
  ArticleRecordsCompanion.insert({
    @required String title,
    @required String description,
    @required String url,
    @required String urlToImage,
    @required String publishData,
    @required String content,
  })  : title = Value(title),
        description = Value(description),
        url = Value(url),
        urlToImage = Value(urlToImage),
        publishData = Value(publishData),
        content = Value(content);
  static Insertable<ArticleRecord> custom({
    Expression<String> title,
    Expression<String> description,
    Expression<String> url,
    Expression<String> urlToImage,
    Expression<String> publishData,
    Expression<String> content,
  }) {
    return RawValuesInsertable({
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (url != null) 'url': url,
      if (urlToImage != null) 'url_to_image': urlToImage,
      if (publishData != null) 'publish_data': publishData,
      if (content != null) 'content': content,
    });
  }

  ArticleRecordsCompanion copyWith(
      {Value<String> title,
      Value<String> description,
      Value<String> url,
      Value<String> urlToImage,
      Value<String> publishData,
      Value<String> content}) {
    return ArticleRecordsCompanion(
      title: title ?? this.title,
      description: description ?? this.description,
      url: url ?? this.url,
      urlToImage: urlToImage ?? this.urlToImage,
      publishData: publishData ?? this.publishData,
      content: content ?? this.content,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (urlToImage.present) {
      map['url_to_image'] = Variable<String>(urlToImage.value);
    }
    if (publishData.present) {
      map['publish_data'] = Variable<String>(publishData.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticleRecordsCompanion(')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('url: $url, ')
          ..write('urlToImage: $urlToImage, ')
          ..write('publishData: $publishData, ')
          ..write('content: $content')
          ..write(')'))
        .toString();
  }
}

class $ArticleRecordsTable extends ArticleRecords
    with TableInfo<$ArticleRecordsTable, ArticleRecord> {
  final GeneratedDatabase _db;
  final String _alias;
  $ArticleRecordsTable(this._db, [this._alias]);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  GeneratedTextColumn _title;
  @override
  GeneratedTextColumn get title => _title ??= _constructTitle();
  GeneratedTextColumn _constructTitle() {
    return GeneratedTextColumn(
      'title',
      $tableName,
      false,
    );
  }

  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  GeneratedTextColumn _description;
  @override
  GeneratedTextColumn get description =>
      _description ??= _constructDescription();
  GeneratedTextColumn _constructDescription() {
    return GeneratedTextColumn(
      'description',
      $tableName,
      false,
    );
  }

  final VerificationMeta _urlMeta = const VerificationMeta('url');
  GeneratedTextColumn _url;
  @override
  GeneratedTextColumn get url => _url ??= _constructUrl();
  GeneratedTextColumn _constructUrl() {
    return GeneratedTextColumn(
      'url',
      $tableName,
      false,
    );
  }

  final VerificationMeta _urlToImageMeta = const VerificationMeta('urlToImage');
  GeneratedTextColumn _urlToImage;
  @override
  GeneratedTextColumn get urlToImage => _urlToImage ??= _constructUrlToImage();
  GeneratedTextColumn _constructUrlToImage() {
    return GeneratedTextColumn(
      'url_to_image',
      $tableName,
      false,
    );
  }

  final VerificationMeta _publishDataMeta =
      const VerificationMeta('publishData');
  GeneratedTextColumn _publishData;
  @override
  GeneratedTextColumn get publishData =>
      _publishData ??= _constructPublishData();
  GeneratedTextColumn _constructPublishData() {
    return GeneratedTextColumn(
      'publish_data',
      $tableName,
      false,
    );
  }

  final VerificationMeta _contentMeta = const VerificationMeta('content');
  GeneratedTextColumn _content;
  @override
  GeneratedTextColumn get content => _content ??= _constructContent();
  GeneratedTextColumn _constructContent() {
    return GeneratedTextColumn(
      'content',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns =>
      [title, description, url, urlToImage, publishData, content];
  @override
  $ArticleRecordsTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'article_records';
  @override
  final String actualTableName = 'article_records';
  @override
  VerificationContext validateIntegrity(Insertable<ArticleRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title'], _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description'], _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url'], _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('url_to_image')) {
      context.handle(
          _urlToImageMeta,
          urlToImage.isAcceptableOrUnknown(
              data['url_to_image'], _urlToImageMeta));
    } else if (isInserting) {
      context.missing(_urlToImageMeta);
    }
    if (data.containsKey('publish_data')) {
      context.handle(
          _publishDataMeta,
          publishData.isAcceptableOrUnknown(
              data['publish_data'], _publishDataMeta));
    } else if (isInserting) {
      context.missing(_publishDataMeta);
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content'], _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  ArticleRecord map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return ArticleRecord.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $ArticleRecordsTable createAlias(String alias) {
    return $ArticleRecordsTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $ArticleRecordsTable _articleRecords;
  $ArticleRecordsTable get articleRecords =>
      _articleRecords ??= $ArticleRecordsTable(this);
  NewsDao _newsDao;
  NewsDao get newsDao => _newsDao ??= NewsDao(this as MyDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [articleRecords];
}
