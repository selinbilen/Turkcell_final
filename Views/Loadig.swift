//
//  Loadig.swift
//  TurkcellFinal
//
//  Created by selin eylül bilen on 2/20/21.
//
// the purpose of this view is to act as a container for the activity indicator view
//when we load the data from the network and if an error occurs;

import SwiftUI

struct Loadig: View {
    
    let isLoad: Bool
    let error: NSError?
    let retryAction: (() -> ())?
    
    var body: some View {
        Group {
            if isLoad {
                HStack {
                    Spacer()
                    ActivityIndicatorView()
                    Spacer()
                }
            } else if error != nil {
                HStack {
                    Spacer()
                    VStack(spacing: 4) {
                        Text(error!.localizedDescription).font(.headline)
                        if self.retryAction != nil {
                            Button(action: self.retryAction!) {
                                Text("Retry")
                            }
                            .foregroundColor(Color.blue)
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}

struct Loading_Previews: PreviewProvider {
    static var previews: some View {
        Loadig(isLoad: true, error: nil, retryAction: nil)
    }
}
