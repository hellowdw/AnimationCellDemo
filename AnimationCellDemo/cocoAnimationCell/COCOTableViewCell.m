//
//  COCOTableViewCell.m
//  cocoAnimationCell
//
//  Created by wochu on 16/6/24.
//  Copyright © 2016年 test. All rights reserved.
//

#import "COCOTableViewCell.h"

#define CELL_HEIGHT 180

#define IMAGEVIEW_HEIGHT CELL_HEIGHT*2

@interface COCOTableViewCell()
@property (nonatomic ,strong) UIImageView *mImageView;
@property (nonatomic ,strong) UILabel *mtitleLabel;
@end

@implementation COCOTableViewCell

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
    
        _mImageView = [[UIImageView alloc]init];
        _mImageView.frame = CGRectMake(0, (CELL_HEIGHT - IMAGEVIEW_HEIGHT)*0.5, [UIScreen mainScreen].bounds.size.width, IMAGEVIEW_HEIGHT);
        //_mImageView.center = self.contentView.center;
        _mImageView.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:_mImageView];
        

        
        self.clipsToBounds = YES;
        self.
        
        
        mtitleLabel = ({
            UILabel * titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CELL_HEIGHT / 2 - 30, [UIScreen mainScreen].bounds.size.width, 30)];
            
            titleLabel.font = [UIFont boldSystemFontOfSize:14];
            
            titleLabel.textAlignment = NSTextAlignmentCenter;
             
            titleLabel.textColor = [UIColor whiteColor];
            
            titleLabel.text = @"HELLO&WDW";
            
            titleLabel;
        });
        
        [self addSubview:_mtitleLabel];
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    
    
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setMImageViewWithName:(NSString *)imageName {
    _mImageView.image = [UIImage imageNamed:imageName];
}



+ (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CELL_HEIGHT;
}


- (void)setImageViewFrame {
   //_mImageView.frame = CGRectMake(<#CGFloat x#>, <#CGFloat y#>, <#CGFloat width#>, <#CGFloat height#>)

    
    /*
     - (CGRect)convertRect:(CGRect)rect toView:(nullable UIView *)view;
     将rect由rect所在视图转换到目标视图view中，返回在目标视图view中的rect
     这里用来获取self在window上的位置
     */
    CGRect toWindow = [self convertRect:self.bounds toView:self.window];
    
    //获取父视图的中心
    CGPoint windowCenter = self.superview.center;
    
    //cell在y轴上的位移  CGRectGetMidY之前讲过,获取中心Y值
    CGFloat cellOffsetY = CGRectGetMidY(toWindow) - windowCenter.y;
    
    //位移比例
    CGFloat offsetDig = 2 * cellOffsetY / self.superview.frame.size.height ;
    
    //要补偿的位移
    CGFloat offset =  -offsetDig * CELL_HEIGHT/2;
    
    //让pictureViewY轴方向位移offset
    CGAffineTransform transY = CGAffineTransformMakeTranslation(0,offset);
    _mImageView.transform = transY;



}

- (void)layoutSubviews {
    
}


@end
