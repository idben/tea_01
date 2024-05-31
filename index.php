<!DOCTYPE html>
<html lang="zh-TW">
<head>
  <meta charset="UTF-8">
  <link rel="stylesheet" href="main.css">
  <title>茶類分類</title>
</head>
<body>
  <div class="d-flex">
    <div class="left">
      <form method="POST" action="">
        <select name="category_id" onchange="this.form.tea_ids.value='[]'; this.form.submit()">
          <option value="">請選擇分類</option>
          <?php
          include 'PDO_connect.php';

          try {
            $sql = "SELECT * FROM tea_category";
            $stmt = $db_host->prepare($sql);
            $stmt->execute();
            $categories = $stmt->fetchAll(PDO::FETCH_ASSOC);

            $selectedCategoryId = isset($_POST['category_id']) ? intval($_POST['category_id']) : '';
            $selectedTeaIds = isset($_POST['tea_ids']) ? (is_string($_POST['tea_ids']) ? json_decode($_POST['tea_ids'], true) : $_POST['tea_ids']) : [];

            if (!is_array($selectedTeaIds)) {
              $selectedTeaIds = [];
            }

            foreach ($categories as $category) {
              $categoryId = htmlspecialchars($category['id'], ENT_QUOTES, 'UTF-8');
              $categoryName = htmlspecialchars($category['name'], ENT_QUOTES, 'UTF-8');
              $selected = $selectedCategoryId == $category['id'] ? 'selected' : '';
              echo "<option value=\"{$categoryId}\" {$selected}>{$categoryName}</option>";
            }

          } catch(PDOException $e) {
            echo "查詢失敗<br>";
            echo "Error: " . $e->getMessage() . "<br>";
          }
          ?>
        </select>
        <input type="hidden" name="tea_ids" value="<?php echo htmlspecialchars(json_encode($selectedTeaIds), ENT_QUOTES, 'UTF-8'); ?>">
      </form>
      <?php
        if (!empty($selectedCategoryId)) {
          try {
            $sql = "SELECT * FROM tea WHERE category_id = :category_id";
            $stmt = $db_host->prepare($sql);
            $stmt->bindParam(':category_id', $selectedCategoryId, PDO::PARAM_INT);
            $stmt->execute();
            $teas = $stmt->fetchAll(PDO::FETCH_ASSOC);

            if ($teas) {
              echo "<form method='POST' action=''>";
              echo "<input type='hidden' name='category_id' value='{$selectedCategoryId}'>";
              echo "<ul>";
              foreach ($teas as $tea) {
                $teaName = htmlspecialchars($tea['name'], ENT_QUOTES, 'UTF-8');
                $teaId = htmlspecialchars($tea['id'], ENT_QUOTES, 'UTF-8');
                $checked = in_array($tea['id'], $selectedTeaIds) ? 'checked' : '';
                echo "<li>";
                echo "<input type='checkbox' id='tea_{$teaId}' name='tea_ids[]' value='{$teaId}' onchange='this.form.submit()' {$checked}>";
                echo "<label for='tea_{$teaId}'>{$teaName}</label>";
                echo "</li>";
              }
              echo "</ul>";
              echo "</form>";
            } else {
              echo "沒有找到任何茶";
            }

          } catch(PDOException $e) {
            echo "查詢失敗<br>";
            echo "Error: " . $e->getMessage() . "<br>";
          }
        }
      ?>
    </div>
    <div class="right">
      <?php
        if (!empty($selectedTeaIds)) {
          foreach ($selectedTeaIds as $teaId) {
            try {
              $sql = "SELECT * FROM tea WHERE id = :tea_id";
              $stmt = $db_host->prepare($sql);
              $stmt->bindParam(':tea_id', $teaId, PDO::PARAM_INT);
              $stmt->execute();
              $tea = $stmt->fetch(PDO::FETCH_ASSOC);

              if ($tea) {
                $teaName = htmlspecialchars($tea['name'], ENT_QUOTES, 'UTF-8');
                $teaDescription = htmlspecialchars($tea['description'], ENT_QUOTES, 'UTF-8');
                $teaLatitude = htmlspecialchars($tea['latitude'], ENT_QUOTES, 'UTF-8');
                $teaLongitude = htmlspecialchars($tea['longitude'], ENT_QUOTES, 'UTF-8');
                $teaImageUrl = htmlspecialchars($tea['image_url'], ENT_QUOTES, 'UTF-8');
                echo "<h1>{$teaName}</h1>";
                echo "<p>描述: {$teaDescription}</p>";
                echo "<p>座標: ({$teaLatitude}, {$teaLongitude})</p>";
                echo "<p><img src='{$teaImageUrl}' alt='{$teaName}'></p>";
              } else {
                echo "沒有找到相應的茶";
              }

            } catch(PDOException $e) {
              echo "查詢失敗<br>";
              echo "Error: " . $e->getMessage() . "<br>";
            }
          }
        }
      ?>
    </div>
  </div>



</body>
</html>
