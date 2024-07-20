//
//  ViewModel.swift
//  ImpactGenerator
//
//  Created by Seunghun on 7/20/24.
//

import Combine
import UIKit

final class ViewModel: ObservableObject {
    private var feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
    @Published var feedbackType: FeedbackType = .heavy
    @Published var intensity: Float = .zero
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        bind()
    }
    
    private func bind() {
        $feedbackType
            .sink { [weak self] type in
                self?.feedbackGenerator = UIImpactFeedbackGenerator(style: type.feedbackStyle)
            }
            .store(in: &cancellables)
        
        $intensity
            .map { CGFloat($0) }
            .sink { [weak self] intensity in
                self?.feedbackGenerator.prepare()
                self?.feedbackGenerator.impactOccurred(intensity: intensity)
            }
            .store(in: &cancellables)
    }
}

extension FeedbackType {
    var feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle {
        switch self {
        case .heavy: return .heavy
        case .light: return .light
        case .medium: return .medium
        case .rigid: return .rigid
        case .soft: return .soft
        }
    }
}
