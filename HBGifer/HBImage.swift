//
//  HBImage.swift
//  HBGifer
//
//  Created by jianghongbao on 2017/11/23.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

enum HBImageType : Int {
    case unknow = 0
    case JPEG
    case JPEG2000
    case TIFF
    case BMP
    case ICO
    case ICNS
    case GIF
    case PNG
    case WebP
    case Other
}

class HBImage: NSObject {
    
    public var imageData : Data?
    
    
    
    init(imageData:Data) {
        
    }
    
    
    func getSourceType(data:CFData) -> HBImageType {
        let bytes = CFDataGetBytePtr(data)
        if let b = bytes as? UInt8 {
            
        }
            /*
            switch bytes {
            case getBytes_four(a: 0x4D, b: 0x4D, c: 0x00, d: 0x2A):// big endian TIFF
                return .TIFF
            case getBytes_four(a: 0x49, b: 0x49, c: 0x2A, d: 0x00):// little endian TIFF
                return .TIFF
            case getBytes_four(a: 0x00, b: 0x00, c: 0x01, d: 0x00):
                return .ICO
            case getBytes_four(a: 0x00, b: 0x00, c: 0x02, d: 0x00):// CUR
                return .ICO
            case getBytes_four(a: UInt32.init(Unicode.Scalar.init("i")), b: UInt32.init(Unicode.Scalar.init("c")), c: UInt32.init(Unicode.Scalar.init("n")), d: UInt32.init(Unicode.Scalar.init("s"))):
                return .ICNS
            case getBytes_four(a: 0x4D, b: 0x4D, c: 0x00, d: 0x2A):
                return .TIFF
            default:break
            }
             */
        return .unknow
    }
    
    func getBytes_four(a:UInt32,b:UInt32,c:UInt32,d:UInt32) -> UInt32 {
        return (a << 24) | (b << 16) | (c << 8) | (d)
    }
    
    func getBytes_two(a:UInt32,b:UInt32) -> UInt32 {
        return (a << 8) | (b)
    }
}

/*
 #define YY_FOUR_CC(c1,c2,c3,c4) ((uint32_t)(((c4) << 24) | ((c3) << 16) | ((c2) << 8) | (c1)))
 #define YY_TWO_CC(c1,c2) ((uint16_t)(((c2) << 8) | (c1)))
 
 YYImageType YYImageDetectType(CFDataRef data) {
 if (!data) return YYImageTypeUnknown;
 uint64_t length = CFDataGetLength(data);
 if (length < 16) return YYImageTypeUnknown;
 
 const char *bytes = (char *)CFDataGetBytePtr(data);
 
 uint32_t magic4 = *((uint32_t *)bytes);
 switch (magic4) {
 case YY_FOUR_CC(0x4D, 0x4D, 0x00, 0x2A): { // big endian TIFF
 return YYImageTypeTIFF;
 } break;
 
 case YY_FOUR_CC(0x49, 0x49, 0x2A, 0x00): { // little endian TIFF
 return YYImageTypeTIFF;
 } break;
 
 case YY_FOUR_CC(0x00, 0x00, 0x01, 0x00): { // ICO
 return YYImageTypeICO;
 } break;
 
 case YY_FOUR_CC(0x00, 0x00, 0x02, 0x00): { // CUR
 return YYImageTypeICO;
 } break;
 
 case YY_FOUR_CC('i', 'c', 'n', 's'): { // ICNS
 return YYImageTypeICNS;
 } break;
 
 case YY_FOUR_CC('G', 'I', 'F', '8'): { // GIF
 return YYImageTypeGIF;
 } break;
 
 case YY_FOUR_CC(0x89, 'P', 'N', 'G'): {  // PNG
 uint32_t tmp = *((uint32_t *)(bytes + 4));
 if (tmp == YY_FOUR_CC('\r', '\n', 0x1A, '\n')) {
 return YYImageTypePNG;
 }
 } break;
 
 case YY_FOUR_CC('R', 'I', 'F', 'F'): { // WebP
 uint32_t tmp = *((uint32_t *)(bytes + 8));
 if (tmp == YY_FOUR_CC('W', 'E', 'B', 'P')) {
 return YYImageTypeWebP;
 }
 } break;
 /*
 case YY_FOUR_CC('B', 'P', 'G', 0xFB): { // BPG
 return YYImageTypeBPG;
 } break;
 */
 }
 
 uint16_t magic2 = *((uint16_t *)bytes);
 switch (magic2) {
 case YY_TWO_CC('B', 'A'):
 case YY_TWO_CC('B', 'M'):
 case YY_TWO_CC('I', 'C'):
 case YY_TWO_CC('P', 'I'):
 case YY_TWO_CC('C', 'I'):
 case YY_TWO_CC('C', 'P'): { // BMP
 return YYImageTypeBMP;
 }
 case YY_TWO_CC(0xFF, 0x4F): { // JPEG2000
 return YYImageTypeJPEG2000;
 }
 }
 
 // JPG             FF D8 FF
 if (memcmp(bytes,"\377\330\377",3) == 0) return YYImageTypeJPEG;
 
 // JP2
 if (memcmp(bytes + 4, "\152\120\040\040\015", 5) == 0) return YYImageTypeJPEG2000;
 
 return YYImageTypeUnknown;
 }*/
