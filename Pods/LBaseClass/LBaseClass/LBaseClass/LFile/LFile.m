//
//  LFile.m
//  LBaseClass
//
//  Created by liqiang on 2018/1/11.
//  Copyright © 2018年 liqiang. All rights reserved.
//

#import "LFile.h"

@implementation LFile

#pragma mark - Interface

+ (NSString *)homePath {
    return NSHomeDirectory();
}

+ (NSString *)documentsPath {
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
}

+ (NSString *)libraryPath {
    return NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).lastObject;
}

+ (NSString *)tempPath {
    return NSTemporaryDirectory();
}

//123456789，单位KB
+ (long long)getFileSize:(NSString *)filePath {
    long long size = 0;
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]){
        size = [[[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:nil] fileSize] / 1024;
    }
    
    return size;
}

//123456789，单位KB
+ (long long)getFolderSize:(NSString *)folderPath {
    long long size = 0;
    
    NSEnumerator *childFiles = [[[NSFileManager defaultManager] subpathsAtPath:folderPath] objectEnumerator];
    NSString* fileName = nil;
    while ((fileName = [childFiles nextObject]) != nil){
        NSString *filePath = [folderPath stringByAppendingPathComponent:fileName];
        size += [self getFileSize:filePath];
    }
    
    return size;
}

+ (BOOL)createPath:(NSString *)path {
    if ([[NSFileManager defaultManager] fileExistsAtPath:path])
        return [self preventAutoBackUp:path];
    
    NSError *error = nil;
    if ([[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error])
        return [self preventAutoBackUp:path];
    else
        return NO;
}

+ (BOOL)removePath:(NSString *)path {
    if (![[NSFileManager defaultManager] fileExistsAtPath:path])
        return NO;
    
    return [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}

+ (BOOL)movePath:(NSString *)path toPath:(NSString *)toPath {
    if (![[NSFileManager defaultManager] fileExistsAtPath:path])
        return NO;
    
    if ([self createPath:toPath])
        return [[NSFileManager defaultManager] moveItemAtPath:path toPath:toPath error:nil];
    else
        return NO;
}

+ (NSArray<NSString *> *)getChildFileNames:(NSString *)path {
    if (![[NSFileManager defaultManager] fileExistsAtPath:path])
        return nil;
    
    NSArray *names = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
    
    NSMutableArray *fileNames = nil;
    if (names.count > 0) {
        fileNames = [[NSMutableArray alloc] init];
        for (NSString *name in names)
            if ([name containsString:@"."])
                [fileNames addObject:name];
    }
    
    return fileNames;
}

+ (NSArray<NSString *> *)getChildFolderNames:(NSString *)path {
    if (![[NSFileManager defaultManager] fileExistsAtPath:path])
        return nil;
    
    NSArray *names = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:nil];
    
    NSMutableArray *folderNames = nil;
    if (names.count > 0) {
        folderNames = [[NSMutableArray alloc] init];
        for (NSString *name in names)
            if (![name containsString:@"."])
                [folderNames addObject:name];
    }
    
    return folderNames;
}

+ (NSArray<NSString *> *)getChildFilesAndFolderNames:(NSString *)path {
    if (![[NSFileManager defaultManager] fileExistsAtPath:path])
        return nil;
    
    NSError *error = nil;
    NSArray *filesAndFolders = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:path error:&error];
    
    return error == nil ? filesAndFolders : nil;
}

+ (NSArray<NSString *> *)getChildFilePaths:(NSString *)path {
    NSArray *fileNames = [self getChildFileNames:path];
    
    NSMutableArray *filePaths = nil;
    if (fileNames.count > 0) {
        filePaths = [[NSMutableArray alloc] init];
        for (NSString *fileName in fileNames)
            [filePaths addObject:[path stringByAppendingPathComponent:fileName]];
    }
    
    return filePaths;
}

+ (NSArray<NSString *> *)getChildFolderPaths:(NSString *)path {
    NSArray *folderNames = [self getChildFolderNames:path];
    
    NSMutableArray *folderPaths = nil;
    if (folderNames.count > 0) {
        folderPaths = [[NSMutableArray alloc] init];
        for (NSString *folderName in folderNames)
            [folderPaths addObject:[path stringByAppendingPathComponent:folderName]];
    }
    
    return folderPaths;
}

+ (NSArray<NSString *> *)getChildFilesAndFolderPaths:(NSString *)path {
    NSArray *filesAndFolderNames = [self getChildFolderNames:path];
    
    NSMutableArray *filesAndFolderPaths = nil;
    if (filesAndFolderNames.count > 0) {
        filesAndFolderPaths = [[NSMutableArray alloc] init];
        for (NSString *folderName in filesAndFolderNames)
            [filesAndFolderPaths addObject:[path stringByAppendingPathComponent:folderName]];
    }
    
    return filesAndFolderPaths;
}

#pragma mark - 阻止icloud和itunes自动备份

+ (BOOL)preventAutoBackUp:(NSString *)path {
    if (![[NSFileManager defaultManager] fileExistsAtPath:path])
        return NO;
    
    NSURL *url= [NSURL fileURLWithPath:path];
    NSError *error = nil;
    
    return [url setResourceValue:[NSNumber numberWithBool:YES] forKey:NSURLIsExcludedFromBackupKey error: &error];
}

@end
