main() {
    V_VARCOUNT="$#"

    if [ $# -ne 2 ]; then
        echo "Argument가 $V_VARCOUNT 개 입니다. 2개를 입력해야 합니다."
        return 1
    fi

    V_FILENAME="$1"
    V_TEXT="$2"

    echo "$V_TEXT" > "$V_FILENAME"
    echo "$V_FILENAME 파일이 성공적으로 생성되었습니다."
}

main "$@"