//
//  SsupTemplateView.swift
//  partTest
//
//  Created by sup on 2023/03/29.
//


import SwiftUI

struct SsupTemplateView: View {
    @State private var videoName: [String] = [
        /* 비디오 이름 배열 */ //7
        //0
        "썹Scene0",
        //1
        "썹Scene1",
        //2
        "썹Scene2",
        //3
        "썹Scene3",
        //4
        "썹Scene4",
        //5
        "썹Scene5",
        //6
        "썹Scene6",
        //7
        "novideo",
        //8
        "썹Scene8",
        //9
        "썹Scene9",
        //10
        "썹Scene10",
        //11
        "썹Scene11",
        //12
        "썹Scene12",
        //13
        "썹Scene13",
        //14
        "썹Scene14",
        //15
        "썹Scene15",
        //16
        "썹Scene16",
        //17
        "video",
        //18
        "video",
        //19
        "video"
        
    ]
    @State private var lineIndex: Int = 0
    @State private var enemyHP: Int = 10
    @State private var displayString: String = ""
    @State private var isNextButtonDisabled = false
    @State private var characterList: [String] = [
        /* 여기다가 말하는 캐릭터 이름 써주세요 */
        /* lines의 배열 요소 개수와 캐릭터 배열 요소 개수는 동일해야 함 */
        "두잇투잇",
        "설문지",
        "두잇투잇",
        "두잇투잇",
        "???",
        "두잇투잇",
        "두잇투잇",
        "두잇투잇",
        "두잇투잇",
        "굳건이",
        "굳건이",
        "굳건이",
        "두잇투잇",
        "두잇투잇",
        "두잇투잇",
        "두잇투잇",
        "???",
        "두잇투잇",
        ""
    ]
    @State private var lines: [String] = [
        /* 여기다가 대사를 넣어주세요 그러면 끝 */
        //0
        "몬스터를 해치우자, 설문지 보스가 등장했다!",
        //1
        "크하하! 챌린지를 이루고 싶다면 나를 감당해야 할 것이다!!",
        //2
        "우리는 설문지 항목을 작성하고 다른 이세계 주민들에게 도움을 요청했다!",
        //3
        "설문지를 내고 우리는 챌린지를 구체화할 수 있을 것이라 생각했지만…",
        //4
        "설문지 보스는 별안간 체력을 회복하며 “솔루션 보스”가 되어버리고 말았다!",
        //5
        "다행히 우리는 설문지 보스를 해치우고 5개의 무기를 얻을 수 있었다.",
        //6
        "그중, 솔루션 보스를 공략할 수 있는 무기인 “랜덤만남 피스톨”로 약점을 겨누었다.",
        //7
        "그 순간….",
        //8
        "앗! 솔루션 보스의 하수인, 굳건이가 나타났다!",
        //9
        "하하! 구피와 제리를 예비군으로 잡아가겠다!",
        //10
        "하하-! 다시 돌려주겠다-!",
        //11
        "우리는 잃었던 구피와 제리를 돌려받고, 솔루션 보스의 머리를 겨누고 있던 방아쇠를 당겼다.",
        //12
        "솔루션 보스는 처참하게 쓰러졌다!",
        //13
        "우리는 성공적으로 MC1의 솔루션 보스를 해치울 수 있었고, 이 소문은 빠르게 퍼져나갔다!",
        //14
        "드디어… 이 던전의 끝이 보이고 있어요…! 다들 조금만 더…!",
        //15
        "응 아니야",
        //16
        "알고보니 우리는 고작 MC1을 끝냈을 뿐이었다….",
        //17
        "이세계의 모든 용사들도 이러한 과정을 겪고 있는 걸까…? 모두들… 잘 이겨내기를 바란다…",
        //18
        "The End……"
    ]
    

    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            if lineIndex == 2 || lineIndex == 3 ||  lineIndex ==  12 || lineIndex == 13 || lineIndex == 15 || lineIndex ==  16 || lineIndex ==  17 {
                 // 이미지 보여주기
                Image("썹Scene\(lineIndex)")
                    .resizable()
                    .scaledToFit()
            } else if lineIndex ==  18 {
                HStack
                {
                    Text("The end....")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .font(.largeTitle)
                    
                    Image("TeamPicture")
                    .resizable()
                    .scaledToFit()
                    .padding(.leading, 230)
                    
                }
            } else {
                VideoView(
                    title: videoName[lineIndex])
                }
        }
        .overlay(alignment: .bottom) {
            
            if lineIndex < 18{
                Image("bubble")
                    .overlay(alignment: .leading) {
                        Text(lines[lineIndex])
                            .foregroundColor(.white)
                            .font(.title3)
                            .padding([.bottom, .leading], 30)
                    }
                    .onAppear() {
                        SoundSetting.instance.playSound(formusicName: MusicList3[lineIndex])
                    }
                    .onChange(of: lineIndex) { newValue in
                        SoundSetting.instance.playSound(formusicName: MusicList3[lineIndex])
                    }
                    .overlay(alignment: .topLeading) {
                        Text(characterList[lineIndex])
                            .foregroundColor(.black)
                            .bold()
                            .font(.title)
                            .frame(width: 100, height: 30)
                            .offset(x: 50, y: 15)
                    }
                    .overlay(alignment: .bottomTrailing) {
                        Button {
                            if lineIndex < lines.count - 1 {
                                lineIndex += 1
                            } else if lineIndex == lines.count - 1{
                                // TODO: - "전투씬으로 가거나 후반씬으로 이동시키기"
                            }
                        } label: {
                            Text("▶︎  다음")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                                .bold()
                                .blinking(duration: 0.8)
                                .padding(
                                    [.bottom, .trailing],
                                    30
                                )
                        }
                        .disabled(isNextButtonDisabled ? true : false)
                    }
            } else {
                
            }
            
            
        }
    }
}
