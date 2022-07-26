//
//  ContentView.swift
//  TheCatShow
//
//  Created by Nasim Ahmed on 20.07.22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var breedFetcher = BreedFetcher()
    
    var body: some View {
        if breedFetcher.isLoading == true{
            LoadingView()
        }else if breedFetcher.errorMessage != nil{
            ErrorView(breedFetcher: breedFetcher)
        }else{
            BreedListView(breeds: breedFetcher.breeds)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
