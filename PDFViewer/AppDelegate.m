#import "AppDelegate.h"
#import <Quartz/Quartz.h>
@interface AppDelegate ()
@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet PDFView *view;
@end
@implementation AppDelegate
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [_view setDisplayMode:kPDFDisplayTwoUp];
    [_view setDisplaysRTL:YES];
}
- (void)applicationWillTerminate:(NSNotification *)aNotification {
}
- (void)openDocument:(id)sender
{
    NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setAllowsMultipleSelection:NO];
    [panel setCanChooseDirectories:NO];
    NSModalResponse ret= [panel runModal];
    if (ret == NSModalResponseCancel) return;
    [_view setDocument:[[PDFDocument alloc] initWithURL:[panel URL]]];
    [_view setAutoScales:YES];
    [_view setDisplaysPageBreaks:NO];
}
- (IBAction)toggleAsBook:(id)sender
{
    [_view setDisplaysAsBook:![_view displaysAsBook]];
}
@end
