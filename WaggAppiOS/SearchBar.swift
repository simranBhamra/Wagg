//
//  SearchBar.swift
//  WaggAppiOS
//
//  Created by Simran Bhamra on 4/2/20.
//  Copyright © 2020 Simran Bhamra. All rights reserved.
//

import Foundation
import SwiftUI

struct SearchBar: UIViewRepresentable{
    
    @Binding var text: String
    
    class Coordinator: NSObject,UISearchBarDelegate{
        @Binding var text: String
        
        init(text: Binding<String>){
            _text = text
        }
        
        
        func searchBar(_ searchbar: UISearchBar, textDidChange searchText: String){
            text = searchText
        }
        
    }
    
    func  makeCoordinator() -> SearchBar.Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: UIViewRepresentableContext <SearchBar>) -> UISearchBar{
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text 
    }
    
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
