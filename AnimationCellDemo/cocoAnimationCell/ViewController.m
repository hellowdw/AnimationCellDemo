//
//  ViewController.m
//  cocoAnimationCell
//
//  Created by wochu on 16/6/24.
//  Copyright © 2016年 test. All rights reserved.
//

#import "ViewController.h"
#import "COCOTableViewCell.h"
static NSString *__cocoTableViewCellID = @"COCOTableViewCell";

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *imageNames;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageNames = [NSMutableArray array];
    for (NSInteger i = 0; i < 12; i++) {
        NSString *name = [NSString stringWithFormat:@"%ld.jpg",(long)i];
        [_imageNames addObject:name];
    }
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _imageNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    COCOTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:__cocoTableViewCellID forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[COCOTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:__cocoTableViewCellID];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    COCOTableViewCell *cococell = (COCOTableViewCell *)cell;
    [cococell setMImageViewWithName:_imageNames[indexPath.row]];
    [cococell setImageViewFrame];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [COCOTableViewCell heightForRowAtIndexPath:indexPath];
}


#pragma mark - scrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView

{
    
    //contentOffsetY = scrollView.contentOffset.y;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    // visibleCells 获取界面上能显示出来了cell
    NSArray *array = [self.tableView visibleCells];
    
    [array enumerateObjectsUsingBlock:^(COCOTableViewCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj setImageViewFrame];
    }];
    
}


@end
