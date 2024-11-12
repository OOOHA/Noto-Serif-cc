// 清空輸入框
function clearInput() {
    document.getElementById('textInput').value = '';
  }
  
  // 顯示輸入的文字在不同字體區域
  function displayText() {
    const inputText = document.getElementById('textInput').value;
    document.getElementById('output-cn').textContent = inputText;
    document.getElementById('output-tw').textContent = inputText;
  }