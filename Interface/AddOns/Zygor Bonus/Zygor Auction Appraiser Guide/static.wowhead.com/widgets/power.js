if(typeof $WowheadPower=="undefined"){var $WowheadPower=new function(){function B(aC,aB){var ae=document.createElement(aC);if(aB){F(ae,aB)}return ae}function aa(ae,aB){return ae.appendChild(aB)}function av(aB,aC,ae){if(window.attachEvent){aB.attachEvent("on"+aC,ae)}else{aB.addEventListener(aC,ae,false)}}function F(aC,ae){for(var aB in ae){if(typeof ae[aB]=="object"){if(!aC[aB]){aC[aB]={}}F(aC[aB],ae[aB])}else{aC[aB]=ae[aB]}}}function am(ae){if(!ae){ae=event}if(!ae._button){ae._button=ae.which?ae.which:ae.button;ae._target=ae.target?ae.target:ae.srcElement}return ae}function ac(){var ae=0,aB=0;if(typeof window.innerWidth=="number"){ae=window.innerWidth;aB=window.innerHeight}else{if(document.documentElement&&(document.documentElement.clientWidth||document.documentElement.clientHeight)){ae=document.documentElement.clientWidth;aB=document.documentElement.clientHeight}else{if(document.body&&(document.body.clientWidth||document.body.clientHeight)){ae=document.body.clientWidth;aB=document.body.clientHeight}}}return{w:ae,h:aB}}function A(){var ae=0,aB=0;if(typeof(window.pageYOffset)=="number"){ae=window.pageXOffset;aB=window.pageYOffset}else{if(document.body&&(document.body.scrollLeft||document.body.scrollTop)){ae=document.body.scrollLeft;aB=document.body.scrollTop}else{if(document.documentElement&&(document.documentElement.scrollLeft||document.documentElement.scrollTop)){ae=document.documentElement.scrollLeft;aB=document.documentElement.scrollTop}}}return{x:ae,y:aB}}function y(aC){var ae,aD;if(window.innerHeight){ae=aC.pageX;aD=aC.pageY}else{var aB=A();ae=aC.clientX+aB.x;aD=aC.clientY+aB.y}return{x:ae,y:aD}}function ap(aB){var aC={};for(var ae in aB){aC[aB[ae]]=ae}return aC}function aj(ae){var aB=aj.L;return(aB[ae]?aB[ae]:0)}aj.L={fr:2,de:3,es:6,ru:7,ptr:25};function Y(ae){var aB;if(Y.L){aB=Y.L}else{aB=Y.L=ap(aj.L)}return(aB[ae]?aB[ae]:"www")}function g(ae){var aB=g.L;return(aB[ae]?aB[ae]:-1)}g.L={npc:1,object:2,item:3,itemset:4,quest:5,spell:6,zone:7,faction:8,pet:9,achievement:10,profile:100};function Z(ae){aa(s,B("script",{type:"text/javascript",src:ae}))}function G(aF,aB,aE){var aD={12:1.5,13:12,14:15,15:5,16:10,17:10,18:8,19:14,20:14,21:14,22:10,23:10,24:0,25:0,26:0,27:0,28:10,29:10,30:10,31:10,32:14,33:0,34:0,35:25,36:10,37:2.5,44:4.69512176513672};if(aF<0){aF=1}else{if(aF>80){aF=80}}if((aB==14||aB==12||aB==15)&&aF<34){aF=34}if(aE<0){aE=0}var ae;if(aD[aB]==null){ae=0}else{var aC;if(aF>70){aC=(82/52)*Math.pow((131/63),((aF-70)/10))}else{if(aF>60){aC=(82/(262-3*aF))}else{if(aF>10){aC=((aF-8)/52)}else{aC=2/52}}}ae=aE/aD[aB]/aC}return ae}var ab={applyto:3},i=true,H,o,V,j,h,R,Q,s=document.getElementsByTagName("head")[0],U={},I={},al={},ay={},k={},L={},ag={},ar,t,S,X,W,aq=1,at=0,C=!!(window.attachEvent&&!window.opera),a=navigator.userAgent.indexOf("MSIE 7.0")!=-1,c=navigator.userAgent.indexOf("MSIE 6.0")!=-1&&!a,aw={loading:"Loading...",noresponse:"No response from server :("},u=0,O=1,ak=2,f=3,J=4,D=1,w=2,ax=3,ao=5,E=6,ah=10,T=100,b=15,n=15,ai={1:[U,"npc","NPC"],2:[I,"object","Object"],3:[al,"item","Item"],5:[ay,"quest","Quest"],6:[k,"spell","Spell"],10:[L,"achievement","Achievement"],100:[ag,"profile","Profile"]},an={0:"enus",2:"frfr",3:"dede",6:"eses",7:"ruru"},d={wotlk:"www"};if(i){an[25]="ptr"}else{d.ptr="www"}function P(){aa(s,B("link",{type:"text/css",href:"http://static.wowhead.com/widgets/power/power.css?3",rel:"stylesheet"}));if(C){aa(s,B("link",{type:"text/css",href:"http://static.wowhead.com/widgets/power/power_ie.css?3",rel:"stylesheet"}));if(c){aa(s,B("link",{type:"text/css",href:"http://static.wowhead.com/widgets/power/power_ie6.css?3",rel:"stylesheet"}))}}av(document,"mouseover",p)}function r(ae){var aB=y(ae);R=aB.x;Q=aB.y}function q(aK,aI){if(aK.nodeName!="A"&&aK.nodeName!="AREA"){return -2323}if(!aK.href.length){return}var aF,aE,aC,aB,aG={};var ae=function(aL,aN,aM){if(aN=="buff"||aN=="sock"){aG[aN]=true}else{if(aN=="rand"||aN=="ench"||aN=="lvl"||aN=="c"){aG[aN]=parseInt(aM)}else{if(aN=="gems"||aN=="pcs"){aG[aN]=aM.split(":")}else{if(aN=="who"||aN=="domain"){aG[aN]=aM}else{if(aN=="when"){aG[aN]=new Date(parseInt(aM))}}}}}};if(ab.applyto&1){aF=1;aE=2;aC=3;aB=aK.href.match(/^http:\/\/(.+?)?\.?wowhead\.com\/\?(item|quest|spell|achievement|npc|object)=([0-9]+)/);if(aB==null){aB=aK.href.match(/^http:\/\/(.+?)?\.?wowhead\.com\/\?(profile)=([^&#]+)/)}at=0}if(aB==null&&(ab.applyto&2)&&aK.rel){aF=0;aE=1;aC=2;aB=aK.rel.match(/(item|quest|spell|achievement|npc|object)=([0-9]+)/);if(aB==null){aB=aK.rel.match(/(profile)=([^&#]+)/)}at=1}if(aK.rel){aK.rel.replace(/([a-zA-Z]+)=?([a-zA-Z0-9:-]*)/g,ae);if(aG.gems&&aG.gems.length>0){var aH;for(aH=Math.min(3,aG.gems.length-1);aH>=0;--aH){if(parseInt(aG.gems[aH])){break}}++aH;if(aH==0){delete aG.gems}else{if(aH<aG.gems.length){aG.gems=aG.gems.slice(0,aH)}}}}if(aB){var aJ,aD="www";if(aG.domain){aD=aG.domain}else{if(aF&&aB[aF]){aD=aB[aF]}}if(d[aD]){aD=d[aD]}aJ=aj(aD);j=aD;if(!aK.onmousemove){aK.onmousemove=af;aK.onmouseout=N}r(aI);e(g(aB[aE]),aB[aC],aJ,aG)}}function p(aC){aC=am(aC);var aB=aC._target;var ae=0;while(aB!=null&&ae<5&&q(aB,aC)==-2323){aB=aB.parentNode;++ae}}function af(ae){ae=am(ae);r(ae);aA()}function N(){H=null;K()}function au(){if(!ar){var aF=B("div"),aJ=B("table"),aB=B("tbody"),aE=B("tr"),aC=B("tr"),ae=B("td"),aI=B("th"),aH=B("th"),aG=B("th");aF.className="wowhead-tooltip";aI.style.backgroundPosition="top right";aH.style.backgroundPosition="bottom left";aG.style.backgroundPosition="bottom right";aa(aE,ae);aa(aE,aI);aa(aB,aE);aa(aC,aH);aa(aC,aG);aa(aB,aC);aa(aJ,aB);X=B("p");X.style.display="none";aa(X,B("div"));aa(aF,X);aa(aF,aJ);aa(document.body,aF);ar=aF;t=aJ;S=ae;var aD=B("div");aD.className="wowhead-tooltip-powered";aa(aF,aD);W=aD;K()}}function l(aD,aE){var aF=false;if(!ar){au()}if(!aD){aD=ai[H][2]+" not found :(";aE="inv_misc_questionmark";aF=true}else{if(h!=null){if(h.pcs&&h.pcs.length){var aG=0;for(var aC=0,aB=h.pcs.length;aC<aB;++aC){var ae;if(ae=aD.match(new RegExp("<span><!--si([0-9]+:)*"+h.pcs[aC]+"(:[0-9]+)*-->"))){aD=aD.replace(ae[0],'<span class="q8"><!--si'+h.pcs[aC]+"-->");++aG}}if(aG>0){aD=aD.replace("(0/","("+aG+"/");aD=aD.replace(new RegExp("<span>\\(([0-"+aG+"])\\)","g"),'<span class="q2">($1)')}}if(h.c){aD=aD.replace(/<span class="c([0-9]+?)">(.+?)<\/span><br \/>/g,'<span class="c$1" style="display: none">$2</span>');aD=aD.replace(new RegExp('<span class="c('+h.c+')" style="display: none">(.+?)</span>',"g"),'<span class="c$1">$2</span><br />')}if(h.lvl){aD=aD.replace(/\(<!--r([0-9]+):([0-9]+):([0-9]+)-->([0-9.%]+)(.+?)([0-9]+)\)/g,function(aK,aM,aL,aJ,aH,aO,aI){var aN=G(h.lvl,aL,aJ);aN=(Math.round(aN*100)/100);if(aL!=12&&aL!=37){aN+="%"}return"(<!--r"+h.lvl+":"+aL+":"+aJ+"-->"+aN+aO+h.lvl+")"})}if(h.who&&h.when){aD=aD.replace("<table><tr><td><br />",'<table><tr><td><br /><span class="q2">'+sprintf(aw.tooltip_achievementcomplete,h.who,h.when.getMonth()+1,h.when.getDate(),h.when.getFullYear())+"</span><br /><br />");aD=aD.replace(/class="q0"/g,'class="r3"')}}}if(W){W.style.display=(at&&!aF?"":"none")}if(aq&&aE){X.style.backgroundImage="url(http://static.wowhead.com/images/icons/medium/"+aE.toLowerCase()+".jpg)";X.style.display=""}else{X.style.backgroundImage="none";X.style.display="none"}ar.style.display="";ar.style.width="320px";S.innerHTML=aD;az();aA();ar.style.visibility="visible"}function K(){if(!ar){return}ar.style.display="none";ar.style.visibility="hidden"}function az(){var aB=S.childNodes;if(aB.length>=2&&aB[0].nodeName=="TABLE"&&aB[1].nodeName=="TABLE"){aB[0].style.whiteSpace="nowrap";var ae;if(aB[1].offsetWidth>300){ae=Math.max(300,aB[0].offsetWidth)+20}else{ae=Math.max(aB[0].offsetWidth,aB[1].offsetWidth)+20}if(ae>20){ar.style.width=ae+"px";aB[0].style.width=aB[1].style.width="100%"}}else{ar.style.width=t.offsetWidth+"px"}}function aA(){if(!ar){return}if(R==null){return}var aJ=ac(),aK=A(),aG=aJ.w,aD=aJ.h,aF=aK.x,aC=aK.y,aE=t.offsetWidth,ae=t.offsetHeight,aB=R+b,aI=Q-ae-n;if(aB+b+aE+4>=aF+aG){var aH=R-aE-b;if(aH>=0){aB=aH}else{aB=aF+aG-aE-b-4}}if(aI<aC){aI=Q+n;if(aI+ae>aC+aD){aI=aC+aD-ae;if(aq){if(R>=aB-48&&R<=aB&&Q>=aI-4&&Q<=aI+48){aI-=48-(Q-aI)}}}}ar.style.left=aB+"px";ar.style.top=aI+"px"}function m(ae){return(h&&h.buff?"buff_":"tooltip_")+an[ae]}function z(aB,aD,aC){var ae=ai[aB][0];if(ae[aD]==null){ae[aD]={}}if(ae[aD].status==null){ae[aD].status={}}if(ae[aD].status[aC]==null){ae[aD].status[aC]=u}}function e(aB,aF,aD,aE){if(!aE){aE={}}var aC=M(aF,aE);H=aB;o=aC;V=aD;h=aE;z(aB,aC,aD);var ae=ai[aB][0];if(ae[aC].status[aD]==J||ae[aC].status[aD]==f){l(ae[aC][m(aD)],ae[aC].icon)}else{if(ae[aC].status[aD]==O){l(aw.tooltip_loading)}else{ad(aB,aF,aD,null,aE)}}}function ad(aI,aE,aJ,aC,aF){var ae=M(aE,aF);var aH=ai[aI][0];if(aH[ae].status[aJ]!=u&&aH[ae].status[aJ]!=ak){return}aH[ae].status[aJ]=O;if(!aC){aH[ae].timer=setTimeout(function(){x.apply(this,[aI,ae,aJ])},333)}var aD="";for(var aG in aF){if(aG!="rand"&&aG!="ench"&&aG!="gems"&&aG!="sock"){continue}if(typeof aF[aG]=="object"){aD+="&"+aG+"="+aF[aG].join(":")}else{if(aG=="sock"){aD+="&sock"}else{aD+="&"+aG+"="+aF[aG]}}}var aB="";aB+="http://"+Y(aJ)+".wowhead.com";aB+="/?"+ai[aI][1]+"="+aE+"&power"+aD;Z(aB)}function x(aB,aD,aC){if(H==aB&&o==aD&&V==aC){l(aw.loading);var ae=ai[aB][0];ae[aD].timer=setTimeout(function(){v.apply(this,[aB,aD,aC])},3850)}}function v(aB,aD,aC){var ae=ai[aB][0];ae[aD].status[aC]=ak;if(H==aB&&o==aD&&V==aC){l(aw.tooltip_noresponse)}}function M(aB,ae){return aB+(ae.rand?"r"+ae.rand:"")+(ae.ench?"e"+ae.ench:"")+(ae.gems?"g"+ae.gems.join(","):"")+(ae.sock?"s":"")}this.register=function(aC,aE,aD,aB){var ae=ai[aC][0];clearTimeout(ae[aE].timer);F(ae[aE],aB);if(ae[aE][m(aD)]){ae[aE].status[aD]=J}else{ae[aE].status[aD]=f}if(H==aC&&aE==o&&V==aD){l(ae[aE][m(aD)],ae[aE].icon)}};this.registerNpc=function(aC,aB,ae){this.register(D,aC,aB,ae)};this.registerObject=function(aC,aB,ae){this.register(w,aC,aB,ae)};this.registerItem=function(aC,aB,ae){this.register(ax,aC,aB,ae)};this.registerQuest=function(aC,aB,ae){this.register(ao,aC,aB,ae)};this.registerSpell=function(aC,aB,ae){this.register(E,aC,aB,ae)};this.registerAchievement=function(aC,aB,ae){this.register(ah,aC,aB,ae)};this.registerProfile=function(aC,aB,ae){this.register(T,aC,aB,ae)};this.set=function(ae){F(ab,ae)};this.showTooltip=function(aC,ae,aB){r(aC);l(ae,aB)};this.hideTooltip=function(){K()};this.moveTooltip=function(ae){af(ae)};P()}};