//
//  LFile.h
//  LBaseClass
//
//  Created by liqiang on 2018/1/11.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "LObject.h"

@interface LFile : LObject

+ (NSString *)homePath;

+ (NSString *)documentsPath;

+ (NSString *)libraryPath;

+ (NSString *)tempPath;

//123456789，单位KB
+ (long long)getFileSize:(NSString *)filePath;

//123456789，单位KB
+ (long long)getFolderSize:(NSString *)folderPath;

+ (BOOL)createPath:(NSString *)path;

+ (BOOL)removePath:(NSString *)path;

+ (BOOL)movePath:(NSString *)path toPath:(NSString *)toPath;

+ (NSArray<NSString *> *)getChildFileNames:(NSString *)path;

+ (NSArray<NSString *> *)getChildFolderNames:(NSString *)path;

+ (NSArray<NSString *> *)getChildFilesAndFolderNames:(NSString *)path;

+ (NSArray<NSString *> *)getChildFilePaths:(NSString *)path;

+ (NSArray<NSString *> *)getChildFolderPaths:(NSString *)path;

+ (NSArray<NSString *> *)getChildFilesAndFolderPaths:(NSString *)path;

@end
