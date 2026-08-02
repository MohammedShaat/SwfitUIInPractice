//
//  BumbleHomeView.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/2/26.
//

import SwiftUI
import SwiftfulUI

struct BumbleHomeView: View {
    @State private var selected = "Everyone"
    private let options = ["Everyone", "Trending"]
    
    @State private var users: [User] = []
    @State private var likeStatus: [Int: Bool] = [:]
    
    @State private var showChats: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bumbleLightYellow
                    .ignoresSafeArea()
                
                VStack(spacing: 0) {
                    header
                    
                    BumbleFilterVIew(options: options, selected: $selected)
                        .background(
                            RoundedRectangle(cornerRadius: 5)
                                .fill(.bumbleGray.opacity(0.2))
                                .frame(height: 2)
                            ,alignment: .bottom
                        )
                        .padding(.top, 30)
                        .animation(.easeOut(duration: 0.4), value: selected)
                    
                    
                    cardsSection
                }
                .frame(maxWidth: .infinity)
            }
            .task {
                await getData()
            }
            .navigationDestination(isPresented: $showChats) {
                BumbleChatsView()
            }
        }
    }
    
    private func getData() async {
        do {
            let db = DatabaseHelper()
            users = try await db.getUsers()
        } catch {
            print("Failed to get data:\n", error)
        }
    }
    
    private func onSwipeEnded(isRight: Bool, at index: Int) {
        let user  = users[index]
        likeStatus[user.id] = isRight
        users.remove(at: index)
    }
    
    private var header: some View {
        ZStack {
            HStack(spacing: 16) {
                Image(systemName: "line.3.horizontal")
                    .asButton(.press) {
                        showChats.toggle()
                    }
                Image(systemName: "arrow.uturn.backward")
                    .asButton(.press) {
                        
                    }
                Spacer()
            }
            .padding(.leading, 16)
            .font(.title2)
            
            Text("bumble")
                .foregroundStyle(.bumbleYellow)
                .font(.largeTitle.bold())
            
            Image(systemName: "slider.horizontal.3")
                .padding(.trailing, 16)
                .font(.title2)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .fontWeight(.semibold)
        .foregroundStyle(.bumbleBlack)
        .padding(.top)
    }
    
    private var cardsSection: some View {
        ZStack {
            if !users.isEmpty {
                ForEach(Array(users.enumerated()), id: \.element.id) { (index, user) in
                    let top1 = index == 0
                    let top2 = index == 1
                    let top3 = index == 2
                    
                    if top1 || top2 || top3 {
                        BumbleCardView(
                            user: user,
                            onRightSwipe: { onSwipeEnded(isRight: true, at: index) },
                            onLeftSwipe: { onSwipeEnded(isRight: false, at: index) }
                        )
                        .zIndex(Double(3 - index))
                    }
                }
            } else {
                ContentUnavailableView("No data", systemImage: "nosign.app.fill")
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    BumbleHomeView()
}
