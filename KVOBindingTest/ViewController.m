//
//  ViewController.m
//  KVOBindingTest
//
//  Created by Daniel Tull on 05.05.2013.
//  Copyright (c) 2013 Daniel Tull. All rights reserved.
//

#import "ViewController.h"
#import "ModelObject.h"

void* ViewControllerSliderContext = &ViewControllerSliderContext;

@interface ViewController ()
@property (nonatomic, strong) ModelObject *modelObject;
@property (nonatomic, weak) IBOutlet UISlider *slider;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.modelObject = [ModelObject new];
	
	[self.slider addObserver:self
				  forKeyPath:@"value"
					 options:NSKeyValueObservingOptionNew
					 context:ViewControllerSliderContext];
	
	[self.modelObject addObserver:self
					   forKeyPath:@"value"
						  options:NSKeyValueObservingOptionNew
						  context:ViewControllerSliderContext];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
					  ofObject:(id)object
						change:(NSDictionary *)change
					   context:(void *)context {
		
	if (context != ViewControllerSliderContext) {
		[super observeValueForKeyPath:keyPath
							 ofObject:object
							   change:change
							  context:context];
		return;
	}
	
	float value = [[change objectForKey:@"new"] floatValue];
	
	if (self.slider.value != value)
		self.slider.value = value;
	
	if (self.modelObject.value != value)
		self.modelObject.value = value;
}

@end
