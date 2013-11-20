//
//  NTAlbumViewController.m
//  NTImagePicker
//
//  Created by FFF on 13-11-20.
//  Copyright (c) 2013年 Liu Zhuang. All rights reserved.
//

#import "NTAlbumViewController.h"
#import "AlbumTableDataSource.h"
#import "NTPhotosViewController.h"

@import AssetsLibrary;

@interface NTAlbumViewController ()
{
    AlbumTableDataSource *_dataSource;

    ALAssetsLibrary *_assetsLibrary;
}

@end

@implementation NTAlbumViewController

- (id)init {
    
    if (self = [super init]) {
        self.view.backgroundColor = [UIColor whiteColor];
        _albums = [@[] mutableCopy];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupTableView];
    
    [self getPhotoAlbums];
    
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NTPhotosViewController *photoVC = [[NTPhotosViewController alloc] init];
    photoVC.group = self.albums[indexPath.row];
    [self.navigationController pushViewController:photoVC animated:YES];
}


#pragma mark - Private


- (void)getPhotoAlbums
{
    if (!_assetsLibrary) {
        _assetsLibrary  = [[ALAssetsLibrary alloc] init];
    }
    
    __unsafe_unretained NTAlbumViewController * bself = self;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        [_assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
            
            if (group) {
                [bself.albums addObject:group];
            }
            if (stop) {
                _dataSource.dataSource = self.albums;
                [_tableView reloadData];
            }
            
        } failureBlock:^(NSError *error) {
#pragma TODO ---
        }];
        
    });
    
}

- (void)registerObserver
{
    [self addObserver:self forKeyPath:@"_dataSource.dataSource.count" options:NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew context:nil];
}

- (void)setupTableView
{   
    _dataSource = [AlbumTableDataSource new];
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = _dataSource;
    _tableView.delegate = self;
    _tableView.rowHeight = 70;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CELL_IDENTIFIER];
    [self.view addSubview:_tableView];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"_dataSource.dataSource"]) {
        [_tableView reloadData];
    }
}

- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"_dataSource.dataSource"];
    
    
}

@end
