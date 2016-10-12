//
//  ViewController.m
//  TableViewAction
//
//  Created by Liszt on 16/9/1.
//  Copyright © 2016年 Liszt-iOS开发:98787555. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
/** tableView*/
@property (strong, nonatomic, readwrite) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.tableView];
}

#pragma mark - 懒加载
- (UITableView *)tableView{
    if(!_tableView){
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}
- (NSArray *)data{
    return @[@"写字楼里写字间,写字间里程序员",@"程序人员写程序,又拿程序换酒钱",@"酒醒只在网上坐,酒醉还来网下眠",@"酒醉酒醒日复日,网上网下年复年",@"但愿老死电脑间,不愿鞠躬老板前",@"奔驰宝马贵者趣,公交自行程序员",@"奔驰宝马贵者趣,公交自行程序员",@"别人笑我忒疯癫,我笑自己命太贱",@"不见满街漂亮妹,哪个归得程序员"];
}

#pragma mark - TableView DataSource and Delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.data count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"iOS开发:98787555";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.data[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:14.f];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50.f;
}
-(NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath{
    void(^rowActionHandler)(UITableViewRowAction *, NSIndexPath *) = ^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [[[UIAlertView alloc]initWithTitle:@"点击了删除" message:@"Lester邀请你加入iOS高级研发群:98787555" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil] show];
        [tableView reloadData];
    };
    void(^rowActionHandler1)(UITableViewRowAction *, NSIndexPath *) = ^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [[[UIAlertView alloc]initWithTitle:@"点击了其他" message:@"Lester邀请你加入iOS高级研发群发:98787555" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil] show];
        [tableView reloadData];
    };
    void(^rowActionHandler2)(UITableViewRowAction *, NSIndexPath *) = ^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        [[[UIAlertView alloc]initWithTitle:@"点击了收藏" message:@"Lester邀请你加入iOS高级研发群:98787555" delegate:nil cancelButtonTitle:@"好的" otherButtonTitles:nil, nil] show];
        [tableView reloadData];
    };
    
    UITableViewRowAction *action1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:rowActionHandler];
    action1.backgroundColor = [UIColor redColor];
    UITableViewRowAction *action2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"其他" handler:rowActionHandler1];
    action2.backgroundColor = [UIColor lightGrayColor];
    UITableViewRowAction *action3 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"收藏" handler:rowActionHandler2];
    action3.backgroundColor = [UIColor orangeColor];
    
    return @[action1,action3,action2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
