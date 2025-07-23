V_varcount="$#"

if [ $# -ne 2 ]; then
    echo "Argument가 $V_varcount 개 입니다. 2개를 입력해야 합니다."
    return 1
fi

V_filename="$1"
V_text="$2"

echo "$V_text" > "$V_filename"
echo "$V_filename 파일이 성공적으로 생성되었습니다."