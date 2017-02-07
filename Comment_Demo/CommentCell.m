//
//  CommentCell.m
//  Comment_Demo
//
//  Created by admin on 2017/2/7.
//  Copyright © 2017年 AlezJi. All rights reserved.
//

#import "CommentCell.h"
@interface CommentCell ()
@end

@implementation CommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}
- (IBAction)commentAction:(UIIndexButton *)sender {
    [self.delegate CommentCellDelegateWithIndexPath:sender.indexPath];
}

-(void)configWithModel:(CommentModel *)model
{
    self.commentLabel.text = model.commentString;
}



@end
