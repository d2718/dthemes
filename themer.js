
/*
 * Themeing tool!
 */
"use strict";

function clear(elt) {
    while(elt.firstChild) {
        clear(elt.lastChild);
        elt.removeChild(elt.lastChild);
    }
}

const BODY = document.getElementsByTagName("body")[0];
const TAB = document.getElementById("colors");
const CTL = {
    "bkg": document.getElementById("bkg"),
    "add": document.getElementById("add")
};

CTL.bkg.addEventListener(
    "change",
    function(evt) {
        const color = this.value;
        BODY.style.backgroundColor = color;
    }
);

function add_color(e) {
    const tr = document.createElement("tr");
    const ipttd = document.createElement("td");
    const ipt = document.createElement("input");
    ipt.setAttribute("type", "color");
    ipttd.appendChild(ipt);
    tr.appendChild(ipttd);
    
    const outputtd = document.createElement("td");
    tr.appendChild(outputtd);
    const texttd = document.createElement("td");
    texttd.setAttribute("class", "output");
    tr.appendChild(texttd);
    
    const darkspan = document.createElement("span");
    darkspan.style.color = "black";
    texttd.appendChild(darkspan);
    const lightspan = document.createElement("span");
    lightspan.style.color = "white";
    texttd.appendChild(lightspan);
    
    const removetd = document.createElement("td");
    const removebutton = document.createElement("button");
    removebutton.innerHTML = "<label>[-]</label>";
    removetd.appendChild(removebutton);
    tr.appendChild(removetd);
    
    ipt.addEventListener(
        "change",
        function(evt) {
            const color = this.value;
            outputtd.style.backgroundColor = color;
            darkspan.innerHTML = color;
            lightspan.innerHTML = color;
        }
    );
    
    removebutton.addEventListener(
        "click",
        function(evt) {
            clear(tr);
            tr.remove();
        }
    );
    
    TAB.appendChild(tr);
}

CTL.add.addEventListener("click", add_color)