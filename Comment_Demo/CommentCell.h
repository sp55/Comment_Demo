//
//  CommentCell.h
//  Comment_Demo
//
//  Created by admin on 2017/2/7.
//  Copyright © 2017年 AlezJi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIIndexButton.h"
#import "CommentModel.h"

@protocol CommentCellDelegate <NSObject>
-(void)CommentCellDelegateWithIndexPath:(NSIndexPath *)indexPath;
@end

@interface CommentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UIIndexButton *commentBtn;

@property(weak,nonatomic)id<CommentCellDelegate>delegate;

-(void)configWithModel:(CommentModel *)model;


@end
