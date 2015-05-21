//
//  ViewController.m
//  UImageViewExample
//
//  Created by Xiaodong Jiang on 5/14/15.
//  Copyright (c) 2015 jxdwinter. All rights reserved.
//

#import "ViewController.h"

#import <Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface ViewController ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.imageView = [[UIImageView alloc] init];
    self.imageView.clipsToBounds = YES;
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_top).with.offset(10.0);
        make.left.equalTo(self.view.mas_left).with.offset(10.0);
    }];
    //http://7xi9xh.com1.z0.glb.clouddn.com/Screen_Shot.png
    //http://7xi9xh.com1.z0.glb.clouddn.com/1.png
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:@"http://7xi9xh.com1.z0.glb.clouddn.com/1.png"]
                      placeholderImage:nil
                             completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                 if (!error) {
                                     CGFloat width = .0;
                                     CGFloat height = .0;
                                     if (image.size.width > image.size.height) {
                                         if (image.size.width >= 200.0) {
                                             width = 200.0;
                                             height = 200.0 * image.size.height / image.size.width;
                                         }else{
                                             width = image.size.width;
                                             height = image.size.height;
                                         }
                                     }else{
                                         if (image.size.height >= 200.0) {
                                             width = 200.0 * image.size.width / image.size.height;
                                             height = 200.0;
                                         }else{
                                             width = image.size.width;
                                             height = image.size.height;
                                         }
                                     }
                                     [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                                         make.width.equalTo(@(width));
                                         make.height.equalTo(@(height));
                                     }];
                                 }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
