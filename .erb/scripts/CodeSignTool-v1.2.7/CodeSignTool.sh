if [[ -z "${CODE_SIGN_TOOL_PATH}" ]]; then
  java -cp "./jar/picocli-4.6.1.jar:./jar/bcprov-jdk15on-1.65.01.jar:./jar/httpclient-4.5.13.jar:./jar/json-simple-1.1.1.jar:./jar/jsign-core-3.1.jar:./jar/commons-io-2.8.0.jar:./jar/bcpkix-jdk15on-1.65.jar:./jar/code_sign_tool-1.2.7.jar:./jar/httpcore-4.4.13.jar:./jar/commons-logging-1.2.jar:./jar/log4j-api-2.17.1.jar:./jar/log4j-core-2.17.1.jar:./jar/poi-4.1.2.jar:./jar/commons-lang3-3.9.jar:./jar/commons-math3-3.6.1.jar:./jar/totp-1.0.jar:./jar/commons-codec-1.15.jar" com.ssl.code.signing.tool.CodeSignTool $@  
else
  java -cp "${CODE_SIGN_TOOL_PATH}/jar/picocli-4.6.1.jar:${CODE_SIGN_TOOL_PATH}/jar/bcprov-jdk15on-1.65.01.jar:${CODE_SIGN_TOOL_PATH}/jar/httpclient-4.5.13.jar:${CODE_SIGN_TOOL_PATH}/jar/json-simple-1.1.1.jar:${CODE_SIGN_TOOL_PATH}/jar/jsign-core-3.1.jar:${CODE_SIGN_TOOL_PATH}/jar/commons-io-2.8.0.jar:${CODE_SIGN_TOOL_PATH}/jar/bcpkix-jdk15on-1.65.jar:${CODE_SIGN_TOOL_PATH}/jar/code_sign_tool-1.2.7.jar:${CODE_SIGN_TOOL_PATH}/jar/httpcore-4.4.13.jar:${CODE_SIGN_TOOL_PATH}/jar/commons-logging-1.2.jar:${CODE_SIGN_TOOL_PATH}/jar/log4j-api-2.17.1.jar:${CODE_SIGN_TOOL_PATH}/jar/log4j-core-2.17.1.jar:${CODE_SIGN_TOOL_PATH}/jar/poi-4.1.2.jar:${CODE_SIGN_TOOL_PATH}/jar/commons-lang3-3.9.jar:${CODE_SIGN_TOOL_PATH}/jar/commons-math3-3.6.1.jar:${CODE_SIGN_TOOL_PATH}/jar/totp-1.0.jar:${CODE_SIGN_TOOL_PATH}/jar/commons-codec-1.15.jar" com.ssl.code.signing.tool.CodeSignTool $@
fi