class FolderSearchParams{
  final String path;
  final bool recursive;
  final bool includeMediaInfo;
  final bool includeDeleted;
  final bool includeHasExplicitSharedMembers;
  final bool includeMountedFolders;
  final bool includeNonDownloadableFiles;

  FolderSearchParams({this.path,this.recursive, this.includeMediaInfo, this.includeDeleted, this.includeHasExplicitSharedMembers, this.includeMountedFolders, this.includeNonDownloadableFiles});

  Map toMap() {
    var map = new Map<String, dynamic>();
    map['path'] = path;
    map['recursive'] = recursive;
    map['include_media_info'] = includeMediaInfo;
    map['include_deleted'] = includeDeleted;
    map['include_has_explicit_shared_members'] = includeHasExplicitSharedMembers;
    map['include_mounted_folders'] = includeMountedFolders;
    map['include_non_downloadable_files'] = includeNonDownloadableFiles;

    return map;
  }


}