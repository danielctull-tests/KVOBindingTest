//
//  ViewController.m
//  KVOBindingTest
//
//  Created by Daniel Tull on 05.05.2013.
//  Copyright (c) 2013 Daniel Tull. All rights reserved.
//

#import "ViewController.h"
#import "ModelObject.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

void* ViewControllerSliderContext = &ViewControllerSliderContext;

@interface ViewController ()
@property (nonatomic, strong) ModelObject *modelObject;
@property (nonatomic, weak) IBOutlet UISlider *slider;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.modelObject = [ModelObject new];
	RAC(self.slider.value) = [RACAble(self.modelObject.value) distinctUntilChanged];
	RAC(self.modelObject.value) = [RACAble(self.slider.value) distinctUntilChanged];
}

@end
