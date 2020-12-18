//
//  ViewController.m
//  SimplePlayer
//
//  Created by Andreu Santaren on 18/12/2020.
//

#import "ViewController.h"
#import <NewRelicVideoCore/NewRelicVideoAgent.h>
#import <NewRelicVideoCore/NRVideoTracker.h>
#import <NRAVPlayerTracker/AVPlayerTracker.h>

@import AVKit;

@interface ViewController ()

@property (nonatomic) AVPlayerViewController *playerController;
@property (nonatomic) NSNumber *trackerId;

@end

@implementation ViewController

- (IBAction)clickBunnyVideo:(id)sender {
    [self playVideo:@"http://docs.evostream.com/sample_content/assets/hls-bunny-rangerequest/playlist.m3u8"];
}

- (IBAction)clickSintelVideo:(id)sender {
    [self playVideo:@"https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8"];
}

- (IBAction)clickAirshowLive:(id)sender {
    [self playVideo:@"http://cdn3.viblast.com/streams/hls/airshow/playlist.m3u8"];
}

- (IBAction)clickGearExample:(id)sender {
    [self playVideo:@"https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_16x9/bipbop_16x9_variant.m3u8"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NewRelicVideoAgent sharedInstance] setLogging:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.playerController.isBeingDismissed) {
        //Send END
        [(NRVideoTracker *)[[NewRelicVideoAgent sharedInstance] contentTracker:self.trackerId] sendEnd];
        
        //Stop tracking
        [[NewRelicVideoAgent sharedInstance] releaseTracker:self.trackerId];
    }
}

- (void)playVideo:(NSString *)videoURL {
    AVPlayer *player = [AVPlayer playerWithURL:[NSURL URLWithString:videoURL]];
    self.playerController = [[AVPlayerViewController alloc] init];
    self.playerController.player = player;
    self.playerController.showsPlaybackControls = YES;
    
    self.trackerId = [[NewRelicVideoAgent sharedInstance] startWithContentTracker:[[AVPlayerTracker alloc] initWithAVPlayer:self.playerController.player]];
    
    [self presentViewController:self.playerController animated:YES completion:^{
        [self.playerController.player play];
    } ];
}


@end
