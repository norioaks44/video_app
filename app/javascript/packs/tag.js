if (location.pathname.match("videos/new")){
  document.addEventListener("DOMContentLoaded", () => {
    const inputElement = document.getElementById("videos_tag_name");
    inputElement.addEventListener("keyup", () => {
      const keyword = document.getElementById("videos_tag_name").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `search/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = () => {
        const searchResult = document.getElementById("search-result");
        searchResult.innerHTML = "";
        if (XHR.response) {
          const tagName = XHR.response.keyword;
          tagName.forEach((tag) => {
            const childElement = document.createElement("div");
            childElement.setAttribute("class", "child");
            childElement.setAttribute("id", tag.id);
            childElement.innerHTML = tag.name;
            searchResult.appendChild(childElement);
            const clickElement = document.getElementById(tag.id);
            clickElement.addEventListener("click", () => {
              document.getElementById("videos_tag_name").value = clickElement.textContent
              clickElement.remove();
            });
          });
        };
      };
    });
  });
};

// 
// if (location.pathname.match("videos/new")){
  // videos/newでのみ読み込む。
//   document.addEventListener("DOMContentLoaded", () => {
  // HTML文書の読み込み完了後に発生させる。
//     const inputElement = document.getElementById("videos_tag_name");
  // タグフォームのidを取得する。
//     inputElement.addEventListener("keyup", () => {
  // フォームで入力する度に発火する。
//       const keyword = document.getElementById("videos_tag_name").value;
  // 入力されたフォームの文字を代入する。
//       const XHR = new XMLHttpRequest();
  // XHRオブジェクトでインスタンス生成し、代入する。
//       XHR.open("GET", `search/?keyword=${keyword}`, true);
  // openメソッド。リクエスト内容(HTTPメソッド、URL、非同期通信(true))。
//       XHR.responseType = "json";
  // json形式を指定する。コントローラから返却されるデータ。
//       XHR.send();
  // 送信する処理の記述。
//       XHR.onload = () => {
  // レスポンス受信が成功すると呼び出させる。
//         const tagName = XHR.response.keyword;
  // レスポンス(入力された文字)として返ってくるデータ全てを代入。
//         const searchResult = document.getElementById("search-result");
  // ① idの"search-result"を取得。
//         searchResult.innerHTML = "";
  // search-resultを空にして表示されているタグを消す。
//         tagName.forEach((tag) => {
  // 繰り返し。 "tag"の検索結果があるだけ②③を繰り返す。
//           const childElement = document.createElement("div");
  // ② divを生成。
//           childElement.setAttribute("class", "child");
  // class="child"を追加。
//           childElement.setAttribute("id", tag.id);
  // tag.id で タグ番号を指定。
//           childElement.innerHTML = tag.name;
  // ③ ②へtag.name でタグ名を挿入。
//           searchResult.appendChild(childElement);
  // childElementをsearchResultへ追加
//           const clickElement = document.getElementById(tag.id);
  // tag.idを取得
//           clickElement.addEventListener("click", () => {
  // クリックイベント
//             document.getElementById("videos_tag_name").value = clickElement.textContent
  // tag.nameを.textContent → タグフォームに挿入
//             clickElement.remove();
  // クリック後削除　　ここまで繰り返し
//           });
//         });
//       };
//     });
//   });
// };