//
//  ContentView.swift
//  XOgame
//
//  Created by Mariam2 on 1/5/21.
//

import SwiftUI

struct ContentView: View {
    @State var fields: [[Field]] = .init (repeating: .init(repeating: Field(player: "", enabled: true), count:3), count:3)
    
    @State var playerTurn: String = "X"
    @State var winner = ""
    @State var winStatus = false
    @State var drawCounter = 0
    
    var body: some View {
        VStack (spacing: 10){
            ForEach(0 ..< 3){ r in
                HStack(spacing: 10){
            ForEach(0 ..< 3){ c in
          
                Button(action: {
                   
                    if fields[r][c].enabled {
                        fields[r][c].player = playerTurn
                        drawCounter += 1
                        CheckWinner()
                        if winStatus == false {
                            
                        
                        playerTurn = playerTurn == "X" ? "0" : "X"
                            fields[r][c].enabled = false
                        }
                        else{
                            fields[0][0].enabled = false
                            fields[0][1].enabled = false
                            fields[0][2].enabled = false
                            fields[1][0].enabled = false
                            fields[1][1].enabled = false
                            fields[1][2].enabled = false
                            fields[2][0].enabled = false
                            fields[2][1].enabled = false
                            fields[2][2].enabled = false
                        }
                    }
                }
                , label: {
                    
            
                Text(fields[r][c].player)
                    .font(.system(size:60))
                    .foregroundColor(Color.white)
                    .frame(width: 90, height: 90, alignment: .center)
                    .background(Color.black)
                })
            
                if winner !="" {
                    Button(action: {
                        restartG()
                    }
                    , label:
                        {
                            Text("Restart")
                                
                        }
                    )
                    
                }
        }
    }
}
        
    

    
    
    }
    
    
    }
    
    func CheckWinner(){
                
        let r1 = fields[0][0].player == playerTurn && fields[0][1].player == playerTurn && fields[0][2].player == playerTurn
        
        
        

        let r2 = fields[0][0].player == playerTurn && fields[0][1].player == playerTurn && fields[0][2].player == playerTurn
        
        

        let r3 = fields[0][0].player == playerTurn && fields[0][1].player == playerTurn && fields[0][2].player == playerTurn
        
        let c1 = fields[0][0].player == playerTurn && fields[1][0].player == playerTurn && fields[2][0].player == playerTurn
        
        
        let c2 = fields[0][0].player == playerTurn && fields[1][0].player == playerTurn && fields[2][0].player == playerTurn
        
        
        let c3 = fields[0][0].player == playerTurn && fields[1][0].player == playerTurn && fields[2][0].player == playerTurn
        
        let d1 = fields[0][0].player == playerTurn && fields[1][1].player == playerTurn && fields[2][2].player == playerTurn
        
        let d2 = fields[0][0].player == playerTurn && fields[1][1].player == playerTurn && fields[2][2].player == playerTurn
        
        
        if r1 || r2 || r3 || c1 || c2 || c3 || d1 || d2 {
            winner = ("\(playerTurn) win")
            winStatus = true
        }
        else if drawCounter == 9{
            winner = "Draw"
            winStatus = true
        }
        
            }
    
    
    func restartG(){
        fields = .init(repeating: .init(repeating: Field(player: "", enabled: true), count: 3), count: 3)
        playerTurn = "X"
        winner = ""
        winStatus = false
        drawCounter = 0
    }
    
}


struct Field{
    var player: String
    var enabled: Bool
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



