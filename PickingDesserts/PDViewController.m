//
//  PDViewController.m
//  PickingDesserts
//
//  Created by Brandon Beecroft on 9/27/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "PDViewController.h"

@interface PDViewController () <UIPickerViewDelegate, UIPickerViewDataSource>
@property (nonatomic, strong) UILabel *selectLabel;

@end

@implementation PDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIPickerView *pickerView = [[UIPickerView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:pickerView];

    pickerView.dataSource = self;
    pickerView.delegate = self;

    _selectLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 300, self.view.frame.size.width, 50)];
    _selectLabel.text = @"text here";
    [self.view addSubview:_selectLabel];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Picker View datasource methods
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return [self data].count;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    // return the data array then...get the components count
    // the fruits array is a component, the liquids and desserts are also components;
    return [[self data][component]count];
}


#pragma mark - Picker View delegate methods
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    // call the data method, then look at the components of data and it loops through each row in the component and returns the name.
    return [self data][component][row];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    _selectLabel.text = [NSString stringWithFormat:@"%@ %@ %@",[self data][0][[pickerView selectedRowInComponent:0]],[self data][1][[pickerView selectedRowInComponent:1]],[self data][2][[pickerView selectedRowInComponent:2]]  ];
}


#pragma mark - Picker View Data Arrays
- (NSArray *)data {

    return @[
             [self fruits],
             [self liquids],
             [self desserts]
             ];
}

- (NSArray *)fruits {

    return @[@"banana",
             @"orange",
             @"apple"];
}

- (NSArray *)liquids {
    return @[@"milk",
             @"soda",
             @"coffee"];
}

- (NSArray *)desserts {
    return @[@"shake",
             @"sundae",
             @"cookie"];
}

@end
