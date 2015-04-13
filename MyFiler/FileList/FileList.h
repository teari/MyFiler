//
//  FileList.h
//  MyFiler
//
//  Created by thayakawa on 2015/04/13.
//  Copyright (c) 2015年 takuto. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FileList : UITableViewController <UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *inDocumentFile;
}
@end
