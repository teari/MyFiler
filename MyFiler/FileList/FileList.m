//
//  FileList.m
//  MyFiler
//
//  Created by thayakawa on 2015/04/13.
//  Copyright (c) 2015年 takuto. All rights reserved.
//

#import "FileList.h"

@implementation FileList

-(void)viewDidLoad
{
    [super viewDidLoad];
    // サンドボックスのパスを取得
    inDocumentFile = [[NSMutableArray alloc] init];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSLog(@"%@",path);
    // サンドボックス内のファイルを取得
    NSError *error = nil;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *files = [fileManager contentsOfDirectoryAtPath:path error:&error];
    for (NSString *file in files) {
        [inDocumentFile addObject:file];
    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return inDocumentFile.count;
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    cell.textLabel.text = [inDocumentFile objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *path = [paths objectAtIndex:0];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        NSString *filePath = [path stringByAppendingPathComponent:[inDocumentFile objectAtIndex:indexPath.row]];
        NSError *error;
        [fileManager removeItemAtPath:filePath error:&error];
        [inDocumentFile removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    }
}



@end
