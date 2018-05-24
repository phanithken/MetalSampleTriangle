//
//  ViewController.swift
//  MetalSample
//
//  Created by Ken Phanith on 2018/05/24.
//  Copyright © 2018 Quad. All rights reserved.
//

import Metal
import QuartzCore
import UIKit

class ViewController: UIViewController {

    var device: MTLDevice! = nil // this is represent the GPU
    var metalLayer: CAMetalLayer!
    var vertexBuffer: MTLBuffer! = nil
    
    let vertexData: [Float] = [
        0.0, 0.5, 0.0,
        -0.5, -0.5, 0.0,
        0.5, -0.5, 0.0
    ]

}


// MARK: - LIFECYCLE
extension ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        device = MTLCreateSystemDefaultDevice()
        
        metalLayer = CAMetalLayer()
        metalLayer.device = device
        metalLayer.pixelFormat = .bgra8Unorm
        metalLayer.framebufferOnly = true
        metalLayer.frame = view.layer.frame
        
        let dataSize = vertexData.count * MemoryLayout.size(ofValue: vertexData[0])
        vertexBuffer = device.makeBuffer(bytes: vertexData, length: dataSize, options: .storageModePrivate)
        
        view.layer.addSublayer(metalLayer)
        
    }
    
}
