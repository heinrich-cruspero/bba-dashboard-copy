import t from"jquery";var e="undefined"!==typeof globalThis?globalThis:"undefined"!==typeof self?self:global;(function(e){e(t)})((function(t,i){function UTCDate(){return new Date(Date.UTC.apply(Date,arguments))}function UTCToday(){var t=new Date;return UTCDate(t.getFullYear(),t.getMonth(),t.getDate())}function isUTCEquals(t,e){return t.getUTCFullYear()===e.getUTCFullYear()&&t.getUTCMonth()===e.getUTCMonth()&&t.getUTCDate()===e.getUTCDate()}function alias(a,s){return function(){s!==i&&t.fn.datepicker.deprecated(s);return(this||e)[a].apply(this||e,arguments)}}function isValidDate(t){return t&&!isNaN(t.getTime())}var a=function(){var i={get:function(t){return this.slice(t)[0]},contains:function(t){var i=t&&t.valueOf();for(var a=0,s=(this||e).length;a<s;a++)if(0<=(this||e)[a].valueOf()-i&&(this||e)[a].valueOf()-i<1e3*60*60*24)return a;return-1},remove:function(t){this.splice(t,1)},replace:function(i){if(i){t.isArray(i)||(i=[i]);this.clear();(this||e).push.apply(this||e,i)}},clear:function(){(this||e).length=0},copy:function(){var t=new a;t.replace(this||e);return t}};return function(){var e=[];e.push.apply(e,arguments);t.extend(e,i);return e}}();var Datepicker=function(i,s){t.data(i,"datepicker",this||e);(this||e)._events=[];(this||e)._secondaryEvents=[];this._process_options(s);(this||e).dates=new a;(this||e).viewDate=(this||e).o.defaultViewDate;(this||e).focusDate=null;(this||e).element=t(i);(this||e).isInput=(this||e).element.is("input");(this||e).inputField=(this||e).isInput?(this||e).element:(this||e).element.find("input");(this||e).component=!!(this||e).element.hasClass("date")&&(this||e).element.find(".add-on, .input-group-addon, .input-group-append, .input-group-prepend, .btn");(this||e).component&&0===(this||e).component.length&&((this||e).component=false);(this||e).isInline=!(this||e).component&&(this||e).element.is("div");(this||e).picker=t(h.template);this._check_template((this||e).o.templates.leftArrow)&&(this||e).picker.find(".prev").html((this||e).o.templates.leftArrow);this._check_template((this||e).o.templates.rightArrow)&&(this||e).picker.find(".next").html((this||e).o.templates.rightArrow);this._buildEvents();this._attachEvents();(this||e).isInline?(this||e).picker.addClass("datepicker-inline").appendTo((this||e).element):(this||e).picker.addClass("datepicker-dropdown dropdown-menu");(this||e).o.rtl&&(this||e).picker.addClass("datepicker-rtl");(this||e).o.calendarWeeks&&(this||e).picker.find(".datepicker-days .datepicker-switch, thead .datepicker-title, tfoot .today, tfoot .clear").attr("colspan",(function(t,e){return Number(e)+1}));this._process_options({startDate:(this||e)._o.startDate,endDate:(this||e)._o.endDate,daysOfWeekDisabled:(this||e).o.daysOfWeekDisabled,daysOfWeekHighlighted:(this||e).o.daysOfWeekHighlighted,datesDisabled:(this||e).o.datesDisabled});(this||e)._allow_update=false;this.setViewMode((this||e).o.startView);(this||e)._allow_update=true;this.fillDow();this.fillMonths();this.update();(this||e).isInline&&this.show()};Datepicker.prototype={constructor:Datepicker,_resolveViewName:function(e){t.each(h.viewModes,(function(i,a){if(e===i||-1!==t.inArray(e,a.names)){e=i;return false}}));return e},_resolveDaysOfWeek:function(e){t.isArray(e)||(e=e.split(/[,\s]*/));return t.map(e,Number)},_check_template:function(e){try{if(e===i||""===e)return false;if((e.match(/[<>]/g)||[]).length<=0)return true;var a=t(e);return a.length>0}catch(t){return false}},_process_options:function(i){(this||e)._o=t.extend({},(this||e)._o,i);var a=(this||e).o=t.extend({},(this||e)._o);var s=a.language;if(!o[s]){s=s.split("-")[0];o[s]||(s=n.language)}a.language=s;a.startView=this._resolveViewName(a.startView);a.minViewMode=this._resolveViewName(a.minViewMode);a.maxViewMode=this._resolveViewName(a.maxViewMode);a.startView=Math.max((this||e).o.minViewMode,Math.min((this||e).o.maxViewMode,a.startView));if(true!==a.multidate){a.multidate=Number(a.multidate)||false;false!==a.multidate&&(a.multidate=Math.max(0,a.multidate))}a.multidateSeparator=String(a.multidateSeparator);a.weekStart%=7;a.weekEnd=(a.weekStart+6)%7;var r=h.parseFormat(a.format);-Infinity!==a.startDate&&(a.startDate?a.startDate instanceof Date?a.startDate=this._local_to_utc(this._zero_time(a.startDate)):a.startDate=h.parseDate(a.startDate,r,a.language,a.assumeNearbyYear):a.startDate=-Infinity);Infinity!==a.endDate&&(a.endDate?a.endDate instanceof Date?a.endDate=this._local_to_utc(this._zero_time(a.endDate)):a.endDate=h.parseDate(a.endDate,r,a.language,a.assumeNearbyYear):a.endDate=Infinity);a.daysOfWeekDisabled=this._resolveDaysOfWeek(a.daysOfWeekDisabled||[]);a.daysOfWeekHighlighted=this._resolveDaysOfWeek(a.daysOfWeekHighlighted||[]);a.datesDisabled=a.datesDisabled||[];t.isArray(a.datesDisabled)||(a.datesDisabled=a.datesDisabled.split(","));a.datesDisabled=t.map(a.datesDisabled,(function(t){return h.parseDate(t,r,a.language,a.assumeNearbyYear)}));var l=String(a.orientation).toLowerCase().split(/\s+/g),d=a.orientation.toLowerCase();l=t.grep(l,(function(t){return/^auto|left|right|top|bottom$/.test(t)}));a.orientation={x:"auto",y:"auto"};if(d&&"auto"!==d)if(1===l.length)switch(l[0]){case"top":case"bottom":a.orientation.y=l[0];break;case"left":case"right":a.orientation.x=l[0];break}else{d=t.grep(l,(function(t){return/^left|right$/.test(t)}));a.orientation.x=d[0]||"auto";d=t.grep(l,(function(t){return/^top|bottom$/.test(t)}));a.orientation.y=d[0]||"auto"}else;if(a.defaultViewDate instanceof Date||"string"===typeof a.defaultViewDate)a.defaultViewDate=h.parseDate(a.defaultViewDate,r,a.language,a.assumeNearbyYear);else if(a.defaultViewDate){var c=a.defaultViewDate.year||(new Date).getFullYear();var u=a.defaultViewDate.month||0;var p=a.defaultViewDate.day||1;a.defaultViewDate=UTCDate(c,u,p)}else a.defaultViewDate=UTCToday()},_applyEvents:function(t){for(var e=0,a,s,n;e<t.length;e++){a=t[e][0];if(2===t[e].length){s=i;n=t[e][1]}else if(3===t[e].length){s=t[e][1];n=t[e][2]}a.on(n,s)}},_unapplyEvents:function(t){for(var e=0,a,s,n;e<t.length;e++){a=t[e][0];if(2===t[e].length){n=i;s=t[e][1]}else if(3===t[e].length){n=t[e][1];s=t[e][2]}a.off(s,n)}},_buildEvents:function(){var i={keyup:t.proxy((function(e){-1===t.inArray(e.keyCode,[27,37,39,38,40,32,13,9])&&this.update()}),this||e),keydown:t.proxy((this||e).keydown,this||e),paste:t.proxy((this||e).paste,this||e)};true===(this||e).o.showOnFocus&&(i.focus=t.proxy((this||e).show,this||e));(this||e).isInput?(this||e)._events=[[(this||e).element,i]]:(this||e).component&&(this||e).inputField.length?(this||e)._events=[[(this||e).inputField,i],[(this||e).component,{click:t.proxy((this||e).show,this||e)}]]:(this||e)._events=[[(this||e).element,{click:t.proxy((this||e).show,this||e),keydown:t.proxy((this||e).keydown,this||e)}]];(this||e)._events.push([(this||e).element,"*",{blur:t.proxy((function(t){(this||e)._focused_from=t.target}),this||e)}],[(this||e).element,{blur:t.proxy((function(t){(this||e)._focused_from=t.target}),this||e)}]);(this||e).o.immediateUpdates&&(this||e)._events.push([(this||e).element,{"changeYear changeMonth":t.proxy((function(t){this.update(t.date)}),this||e)}]);(this||e)._secondaryEvents=[[(this||e).picker,{click:t.proxy((this||e).click,this||e)}],[(this||e).picker,".prev, .next",{click:t.proxy((this||e).navArrowsClick,this||e)}],[(this||e).picker,".day:not(.disabled)",{click:t.proxy((this||e).dayCellClick,this||e)}],[t(window),{resize:t.proxy((this||e).place,this||e)}],[t(document),{"mousedown touchstart":t.proxy((function(t){(this||e).element.is(t.target)||(this||e).element.find(t.target).length||(this||e).picker.is(t.target)||(this||e).picker.find(t.target).length||(this||e).isInline||this.hide()}),this||e)}]]},_attachEvents:function(){this._detachEvents();this._applyEvents((this||e)._events)},_detachEvents:function(){this._unapplyEvents((this||e)._events)},_attachSecondaryEvents:function(){this._detachSecondaryEvents();this._applyEvents((this||e)._secondaryEvents)},_detachSecondaryEvents:function(){this._unapplyEvents((this||e)._secondaryEvents)},_trigger:function(i,a){var s=a||(this||e).dates.get(-1),n=this._utc_to_local(s);(this||e).element.trigger({type:i,date:n,viewMode:(this||e).viewMode,dates:t.map((this||e).dates,(this||e)._utc_to_local),format:t.proxy((function(t,i){if(0===arguments.length){t=(this||e).dates.length-1;i=(this||e).o.format}else if("string"===typeof t){i=t;t=(this||e).dates.length-1}i=i||(this||e).o.format;var a=(this||e).dates.get(t);return h.formatDate(a,i,(this||e).o.language)}),this||e)})},show:function(){if(!((this||e).inputField.is(":disabled")||(this||e).inputField.prop("readonly")&&false===(this||e).o.enableOnReadonly)){(this||e).isInline||(this||e).picker.appendTo((this||e).o.container);this.place();(this||e).picker.show();this._attachSecondaryEvents();this._trigger("show");(window.navigator.msMaxTouchPoints||"ontouchstart"in document)&&(this||e).o.disableTouchKeyboard&&t((this||e).element).blur();return this||e}},hide:function(){if((this||e).isInline||!(this||e).picker.is(":visible"))return this||e;(this||e).focusDate=null;(this||e).picker.hide().detach();this._detachSecondaryEvents();this.setViewMode((this||e).o.startView);(this||e).o.forceParse&&(this||e).inputField.val()&&this.setValue();this._trigger("hide");return this||e},destroy:function(){this.hide();this._detachEvents();this._detachSecondaryEvents();(this||e).picker.remove();delete(this||e).element.data().datepicker;(this||e).isInput||delete(this||e).element.data().date;return this||e},paste:function(e){var i;if(e.originalEvent.clipboardData&&e.originalEvent.clipboardData.types&&-1!==t.inArray("text/plain",e.originalEvent.clipboardData.types))i=e.originalEvent.clipboardData.getData("text/plain");else{if(!window.clipboardData)return;i=window.clipboardData.getData("Text")}this.setDate(i);this.update();e.preventDefault()},_utc_to_local:function(t){if(!t)return t;var e=new Date(t.getTime()+6e4*t.getTimezoneOffset());e.getTimezoneOffset()!==t.getTimezoneOffset()&&(e=new Date(t.getTime()+6e4*e.getTimezoneOffset()));return e},_local_to_utc:function(t){return t&&new Date(t.getTime()-6e4*t.getTimezoneOffset())},_zero_time:function(t){return t&&new Date(t.getFullYear(),t.getMonth(),t.getDate())},_zero_utc_time:function(t){return t&&UTCDate(t.getUTCFullYear(),t.getUTCMonth(),t.getUTCDate())},getDates:function(){return t.map((this||e).dates,(this||e)._utc_to_local)},getUTCDates:function(){return t.map((this||e).dates,(function(t){return new Date(t)}))},getDate:function(){return this._utc_to_local(this.getUTCDate())},getUTCDate:function(){var t=(this||e).dates.get(-1);return t!==i?new Date(t):null},clearDates:function(){(this||e).inputField.val("");this.update();this._trigger("changeDate");(this||e).o.autoclose&&this.hide()},setDates:function(){var i=t.isArray(arguments[0])?arguments[0]:arguments;(this||e).update.apply(this||e,i);this._trigger("changeDate");this.setValue();return this||e},setUTCDates:function(){var i=t.isArray(arguments[0])?arguments[0]:arguments;(this||e).setDates.apply(this||e,t.map(i,(this||e)._utc_to_local));return this||e},setDate:alias("setDates"),setUTCDate:alias("setUTCDates"),remove:alias("destroy","Method `remove` is deprecated and will be removed in version 2.0. Use `destroy` instead"),setValue:function(){var t=this.getFormattedDate();(this||e).inputField.val(t);return this||e},getFormattedDate:function(a){a===i&&(a=(this||e).o.format);var s=(this||e).o.language;return t.map((this||e).dates,(function(t){return h.formatDate(t,a,s)})).join((this||e).o.multidateSeparator)},getStartDate:function(){return(this||e).o.startDate},setStartDate:function(t){this._process_options({startDate:t});this.update();this.updateNavArrows();return this||e},getEndDate:function(){return(this||e).o.endDate},setEndDate:function(t){this._process_options({endDate:t});this.update();this.updateNavArrows();return this||e},setDaysOfWeekDisabled:function(t){this._process_options({daysOfWeekDisabled:t});this.update();return this||e},setDaysOfWeekHighlighted:function(t){this._process_options({daysOfWeekHighlighted:t});this.update();return this||e},setDatesDisabled:function(t){this._process_options({datesDisabled:t});this.update();return this||e},place:function(){if((this||e).isInline)return this||e;var i=(this||e).picker.outerWidth(),a=(this||e).picker.outerHeight(),s=10,n=t((this||e).o.container),r=n.width(),o="body"===(this||e).o.container?t(document).scrollTop():n.scrollTop(),h=n.offset();var l=[0];(this||e).element.parents().each((function(){var i=t(this||e).css("z-index");"auto"!==i&&0!==Number(i)&&l.push(Number(i))}));var d=Math.max.apply(Math,l)+(this||e).o.zIndexOffset;var c=(this||e).component?(this||e).component.parent().offset():(this||e).element.offset();var u=(this||e).component?(this||e).component.outerHeight(true):(this||e).element.outerHeight(false);var p=(this||e).component?(this||e).component.outerWidth(true):(this||e).element.outerWidth(false);var f=c.left-h.left;var g=c.top-h.top;"body"!==(this||e).o.container&&(g+=o);(this||e).picker.removeClass("datepicker-orient-top datepicker-orient-bottom "+"datepicker-orient-right datepicker-orient-left");if("auto"!==(this||e).o.orientation.x){(this||e).picker.addClass("datepicker-orient-"+(this||e).o.orientation.x);"right"===(this||e).o.orientation.x&&(f-=i-p)}else if(c.left<0){(this||e).picker.addClass("datepicker-orient-left");f-=c.left-s}else if(f+i>r){(this||e).picker.addClass("datepicker-orient-right");f+=p-i}else(this||e).o.rtl?(this||e).picker.addClass("datepicker-orient-right"):(this||e).picker.addClass("datepicker-orient-left");var v=(this||e).o.orientation.y,y;if("auto"===v){y=-o+g-a;v=y<0?"bottom":"top"}(this||e).picker.addClass("datepicker-orient-"+v);"top"===v?g-=a+parseInt((this||e).picker.css("padding-top")):g+=u;if((this||e).o.rtl){var D=r-(f+p);(this||e).picker.css({top:g,right:D,zIndex:d})}else(this||e).picker.css({top:g,left:f,zIndex:d});return this||e},_allow_update:true,update:function(){if(!(this||e)._allow_update)return this||e;var i=(this||e).dates.copy(),a=[],s=false;if(arguments.length){t.each(arguments,t.proxy((function(t,e){e instanceof Date&&(e=this._local_to_utc(e));a.push(e)}),this||e));s=true}else{a=(this||e).isInput?(this||e).element.val():(this||e).element.data("date")||(this||e).inputField.val();a=a&&(this||e).o.multidate?a.split((this||e).o.multidateSeparator):[a];delete(this||e).element.data().date}a=t.map(a,t.proxy((function(t){return h.parseDate(t,(this||e).o.format,(this||e).o.language,(this||e).o.assumeNearbyYear)}),this||e));a=t.grep(a,t.proxy((function(t){return!this.dateWithinRange(t)||!t}),this||e),true);(this||e).dates.replace(a);(this||e).o.updateViewDate&&((this||e).dates.length?(this||e).viewDate=new Date((this||e).dates.get(-1)):(this||e).viewDate<(this||e).o.startDate?(this||e).viewDate=new Date((this||e).o.startDate):(this||e).viewDate>(this||e).o.endDate?(this||e).viewDate=new Date((this||e).o.endDate):(this||e).viewDate=(this||e).o.defaultViewDate);if(s){this.setValue();(this||e).element.change()}else if((this||e).dates.length&&String(i)!==String((this||e).dates)&&s){this._trigger("changeDate");(this||e).element.change()}if(!(this||e).dates.length&&i.length){this._trigger("clearDate");(this||e).element.change()}this.fill();return this||e},fillDow:function(){if((this||e).o.showWeekDays){var i=(this||e).o.weekStart,a="<tr>";(this||e).o.calendarWeeks&&(a+='<th class="cw">&#160;</th>');while(i<(this||e).o.weekStart+7){a+='<th class="dow';-1!==t.inArray(i,(this||e).o.daysOfWeekDisabled)&&(a+=" disabled");a+='">'+o[(this||e).o.language].daysMin[i++%7]+"</th>"}a+="</tr>";(this||e).picker.find(".datepicker-days thead").append(a)}},fillMonths:function(){var t=this._utc_to_local((this||e).viewDate);var i="";var a;for(var s=0;s<12;s++){a=t&&t.getMonth()===s?" focused":"";i+='<span class="month'+a+'">'+o[(this||e).o.language].monthsShort[s]+"</span>"}(this||e).picker.find(".datepicker-months td").html(i)},setRange:function(i){i&&i.length?(this||e).range=t.map(i,(function(t){return t.valueOf()})):delete(this||e).range;this.fill()},getClassNames:function(i){var a=[],s=(this||e).viewDate.getUTCFullYear(),n=(this||e).viewDate.getUTCMonth(),r=UTCToday();i.getUTCFullYear()<s||i.getUTCFullYear()===s&&i.getUTCMonth()<n?a.push("old"):(i.getUTCFullYear()>s||i.getUTCFullYear()===s&&i.getUTCMonth()>n)&&a.push("new");(this||e).focusDate&&i.valueOf()===(this||e).focusDate.valueOf()&&a.push("focused");(this||e).o.todayHighlight&&isUTCEquals(i,r)&&a.push("today");-1!==(this||e).dates.contains(i)&&a.push("active");this.dateWithinRange(i)||a.push("disabled");this.dateIsDisabled(i)&&a.push("disabled","disabled-date");-1!==t.inArray(i.getUTCDay(),(this||e).o.daysOfWeekHighlighted)&&a.push("highlighted");if((this||e).range){i>(this||e).range[0]&&i<(this||e).range[(this||e).range.length-1]&&a.push("range");-1!==t.inArray(i.valueOf(),(this||e).range)&&a.push("selected");i.valueOf()===(this||e).range[0]&&a.push("range-start");i.valueOf()===(this||e).range[(this||e).range.length-1]&&a.push("range-end")}return a},_fill_yearsView:function(a,s,n,r,o,h,l){var d="";var c=n/10;var u=(this||e).picker.find(a);var p=Math.floor(r/n)*n;var f=p+9*c;var g=Math.floor((this||e).viewDate.getFullYear()/c)*c;var v=t.map((this||e).dates,(function(t){return Math.floor(t.getUTCFullYear()/c)*c}));var y,D,m;for(var w=p-c;w<=f+c;w+=c){y=[s];D=null;w===p-c?y.push("old"):w===f+c&&y.push("new");-1!==t.inArray(w,v)&&y.push("active");(w<o||w>h)&&y.push("disabled");w===g&&y.push("focused");if(l!==t.noop){m=l(new Date(w,0,1));m===i?m={}:"boolean"===typeof m?m={enabled:m}:"string"===typeof m&&(m={classes:m});false===m.enabled&&y.push("disabled");m.classes&&(y=y.concat(m.classes.split(/\s+/)));m.tooltip&&(D=m.tooltip)}d+='<span class="'+y.join(" ")+'"'+(D?' title="'+D+'"':"")+">"+w+"</span>"}u.find(".datepicker-switch").text(p+"-"+f);u.find("td").html(d)},fill:function(){var a=new Date((this||e).viewDate),s=a.getUTCFullYear(),n=a.getUTCMonth(),r=-Infinity!==(this||e).o.startDate?(this||e).o.startDate.getUTCFullYear():-Infinity,l=-Infinity!==(this||e).o.startDate?(this||e).o.startDate.getUTCMonth():-Infinity,d=Infinity!==(this||e).o.endDate?(this||e).o.endDate.getUTCFullYear():Infinity,c=Infinity!==(this||e).o.endDate?(this||e).o.endDate.getUTCMonth():Infinity,u=o[(this||e).o.language].today||o["en"].today||"",p=o[(this||e).o.language].clear||o["en"].clear||"",f=o[(this||e).o.language].titleFormat||o["en"].titleFormat,g=UTCToday(),v=(true===(this||e).o.todayBtn||"linked"===(this||e).o.todayBtn)&&g>=(this||e).o.startDate&&g<=(this||e).o.endDate&&!this.weekOfDateIsDisabled(g),y,D;if(!isNaN(s)&&!isNaN(n)){(this||e).picker.find(".datepicker-days .datepicker-switch").text(h.formatDate(a,f,(this||e).o.language));(this||e).picker.find("tfoot .today").text(u).css("display",v?"table-cell":"none");(this||e).picker.find("tfoot .clear").text(p).css("display",true===(this||e).o.clearBtn?"table-cell":"none");(this||e).picker.find("thead .datepicker-title").text((this||e).o.title).css("display","string"===typeof(this||e).o.title&&""!==(this||e).o.title?"table-cell":"none");this.updateNavArrows();this.fillMonths();var m=UTCDate(s,n,0),w=m.getUTCDate();m.setUTCDate(w-(m.getUTCDay()-(this||e).o.weekStart+7)%7);var k=new Date(m);m.getUTCFullYear()<100&&k.setUTCFullYear(m.getUTCFullYear());k.setUTCDate(k.getUTCDate()+42);k=k.valueOf();var _=[];var C,b;while(m.valueOf()<k){C=m.getUTCDay();if(C===(this||e).o.weekStart){_.push("<tr>");if((this||e).o.calendarWeeks){var T=new Date(+m+((this||e).o.weekStart-C-7)%7*864e5),M=new Date(Number(T)+(7+4-T.getUTCDay())%7*864e5),U=new Date(Number(U=UTCDate(M.getUTCFullYear(),0,1))+(7+4-U.getUTCDay())%7*864e5),x=(M-U)/864e5/7+1;_.push('<td class="cw">'+x+"</td>")}}b=this.getClassNames(m);b.push("day");var V=m.getUTCDate();if((this||e).o.beforeShowDay!==t.noop){D=(this||e).o.beforeShowDay(this._utc_to_local(m));D===i?D={}:"boolean"===typeof D?D={enabled:D}:"string"===typeof D&&(D={classes:D});false===D.enabled&&b.push("disabled");D.classes&&(b=b.concat(D.classes.split(/\s+/)));D.tooltip&&(y=D.tooltip);D.content&&(V=D.content)}b=t.isFunction(t.uniqueSort)?t.uniqueSort(b):t.unique(b);_.push('<td class="'+b.join(" ")+'"'+(y?' title="'+y+'"':"")+' data-date="'+m.getTime().toString()+'">'+V+"</td>");y=null;C===(this||e).o.weekEnd&&_.push("</tr>");m.setUTCDate(m.getUTCDate()+1)}(this||e).picker.find(".datepicker-days tbody").html(_.join(""));var S=o[(this||e).o.language].monthsTitle||o["en"].monthsTitle||"Months";var F=(this||e).picker.find(".datepicker-months").find(".datepicker-switch").text((this||e).o.maxViewMode<2?S:s).end().find("tbody span").removeClass("active");t.each((this||e).dates,(function(t,e){e.getUTCFullYear()===s&&F.eq(e.getUTCMonth()).addClass("active")}));(s<r||s>d)&&F.addClass("disabled");s===r&&F.slice(0,l).addClass("disabled");s===d&&F.slice(c+1).addClass("disabled");if((this||e).o.beforeShowMonth!==t.noop){var N=this||e;t.each(F,(function(e,a){var n=new Date(s,e,1);var r=N.o.beforeShowMonth(n);r===i?r={}:"boolean"===typeof r?r={enabled:r}:"string"===typeof r&&(r={classes:r});false!==r.enabled||t(a).hasClass("disabled")||t(a).addClass("disabled");r.classes&&t(a).addClass(r.classes);r.tooltip&&t(a).prop("title",r.tooltip)}))}this._fill_yearsView(".datepicker-years","year",10,s,r,d,(this||e).o.beforeShowYear);this._fill_yearsView(".datepicker-decades","decade",100,s,r,d,(this||e).o.beforeShowDecade);this._fill_yearsView(".datepicker-centuries","century",1e3,s,r,d,(this||e).o.beforeShowCentury)}},updateNavArrows:function(){if((this||e)._allow_update){var t=new Date((this||e).viewDate),i=t.getUTCFullYear(),a=t.getUTCMonth(),s=-Infinity!==(this||e).o.startDate?(this||e).o.startDate.getUTCFullYear():-Infinity,n=-Infinity!==(this||e).o.startDate?(this||e).o.startDate.getUTCMonth():-Infinity,r=Infinity!==(this||e).o.endDate?(this||e).o.endDate.getUTCFullYear():Infinity,o=Infinity!==(this||e).o.endDate?(this||e).o.endDate.getUTCMonth():Infinity,h,l,d=1;switch((this||e).viewMode){case 4:d*=10;case 3:d*=10;case 2:d*=10;case 1:h=Math.floor(i/d)*d<=s;l=Math.floor(i/d)*d+d>r;break;case 0:h=i<=s&&a<=n;l=i>=r&&a>=o;break}(this||e).picker.find(".prev").toggleClass("disabled",h);(this||e).picker.find(".next").toggleClass("disabled",l)}},click:function(i){i.preventDefault();i.stopPropagation();var a,s,n,r,o;a=t(i.target);a.hasClass("datepicker-switch")&&(this||e).viewMode!==(this||e).o.maxViewMode&&this.setViewMode((this||e).viewMode+1);if(a.hasClass("today")&&!a.hasClass("day")){this.setViewMode(0);this._setDate(UTCToday(),"linked"===(this||e).o.todayBtn?null:"view")}a.hasClass("clear")&&this.clearDates();if(!a.hasClass("disabled")&&(a.hasClass("month")||a.hasClass("year")||a.hasClass("decade")||a.hasClass("century"))){(this||e).viewDate.setUTCDate(1);n=1;if(1===(this||e).viewMode){o=a.parent().find("span").index(a);r=(this||e).viewDate.getUTCFullYear();(this||e).viewDate.setUTCMonth(o)}else{o=0;r=Number(a.text());(this||e).viewDate.setUTCFullYear(r)}this._trigger(h.viewModes[(this||e).viewMode-1].e,(this||e).viewDate);if((this||e).viewMode===(this||e).o.minViewMode)this._setDate(UTCDate(r,o,n));else{this.setViewMode((this||e).viewMode-1);this.fill()}}(this||e).picker.is(":visible")&&(this||e)._focused_from&&(this||e)._focused_from.focus();delete(this||e)._focused_from},dayCellClick:function(i){var a=t(i.currentTarget);var s=a.data("date");var n=new Date(s);if((this||e).o.updateViewDate){n.getUTCFullYear()!==(this||e).viewDate.getUTCFullYear()&&this._trigger("changeYear",(this||e).viewDate);n.getUTCMonth()!==(this||e).viewDate.getUTCMonth()&&this._trigger("changeMonth",(this||e).viewDate)}this._setDate(n)},navArrowsClick:function(i){var a=t(i.currentTarget);var s=a.hasClass("prev")?-1:1;0!==(this||e).viewMode&&(s*=12*h.viewModes[(this||e).viewMode].navStep);(this||e).viewDate=this.moveMonth((this||e).viewDate,s);this._trigger(h.viewModes[(this||e).viewMode].e,(this||e).viewDate);this.fill()},_toggle_multidate:function(t){var i=(this||e).dates.contains(t);t||(this||e).dates.clear();if(-1!==i)(true===(this||e).o.multidate||(this||e).o.multidate>1||(this||e).o.toggleActive)&&(this||e).dates.remove(i);else if(false===(this||e).o.multidate){(this||e).dates.clear();(this||e).dates.push(t)}else(this||e).dates.push(t);if("number"===typeof(this||e).o.multidate)while((this||e).dates.length>(this||e).o.multidate)(this||e).dates.remove(0)},_setDate:function(t,i){i&&"date"!==i||this._toggle_multidate(t&&new Date(t));(!i&&(this||e).o.updateViewDate||"view"===i)&&((this||e).viewDate=t&&new Date(t));this.fill();this.setValue();i&&"view"===i||this._trigger("changeDate");(this||e).inputField.trigger("change");!(this||e).o.autoclose||i&&"date"!==i||this.hide()},moveDay:function(t,e){var i=new Date(t);i.setUTCDate(t.getUTCDate()+e);return i},moveWeek:function(t,e){return this.moveDay(t,7*e)},moveMonth:function(t,i){if(!isValidDate(t))return(this||e).o.defaultViewDate;if(!i)return t;var a=new Date(t.valueOf()),s=a.getUTCDate(),n=a.getUTCMonth(),r=Math.abs(i),o,h;i=i>0?1:-1;if(1===r){h=-1===i?function(){return a.getUTCMonth()===n}:function(){return a.getUTCMonth()!==o};o=n+i;a.setUTCMonth(o);o=(o+12)%12}else{for(var l=0;l<r;l++)a=this.moveMonth(a,i);o=a.getUTCMonth();a.setUTCDate(s);h=function(){return o!==a.getUTCMonth()}}while(h()){a.setUTCDate(--s);a.setUTCMonth(o)}return a},moveYear:function(t,e){return this.moveMonth(t,12*e)},moveAvailableDate:function(t,e,i){do{t=this[i](t,e);if(!this.dateWithinRange(t))return false;i="moveDay"}while(this.dateIsDisabled(t));return t},weekOfDateIsDisabled:function(i){return-1!==t.inArray(i.getUTCDay(),(this||e).o.daysOfWeekDisabled)},dateIsDisabled:function(i){return this.weekOfDateIsDisabled(i)||t.grep((this||e).o.datesDisabled,(function(t){return isUTCEquals(i,t)})).length>0},dateWithinRange:function(t){return t>=(this||e).o.startDate&&t<=(this||e).o.endDate},keydown:function(t){if((this||e).picker.is(":visible")){var i=false,a,s,n=(this||e).focusDate||(this||e).viewDate;switch(t.keyCode){case 27:if((this||e).focusDate){(this||e).focusDate=null;(this||e).viewDate=(this||e).dates.get(-1)||(this||e).viewDate;this.fill()}else this.hide();t.preventDefault();t.stopPropagation();break;case 37:case 38:case 39:case 40:if(!(this||e).o.keyboardNavigation||7===(this||e).o.daysOfWeekDisabled.length)break;a=37===t.keyCode||38===t.keyCode?-1:1;if(0===(this||e).viewMode)if(t.ctrlKey){s=this.moveAvailableDate(n,a,"moveYear");s&&this._trigger("changeYear",(this||e).viewDate)}else if(t.shiftKey){s=this.moveAvailableDate(n,a,"moveMonth");s&&this._trigger("changeMonth",(this||e).viewDate)}else 37===t.keyCode||39===t.keyCode?s=this.moveAvailableDate(n,a,"moveDay"):this.weekOfDateIsDisabled(n)||(s=this.moveAvailableDate(n,a,"moveWeek"));else if(1===(this||e).viewMode){38!==t.keyCode&&40!==t.keyCode||(a*=4);s=this.moveAvailableDate(n,a,"moveMonth")}else if(2===(this||e).viewMode){38!==t.keyCode&&40!==t.keyCode||(a*=4);s=this.moveAvailableDate(n,a,"moveYear")}if(s){(this||e).focusDate=(this||e).viewDate=s;this.setValue();this.fill();t.preventDefault()}break;case 13:if(!(this||e).o.forceParse)break;n=(this||e).focusDate||(this||e).dates.get(-1)||(this||e).viewDate;if((this||e).o.keyboardNavigation){this._toggle_multidate(n);i=true}(this||e).focusDate=null;(this||e).viewDate=(this||e).dates.get(-1)||(this||e).viewDate;this.setValue();this.fill();if((this||e).picker.is(":visible")){t.preventDefault();t.stopPropagation();(this||e).o.autoclose&&this.hide()}break;case 9:(this||e).focusDate=null;(this||e).viewDate=(this||e).dates.get(-1)||(this||e).viewDate;this.fill();this.hide();break}if(i){(this||e).dates.length?this._trigger("changeDate"):this._trigger("clearDate");(this||e).inputField.trigger("change")}}else if(40===t.keyCode||27===t.keyCode){this.show();t.stopPropagation()}},setViewMode:function(t){(this||e).viewMode=t;(this||e).picker.children("div").hide().filter(".datepicker-"+h.viewModes[(this||e).viewMode].clsName).show();this.updateNavArrows();this._trigger("changeViewMode",new Date((this||e).viewDate))}};var DateRangePicker=function(i,a){t.data(i,"datepicker",this||e);(this||e).element=t(i);(this||e).inputs=t.map(a.inputs,(function(t){return t.jquery?t[0]:t}));delete a.inputs;(this||e).keepEmptyValues=a.keepEmptyValues;delete a.keepEmptyValues;datepickerPlugin.call(t((this||e).inputs),a).on("changeDate",t.proxy((this||e).dateUpdated,this||e));(this||e).pickers=t.map((this||e).inputs,(function(e){return t.data(e,"datepicker")}));this.updateDates()};DateRangePicker.prototype={updateDates:function(){(this||e).dates=t.map((this||e).pickers,(function(t){return t.getUTCDate()}));this.updateRanges()},updateRanges:function(){var i=t.map((this||e).dates,(function(t){return t.valueOf()}));t.each((this||e).pickers,(function(t,e){e.setRange(i)}))},clearDates:function(){t.each((this||e).pickers,(function(t,e){e.clearDates()}))},dateUpdated:function(a){if(!(this||e).updating){(this||e).updating=true;var s=t.data(a.target,"datepicker");if(s!==i){var n=s.getUTCDate(),r=(this||e).keepEmptyValues,o=t.inArray(a.target,(this||e).inputs),h=o-1,l=o+1,d=(this||e).inputs.length;if(-1!==o){t.each((this||e).pickers,(function(t,e){e.getUTCDate()||e!==s&&r||e.setUTCDate(n)}));if(n<(this||e).dates[h])while(h>=0&&n<(this||e).dates[h])(this||e).pickers[h--].setUTCDate(n);else if(n>(this||e).dates[l])while(l<d&&n>(this||e).dates[l])(this||e).pickers[l++].setUTCDate(n);this.updateDates();delete(this||e).updating}}}},destroy:function(){t.map((this||e).pickers,(function(t){t.destroy()}));t((this||e).inputs).off("changeDate",(this||e).dateUpdated);delete(this||e).element.data().datepicker},remove:alias("destroy","Method `remove` is deprecated and will be removed in version 2.0. Use `destroy` instead")};function opts_from_el(e,i){var a=t(e).data(),s={},n,r=new RegExp("^"+i.toLowerCase()+"([A-Z])");i=new RegExp("^"+i.toLowerCase());function re_lower(t,e){return e.toLowerCase()}for(var o in a)if(i.test(o)){n=o.replace(r,re_lower);s[n]=a[o]}return s}function opts_from_locale(e){var i={};if(!o[e]){e=e.split("-")[0];if(!o[e])return}var a=o[e];t.each(r,(function(t,e){e in a&&(i[e]=a[e])}));return i}var s=t.fn.datepicker;var datepickerPlugin=function(a){var s=Array.apply(null,arguments);s.shift();var r;this.each((function(){var i=t(this||e),o=i.data("datepicker"),h="object"===typeof a&&a;if(!o){var l=opts_from_el(this||e,"date"),d=t.extend({},n,l,h),c=opts_from_locale(d.language),u=t.extend({},n,c,l,h);if(i.hasClass("input-daterange")||u.inputs){t.extend(u,{inputs:u.inputs||i.find("input").toArray()});o=new DateRangePicker(this||e,u)}else o=new Datepicker(this||e,u);i.data("datepicker",o)}"string"===typeof a&&"function"===typeof o[a]&&(r=o[a].apply(o,s))}));if(r===i||r instanceof Datepicker||r instanceof DateRangePicker)return this||e;if((this||e).length>1)throw new Error("Using only allowed for the collection of a single element ("+a+" function)");return r};t.fn.datepicker=datepickerPlugin;var n=t.fn.datepicker.defaults={assumeNearbyYear:false,autoclose:false,beforeShowDay:t.noop,beforeShowMonth:t.noop,beforeShowYear:t.noop,beforeShowDecade:t.noop,beforeShowCentury:t.noop,calendarWeeks:false,clearBtn:false,toggleActive:false,daysOfWeekDisabled:[],daysOfWeekHighlighted:[],datesDisabled:[],endDate:Infinity,forceParse:true,format:"mm/dd/yyyy",keepEmptyValues:false,keyboardNavigation:true,language:"en",minViewMode:0,maxViewMode:4,multidate:false,multidateSeparator:",",orientation:"auto",rtl:false,startDate:-Infinity,startView:0,todayBtn:false,todayHighlight:false,updateViewDate:true,weekStart:0,disableTouchKeyboard:false,enableOnReadonly:true,showOnFocus:true,zIndexOffset:10,container:"body",immediateUpdates:false,title:"",templates:{leftArrow:"&#x00AB;",rightArrow:"&#x00BB;"},showWeekDays:true};var r=t.fn.datepicker.locale_opts=["format","rtl","weekStart"];t.fn.datepicker.Constructor=Datepicker;var o=t.fn.datepicker.dates={en:{days:["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],daysShort:["Sun","Mon","Tue","Wed","Thu","Fri","Sat"],daysMin:["Su","Mo","Tu","We","Th","Fr","Sa"],months:["January","February","March","April","May","June","July","August","September","October","November","December"],monthsShort:["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],today:"Today",clear:"Clear",titleFormat:"MM yyyy"}};var h={viewModes:[{names:["days","month"],clsName:"days",e:"changeMonth"},{names:["months","year"],clsName:"months",e:"changeYear",navStep:1},{names:["years","decade"],clsName:"years",e:"changeDecade",navStep:10},{names:["decades","century"],clsName:"decades",e:"changeCentury",navStep:100},{names:["centuries","millennium"],clsName:"centuries",e:"changeMillennium",navStep:1e3}],validParts:/dd?|DD?|mm?|MM?|yy(?:yy)?/g,nonpunctuation:/[^ -\/:-@\u5e74\u6708\u65e5\[-`{-~\t\n\r]+/g,parseFormat:function(t){if("function"===typeof t.toValue&&"function"===typeof t.toDisplay)return t;var i=t.replace((this||e).validParts,"\0").split("\0"),a=t.match((this||e).validParts);if(!i||!i.length||!a||0===a.length)throw new Error("Invalid date format.");return{separators:i,parts:a}},parseDate:function(a,s,n,r){if(!a)return i;if(a instanceof Date)return a;"string"===typeof s&&(s=h.parseFormat(s));if(s.toValue)return s.toValue(a,s,n);var l={d:"moveDay",m:"moveMonth",w:"moveWeek",y:"moveYear"},d={yesterday:"-1d",today:"+0d",tomorrow:"+1d"},c,u,p,f,g;a in d&&(a=d[a]);if(/^[\-+]\d+[dmwy]([\s,]+[\-+]\d+[dmwy])*$/i.test(a)){c=a.match(/([\-+]\d+)([dmwy])/gi);a=new Date;for(f=0;f<c.length;f++){u=c[f].match(/([\-+]\d+)([dmwy])/i);p=Number(u[1]);g=l[u[2].toLowerCase()];a=Datepicker.prototype[g](a,p)}return Datepicker.prototype._zero_utc_time(a)}c=a&&a.match((this||e).nonpunctuation)||[];function applyNearbyYear(t,e){true===e&&(e=10);if(t<100){t+=2e3;t>(new Date).getFullYear()+e&&(t-=100)}return t}var v={},y=["yyyy","yy","M","MM","m","mm","d","dd"],D={yyyy:function(t,e){return t.setUTCFullYear(r?applyNearbyYear(e,r):e)},m:function(t,e){if(isNaN(t))return t;e-=1;while(e<0)e+=12;e%=12;t.setUTCMonth(e);while(t.getUTCMonth()!==e)t.setUTCDate(t.getUTCDate()-1);return t},d:function(t,e){return t.setUTCDate(e)}},m,w;D["yy"]=D["yyyy"];D["M"]=D["MM"]=D["mm"]=D["m"];D["dd"]=D["d"];a=UTCToday();var k=s.parts.slice();c.length!==k.length&&(k=t(k).filter((function(e,i){return-1!==t.inArray(i,y)})).toArray());function match_part(){var t=this.slice(0,c[f].length),e=c[f].slice(0,t.length);return t.toLowerCase()===e.toLowerCase()}if(c.length===k.length){var _;for(f=0,_=k.length;f<_;f++){m=parseInt(c[f],10);u=k[f];if(isNaN(m))switch(u){case"MM":w=t(o[n].months).filter(match_part);m=t.inArray(w[0],o[n].months)+1;break;case"M":w=t(o[n].monthsShort).filter(match_part);m=t.inArray(w[0],o[n].monthsShort)+1;break}v[u]=m}var C,b;for(f=0;f<y.length;f++){b=y[f];if(b in v&&!isNaN(v[b])){C=new Date(a);D[b](C,v[b]);isNaN(C)||(a=C)}}}return a},formatDate:function(e,i,a){if(!e)return"";"string"===typeof i&&(i=h.parseFormat(i));if(i.toDisplay)return i.toDisplay(e,i,a);var s={d:e.getUTCDate(),D:o[a].daysShort[e.getUTCDay()],DD:o[a].days[e.getUTCDay()],m:e.getUTCMonth()+1,M:o[a].monthsShort[e.getUTCMonth()],MM:o[a].months[e.getUTCMonth()],yy:e.getUTCFullYear().toString().substring(2),yyyy:e.getUTCFullYear()};s.dd=(s.d<10?"0":"")+s.d;s.mm=(s.m<10?"0":"")+s.m;e=[];var n=t.extend([],i.separators);for(var r=0,l=i.parts.length;r<=l;r++){n.length&&e.push(n.shift());e.push(s[i.parts[r]])}return e.join("")},headTemplate:"<thead>"+"<tr>"+'<th colspan="7" class="datepicker-title"></th>'+"</tr>"+"<tr>"+'<th class="prev">'+n.templates.leftArrow+"</th>"+'<th colspan="5" class="datepicker-switch"></th>'+'<th class="next">'+n.templates.rightArrow+"</th>"+"</tr>"+"</thead>",contTemplate:'<tbody><tr><td colspan="7"></td></tr></tbody>',footTemplate:"<tfoot>"+"<tr>"+'<th colspan="7" class="today"></th>'+"</tr>"+"<tr>"+'<th colspan="7" class="clear"></th>'+"</tr>"+"</tfoot>"};h.template='<div class="datepicker">'+'<div class="datepicker-days">'+'<table class="table-condensed">'+h.headTemplate+"<tbody></tbody>"+h.footTemplate+"</table>"+"</div>"+'<div class="datepicker-months">'+'<table class="table-condensed">'+h.headTemplate+h.contTemplate+h.footTemplate+"</table>"+"</div>"+'<div class="datepicker-years">'+'<table class="table-condensed">'+h.headTemplate+h.contTemplate+h.footTemplate+"</table>"+"</div>"+'<div class="datepicker-decades">'+'<table class="table-condensed">'+h.headTemplate+h.contTemplate+h.footTemplate+"</table>"+"</div>"+'<div class="datepicker-centuries">'+'<table class="table-condensed">'+h.headTemplate+h.contTemplate+h.footTemplate+"</table>"+"</div>"+"</div>";t.fn.datepicker.DPGlobal=h;t.fn.datepicker.noConflict=function(){t.fn.datepicker=s;return this||e};t.fn.datepicker.version="1.9.0";t.fn.datepicker.deprecated=function(t){var e=window.console;e&&e.warn&&e.warn("DEPRECATED: "+t)};t(document).on("focus.datepicker.data-api click.datepicker.data-api",'[data-provide="datepicker"]',(function(i){var a=t(this||e);if(!a.data("datepicker")){i.preventDefault();datepickerPlugin.call(a,"show")}}));t((function(){datepickerPlugin.call(t('[data-provide="datepicker-inline"]'))}))}));var i={};export default i;

