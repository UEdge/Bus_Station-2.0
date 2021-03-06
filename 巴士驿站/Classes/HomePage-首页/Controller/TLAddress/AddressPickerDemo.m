//
//  AddressPickerDemo.m
//  BAddressPickerDemo
//
//  Created by 林洁 on 16/1/13.
//  Copyright © 2016年 onlylin. All rights reserved.
//

#import "AddressPickerDemo.h"
#import "BAddressPickerController.h"
#import "TLHomePageViewController.h"
#import "TLOrderDetailTableViewController.h"
@interface AddressPickerDemo ()<BAddressPickerDelegate,BAddressPickerDataSource>

@end

@implementation AddressPickerDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //适配ios7
    
    if( ([[[UIDevice currentDevice] systemVersion] doubleValue]>=7.0))
    {
        self.navigationController.navigationBar.translucent = NO;
    }
    BAddressPickerController *addressPickerController = [[BAddressPickerController alloc] initWithFrame:self.view.frame setHomePage:_selectHomePageView setOrderDetail:_selectOrderDetailView];
    addressPickerController.dataSource = self;
    addressPickerController.delegate = self;
    
    [self addChildViewController:addressPickerController];
    [self.view addSubview:addressPickerController.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - BAddressController Delegate
- (NSArray*)arrayOfHotCitiesInAddressPicker:(BAddressPickerController *)addressPicker{
    NSLog(@"%@----%@",_selectOrderDetailView,_selectHomePageView);
    if ([_selectOrderDetailView isEqualToString:@"1"]) {
        return @[@"方城站",@"南阳站",@"南召站",@"西峡站"];
    }
    else if ([_selectHomePageView isEqualToString:@"2"])
    {
    return @[@"北京",@"上海",@"深圳",@"杭州",@"广州",@"武汉",@"天津",@"重庆",@"成都",@"苏州"];
    }
    else
    {
        return @[@""];
    }
}


- (void)addressPicker:(BAddressPickerController *)addressPicker didSelectedCity:(NSString *)city{
    self.siteBlock(city);
    [self.navigationController popViewControllerAnimated:YES ];
}

- (void)beginSearch:(UISearchBar *)searchBar{
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)endSearch:(UISearchBar *)searchBar{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
