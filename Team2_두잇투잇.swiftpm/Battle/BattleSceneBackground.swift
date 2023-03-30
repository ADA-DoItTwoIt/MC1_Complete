//
//  BattleSceneView.swift
//  partTest
//
//  Created by Celan on 2023/03/29.
//

import SwiftUI

struct BattleSceneBackground: View {
    @State private var isGoingToNextView: Bool = false
    @State private var isSelectingBehavior: Bool = false
    @State private var isStartedBackgroundMusic = false
    @State private var isRunning: Bool = false
    @State private var isDisplaying: Bool = false
    @State private var lineIndex: Int = 0
    @State private var enemyHP: Int = 10
    @State private var displayString: String = ""
    @State private var isNextButtonDisabled = false
    @State private var lines: [String] = [
        // 0
        "앗!! 질문 지옥을 지배하는 챌린지 몬스터가 등장했다!",
        // 1
        "챌린지 몬스터가 과제 공격을 했다!",
        // 2
        "우리는 토론하기를 시전했다! \n“그럼 이세계 라이프에서만 가져갈 수 있는 것은 뭘까요?!”",
        // 3, HP - 4
        "효과는 굉장했다!",
        // 4
        "챌린지 몬스터는 다시 한 번 과제 공격을 했다!",
        // 5
        "두잇투잇 팀은 좌절하지 않았다.",
        // 6
        "두잇투잇 팀은 서로의 의견에 “귀엽게” 반박했다! \n이미 존재하는 이세계 라이프 질문 채널의 한계는 무엇이고 왜 쓰는 걸까요?!",
        // 7, HP - 5
        "효과는 굉장했다!",
        // 8
        "챌린지 몬스터는 기절한 상태다.",
        // 9
        "두잇투잇 팀은 최후의 일격을 날렸다! \n거리낌 없이 물어보자!",
        // 10, HP - 1
        "와! 챌린지 몬스터를 해치웠다!"
    ]
    @State private var runString: String = "챌린지로부터 도망칠 수는 없다……. 챌린지로부터 도망칠 수는 없다……. 챌린지로부터 도망칠 수는 없다……. 챌린지로부터 도망칠 수는 없다……. 챌린지로부터 도망칠 수는 없다……. 100만원……내 맥북 …… 크큭……."
    
    var MusicList2: [String] = [
        /* 여기다가 말하는 캐릭터 이름 써주세요 */
        /* lines의 배열 요소 개수와 캐릭터 배열 요소 개수는 동일해야 함 */
        "전투1.앗 - 질문 지옥을 지배하는 챌린지 몬스터가 등장했다-",
        "전투2.챌린지 몬스터가 과제 공격을 했다-",
        "전투3.우리는 토론하기를 시전했다- -그럼 이세계 라이프에서만 가져갈 수 있는 것은 뭘까요---",
        "전투4.효과는 굉장했다-",
        "전투5.챌린지 몬스터는 다시 한 번 과제 공격을 했다-",
        "전투추가1.두잇투잇 팀은 좌절하지 않았다-",
        "전투6.두잇투임 팀은 서로의 의견에 -귀엽게- 반박했다- 이미 존재하는 이세계 라이프 질문 채널의 한계는 무엇이고 왜 쓰는 걸까요--",
        "전투7.효과는 굉장했다- 복사본",
        "전투8.챌린지 몬스터는 기절한 상태다-",
        "전투9.두잇투잇 팀은 최후의 일격을 날렸다- 거리낌 없이 물어보자-",
        "전투10.와- 챌린지 몬스터를 해치웠다-"
    ]
    
    var runSoundTitle: String = "전투추가2.챌린지로부터 도망칠 수는 없다--- 챌린지로부터 도망칠 수는 없다--- 챌린지로부터 도망칠 수는 없다--- 챌린지로부터 도망칠 수는 없다--- 챌린지로부터 도망칠 수는 없다--- 100만원-"
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            HStack(spacing: -20) {
                Image("OurNameTag")
                    .overlay(alignment: .top) {
                        VStack(alignment: .leading) {
                            Text("Challenge Monster!")
                                .foregroundColor(.white)
                            
                            Text("HP: \(enemyHP)/10")
                                .foregroundColor(getForegroundColor())
                        }
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .padding(.leading, 10)
                    }
                
                if lineIndex != 10 {
                    Image("ChallengeMonster")
                        .modifier(Shake(animatableData: CGFloat(enemyHP)))
                } else {
                    Image("EnemyDied")
                }
                
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topTrailing
            )
            .offset(y: -50)
            
            HStack(spacing: -20) {
                Image("doittwoitTeams")
                    
                Image("EnemyNameTag")
                    .padding(.bottom, 20)
                    .overlay(alignment: .topTrailing) {
                        VStack(alignment: .trailing) {
                            Text("두잇투잇")
                            
                            HStack {
                                Text("HP:")
                                Image(systemName: "infinity")
                                Text("/")
                                Image(systemName: "infinity")
                            }
                            
                        }
                        .font(.system(size: 24, weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .padding(.trailing, 15)
                    }
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .leading
            )
            .offset(x: -30)
            
            if enemyHP == 0 {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 12, height: 12)
                    .modifier(ParticlesModifier())
                    .offset(x: -100, y : -50)
                
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 12, height: 12)
                    .modifier(ParticlesModifier())
                    .offset(x: 50, y : 20)
                
                Rectangle()
                    .fill(Color.orange)
                    .frame(width: 12, height: 12)
                    .modifier(ParticlesModifier())
                    .offset(x: 22, y : -15)
            }
        }
        .onDisappear {
            SoundSetting.instance.stopBackgroundMusic()
        }
        .overlay(alignment: .bottom) {
            Image("Noname bubble")
                .overlay(alignment: .topLeading) {
                    if !isRunning {
                        Text(isSelectingBehavior ? "" : lines[lineIndex])
                            .foregroundColor(lineIndex != 5 ? .white : .red)
                            .font(.system(size: 24))
                            .bold()
                            .padding([.top, .leading], 30)
                            .onAppear {
                                if !isSelectingBehavior {
                                    SoundSetting.instance.playSound(formusicName: MusicList2[lineIndex])
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                                        if !isStartedBackgroundMusic {
                                            SoundSetting.instance.playBackgroundMusic()
                                            isStartedBackgroundMusic = true
                                        }
                                    }
                                }
                            }
                            .onChange(of: lineIndex) { _ in
                                SoundSetting.instance.playSound(formusicName: MusicList2[lineIndex])
                            }
//                            .animation(.spring(), value: lineIndex)
//                            .applyTextTypingEffect(
//                                with: $displayString,
//                                in: $lines,
//                                lineIndex: $lineIndex,
//                                isNextButtonDisabled: $isNextButtonDisabled
//                            )
                    } else if isRunning {
                        ZStack(alignment: .leading) {
                            Text(runString)
                                .foregroundColor(.red)
                                .font(.system(size: 24))
                                .bold()
                                .padding([.top, .leading], 30)
                                .onAppear {
                                    SoundSetting.instance.playSound(formusicName: runSoundTitle)
                                }
//                                .onAppear {
//                                    displayString = ""
//                                    isNextButtonDisabled = true
//                                    runString.enumerated().forEach { index, character in
//                                        DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.08) {
//                                            displayString += String(character)
//                                            if displayString == runString {
//                                                isNextButtonDisabled = false
//                                            }
//                                        }
//                                    }
//                                }
                        }
                        
                    }
                }
                .overlay(alignment: .bottomTrailing, content: {
                    Button {
                        withAnimation {
                            if !isRunning,
                                lineIndex == 0 {
                                isSelectingBehavior.toggle()
                            } else if isRunning {
                                isRunning = false
                                displayString = ""
                            } else if lineIndex != 0 {
                                withAnimation {
                                    if lineIndex < lines.count - 1 {
                                        lineIndex += 1
                                        if lineIndex == 3 {
                                            enemyHP -= 4
                                        } else if lineIndex == 7 {
                                            enemyHP -= 5
                                        } else if lineIndex == 10 {
                                            enemyHP -= 1
                                        }
                                    } else {
                                        isGoingToNextView.toggle()
                                    }
                                }
                            }
                        }
                    } label: {
                        if !isSelectingBehavior,
                           !isRunning,
                           lineIndex == 0
                        {
                            Text("▶︎  무엇을 할까?")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                                .bold()
                                .blinking(duration: 0.8)
                                .padding([.bottom, .trailing], 30)
                        } else if isRunning {
                            Text("다시 싸우러 가기")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                                .bold()
                                .blinking(duration: 0.8)
                                .padding(
                                    [.bottom, .trailing],
                                    30
                                )
                        } else if lineIndex != 0 {
                            Text("▶︎  다음")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                                .bold()
                                .blinking(duration: 0.8)
                                .padding([.bottom, .trailing], 30)
                        }
                    }
                    .disabled(isNextButtonDisabled ? true : false)
                })
                .overlay(alignment: .trailing) {
                    if isSelectingBehavior, lineIndex == 0 {
                        Image("fighting bubble")
                            .overlay(alignment: .leading) {
                                VStack(alignment: .leading, spacing: 10) {
                                    Button {
                                        withAnimation {
                                            isSelectingBehavior.toggle()
                                            if lineIndex < lines.count - 1 {
                                                lineIndex += 1
                                            }
                                        }
                                    } label: {
                                        Text("▶︎  ") + Text("싸운다")
                                    }
                                    
                                    Button {
                                        withAnimation {
                                            isRunning = true
                                            isSelectingBehavior.toggle()
                                        }
                                    } label: {
                                        Text("▶︎  ") + Text("도망친다")
                                    }
                                }
                                .font(.system(size: 24, weight: .bold, design: .default))
                                .foregroundColor(.white)
                                .padding(.leading, 20)
                            }
                    }
                }
        }
        .overlay {
            NavigationLink(isActive: $isGoingToNextView) {
                SsupTemplateView()
                    .navigationBarBackButtonHidden()
            } label: {
                EmptyView()
            }

        }
    }
    
    private func getForegroundColor() -> Color {
        if enemyHP == 6 {
            return .orange
        } else if enemyHP == 1 {
            return .red
        } else if enemyHP == 0 {
            return .gray
        } else {
            return .white
        }
    }
}
