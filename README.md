# Autohotkey-buffer

오토핫키를 이용하여 만든 버퍼 입니다.

오토핫키는 다른 소켓서버와 연동이 힘든부분이 있습니다.
그중 하나가 간편하게 사용 가능한 버퍼 시스템의 부재 입니다.

## 어떻게 시작하나요?

### Prerequisites / 선행 조건

아래 사항들이 설치가 되어있어야합니다.

```
AutoHotkey_L 1.1.3+
```

### How to use? / 사용방법

사용법은 간단합니다.
일단 버퍼를 만듭니다
```AutoHotkey
#Include ../NcsBuffer.ahk

tmpBuffer := VarSetCapacity(tmpBuffer, 1024)
buffer := new NcsBuffer(1024, &tmpBuffer)
```

해당 버퍼는 2 가지함수를 이용하여 읽고 쓰기가 가능합니다.

Append{Type}()

Extract{Type}()


```AutoHotkey
buffer.AppendByte(10) ; 10의 값을 Byte 자료형으로 버퍼에 넣음

tmpData := buffer.ExtractByte() ; 버퍼에서 Byte 값을 추출함 => 10
```

또한 Byte 뿐만이 아니라 Text 와 같은 문자열 값도 넣을 수 있습니다.

더 자새한 사용법은 Wiki 에서 확인 가능 합니다.

## Built With / 누구랑 만들었나요?

* [Hotkey](https://github.com/Hot-key)

## License / 라이센스

This project is licensed under the MIT License - see the [LICENSE.md](https://gist.github.com/PurpleBooth/LICENSE.md) file for details / 이 프로젝트는 MIT 라이센스로 라이센스가 부여되어 있습니다. 자세한 내용은 LICENSE.md 파일을 참고하세요.
