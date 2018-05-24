//
//  Shaders.metal
//  MetalSample
//
//  Created by Ken Phanith on 2018/05/24.
//  Copyright © 2018 Quad. All rights reserved.
//\

#include <metal_stdlib>
using namespace metal;

vertex float4 basic_vertex(
    const device packed_float3 * vertex_array [[ buffer(0) ]],
                           unsigned int vid [[ vertex_id ]]) {
    return float4(vertex_array[vid], 1.0);
}

fragment half4 basic_fragment() {
    return half4(1.0);
}
