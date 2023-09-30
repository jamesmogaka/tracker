<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Presentations</title>
</head>
<body>
    <h1>Minutes</h1>
   <?php include 'query.php';?>
    <script type="module">
        import {display} from "./minutes.js";
       
        const minutes =  <?php 
            //Call the function to fetch minutes
            echo fetch_minutes();
        ?>;
            minutes.forEach(minute =>{
              display(minute);  
            });
    </script>

</body>
</html>