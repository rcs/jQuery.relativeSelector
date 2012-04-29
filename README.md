

Add the script tag to the page after loading jQuery.

<script src="scripts/jQuery.relativeSelector.js"></script>

Then in your code:

```javascript
$('div').relativeSelector() // #page-text div.dokeeno-html:eq(1) div:eq(1)
```

# Examples
Given a page like:

```html
<html>
  <head>
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="jQuery.relativeSelector.js"></script>
  </head>

  <body>
    <div id="firstDiv">
    </div>
    <div>
    </div>
    <div class="firstClass">
      <div></div>
    </div>
    <div class="secondClass">
    </div>
    <div class="secondClass">
      <div></div>
    </div>
  </body>
</html>
```

Running
```javascript
  $('div').each(function() { $('<div>').html( $(this).relativeSelector() ).appendTo('body'); });
```

will give you relative selectors that look like
```
#firstDiv
body div:eq(1)
div.firstClass
div.firstClass div:eq(0)
body div.secondClass:eq(0)
body div.secondClass:eq(1)
body div.secondClass:eq(1) div:eq(0)
```
