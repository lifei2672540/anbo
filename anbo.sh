#!/bin/csh -f


rm -rf ./live.txt

#wget https://raw.githubusercontent.com/wolfcode9/OpenChannel/main/live.txt
## Normal
wget https://raw.githubusercontent.com/wolfcode9/d25d221074c7b34d/main/d3ef48d76c053b24/6df8af2d858ae0c4
## 18
wget https://raw.githubusercontent.com/wolfcode9/d25d221074c7b34d/main/d3ef48d76c053b24/d919fe9602ad13f7

mv ./6df8af2d858ae0c4 ./live.txt
mv ./d919fe9602ad13f7 ./18.txt

grep -i "ubvip1688" ./live.txt > ./ubvip1689


## 取出區段之間資料
sed -n '/即時新聞/,/綜合直播/p' ./live.txt > ./news.c
sed -n '/兒童頻道/,/台灣電視/p' ./live.txt > ./child.c
sed -n '/音樂串流/,/即時影像/p' ./live.txt > ./music.c

echo "UB18,#genre#" > UBSP18
sed -n '/Vivid Touch/,/潘朵拉完美/p' ./18.txt >> UBSP18



## 除去空白行
sed -i 's/ //' ./news.c
sed -i 's/ //' ./child.c
sed -i 's/ //' ./music.c

cat ./ubvip1689 ./news.c ./child.c ./music.c > ubvip1688
rm -rf ./ubvip1689


sed -n '/安博台灣/,//p' ./live.txt > UBSP
sed -n '/安博台灣/,//p' ./live.txt > UBSP


# Rename
### Normal
sed -i 's/HBO Hits #330,/HBO強檔鉅獻,/' ./UBSP
sed -i 's/HBOSignature,/HBO原創鉅獻,/'./UBSP


## 刪除無法處理的資料
#### Normal
#sed -i '/探索科學/d' ./UBSP
sed -i 's/探索科學/DiscorveryScience/' ./UBSP
#sed -i '/探索頻道/d' ./UBSP
sed -i 's/探索頻道 #1035,/DiscoveryHD/' ./UBSP
sed -i 's/探索頻道 #2817,/DiscoveryHD/' ./UBSP
sed -i '/CBN歡笑劇場/d' ./UBSP
sed -i '/天映經典/d' ./UBSP
sed -i '/靖天映畫/d' ./UBSP
sed -i '/Z頻道/d' ./UBSP

#### 18
sed -i 's/奧視頻道2 #2916,/奧視2,/' ./UBSP18
sed -i 's/彩虹E #406,/彩虹E,/' ./UBSP18
sed -i 's/彩虹K #415,/彩虹K,/' ./UBSP18
sed -i 's/松視1台 #402,/松視1,/' ./UBSP18
sed -i 's/松視1台 #2905,/松視1,/' ./UBSP18
sed -i 's/松視2台 #403,/松視2,/' ./UBSP18
sed -i 's/松視2台 #2906,/松視2,/' ./UBSP18
sed -i 's/松視3台 #404,/松視3,/' ./UBSP18
sed -i '/Vivid Touch/d' ./UBSP18


file -i UBSP

### 處理"空格到,"前的資料
cat ./UBSP | grep -v "#genre" | grep -v "header" | cut -d "," -f 1 > a
cat ./UBSP | grep -v "#genre" | grep -v "header" | cut -d "," -f 1 | cut -d " " -f 1 > b
foreach chk ("`cat ./a`")
  echo $chk
  set c = echo $chk | cut -d " " -f 1 
  echo $c
  sed -i 's/'"$chk"'/'"$c"'/' ./live.txt
end

sed -n '/安博台灣/,//p' ./live.txt > UBSP





set FP = "./UBSP"

foreach FP (./UBSP ./ubvip1688)

sed -i '/#genre#/d' $FP
sed -i 's/台,/,/' $FP
sed -i 's/TVN台灣版/tvN/' $FP
sed -i 's/ELTA/愛爾達/' $FP
sed -i 's/壹新聞/壹電視新聞/' $FP
sed -i 's/一,/1,/' $FP
sed -i 's/二,/2,/' $FP
sed -i 's/CATCHPLAY/CatchPlay/' $FP
sed -i 's/CatchPlay,/CatchPlay電影,/' $FP
sed -i 's/CineMAX/CINEMAX/' $FP
sed -i 's/EYE戲劇,/EYETV戲劇,/' $FP
sed -i 's/EYE旅遊,/EYETV旅遊,/' $FP
sed -i 's/AXN亞洲,/AXN,/' $FP
sed -i 's/AMC,/AMC最愛電影,/' $FP
sed -i 's/AMC電影,/AMC最愛電影,/' $FP
sed -i 's/華納電影,/WARNERTV,/' $FP
sed -i 's/八大第1,/八大第一,/' $FP
sed -i 's/探索亞洲,/DiscoveryAsia,/' $FP



end




mv ./ubvip1688 ./Source/ubvip1688
rm -rf ./ubvip1688
rm -rf ./18.txt
