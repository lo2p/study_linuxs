✅ 문제 : 간단한 서버 관리 스크립트 작성
🔧 요구사항
start: 포트 8000에서 http.server를 백그라운드로 실행 (nohup, 로그는 server.log)

stop: 실행 중인 프로세스를 찾아 종료

status: 프로세스가 실행 중인지 확인하여 출력

restart: 중지 후 다시 실행

🎯 실행 예시
```bash
$ ./webserver.sh start
서버가 백그라운드에서 시작되었습니다.

$ ./webserver.sh status
서버 실행 중입니다. PID: 13579

$ ./webserver.sh stop
서버가 종료되었습니다.

$ ./webserver.sh tail_log
… log message 확인
```

문제 모두 조건에 따라:
if [ "$1" == "start" ] 식으로 흐름 제어

변수 PORT, PID, LOGFILE 등을 정의해 구성 가능


```bash
if [ "$1" = "start" ]; then
        nohup python3 -m http.server 8000 --bind 0.0.0.0 > server.log &
elif [ "$1" = "status" ]; then
        V_PID=$(ps aux | grep "python" | grep "http.server" | tr -s " " | cut -d" " -f2)
        if  [ -z "$V_PID" ]; then
                echo "실행 중인 서버가 없습니다."
        else
                echo "서버 실행 중입니다. PID: $V_PID"
        fi
elif [ "$1" = "stop" ]; then
        V_PID=$(ps aux | grep "python" | grep "http.server" | tr -s " " | cut -d" " -f2)
        kill "$V_PID"
elif [ "$1" = "restart" ]; then
        V_PID=$(ps aux | grep "python" | grep "http.server" | tr -s " " | cut -d" " -f2)
        kill "$V_PID"
        nohup python3 -m http.server 8000 --bind 0.0.0.0 > server.log &
elif [ "$1" = "tail_log" ]; then
        tail server.log
else
        echo "error! entered: $1"
fi
```

