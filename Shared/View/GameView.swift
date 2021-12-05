//
//  GameView.swift
//  Set
//
//  Created by Rudolf Farkas on 11.09.21.
//

import SwiftUI

// MARK: - alternative for tests
// model
struct Item: Identifiable, Hashable {
    let id: Int
    var value: Int {
        id
    }
}

// viewModel

func items(n: Int) -> [Item] {
    return [Int](0 ..< n).map { Item(id: $0) }
}

// view

struct ItemView: View {
    let item: Item

    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "\(item.value).circle")
            Text("\(1000 * item.value)")
        }
    }
}

struct CardView: View {
    let card: CardPack.Card
    var body: some View {
        Text(card.description)
    }
}


struct GameView: View {
    @ObservedObject var viewModel: GameViewModel

    @State var numberOfCards = 12

    var body: some View {
        ZStack {
            // Color.walnut.edgesIgnoringSafeArea(.all)
//            Color.mahogany6.edgesIgnoringSafeArea(.all)
            Color.blue
            VStack {
                HStack {
                    SameWidth(view: TitledInfo(title: "Score", info: "\(viewModel.game.score)"))
                    SameWidth(view: TitledInfo(title: "Deck", info: "\(viewModel.game.deck.count)"))
                    SameWidth(view: TitledInfo(title: "Time", info: hms(from: viewModel.game.elapsedGameTime)))
                    SameWidth(view: TitledInfo(title: "Bounty", info: "\(viewModel.game.bounty)"))
                }
                .padding(5)


//                GameBoardView(items: items(n: 10)) { item in
//                    ItemView(item: item)
//                }


                GameBoardView(items: viewModel.game.cards) { item in
                    CardView(card: item)
                }


                VStack {
                    if viewModel.game.isGameOver {
                        Text("GAME OVER")
                            .font(Font.custom("Seven Segment", size: 40))
                            .padding()
                            .foregroundColor(.blue)
                    }
                    Buttons(viewModel: viewModel)
                }
                .padding(5)
                .font(Font.custom("Seven Segment", size: 25))
            }
        }
    }
}

struct Buttons: View {
    var viewModel: GameViewModel
    @State private var isDealEnabled = true
    @State private var isCheatEnabled = true
    var body: some View {
        HStack {
            Spacer()
            Button {
                viewModel.deal()
                isDealEnabled = viewModel.game.isDealAllowed
            } label: {
                Text("Deal")
            }
            .niceButton(foregroundColor: .white.opacity(opacityIfEnabled(isDealEnabled)))

            Spacer()

            Button {
                viewModel.newGame()
                isDealEnabled = viewModel.game.isDealAllowed
                isCheatEnabled = viewModel.game.isCheatAllowed
            } label: {
                Text("New game")
            }
            .niceButton(foregroundColor: .white)

            Spacer()

            Button {
                viewModel.cheat()
                isCheatEnabled = viewModel.game.isCheatAllowed
            } label: {
                Text("Cheat")
            }
            .niceButton(foregroundColor: .white.opacity(opacityIfEnabled(isCheatEnabled)))

            Spacer()
        }
    }

    private func opacityIfEnabled(_ enabled: Bool) -> Double {
        return enabled ? 1.0 : 0.5
    }
}

func hms(from interval: TimeInterval) -> String {
    let formatter = DateComponentsFormatter()
    formatter.allowedUnits = [.hour, .minute, .second]
    // styles are positional, abbreviated, short, full, spellOut and brief
    formatter.unitsStyle = .positional
    return formatter.string(from: TimeInterval(interval))!
}

struct SameWidth<V: View>: View {
    let view: V
    var body: some View {
        HStack {
            Spacer()
            view
            Spacer()
        }
    }
}

struct TitledInfo: View {
    let title: String
    let info: String
    var body: some View {
        VStack {
            Text(title).font(Font.custom("Seven Segment", size: 15))
            Text(info).font(Font.custom("Seven Segment", size: 30))
        }
        .foregroundColor(.white)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        let svModel = GameViewModel()
        GameView(viewModel: svModel)
    }
}
