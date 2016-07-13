//
//  COCOTableViewCell.h
//  cocoAnimationCell
//
//  Created by wochu on 16/6/24.
//  Copyright © 2016年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface COCOTableViewCell : UITableViewCell


- (void)setMImageViewWithName:(NSString *)imageName;

+ (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath;


- (void)setImageViewFrame;
@end
