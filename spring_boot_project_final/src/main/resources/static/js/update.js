/**
 * 	update.js
 */
function deleteFile() {
        var fileInfoElement = document.getElementById('fileInfo');
        if (fileInfoElement) {
            // AJAX를 이용하여 서버에서 파일 삭제 처리 (예시로만 작성)
            var fileUrl = document.getElementById('fileUrl').value;
            // AJAX 요청 예시 (실제 서버 URL과 데이터 전송은 프로젝트에 맞게 수정 필요)
            var xhr = new XMLHttpRequest();
            xhr.open('POST', '/deleteFile', true);
            xhr.setRequestHeader('Content-Type', 'application/json');
            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        // 파일 삭제 성공 시 요소 제거
                        fileInfoElement.parentNode.removeChild(fileInfoElement);
                        // 파일 업로드 필드 보이게 설정
                        document.getElementById('uploadFile').style.display = 'block';
                        alert('파일이 삭제되었습니다.');
                    } else {
                        alert('파일 삭제 중 오류가 발생했습니다.');
                    }
                }
            };
            xhr.send(JSON.stringify({ url: fileUrl }));
        }
    }