//
//  BumbleChatsView.swift
//  SwfitUIInPractice
//
//  Created by Mohammed on 8/4/26.
//

import SwiftUI
import SwiftfulUI

struct BumbleChatsView: View {
    @State private var users: [User] = []
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            Color.bumbleWhite
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                
                matchedQueueSection
                
                recentchatsSection
            }
        }
        .task {
            await getData()
        }
        .toolbarVisibility(.hidden, for: .navigationBar)
    }
    
    private func getData() async {
        do {
            let db = DatabaseHelper()
            users = try await db.getUsers()
        } catch {
            print("Failed to get users:\n", error)
        }
    }
    
    private var header: some View {
        HStack {
            Image(systemName: "line.3.horizontal")
                .asButton(.press) {
                    dismiss()
                }
            Spacer()
            Image(systemName: "magnifyingglass")
                .asButton(.press) {
                    
                }
        }
        .font(.title2)
        .fontWeight(.semibold)
        .foregroundStyle(.bumbleBlack)
        .padding(16)
        .padding(.top)
    }
    
    private var matchedQueueSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack(spacing: 0) {
                Text("Matched Queue ")
                
                Text("(\(users.count))")
                    .foregroundStyle(.bumbleGray)
            }
            .font(.title3)
            .padding(.horizontal)
            
            ScrollView(.horizontal) {
                LazyHStack(spacing: 16) {
                    ForEach(users) { user in
                        BumbleCircleProgressView(imageUrlString: user.image, strokeEnd: user.storyProgress, isActive: user.isActive)
                            .frame(width: 80, height: 80)
                    }
                }
                .padding(.horizontal)
            }
            .frame(height: 110)
        }
        .scrollIndicators(.hidden)
    }
    
    private var recentchatsSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                HStack(spacing: 0) {
                    Text("Chats ")
                    Text("(Recent)")
                        .foregroundStyle(.bumbleGray)
                }
                Spacer()
                Image(systemName: "line.3.horizontal.decrease")
            }
            .font(.title3)
            .padding([.horizontal, .top])
            
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(users) { user in
                        BumbleChatItemView(
                            imageUrlString: user.image,
                            name: user.firstName,
                            lastMessage: user.lastMessage,
                            storyProgress: user.storyProgress,
                            hasReplied: user.replied,
                            isActive: user.isActive
                        )
                    }
                }
                .padding()
            }
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    BumbleChatsView()
}
