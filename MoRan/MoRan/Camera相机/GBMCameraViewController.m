//
//  GBMCameraViewController.m
//  MoRan
//
//  Created by leeguoyu on 15/8/23.
//  Copyright (c) 2015年 GeekBand. All rights reserved.
//

#import "GBMCameraViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface GBMCameraViewController ()

@property (strong, nonatomic) AVCaptureSession *captureSession;
@property (strong, nonatomic) AVCaptureDeviceInput *captureDeviceInput;
@property (strong, nonatomic) AVCaptureStillImageOutput *captureStillImageOutput;
@property (strong, nonatomic) AVCaptureVideoPreviewLayer *captureVideoPreviewLayer;

@end

@implementation GBMCameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor yellowColor];
//    
//    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 80, 40)];
//    [backButton setTitle:@"Back" forState:UIControlStateNormal];
//    [backButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [self.view addSubview:backButton];
//    
//    [backButton addTarget:self action:@selector(backButton:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

//- (void)backButton:(UIButton *)backButton{
//    
//    [self dismissViewControllerAnimated:YES completion:nil];
//    
//}

#pragma mark -------设置相机-----------
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //初始化对话
    self.captureSession = [[AVCaptureSession alloc] init];
    if ([self.captureSession canSetSessionPreset:AVCaptureSessionPreset1280x720]) {
        self.captureSession.sessionPreset = AVCaptureSessionPreset1280x720;
    }
    //获取设备
    AVCaptureDevice *captureDevice = [self getCameraDeviceWithPosition:AVCaptureDevicePositionBack];
    if (!captureDevice) {
        NSLog(@"获取摄像头出现问题");
    }
    NSError *error = nil;
    
    //根据输入设备初始化设备输入对象，用于获得输入数据
    self.captureDeviceInput = [[AVCaptureDeviceInput alloc] initWithDevice:captureDevice error:&error];
    if (error) {
        NSLog(@"获取设备时出错，出错原因：%@", error.localizedDescription);
    }
    
    //初始化设备输出对象，用于获得输出数据
    self.captureStillImageOutput = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary *outputSettings = @{AVVideoCodecKey:AVVideoCodecJPEG};
    [self.captureStillImageOutput setOutputSettings:outputSettings];
}

#pragma mark - 私有方法

/**
 *  取得指定位置的摄像头
 *
 *  @param position 摄像头位置
 *
 *  @return 摄像头设备
 */

-(AVCaptureDevice *)getCameraDeviceWithPosition:(AVCaptureDevicePosition )position{
    NSArray *cameras= [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice *camera in cameras) {
        if ([camera position]==position) {
            return camera;
        }
    }
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end


























