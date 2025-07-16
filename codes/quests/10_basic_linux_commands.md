기본 명령어 연습 문제

# 📁 Level 1: 기본 탐색 및 폴더 조작

❔ 문제 1-1: 현재 위치 확인
현재 작업 중인 디렉터리의 경로를 확인하세요
``` sh
PS C:\Develops\quests> pwd

Path
----
C:\Develops\quests
```

❔ 문제 1-2: 폴더 구조 만들기
다음 폴더 구조를 생성하세요:
```
# 폴더 구조
powershell_practice/
├── documents/
├── images/
├── backup/
└── temp/
```

> `mkdir` 폴더 생성
> `cd` 드렉토리 변경
> `ls` 리스트 폴더 및 파일
> 
> 원라인으로도 가능 `mkdir powershell_practice/documents, mkdir powershell_practice/images, mkdir powershell_practice/backup, mkdir powershell_practice/temp`

``` sh
PS C:\Develops\quests> mkdir powershell_practice/documents


    디렉터리: C:\Develops\quests\powershell_practice


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 3:36                documents


PS C:\Develops\quests> ls


    디렉터리: C:\Develops\quests


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 3:36                powershell_practice


PS C:\Develops\quests> cd .\powershell_practice\
PS C:\Develops\quests\powershell_practice> ls


    디렉터리: C:\Develops\quests\powershell_practice


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 3:36                documents


PS C:\Develops\quests\powershell_practice> mkdir images


    디렉터리: C:\Develops\quests\powershell_practice


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 3:37                images


PS C:\Develops\quests\powershell_practice> mkdir backup


    디렉터리: C:\Develops\quests\powershell_practice


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 3:37                backup


PS C:\Develops\quests\powershell_practice> mkdir temp


    디렉터리: C:\Develops\quests\powershell_practice


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 3:37                temp
```

❔ 문제 1-3: 폴더 탐색
documents 폴더로 이동하세요
현재 폴더의 내용을 확인하세요 (비어있을 것입니다)
다시 상위 폴더로 돌아가세요
```sh
PS C:\Develops\quests\powershell_practice> cd C:\Develops\quests\powershell_practice\documents\
PS C:\Develops\quests\powershell_practice\documents> ls
PS C:\Develops\quests\powershell_practice\documents> cd ..
PS C:\Develops\quests\powershell_practice>
```

<br>

# 📄 Level 2: 파일 생성 및 조작
❔ 문제 2-1: 텍스트 파일 생성
documents 폴더에 hello.txt 파일을 생성하고 "Hello PowerShell!" 내용을 입력하세요
``` sh
PS C:\Develops\quests\powershell_practice\documents> "Hello PowerShell!" > hello.txt
```
images 폴더에 photo1.jpg, photo2.png 빈 파일을 생성하세요
힌트: New-Item -ItemType File 또는 echo "내용" > 파일명 사용

``` ps1
PS C:\Develops\quests\powershell_practice\images> $null > photo1.jpg ; echo "" >photo2.png
PS C:\Develops\quests\powershell_practice\images> ls


    디렉터리: C:\Develops\quests\powershell_practice\images


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-15   오후 3:43              2 photo1.jpg
-a----      2025-07-15   오후 3:43              2 photo2.png
```

❔ 문제 2-2: 파일 내용 확인
hello.txt 파일의 내용을 출력하세요
```sh
PS C:\Develops\quests\powershell_practice\documents> cat C:\Develops\quests\powershell_practice\documents\hello.txt
Hello PowerShell!
```

현재 폴더의 모든 파일과 폴더 목록을 자세히 확인하세요
``` sh
PS C:\Develops\quests\powershell_practice\documents> ls


    디렉터리: C:\Develops\quests\powershell_practice\documents


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-15   오후 3:42             40 hello.txt
```

❔ 문제 2-3: 파일 복사
documents/hello.txt 파일을 backup 폴더에 복사하세요
images 폴더의 모든 파일을 backup 폴더에 복사하세요
``` sh
PS C:\Develops\quests\powershell_practice\documents> cp C:\Develops\quests\powershell_practice\documents\hello.txt ..\backup\

PS C:\Develops\quests\powershell_practice\images> cp C:\Develops\quests\powershell_practice\images\photo1.jpg ..\backup\
PS C:\Develops\quests\powershell_practice\images> cp C:\Develops\quests\powershell_practice\images\photo2.png ..\backup\
```

<br>

# 🔄 Level 3: 파일 이동 및 이름 변경
❔ 문제 3-1: 파일 이동
temp 폴더에 test.txt 파일을 생성하세요
이 파일을 documents 폴더로 이동하세요
``` sh
PS C:\Develops\quests\powershell_practice> cd C:\Develops\quests\powershell_practice\temp\
PS C:\Develops\quests\powershell_practice\temp> "" > test.txt
PS C:\Develops\quests\powershell_practice\temp> ls


    디렉터리: C:\Develops\quests\powershell_practice\temp


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-15   오후 3:50              6 test.txt


PS C:\Develops\quests\powershell_practice\temp> mv C:\Develops\quests\powershell_practice\temp\test.txt ..\documents\
PS C:\Develops\quests\powershell_practice\temp> cd ..\documents\
PS C:\Develops\quests\powershell_practice\documents> ls


    디렉터리: C:\Develops\quests\powershell_practice\documents


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-15   오후 3:42             40 hello.txt
-a----      2025-07-15   오후 3:50              6 test.txt

```

❔ 문제 3-2: 파일 이름 변경
documents/test.txt 파일의 이름을 moved_file.txt로 변경하세요
images/photo1.jpg 파일의 이름을 picture1.jpg로 변경하세요
``` sh
PS C:\Develops\quests\powershell_practice\documents> mv C:\Develops\quests\powershell_practice\documents\test.txt moved_file.txt
PS C:\Develops\quests\powershell_practice\documents> ls


    디렉터리: C:\Develops\quests\powershell_practice\documents


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-15   오후 3:42             40 hello.txt
-a----      2025-07-15   오후 3:50              6 moved_file.txt

PS C:\Develops\quests\powershell_practice\images> mv .\photo1.jpg picture1.jpg
PS C:\Develops\quests\powershell_practice\images> ls


    디렉터리: C:\Develops\quests\powershell_practice\images


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-15   오후 3:43              2 photo2.png
-a----      2025-07-15   오후 3:43              2 picture1.jpg
```

❔ 문제 3-3: 폴더 이름 변경
temp 폴더의 이름을 temporary로 변경하세요
``` sh
PS C:\Develops\quests\powershell_practice> ls


    디렉터리: C:\Develops\quests\powershell_practice


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 3:49                backup
d-----      2025-07-15   오후 3:51                documents
d-----      2025-07-15   오후 3:52                images
d-----      2025-07-15   오후 3:50                temp


PS C:\Develops\quests\powershell_practice> mv .\temp\ temporary
PS C:\Develops\quests\powershell_practice> ls


    디렉터리: C:\Develops\quests\powershell_practice


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 3:49                backup
d-----      2025-07-15   오후 3:51                documents
d-----      2025-07-15   오후 3:52                images
d-----      2025-07-15   오후 3:50                temporary
```
<br>

# 🗑️ Level 4: 삭제 연습
❔ 문제 4-1: 개별 파일 삭제
documents/moved_file.txt 파일을 삭제하세요

images/photo2.png 파일을 삭제하세요
``` sh
PS C:\Develops\quests\powershell_practice> rm C:\Develops\quests\powershell_practice\documents\moved_file.txt

PS C:\Develops\quests\powershell_practice> rm C:\Develops\quests\powershell_practice\images\photo2.png
```

❔ 문제 4-2: 폴더 삭제
temporary 폴더를 삭제하세요 (비어있는 폴더)
backup 폴더와 그 안의 모든 내용을 삭제하세요
``` ps1
PS C:\Develops\quests\powershell_practice> rm C:\Develops\quests\powershell_practice\temporary
PS C:\Develops\quests\powershell_practice> rm C:\Develops\quests\powershell_practice\backup\

확인
C:\Develops\quests\powershell_practice\backup\의 항목에는 하위 항목이 있으며 Recurse 매개 변수를 지정하지 않았습니다. 계속하면 해당
항목과 모든 하위 항목이 제거됩니다. 계속하시겠습니까?
[Y] 예(Y)  [A] 모두 예(A)  [N] 아니요(N)  [L] 모두 아니요(L)  [S] 일시 중단(S)  [?] 도움말 (기본값은 "Y"): A
```

<br>

# 🚀 Level 5: 종합 응용
❔ 문제 5-1: 프로젝트 구조 만들기
다음과 같은 프로젝트 구조를 생성하세요:
```
my_project/
├── src/
│   └── main.py (내용: "print('Hello World')")
├── docs/
│   └── readme.txt (내용: "This is my project")
├── tests/
└── build/
```
``` sh
PS C:\Develops\quests\powershell_practice> mkdir my_project\src, my_project\docs, my_project\test, my_project\build


    디렉터리: C:\Develops\quests\powershell_practice\my_project


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----      2025-07-15   오후 4:00                src
d-----      2025-07-15   오후 4:00                docs
d-----      2025-07-15   오후 4:00                test
d-----      2025-07-15   오후 4:00                build

PS C:\Develops\quests\powershell_practice> "print('Hello World')" > .\my_project\src\main.py
PS C:\Develops\quests\powershell_practice> "This is my project" > .\my_project\docs\readme.txt
PS C:\Develops\quests\powershell_practice> cat .\my_project\src\main.py
print('Hello World')
PS C:\Develops\quests\powershell_practice> cat .\my_project\docs\readme.txt
This is my project
```

❔ 문제 5-2: 파일 정리
src/main.py 파일을 build 폴더에 복사하세요
``` sh
PS C:\Develops\quests\powershell_practice\my_project> cp .\src\main.py .\build\
```

docs/readme.txt 파일을 project_info.txt로 이름을 변경하세요
``` sh
PS C:\Develops\quests\powershell_practice\my_project> mv .\docs\readme.txt project_info.txt
```

tests 폴더를 삭제하세요
``` sh
PS C:\Develops\quests\powershell_practice\my_project> rm C:\Develops\quests\powershell_practice\my_project\tests
```

❔ 문제 5-3: 최종 확인
my_project 폴더의 모든 하위 내용을 재귀적으로 확인하세요
각 폴더로 이동하여 파일 내용을 확인하세요
> [!TIP]
> `ls -R` shows all folders and files

``` sh
PS C:\Develops\quests\powershell_practice\my_project> tree
폴더 PATH의 목록입니다.
볼륨 일련 번호는 52B6-33C5입니다.
C:.
├─build
├─docs
└─src
PS C:\Develops\quests\powershell_practice\my_project> cd .\build\
PS C:\Develops\quests\powershell_practice\my_project\build> ls


    디렉터리: C:\Develops\quests\powershell_practice\my_project\build


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-15   오후 4:05             46 main.py


PS C:\Develops\quests\powershell_practice\my_project\build> cat .\main.py
print('Hello World')
PS C:\Develops\quests\powershell_practice\my_project\build> cd ..
PS C:\Develops\quests\powershell_practice\my_project> cd .\docs\
PS C:\Develops\quests\powershell_practice\my_project\docs> ls
PS C:\Develops\quests\powershell_practice\my_project\docs> cd ..\src\
PS C:\Develops\quests\powershell_practice\my_project\src> ls


    디렉터리: C:\Develops\quests\powershell_practice\my_project\src


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a----      2025-07-15   오후 4:05             46 main.py


PS C:\Develops\quests\powershell_practice\my_project\src> cat .\main.py
print('Hello World')
```
