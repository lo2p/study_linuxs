Linux 파일 관리 명령어 와일드카드 실습 문제
실습 환경 설정
먼저 다음 명령어들을 실행하여 실습 환경을 구성하세요:

# Environment Setup
## 실습 디렉터리 생성

```bash
mkdir wildcard_file_practice && cd wildcard_file_practice
```

## 테스트 파일들 생성

> [!NOTE]
> 총 35개 파일 생성

```bash
touch report1.txt report2.txt report3.txt
touch data1.csv data2.csv data3.csv data_old.csv
touch image1.jpg image2.jpg image3.png photo.gif
touch backup_2023.tar backup_2024.tar config.conf
touch log_error.txt log_access.txt log_system.txt
touch temp1.tmp temp2.tmp temp3.tmp
touch file_001.dat file_002.dat file_010.dat
touch script1.sh script2.sh test_script.sh
touch document.pdf presentation.ppt spreadsheet.xls
touch readme.md changelog.md license.txt
touch old_report.txt new_report.txt final_report.txt
```

간소화
```bash
touch report{1..3}.txt \
data{1..3}.csv data_old.csv \
image{1,2}.jpg image3.png photo.gif \
backup_202{3,4}.tar config.conf \
log_{error,access,system}.txt \
temp{1..3}.tmp \
file_0{01,02,10}.dat \
script{1,2}.sh test_script.sh \
document.pdf presentation.ppt spreadsheet.xls \
readme.md changelog.md license.txt \
{old,new,final}_report.txt
```

## 기본 디렉터리들 생성

```bash
mkdir archives backup logs images documents scripts
```

# mkdir 명령어 와일드카드 실습

**1-1. 연도별 백업 디렉터리 생성**

2020년부터 2024년까지 백업 디렉터리를 한 번에 생성하세요

> 예: backup_2020, backup_2021, backup_2022, backup_2023, backup_2024

```bash
mkdir backup_{2020..2024}
```

**1-2. 월별 로그 디렉터리 생성**

logs 디렉터리 안에 01월부터 12월까지 디렉터리 생성

> 예: logs/log_01, logs/log_02, ..., logs/log_12

```bash
mkdir logs/log_{01..12}
```

**1-3. 프로젝트별 디렉터리 생성**

project_A, project_B, project_C 디렉터리를 한 번에 생성하세요

```bash
mkdir project_{A,B,C}
```

**1-4. 계층적 디렉터리 생성**

data/2024/{01,02,03} 구조로 디렉터리를 생성하세요

> (data 디렉터리 안에 2024 디렉터리, 그 안에 01, 02, 03 디렉터리)

```bash
mkdir -p data/2024/{01,02,03}
```

# cp 명령어 와일드카드 실습

**2-1. 확장자별 파일 복사**

모든 .txt 파일을 backup 디렉터리로 복사하세요

```bash
cp *.txt backup/
```

**2-2. 특정 패턴 파일 복사**

"report"로 시작하는 모든 파일을 documents 디렉터리로 복사하세요

```bash
cp report* documents/
```

**2-3. 숫자가 포함된 파일 복사**

파일명에 숫자가 포함된 모든 이미지 파일(.jpg, .png)을 images 디렉터리로 복사하세요

```bash
cp *[0-9]*.{jpg,png} images/
```

**2-4. 특정 범위의 파일 복사**

data1.csv, data2.csv, data3.csv 파일만 backup 디렉터리로 복사하세요

```bash
cp data[1-3].csv backup/
```

**2-5. 복합 조건 파일 복사**

"log_"로 시작하는 .txt 파일들을 logs 디렉터리로 복사하세요

```bash
cp log_*.txt logs/
```


# mv 명령어 와일드카드 실습

**3-1. 임시 파일 이동**

모든 .tmp 파일을 temp 디렉터리로 이동하세요 (mkdir temp 먼저 실행)

```bash
mkdir -p temp && mv *.tmp temp/
```

**3-2. 백업 파일 정리**

"backup_"로 시작하는 모든 파일을 archives 디렉터리로 이동하세요

```bash
mv backup_* archives/
```

**3-3. 스크립트 파일 정리**

모든 .sh 파일을 scripts 디렉터리로 이동하세요

```bash
mv *.sh scripts/
```

**3-4. 특정 패턴 파일 이동**

"file_"로 시작하고 3자리 숫자가 포함된 .dat 파일들을 data 디렉터리로 이동하세요

```bash
mv file_[0-9][0-9][0-9].dat data/
```

**3-5. 조건부 파일 이동**

"old_" 또는 "new_"로 시작하는 모든 파일을 archives 디렉터리로 이동하세요

```bash
mv {old_*,new_*} archives/
```


# rm 명령어 와일드카드 실습

4-1. 임시 파일 삭제

모든 .tmp 파일을 삭제하세요 (주의: 실제로는 신중히 실행)

> `.tmp` 파일은 현재 `temp/` 디렉터리 안에 존재. 
> `rm *.tmp`는 파일을 찾지 못해 에러가 발생.

```bash
rm *.tmp

# output
rm: cannot remove '*.tmp': No such file or directory
```

> `rm`만 사용해서 여러 단계의 child 디렉터리 `.tmp` 파일 삭제

```bash
rm *.tmp */*.tmp */*/*.tmp */*/*/*.tmp
```

**4-2. 특정 패턴 파일 삭제**

"temp"로 시작하는 모든 파일을 삭제하세요

> 4-1에서 관련된 모든 파일 삭제
> 만약 있으면 해당 명령어로 현재 폴더에서 `temp*` 삭제

```bash
rm temp*
```

**4-3. 백업 파일 정리**

> 2023년 백업 파일만 삭제하세요 (backup_2023.tar)

```bash
rm backup_2023.tar

# output
rm: cannot remove 'backup_2023.tar': No such file or directory
```

> archives 폴더에 있는 backup_2023.tar 삭제

```bash
rm archives/backup_2023.tar
```

**4-4. 조건부 파일 삭제**

확장자가 3글자가 **아닌** 파일들을 삭제하세요

> 힌트: 확장자가 .jpg, .png, .gif, .txt, .csv, .tar, .dat, .pdf, .ppt, .xls가 **아닌** 파일
> 주어진 명령어로는 복잡한 패턴 매칭이 불가능해 직접 확장자 글자수 체크

```bash
rm {*.?,*.??,*.????}
```

# 복합 명령어 실습

**5-1. 파일 정리 시스템**

1단계: 모든 이미지 파일(.jpg, .png, .gif)을 images 디렉터리로 이동

2단계: 모든 문서 파일(.pdf, .ppt, .xls, .md)을 documents 디렉터리로 이동

3단계: 모든 데이터 파일(.csv, .dat)을 data 디렉터리로 이동 (없으면 생성)

```bash
mv *.jpg *.png *.gif images/
mv *.pdf *.ppt *.xls *.md documents/
mv *.csv *.dat data/
```

**5-2. 백업 및 정리 작업**

1단계: 모든 .txt 파일을 backup/txt_files 디렉터리로 복사 (디렉터리 생성 필요)

2단계: 모든 설정 파일(.conf)을 backup/config 디렉터리로 복사

3단계: 원본 설정 파일들을 삭제

> `.conf` 파일은 4-4에서 모두 삭제됨

```bash
mkdir -p backup/txt_files backup/config
cp *.txt backup/txt_files/
cp *.conf backup/config/ && rm *.conf
```

**5-3. 날짜별 로그 정리**

1단계: logs 디렉터리에 error, access, system 하위 디렉터리 생성

2단계: log_error.txt를 logs/error/로 이동

3단계: log_access.txt를 logs/access/로 이동

4단계: log_system.txt를 logs/system/로 이동

```bash
mkdir -p logs/{error,access,system}
mv logs/log_error.txt logs/error/
mv logs/log_access.txt logs/access/
mv logs/log_system.txt logs/system/
```

# 고급 와일드카드 실습

**6-1. 복잡한 패턴 매칭**

"report" 또는 "data"로 시작하고 숫자가 포함된 모든 파일을 찾아서 processed 디렉터리로 복사하세요

```bash
mkdir processed
cp report*[0-9]* data*[0-9]*
```

> 프로젝트 전체
> backup/ 디렉터리에 동일한 파일명이 존재

```bash
mkdir processed
cp report*[0-9]* data*[0-9]* */report*[0-9]* */data*[0-9]* */*/report*[0-9]* */*/data*[0-9]* */*/*/report*[0-9]* */*/*/data*[0-9]* processed/
```

**6-2. 제외 패턴 활용**

모든 파일 중에서 "final_"로 시작하지 않는 .txt 파일들을 draft 디렉터리로 이동하세요

```bash
mkdir draft
mv report*.txt draft/
mv license.txt draft/
```

glob 사용
```bash
shopt -s extglob
mkdir draft
mv !(final_*.txt).txt draft/
shopt -u extglob
```

for loop 사용
```bash
mkdir draft
for file in *.txt; do
  [[ "$file" != final_*.txt ]] && mv "$file" draft/
done
```

find 사용
```bash
mkdir draft
find . -maxdepth 1 -type f -name "*.txt" ! -name "final_*.txt" -exec mv {} draft/ \;
```

**6-3. 범위 지정 패턴**

파일명에 001부터 009까지의 숫자가 포함된 파일들을 single_digit 디렉터리로 복사하세요

```bash
mkdir single_digit

# output
cp: cannot stat '*00[1-9].*': No such file or directory
```

```bash
mkdir single_digit
cp *00[1-9].* */*00[1-9].* */*/*00[1-9].* */*/*/*00[1-9].* single_digit/
```

# 실전 시나리오 문제

**7-1. 프로젝트 정리 시나리오**

시나리오: 프로젝트 종료 후 파일 정리

1. 완료된 리포트 파일들(report*.txt)을 completed 디렉터리로 이동

2. 작업 중인 파일들(temp*, *_draft)을 ongoing 디렉터리로 이동

3. 백업 파일들(backup_*)을 archive 디렉터리로 이동

4. 불필요한 임시 파일들(*.tmp)을 삭제

```bash
mkdir -p completed ongoing archive
mv report*.txt completed/
mv temp* ongoing/
mv *_draft ongoing/
mv backup_* archive/
rm *.tmp
```

**7-2. 로그 관리 시나리오**

시나리오: 서버 로그 정리

1. 2024년 로그 파일들을 logs/2024 디렉터리로 이동

2. 에러 로그들을 logs/errors 디렉터리로 복사

3. 2023년 로그 파일들을 삭제

4. 시스템 로그들을 logs/system 디렉터리로 이동

```bash
mkdir -p logs/2024 logs/errors logs/system
mv *2024*.log logs/2024/
cp *error*.log logs/errors/
rm *2023*.log
mv *system*.log logs/system/
```

**7-3. 개발 환경 정리 시나리오**

시나리오: 개발 프로젝트 구조 정리

> 존재하지 않으면 디렉터리를 생성한 후 이동하는 명령어를 작성하세요

1. 모든 스크립트 파일(*.sh)을 scripts 디렉터리로 이동

2. 설정 파일들(*.conf, *.config)을 config 디렉터리로 복사

3. 문서 파일들(*.md, *.txt)을 docs 디렉터리로 이동

4. 데이터 파일들(*.csv, *.dat)을 data 디렉터리로 이동

```bash
mkdir -p scripts config docs data
mv *.sh scripts/
cp *.conf *.config config/
mv *.md *.txt docs/
mv *.csv *.dat data/
```

---

힌트
{} 중괄호 확장 활용: mkdir {dir1,dir2,dir3}

[] 문자 범위 활용: [1-3], [a-z]

\* 와일드카드 활용: file*, *.txt

? 단일 문자 활용: file?.txt

복합 패턴 활용: *[0-9]*, file[1-3].txt

디렉터리 생성 시 -p 옵션 활용: mkdir -p path/to/directory


