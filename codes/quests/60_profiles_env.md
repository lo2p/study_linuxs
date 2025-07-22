각 실습 후 su - 사용자명, ls -R ~/Downloads, cat 등을 통해 적용 여부를 확인하십시오.

---

## 🧪 환경 변수 및 초기화 스크립트 실습 문제

### 🔹 문제 1. 로그인 시마다 "Welcome, USERNAME" 메시지를 출력하시오.

조건:

- 현재 로그인한 사용자명을 포함할 것 ($USER)  
- 로그인할 때마다 자동으로 출력되도록 설정할 것 

```bash
echo "echo 'Welcome, $USER'" >> .bash_profile
```
또는 env $USER 사용

---

### 🔹 문제 2. 로그인 시 사용자의 Downloads/ 폴더 내 일반 파일을 삭제하시오.

조건:

- 경로: ~/Downloads/
- 일반 파일만 삭제 (서브디렉토리, 숨김파일은 삭제하지 않음)  
- 로그인 시 자동 실행  

./bash_profile
```bash
echo "rm -f ~/Downloads/*" >> .bash_profile
```

---

### 🔹 문제 3. 로그인할 때마다 ~/Downloads/ 경로에 다음 구조로 디렉토리 및 파일을 자동 생성하도록 설정하시오.

생성 구조:

```
- ~/Downloads/
-  └── auto_created/
-       ├── info.txt
-       └── logs/
-            └── log.txt
```

조건:

- 파일에는 임의의 간단한 문자열이 들어갈 것    
- 매 로그인마다 자동 생성  

```bash
printf "mkdir -p '$HOME/Downloads/auto_created/logs'\ntouch '$HOME/Downloads/auto_created/info.txt'\ntouch '$HOME/Downloads/auto_created/logs/log.txt'" >> .bash_profile
```

---

### 🔹 문제 4. /etc/profile을 수정하여, 로그인 시 모든 사용자에게 공지 메시지 /etc/login_notice.txt를 출력하도록 설정하시오.

조건:

- 출력 방식은 cat, echo 등 자유  
- 시스템 전체 사용자에게 적용  
- /etc/login_notice.txt는 임의의 내용을 사전에 작성해 둘 것  
- sudo 권한 필요  

```bash
# bash
sudo bash -c echo "공식 메시지" >> /etc/login_notice.txt
sudo bash -c echo "cat /etc/login_notice.txt" >> /etc/profile

# tee
echo "공식 메시지" | sudo tee /etc/login_notice.txt
echo "cat /etc/login_notice.txt" | sudo tee -a /etc/profile
```

---
