🧪 Shell Script 실습 문제 세트: "변수 중심 텍스트 분석"

# Setup

📁 디렉토리 및 파일 구조 생성 스크립트
```bash
mkdir -p ~/shell_practice/env
cd ~/shell_practice/env
```

샘플 파일 1: article.txt (단어 빈도수/정렬/고유단어 실습용)
```bash
cat > article.txt <<EOF
Linux is an open-source operating system.
Linux is popular for servers and embedded systems.
Many developers use Linux for programming and automation.
EOF
```

샘플 파일 2: logfile.txt (grep 실습용)
```bash
cat > logfile.txt <<EOF
[2025-07-23 14:00] INFO Start processing
[2025-07-23 14:01] ERROR Failed to load file
[2025-07-23 14:02] INFO Retrying
[2025-07-23 14:03] ERROR Timeout
[2025-07-23 14:04] ERROR Disk full
EOF
```

샘플 파일 3, 4: file1.txt, file2.txt (tail, diff 실습용)
```bash
cat > file1.txt <<EOF
Line 1
Line 2
Last line A
EOF
```

```bash
cat > file2.txt <<EOF
Line 1
Line 2
Last line B
EOF
```

샘플 파일 5: people.txt (이메일 처리용)
```bash
cat > people.txt <<EOF
Alice <alice@gmail.com>
Bob <bob@naver.com>
Charlie <charlie@gmail.com>
Diana <diana@daum.net>
Eve <eve@naver.com>
Frank <frank@daum.net>
Grace <grace@gmail.com>
Hank <hank@naver.com>
EOF
```

# ✅ [문제 1] 파일 내 단어 수 세기

문제 설명
사용자로부터 파일명을 입력받고, 해당 파일의 단어 수를 계산해서 출력하는 스크립트를 작성하세요.

요구사항
- read 명령어로 파일명 입력
- 변수에 파일명 저장
- wc 명령어 사용

🔧 예시 실행:
bash wordcount.sh
Enter filename: sample.txt
Word count in sample.txt: 123

create file
```bash
cat > sample.txt <<EOF
The bright sun shines over the calm green fields where children play happily every morning.
The birds sing sweet songs while the gentle breeze moves through the tall trees.
Everyone enjoys the fresh air and peaceful sounds of nature.
Families gather for picnics under the clear blue sky,
sharing stories, laughing, and making memories.
Filled with simple joys and warm smiles.
People work hard but always find time to rest and appreciate the beauty around them.
In this quiet village, life feels balanced and true.
Each moment is precious chance to connect with loved ones and the world outside.
Walking down the winding paths, the gentle sounds of life surround you,
creating a perfect harmony that soothes the soul and lifts the spirit.
EOF
fi
```

wordcount.sh
```bash
read -p "Enter filename: " V_FILENAME 

V_COUNT=$(wc -w "$V_FILENAME")

echo "Word count in $V_FILENAME : $V_COUNT"
```

terminal
```bash
source wordcount.sh 
Enter filename: sample.txt
Word count in sample.txt : 123 sample.txt
```

# ✅ [문제 2] 특정 단어 검색 및 빈도수 세기

문제 설명
스크립트 실행 시 단어(keyword)와 파일명을 인자로 받아 해당 단어의 등장 횟수를 출력하세요.

요구사항
- $1: 검색할 단어
- $2: 파일명
- grep, wc, 변수 사용

🔧 예시 실행:
bash count_keyword.sh error logfile.txt
The word 'error' appeared 5 times.

count_keyword.sh
```bash
V_KEYWORD="$1"
V_FILENAME="$2"

V_KEYCOUNT=$(grep -io $V_KEYWORD $V_FILENAME | wc -l)

echo "The word '$1' appeared $V_KEYCOUNT times"
```

terminal
```bash
source count_keyword.sh error logfile.txt

# output
The word 'error' appeared 3 times
```

# ✅ [문제 3] 고유 단어 목록 만들기

문제 설명
파일에서 고유한 단어만 추출하고, 정렬하여 새로운 파일로 저장하세요.

요구사항
- read 로 입력 받을 파일명
- cut, tr, sort, uniq 조합
- 변수 활용 및 리다이렉션 사용

🔧 예시 실행:
bash unique_words.sh
Enter input file: article.txt
Unique words saved to: article_unique.txt

> `${VAR%.*}` : 확장자 제거 (`article.txt` -> `article`) 
> `${VAR##*/}` : 경로 제거하고 파일명만 추출 (`~/path/article.txt `-> `article.txt`)
> `${VAR%/*}` : 경로만 추출 (`~/path/article.txt `-> `~/path`)

```bash
read -p "Enter input file: " V_ARTICLE

tr -cs "A-Za-z" "\n" < "$V_ARTICLE" | tr "A-Z" "a-z" | sort | uniq > "${V_ARTICLE%.*}_unique.txt"

echo "Unique words saved to ${V_ARTICLE%.*}_unique.txt"
```

terminal
```bash
source unique_words.sh 

# output
Enter input file: article.txt
Unique words saved to article_unique.txt

cat article_unique.txt 

# output
an
and
automation
developers
embedded
for
is
Linux
Many
open-source
operating
popular
programming
servers
system
systems
use
```

# ✅ [문제 4] 두 파일의 마지막 줄 비교

문제 설명
두 개의 텍스트 파일을 인자로 받아 각각의 마지막 줄을 비교하고, 같으면 "Same", 다르면 "Different" 출력

요구사항
- 인자 $1, $2 활용
- tail -n 1, diff 사용
- 임시 변수에 각 줄 저장

🔧 예시 실행:
bash compare_lastline.sh file1.txt file2.txt
Result: Different

> - diff는 string 비교가 불가능하므로 임시 파일로 각 string을 저장하고 비교
> - diff의 출력 결과는 필요 없기 때문에 /dev/null로 보내서 화면에 출력되지 않게 함
> - 하지만 결과는 메모리에 저장됨 `$?` 으로 확인 가능 (종료코드: 같으면 0, 다르면 1)

```bash
V_FIRST=$(tail -n 1 "$1")
V_SECOND=$(tail -n 1 "$2")

echo "$V_FIRST" > /tmp/line1.tmp
echo "$V_SECOND" > /tmp/line2.tmp

if diff /tmp/line1.tmp /tmp/line2.tmp > /dev/null; then
  echo "Result: Same"
else
  echo "Result: Different"
fi

rm -f /tmp/line1.tmp /tmp/line2.tmp
```

# ✅ [문제 5] 이메일 리스트 정제 및 카운트

문제 설명
이메일이 섞인 텍스트 파일에서 이메일 주소만 추출하고 도메인별 개수를 출력하는 스크립트 작성

요구사항
- read로 파일명 받기
- grep/awk, cut, sort, uniq -c 활용
- 결과를 정렬된 상태로 출력

🔧 예시 실행:
bash email_domains.sh
Enter file name: people.txt

Output:
5 gmail.com
3 naver.com
2 daum.net

> `grep -E` 를 사용해서 `\+` 대신 그냥 `+` 사용

```bash
read -p "Enter file name: " V_EMAILLIST

grep -oE "[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-z]+" $V_EMAILLIST | cut -d"@" -f"2" | sort | uniq -c | sort -nr
```

# ✅ [문제 6] 다단계 파이프라인 정제

문제 설명
사용자에게 파일명을 받아, 모든 단어를 소문자로 변환한 후, 단어 빈도수를 내림차순으로 정렬해 출력

요구사항
- read 사용
- 변수에 파일명 저장
- tr, sort, uniq -c, sort -nr 조합
- 파이프라인 필수

🔧 예시 실행:
bash word_freq_sort.sh
Enter file to process: document.txt

Output:
45 the  
30 and  
20 python  

> `tr`: upper to lower, 알파벳만

```bash
read -p "Enter file to process: " V_FILENAME

if [ ! -e "$V_FILENAME" ]; then
    cat > "$V_FILENAME" <<EOF
The world of programming is vast, and Python is one of the most popular languages today. 
Python is used in many fields, from web development to machine learning and artificial intelligence. 
The versatility of Python makes it an excellent choice for beginners and experts alike. 
And with a large and active community, finding resources to learn Python is easier than ever. 
The demand for Python developers has grown significantly, and it's not hard to see why. 
From data analysis to automation, Python's simple syntax and powerful libraries make it a top choice for many. 
The ease of learning Python is one reason why so many people choose it over other programming languages. 
And as new technologies emerge, Python continues to adapt and thrive. 
In conclusion, the future of Python looks bright, and it will remain a cornerstone of modern development for years to come.
EOF
fi

tr '[:upper:]' '[:lower:]' < "$V_FILENAME" | tr -cs "A-Za-z" "\n" | sort | uniq -c | sort -nr | head -3
```