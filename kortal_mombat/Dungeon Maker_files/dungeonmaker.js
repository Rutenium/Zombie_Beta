function maplayer1()
{
 widthcounter=0;
 heightcounter=0;
 document.write('<table id="maptable1" class="gridon"><tr><td class="mapshow">&nbsp;</td>');
 for(widthcounter=1; widthcounter <= tiles_wide; widthcounter++) document.write('<td class="mapshow">' + widthcounter + '</td>');
 document.write('<td class="mapshow">&nbsp;</td></tr>');
 for(heightcounter=1; heightcounter <= tiles_high; heightcounter++)
 {
  document.write('<tr><td class="mapshow">' + heightcounter + '</td>');
  for(widthcounter=1; widthcounter <= tiles_wide; widthcounter++)
  {
   label='1im' + widthcounter + 'x' + heightcounter;
   document.write('<td><a href="javascript: void(0)" onClick=switch_tile2("' + label + '")><img id="' + label + '" src="' + image_location + 'blank.gif" width="' + tilesize + '" height="' + tilesize + '" alt="" /></a></td>');
  }
  document.write('<td class="mapshow">' + heightcounter + '</td></tr>');
 }
 document.write('<tr><td class="mapshow">&nbsp;</td>');
 for(widthcounter=1; widthcounter <= tiles_wide; widthcounter++) document.write('<td class="mapshow">' + widthcounter + '</td>');
 document.write('<td class="mapshow">&nbsp;</td></tr></table></div>');
}

function maplayer4(layer)
{
 widthcounter=0;
 heightcounter=0;
 document.write('<table id="maptable' + layer + '" class="gridon"><tr><td class="mapshow">&nbsp;</td>');
 for(widthcounter=1; widthcounter <= tiles_wide; widthcounter++) document.write('<td class="mapshow">' + widthcounter + '</td>');
 document.write('<td class="mapshow">&nbsp;</td></tr>');
 for(heightcounter=1; heightcounter <= tiles_high; heightcounter++)
 {
  document.write('<tr><td class="mapshow">' + heightcounter + '</td>');
  for(widthcounter=1; widthcounter <= tiles_wide; widthcounter++)
  {
   label='im' + widthcounter + 'x' + heightcounter;
   if(layer == 1) document.write('<td><img id="1' + label + '" src="' + floor + '" width="' + tilesize + '" height="' + tilesize + '" alt="" /></td>');
   if(layer == 2) document.write('<td><img id="2' + label + '" src="' + image_location + 'clear.gif" width="' + tilesize + '" height="' + tilesize + '" alt="" /></td>');
   if(layer == 3) document.write('<td><img id="3' + label + '" src="' + image_location + 'clear.gif" width="' + tilesize + '" height="' + tilesize + '" alt="" /></td>');
   if(layer == 4) document.write('<td><a href="javascript: void(0)" onClick=switch_tile("' + label + '")><img id="4' + label + '" src="' + image_location + 'clear.gif" width="' + tilesize + '" height="' + tilesize + '" alt="" /></a></td>');
  }
  document.write('<td class="mapshow">' + heightcounter + '</td></tr>');
 }
 document.write('<tr><td class="mapshow">&nbsp;</td>');
 for(widthcounter=1; widthcounter <= tiles_wide; widthcounter++) document.write('<td class="mapshow">' + widthcounter + '</td>');
 document.write('<td class="mapshow">&nbsp;</td></tr></table></div>');
}

function switch_image(newimage)
{
 image=image_location + newimage;
 document.getElementById("selected").src=image;
}

function switch_checkbox(layer)
{
 checkbox=document.getElementById("checkbox" + layer);
 if(checkbox.checked == true) document.getElementById("maplayer" + layer).className = "show";
 else
 {
  document.getElementById("maplayer" + layer).className = "hide";
  var allinput=document.getElementsByTagName("input");
  var checkbox_counter=0;
  for(var n=0; n < allinput.length; n++)
  {
   if(allinput[n].type == "checkbox" && allinput[n].value == "layers" && allinput[n].checked == true) checkbox_counter++;
  }
  if(checkbox_counter == 0)
  {
   document.getElementById("maplayer1").className="show";
   document.getElementById("checkbox1").checked="true";
  }
 }
}

function switch_radio(newradio,newtile)
{
 document.getElementById("tiles" + oldradio).className = "hide";
 document.getElementById("tiles" + newradio).className = "show";
 document.getElementById("checkbox" + newradio).checked = "true";
 switch_checkbox(newradio);
 oldradio=newradio;
 image=image_location + newtile;
 document.getElementById("selected").src=image;
}

function switch_radio2(newradio,newtile)
{
 document.getElementById("tiles" + oldradio).className = "hide";
 document.getElementById("tiles" + newradio).className = "show";
 oldradio=newradio;
 image=image_location + newtile;
 document.getElementById("selected").src=image;
}

function switch_coords()
{
 var elems = document.getElementsByTagName("td");
 for (var i=0; i<elems.length; i++)
 if(elems[i].className == "mapshow") elems[i].className = "maphide";
 else if(elems[i].className == "maphide") elems[i].className = "mapshow";
}

function switch_grid(layers)
{
 if(document.getElementById("maptable1").className == "gridon")
 {
  for (var i=1; i <= layers; i++) document.getElementById("maptable" + i).setAttribute("class", "gridoff");
 }
 else
 {
  for (var i=1; i <= layers; i++) document.getElementById("maptable" + i).setAttribute("class", "gridon");
 }
}

function switch_tile(tile)
{
 document.getElementById(oldradio + tile).src=image;
}

function switch_tile2(tile)
{
 document.getElementById(tile).src=image;
}

function switch_size()
{
 var tilesize=document.getElementById("tilesize").value;
 var maptable=document.getElementById("map");
 var elems=maptable.getElementsByTagName("img");
 for (var i=0; i<elems.length; i++)
 {
  elems[i].width=tilesize
  elems[i].height=tilesize;
 }
}

function switch_layer()
{
 var maptable=document.getElementById("maptable" + oldradio);
 var elems=maptable.getElementsByTagName("img");
 var image_split=image.split("/");
 var image_name=(image_split[image_split.length-1]);
 for (var i=0; i<elems.length; i++)
 {
  elems_split=elems[i].src.split("/");
  elems_name=(elems_split[elems_split.length-1]);
  if(image_name.substring(0,4) == "lava")
  {
   if(elems_name == "blank.gif" || elems_name.substring(0,4) == "lava")
   {
    random_number=Math.floor((Math.random()*8)+1);
    random_image=image_location + 'lava_' + random_number + '.gif';
    elems[i].src=random_image;
   }
  }
  else if(elems_name == "blank.gif" || elems_name == "clear.gif") elems[i].src=image;
 }
}

function newmapper()
{
 responce=confirm("You are about to renew the map, do you want to continue?");
 if(responce == true)
 {
  document.getElementById("rawdata").value="";
  document.forms[0].target="_self";
  document.forms[0].action=action;
  document.forms[0].submit();
 }
}

function loadmap(layers)
{
 textarea=document.getElementById("rawdata").value;
 if(textarea == "") alert("Text area contains no data.");
 else
 {
  var text_array=textarea.split('\n');
  var text_y=Math.floor((text_array.length)/layers);
  var text_line=text_array[0];
  var line_array=text_line.split(',');
  var text_x=line_array.length;
  if(text_x == tiles_wide && text_y == tiles_high)
  {
   responce=confirm("You are about to load the text data to create a map. You will lose the current map, are you sure you want to generate a new map?");
   if(responce == true)
   {
    textarea=textarea.replace(/\n/g, ",");
    var text_array=textarea.split(',');
    var map=document.getElementById("map");
    var elems=map.getElementsByTagName("img");
    for (var i=0; i<elems.length; i++)
    {
     image_src=image_location + text_array[i];
     elems[i].src=image_src;
    }
   }
  }
  else
  {
   responce=confirm("The map you are trying to load is a different size to the current map, do you want the grid resized?");
   if(responce == true)
   {
    document.getElementById("xcors").value=text_x;
    document.getElementById("ycors").value=text_y;
    document.forms[0].target="_self";
    document.forms[0].action=action;
    document.forms[0].submit();
   }
  }
 }
}

function displaymap(layers)
{
 textarea=document.getElementById("rawdata").value;
 if(textarea != "")
 {
  var text_array=textarea.split('\n');
  var text_y=Math.floor((text_array.length)/layers);
  var text_line=text_array[0];
  var line_array=text_line.split(',');
  var text_x=line_array.length;
  if(text_x == tiles_wide && text_y == tiles_high)
  {
   textarea=textarea.replace(/\n/g, ",");
   var text_array=textarea.split(',');
   var map=document.getElementById("map");
   var elems=map.getElementsByTagName("img");
   for (var i=0; i<elems.length; i++)
   {
    image_src=image_location + text_array[i];
    elems[i].src=image_src;
   }
  }
 }
}

function ascii()
{
 textarea=document.getElementById("rawdata").value;
 if(textarea != "")
 {
  var text_array=textarea.split('\n');
  var text_y=Math.floor(text_array.length-6);
  var text_line=text_array[1];
  var text_x=Math.floor(text_line.length-9);
  var floorarea2="";
  var wallarea2="";
  var objectarea2="";
  var specialarea2="";
  for (var i=3; i<text_y+3; i++)
  {
   var text_line1=text_array[i];
   i++;
   var text_line2=text_array[i];
   var floorarea="";
   var wallarea="";
   var objectarea="";
   var specialarea="";
   for (var j=6; j<text_x+4; j=j+3)
   {
    var j1=j+1;var j2=j+2;var j3=j+3;
    var north="o";var south="o";var west="o";var east="o";
    if(text_line1.substring(j1, j2) == " ") north="n";
    if(text_line2.substring(j1, j2) == " ") south="s";
    if(text_line1.substring(j, j1) == " ") west="w";
    if(text_line2.substring(j, j1) == " ") west="w";
    if(text_line1.substring(j, j1) == "Ä") west="w";
    if(text_line2.substring(j, j1) == "_") west="w";
    if(text_line1.substring(j2, j3) == " ") east="e";
    if(text_line2.substring(j2, j3) == " ") east="e";
    if(text_line1.substring(j2, j3) == "Ä") east="e";
    if(text_line2.substring(j2, j3) == "_") east="e";
    var door=",clear.gif";
    floorarea=floorarea+",blank.gif";
    wallarea=wallarea+",dungeon_"+north+south+west+east+".gif";
    objectarea=objectarea+door;
    specialarea=specialarea+",clear.gif";
   }
   floorarea=floorarea.replace(",","");
   wallarea=wallarea.replace(",","");
   objectarea=objectarea.replace(",","");
   specialarea=specialarea.replace(",","");
   var floorarea2=floorarea2+floorarea+"\n";
   var wallarea2=wallarea2+wallarea+"\n";
   var objectarea2=objectarea2+objectarea+"\n";
   var specialarea2=specialarea2+specialarea+"\n";
  }
 }
 document.getElementById("rawdata").value=floorarea2+wallarea2+objectarea2+specialarea2;
}

function generate()
{
 var textarea="";
 var maptable=document.getElementById("map");
 var elems=maptable.getElementsByTagName("img");
 var fullheight=sheets*tiles_high;
 var width_counter=0;
 var height_counter=1;
 for (var i=0; i<elems.length; i++)
 {
  width_counter++;
  image_src=elems[i].src;
  image_array=image_src.split(image_location);
  image_src=image_array[1];
  if(width_counter < tiles_wide) textarea=textarea + image_src + ",";
  else
  {
   if(height_counter < fullheight)
   {
    textarea=textarea + image_src + '\n';
    height_counter++;
    width_counter=0;
   }
   else
   {
    textarea=textarea + image_src;
    i++;
   }
  }
 }
 document.getElementById("rawdata").value=textarea;
}

function makeimage()
{
 textarea=document.getElementById("rawdata").value;
 if(textarea == "")
 {
  alert("Text area contains no data. Generate text from map, or load previously saved text map before making image."); 
 }
 else
 {
  document.forms[0].target="_new";
  document.forms[0].action="image.php";  
  document.forms[0].submit();
 }
}

function show_help()
{
 window.open("help.php", "_blank", "status=no,toolbar=no,menubar=no,location=no,resizable=yes,scrollbars=yes,width=600,height=400");
}

function switch_floor()
{
 var maptable=document.getElementById("maptable1");
 var elems=maptable.getElementsByTagName("img");
 for (var i=0; i<elems.length; i++)
 {
  elems_split=elems[i].src.split("/");
  elems_name=(elems_split[elems_split.length-1]);
  if(elems_name == "blank.gif") elems[i].src=image;
 }
}