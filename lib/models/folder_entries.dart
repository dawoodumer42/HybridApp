class FolderEntries{
  final String tag;
  final String name;
  final String pathLower;
  final String pathDisplay;
  final String parentSharedFolderId;
  final String id;
  final SharingInfo sharingInfo;
  FolderEntries({this.tag, this.name, this.pathLower, this.pathDisplay, this.parentSharedFolderId, this.id, this.sharingInfo});

  factory FolderEntries.fromJson(Map<String, dynamic> json) {
    return FolderEntries(
        tag: json['.tag'],
        name: json['name'],
        pathLower: json['path_lower'],
        pathDisplay: json['path_display'],
        parentSharedFolderId: json['parent_shared_folder_id'],
        id: json['id'],
        sharingInfo: SharingInfo.fromJson(json['sharing_info']),
    );
  }

}

class SharingInfo {
  final bool readOnly;
  final String parentSharedFolderId;
  final bool traverseOnly;
  final noAccess;

  SharingInfo({this.readOnly, this.parentSharedFolderId, this.traverseOnly, this.noAccess});

  factory SharingInfo.fromJson(Map<String, dynamic> json) {
    return SharingInfo(
      readOnly: json['read_only'],
      parentSharedFolderId: json['parent_shared_folder_id'],
      traverseOnly: json['traverse_only'],
      noAccess: json['no_access']
    );
  }

}