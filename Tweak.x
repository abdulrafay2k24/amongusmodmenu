#import <UIKit/UIKit.h>

%hook SpringBoard

- (void)applicationDidFinishLaunching:(id)application {
    %orig;

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Mod Menu"
                                                                       message:@"Tweak is working!"
                                                                preferredStyle:UIAlertControllerStyleAlert];

        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"OK"
                                                     style:UIAlertActionStyleDefault
                                                   handler:nil];
        [alert addAction:ok];

        UIViewController *root = [UIApplication sharedApplication].keyWindow.rootViewController;
        [root presentViewController:alert animated:YES completion:nil];
    });
}

%end
