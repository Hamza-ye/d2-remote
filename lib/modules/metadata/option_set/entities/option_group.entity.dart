import 'package:d2_remote/core/annotations/index.dart';
import 'package:d2_remote/modules/metadata/option_set/entities/option.entity.dart';
import 'package:d2_remote/modules/metadata/option_set/entities/option_set.entity.dart';
import 'package:d2_remote/shared/entities/identifiable.entity.dart';

@AnnotationReflectable
@Entity(tableName: 'optiongroup', apiResourceName: 'optionGroups')
class OptionGroup extends IdentifiableEntity {
  @Column(type: ColumnType.TEXT, nullable: true)
  String? description;

  @ManyToOne(table: OptionSet, joinColumnName: 'optionSet')
  dynamic optionSet;

  @OneToMany(table: Option)
  List<Option>? options;

  OptionGroup(
      {required String id,
      required String name,
      required String code,
      String? displayName,
      this.description,
      required this.optionSet,
      this.options,
      required bool dirty})
      : super(
            id: id,
            name: name,
            displayName: displayName,
            code: code,
            dirty: dirty);

  factory OptionGroup.fromJson(Map<String, dynamic> jsonData) {
    return OptionGroup(
        id: jsonData['id'],
        name: jsonData['name'],
        code: jsonData['code'],
        optionSet: jsonData['optionSet'],
        description: jsonData['description'],
        displayName: jsonData['displayName'],
        dirty: jsonData['dirty']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['optionSet'] = this.optionSet;
    data['description'] = this.description;
    data['displayName'] = this.displayName;
    data['dirty'] = this.dirty;
    return data;
  }
}
