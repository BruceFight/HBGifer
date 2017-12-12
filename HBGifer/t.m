//
//  t.m
//  HBGifer
//
//  Created by jianghongbao on 2017/11/28.
//  Copyright © 2017年 apple. All rights reserved.
//

#import "t.h"



@implementation t

//YYImageType YYImageDetectType(CFDataRef data) {
//    if (!data) return YYImageTypeUnknown;
//    uint64_t length = CFDataGetLength(data);
//    if (length < 16) return YYImageTypeUnknown;
//
//    const char *bytes = (char *)CFDataGetBytePtr(data);
//
//    uint32_t magic4 = *((uint32_t *)bytes);
//    switch (magic4) {
//        case YY_FOUR_CC(0x4D, 0x4D, 0x00, 0x2A): { // big endian TIFF
//            return YYImageTypeTIFF;
//        } break;
//
//        case YY_FOUR_CC(0x49, 0x49, 0x2A, 0x00): { // little endian TIFF
//            return YYImageTypeTIFF;
//        } break;
//
//        case YY_FOUR_CC(0x00, 0x00, 0x01, 0x00): { // ICO
//            return YYImageTypeICO;
//        } break;
//
//        case YY_FOUR_CC(0x00, 0x00, 0x02, 0x00): { // CUR
//            return YYImageTypeICO;
//        } break;
//
//        case YY_FOUR_CC('i', 'c', 'n', 's'): { // ICNS
//            return YYImageTypeICNS;
//        } break;
//
//        case YY_FOUR_CC('G', 'I', 'F', '8'): { // GIF
//            return YYImageTypeGIF;
//        } break;
//
//        case YY_FOUR_CC(0x89, 'P', 'N', 'G'): {  // PNG
//            uint32_t tmp = *((uint32_t *)(bytes + 4));
//            if (tmp == YY_FOUR_CC('\r', '\n', 0x1A, '\n')) {
//                return YYImageTypePNG;
//            }
//        } break;
//
//        case YY_FOUR_CC('R', 'I', 'F', 'F'): { // WebP
//            uint32_t tmp = *((uint32_t *)(bytes + 8));
//            if (tmp == YY_FOUR_CC('W', 'E', 'B', 'P')) {
//                return YYImageTypeWebP;
//            }
//        } break;
//
//    }
//    uint16_t magic2 = *((uint16_t *)bytes);
//    switch (magic2) {
//        case YY_TWO_CC('B', 'A'):
//        case YY_TWO_CC('B', 'M'):
//        case YY_TWO_CC('I', 'C'):
//        case YY_TWO_CC('P', 'I'):
//        case YY_TWO_CC('C', 'I'):
//        case YY_TWO_CC('C', 'P'): { // BMP
//            return YYImageTypeBMP;
//        }
//        case YY_TWO_CC(0xFF, 0x4F): { // JPEG2000
//            return YYImageTypeJPEG2000;
//        }
//    }
//
//    // JPG             FF D8 FF
//    if (memcmp(bytes,"\377\330\377",3) == 0) return YYImageTypeJPEG;
//    
//    // JP2
//    if (memcmp(bytes + 4, "\152\120\040\040\015", 5) == 0) return YYImageTypeJPEG2000;
//
//    return YYImageTypeUnknown;
//}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)vao{
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:@'j'];
    NSLog(@"%@", array);
}
@end
