//
//  AYViewController.m
//  AYSlidingPickerView
//
//  Created by Ayan Yenbekbay on 11/18/2015.
//  Copyright (c) 2015 Ayan Yenbekbay. All rights reserved.
//

#import "AYViewController.h"

#import <AYSlidingPickerView/AYSlidingPickerView.h>

@interface AYViewController ()

@property (nonatomic) AYSlidingPickerView *pickerView;

@end

@implementation AYViewController

#pragma mark Lifecycle

- (void)viewDidLoad {
  [super viewDidLoad];
  self.navigationItem.title = @"Tap to select color";
  [self setUpPickerView];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.navigationController.navigationBar.translucent = NO;
  self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
  self.navigationController.navigationBar.titleTextAttributes = @{
    NSForegroundColorAttributeName : [UIColor whiteColor]
  };
  [self.pickerView addGestureRecognizersToNavigationBar:self.navigationController.navigationBar];
}

#pragma mark Private

- (void)setUpPickerView {
  NSDictionary *colors = @{
    @"Red" : [UIColor colorWithRed:0.91f green:0.3f blue:0.24f alpha:1],
    @"Green" : [UIColor colorWithRed:0.18f green:0.8f blue:0.44f alpha:1],
    @"Blue" : [UIColor colorWithRed:0.2f green:0.6f blue:0.86f alpha:1],
    @"Magenta" : [UIColor colorWithRed:0.61f green:0.35f blue:0.71f alpha:1],
    @"Yellow" : [UIColor colorWithRed:1 green:0.8f blue:0 alpha:1]
  };

  NSMutableArray *items = [[NSMutableArray alloc] initWithCapacity:colors.count];
  for (NSString *color in colors) {
    AYSlidingPickerViewItem *item = [[AYSlidingPickerViewItem alloc] initWithTitle:color handler:^(BOOL completed) {
      self.view.backgroundColor = colors[color];
      self.navigationController.navigationBar.barTintColor = [self darkerColorForColor:self.view.backgroundColor];
    }];
    [items addObject:item];
  }

  self.pickerView = [AYSlidingPickerView sharedInstance];
  self.pickerView.mainView = self.view;
  self.pickerView.items = items;
  self.pickerView.selectedIndex = 1;
  self.pickerView.closeOnSelection = YES;
  self.pickerView.willAppearHandler = ^{
    NSLog(@"Picker is going to open!");
  };
  self.pickerView.willDismissHandler = ^{
    NSLog(@"Picker is going to close!");
  };
  self.pickerView.didAppearHandler = ^{
    NSLog(@"Picker is opened!");
  };
  self.pickerView.didDismissHandler = ^{
    NSLog(@"Picker is dismissed");
  };

  self.view.backgroundColor = colors[[colors allKeys][self.pickerView.selectedIndex]];
  self.navigationController.navigationBar.barTintColor = [self darkerColorForColor:self.view.backgroundColor];
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self.pickerView action:@selector(show)];
}

#pragma mark Helpers

- (UIColor *)darkerColorForColor:(UIColor *)color {
  CGFloat r, g, b, a;
  if ([color getRed:&r green:&g blue:&b alpha:&a]) {
    return [UIColor colorWithRed:MAX(r - 0.2f, 0) green:MAX(g - 0.2f, 0) blue:MAX(b - 0.2f, 0) alpha:a];
  }
  return nil;
}

@end
