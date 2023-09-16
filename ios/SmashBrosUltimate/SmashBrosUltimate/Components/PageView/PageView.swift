//
//  PageView.swift
//  SmashBrosUltimate
//
//  Created by Paulo Keller on 20/01/22.
//

import SwiftUI

struct PagingView<Content>: View where Content: View {

    @Binding var index: Int
    let maxIndex: Int
    let content: () -> Content

    @State private var offset = CGFloat.zero
    @State private var dragging = false

    init(index: Binding<Int>, maxIndex: Int, @ViewBuilder content: @escaping () -> Content) {
        self._index = index
        self.maxIndex = maxIndex
        self.content = content
    }

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            GeometryReader { geometry in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        self.content()
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .clipped()
                    }
                }
                .content.offset(x: self.offset(in: geometry), y: 0)
                .frame(width: geometry.size.width, alignment: .leading)
            }
            .clipped()
        }
    }

    func offset(in geometry: GeometryProxy) -> CGFloat {
        if self.dragging {
            return max(min(self.offset, 0), -CGFloat(self.maxIndex) * geometry.size.width)
        } else {
            return -CGFloat(self.index) * geometry.size.width
        }
    }
}
