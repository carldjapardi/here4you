//
//  CareTakerCard.swift
//  here4you
//
//  Created by Carl on 12/7/25.
//

import SwiftData
import SwiftUI

struct CareTakerCard: View {
    let careTaker: CareTaker
    let onTap: () -> Void
    
    var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 12) {
                HStack {
                    circleComponent
                    VStack(alignment: .leading, spacing: 4) {
                        Text(careTaker.name)
                            .font(.title2).fontWeight(.bold).foregroundColor(.primary)
                        
                        Text("Available")
                            .font(.subheadline).foregroundColor(.green)
                    }.padding(.leading, 8)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(.secondary).padding(.trailing, 8)
                }
                
                Text(careTaker.desc)
                    .font(.body).foregroundColor(.secondary).lineLimit(2).multilineTextAlignment(.leading)
            }
            .padding(20)
            .background {cardBackground}
        }
        .buttonStyle(.plain)
    }
    
    private var circleComponent: some View {
        Circle()
            .fill(Color.blue.gradient)
            .frame(width: 50, height: 50)
            .overlay {
                Text(String(careTaker.name.prefix(1)))
                    .font(.title2).fontWeight(.semibold).foregroundColor(.white)
            }
    }
    
    private var cardBackground: some View {
        RoundedRectangle(cornerRadius: 32)
            .fill(Color(.systemBackground))
            .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    ContentView()
        .modelContainer(SampleData.shared.modelContainer)
}
