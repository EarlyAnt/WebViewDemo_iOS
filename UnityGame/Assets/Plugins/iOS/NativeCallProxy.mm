#import <Foundation/Foundation.h>
#import "NativeCallProxy.h"

void CalliOSNativeMethod(int parameter){
    NSLog([@"[iOS Native] I am running: " stringByAppendingString: [NSString stringWithFormat:@"%d", parameter]]);
}
