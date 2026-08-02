//
//  BumbleCardView.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/3/26.
//

import SwiftUI
import SwiftfulUI

struct BumbleCardView: View {
    let user: User
    
    var onComplimentClicked: (() -> Void)? = nil
    var onFavoriteClicked: (() -> Void)? = nil
    var onReportClicked: (() -> Void)? = nil
    var onRightSwipe: (() -> Void)? = nil
    var onLeftSwipe: (() -> Void)? = nil
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]
    
    @State private var containerWidth: Double = 0
    @State private var xOffset: Double = 0
    
    var body: some View {
        ZStack {
            ZStack {
                ScrollView {
                    LazyVStack {
                        profileImageSection
                        
                        bioSection

                        basicsAndInterestsSection
                        
                        imagesSection
                        
                        locationSection
                        
                        swipeSection
                        
                        reportSection
                    }
                }
                .background(.bumbleWhite)
                .shadow(radius: 5)
                .clipShape(.rect(cornerRadius: 15))
                
                floatingFavorite
            }
            .offset(x: xOffset)
            .rotationEffect(.degrees(xOffset / 20))
            
            animatedSwipeGesture
        }
        .highPriorityGesture(
            DragGesture(minimumDistance: 50)
            .onChanged({ value in
                xOffset = value.translation.width
            })
            
            .onEnded({ value in
                withAnimation(.spring(duration: 0.6, bounce: 0.5)) {
                    guard abs(xOffset) > 70 else {
                        xOffset = 0
                        return
                    }
                    if xOffset > 0 {
                        xOffset += containerWidth * 2
                        onRightSwipe?()
                    } else {
                        xOffset -= containerWidth * 2
                        onLeftSwipe?()
                    }
                }
            })
        )
        .readingFrame { frame in
            containerWidth = frame.size.width
        }
    }
    
    private var profileImageSection: some View {
        ZStack(alignment: .bottom) {
            ImageLoaderView(urlString: user.image, contentMode: .fill)
                .containerRelativeFrame(.vertical) { height, _ in height }
                .background(.bumbleWhite)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("\(user.firstName), \(user.age)")
                    .font(.largeTitle.bold())
                
                Label {
                    Text(user.work)
                } icon: {
                    Image(systemName: "briefcase")
                }
                
                Label {
                    Text(user.study)
                } icon: {
                    Image(systemName: "graduationcap")
                }
                
                BumbleHeartMessageView()
                    .circleIcon(padding: 10)
                    .asButton(.press) {
                        onComplimentClicked?()
                    }
            }
            .padding(30)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                LinearGradient(colors: [.bumbleBlack.opacity(0), .bumbleBlack.opacity(0.8)], startPoint: .top, endPoint: .bottom)
            )
        }
    }
    
    private var bioSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("About Me")
                .foregroundStyle(.bumbleGray)
            
            Text(user.bio)
                .foregroundStyle(.bumbleBlack)
            
            BumbleChipView(
                title: "Send A Compliment",
                image: BumbleHeartMessageView(),
                backgroundColor: .bumbleYellow
            )
            .asButton(.press, action: {
                onComplimentClicked?()
            })
                .font(.default)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.headline)
        .padding()
    }
    
    private var basicsAndInterestsSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 0) {
                Text("My Basics")
                    .foregroundStyle(.bumbleGray)
                
                NonLazyVGrid(columns: 2, alignment: .leading, items: user.basics) { basic in
                    if let basic {
                        BumbleChipView(title: basic.name, image: Image(systemName: basic.iconName ?? "exclamationmark"))
                    } else {
                        EmptyView()
                    }
                }
            }
            
            
            VStack(alignment: .leading, spacing: 0) {
                Text("My Interests")
                    .foregroundStyle(.bumbleGray)
                
                NonLazyVGrid(columns: 2, alignment: .leading, items: user.interests) { basic in
                    if let basic {
                        BumbleChipView(title: basic.name)
                    } else {
                        EmptyView()
                    }
                }
            }
        }
        .padding()
    }
    
    private var imagesSection: some View {
        LazyVStack(spacing: 0) {
            ForEach(user.images, id: \.self) { imageUlr in
                ImageLoaderView(urlString: imageUlr, contentMode: .fill)
                    .containerRelativeFrame(.vertical) { height, _ in
                        height
                    }
            }
        }
        .padding(.vertical, 30)
    }
    
    private var locationSection: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label("\(user.firstName)'s Location", systemImage: "mappin.and.ellipse.circle.fill")
                .foregroundStyle(.bumbleGray)
                
            Text("\(user.distance) miles away")
            
            BumbleChipView(title: "\(user.countryFlag) Lives in \(user.address)")
        }
        .padding(30)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var swipeSection: some View {
        HStack {
            Image(systemName: "xmark")
                .circleIcon()
                .asButton(.press) {
                    onLeftSwipe?()
                }
            
            Spacer()
            
            Image(systemName: "checkmark")
                .circleIcon()
                .asButton(.press) {
                    onRightSwipe?()
                }
        }
        .padding(.horizontal, 30)
    }
    
    private var reportSection: some View {
        Text("Hide and Report")
            .foregroundStyle(.bumbleGray)
            .font(.headline)
            .padding(.vertical, 60)
            .asButton(.press) {
                onReportClicked?()
            }
    }
    
    private var floatingFavorite: some View {
        ZStack {
            Image(systemName: "hexagon.fill")
                .font(.system(size: 60))
                .foregroundStyle(.bumbleYellow)
            Image(systemName: "star.fill")
                .font(.system(size: 30).bold())
        }
        .padding(30)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        .asButton(.press) {
            onFavoriteClicked?()
        }
    }
    
    private var animatedSwipeGesture: some View {
        Group {
            let hPadding = containerWidth / 10
            let initialOffset = containerWidth / 2
            var swipeOffset: Double {
                abs(xOffset) > containerWidth * 2 ? 0 : xOffset
            }
            
            Image(systemName: "checkmark")
                .circleIcon(backgroundColor: .bumbleGray.opacity(0.6))
                .padding(.trailing, hPadding)
                .scaleEffect(abs(swipeOffset) > 80 ? 1.4 : 1)
                .animation(.spring(duration: 1, bounce: 0.2), value: xOffset)
                .offset(x: initialOffset)
                .offset(x: max(-swipeOffset * 2, -initialOffset))
                .frame(maxWidth: .infinity, alignment: .trailing)
            
            
            Image(systemName: "xmark")
                .circleIcon(backgroundColor: .bumbleGray.opacity(0.6))
                .padding(.leading, hPadding)
                .scaleEffect(abs(swipeOffset) > 80 ? 1.4 : 1)
                .animation(.spring(duration: 1, bounce: 0.2), value: xOffset)
                .offset(x: -initialOffset)
                .offset(x: min(-swipeOffset * 2, initialOffset))
                .frame(maxWidth: .infinity, alignment: .leading)
                .animation(.spring(duration: 1, bounce: 0.2), value: xOffset)
        }
    }
}

#Preview {
    BumbleCardView(user: sampleUser)
        .bumbleTheme()
        .padding()
}
