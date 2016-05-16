//
//  ViewController.m
//  Example
//
//  Created by 马权 on 3/21/16.
//  Copyright © 2016 马权. All rights reserved.
//

#import "ViewController.h"
#import "ExCustomTableViewCell.h"
#import "MSDImageDownloadGroupManage.h"
@import SDWebImage;

static NSString *randomPicURL = @"http://7xr4g8.com1.z0.glb.clouddn.com/";

@interface ViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clearCache:(id)sender {
    [[SDImageCache sharedImageCache] clearMemory];
    [[SDImageCache sharedImageCache] clearDisk];
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"customCell";
    
    ExCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    NSURL *sdImageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%ld", randomPicURL, (long)indexPath.row]];

    NSURL *msdImageURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@%ld", randomPicURL, (long)indexPath.row + 100]];
    
    [cell setImageWithURLs:@[sdImageURL, msdImageURL]];
    
    return cell;
}

@end
