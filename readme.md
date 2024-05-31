# PHP 讀取多筆資料
## 設定
1. 整包放入你 XAMPP 中的 htdocs
2. 在 XAMPP 中載入 tea.sql 並執行，把假資料建立
3. 修改連線設定 PDO_connect.php
4. 這個範例是聽取要求所撰寫，目標是使用純 PHP 去選擇同一分類下的多筆內容顯示
5. 記得按星星讓老師知道你有來看過
6. [示範網址](https://sagedaben.com/iSpan/php/tea_01/)

## css
1. 使用 flex 讓 .d-flex 下的 .left 和 .right 左右排列
2. 把 checkbox 隱藏起來，用與 checkbox 關連的 label 做為視覺與觸發對象
3. `input[type=checkbox]+label` 是沒被選取時的樣子
4. `input[type=checkbox]:checked+label` 是被選取時的樣子
5. 利用 css 把純文字的 label 做得像按鈕

## 第 1 區塊
1. PHP 的程式主要分三區，第一區是讀取主分類區，讀出來的內容繪製成下拉式選單
2. 下拉式選單放在 form 元素中，行為是 post，利用不斷 post 到自己這頁來切換視覺呈現
3. 除了下拉式選單外，還有一個隱藏的欄位 tea_ids 用來記錄 post 進來的 tea_ids
4. 當下拉式選單觸發選取動作時，會將 tea_ids 清空，因為換一個分類後，把上個分類顯示的內容清除算是正常行為
5. 除此之外，也會觸發這一頁的送出，也就是會 post 到自己這頁，用這個方法改變視覺變化依賴的變數
6. 這一區也會把 post 進來的變數，像是 category_id 和 tea_ids 整理，整理成其他區可以用的數字型態或陣列型態

## 第 2 區塊
1. 這一區是要把 post 進來的 category_id 所存放的變數 $selectedCategoryId 當做 SQL 中判斷依據，取出所有同分類的的 tea 的名稱
2. 取出來的內容用迴圈繪製成一組一組的 checkbox 和 label
3. checkbox 和 label 的 id 與 for 用資料的 id 與固定字串來生成
4. 這裡所有的 checkbox 的 name 都取做 `tea_ids[]`，加上個中括號
5. 這個用法並不是 PHP 特有的，而是 HTML 表單的標準功能
6. 這種命名方式允許在送出表單時將多個值作為陣列發送給伺服器
7. 這些 checkbox 放在另一個 form 標籤中，而 checkbox 值發生變化時，就會馬上 post 到自己這頁來繪製視覺

## 第 3 區塊
1. 這一區就是把 post 來的 tea_ids 轉成的陣列 $selectedTeaIds 跑迴圈繪製視覺
2. 陣列中是對應 tea 資料夾的內容，所以迴圈就是下 SQL 去 tea 中把對應的 id 內容取出