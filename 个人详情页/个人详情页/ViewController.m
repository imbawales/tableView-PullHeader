//
//  ViewController.m
//  个人详情页
//
//  Created by apple on 16/9/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Image.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightCons;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //取消scrollview自动设置内边距
    self.automaticallyAdjustsScrollViewInsets = NO;
    //将导航栏隐藏(变透明)
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    //设置title
    UILabel *titleL = [[UILabel alloc]init];
    titleL.text = @"个人详情页";
    titleL.textColor = [UIColor colorWithWhite:0 alpha:0];
    [titleL sizeToFit];
    self.navigationItem.titleView = titleL;
    //设置tableView的代理和数据源
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //当调用contentInSet时候,会自动调用scrollViewDidScroll方法
    self.tableView.contentInset = UIEdgeInsetsMake(244, 0, 0, 0);
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //计算偏移量
    CGFloat offset = scrollView.contentOffset.y - (-244);
    CGFloat h = 200 - offset;
    if (h <= 64) {
        h = 64;
    }
    self.heightCons.constant = h;
    //设置透明度
    CGFloat alpha = offset / 136.0;
    if (alpha == 1) {
        alpha = 0.9;
    }
    UILabel *titleL = (UILabel *)self.navigationItem.titleView;
    titleL.textColor = [UIColor colorWithWhite:0 alpha:alpha];
    UIColor *color = [UIColor colorWithWhite:1 alpha:alpha];
    UIImage *image = [UIImage imageWithColor:color];
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
    
}

#pragma 实现数据源方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *ID = @"ljw";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = @"gggggg";
    return cell;
}

@end
