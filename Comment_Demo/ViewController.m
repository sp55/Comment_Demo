//
//  ViewController.m
//  Comment_Demo
//
//  Created by admin on 2017/2/7.
//  Copyright © 2017年 AlezJi. All rights reserved.
//

#import "ViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#import "CommentCell.h"
#import "CommentModel.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,CommentCellDelegate>
@property(strong,nonatomic)UITableView *tableView;//
@property(strong,nonatomic)NSMutableArray *dataArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    self.tableView.tableFooterView = [[UIView alloc]init];
    [self.tableView registerNib:[UINib nibWithNibName:@"CommentCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"CommentCell"];
    
    
    self.dataArr = [NSMutableArray array];//留下唇印的嘴
    NSArray *data = @[@"塞纳河畔",@"左岸的咖啡",@"我手一杯",@"品尝你的美"];
    for (NSInteger i=0; i<data.count; i++) {
        CommentModel *commentModel = [[CommentModel alloc] init];
        commentModel.commentString = data[i];
        [self.dataArr addObject:commentModel];
    }
    [self.view addSubview:self.tableView];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CommentCell" forIndexPath:indexPath];
    [cell configWithModel:self.dataArr[indexPath.row]];
    cell.commentBtn.indexPath = indexPath;
    cell.delegate = self;
    return cell;
}

#pragma mark - comment
-(void)CommentCellDelegateWithIndexPath:(NSIndexPath *)indexPath
{
    //找到点击的单元格  取出该单元格的对象
    CommentCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    CommentModel *model = self.dataArr[indexPath.row];
    
    CommentModel *commentModel = [[CommentModel alloc] init];
    commentModel.commentString = [NSString stringWithFormat:@"@某某%@---评论测试",model.commentString];
//    commentModel.commentString = @"留下唇印的嘴";

    //插入新数据源  刷新当前页面
    [self.dataArr insertObject:commentModel atIndex:0];
    [self.tableView reloadData];
    NSLog(@"=====%@====%ld====%@",model.commentString,indexPath.row,cell.commentLabel.text);
    
}




@end
