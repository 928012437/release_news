function G(s) { return document.getElementById(s) }
function E(o, e, f) { if (!e) { e = 'load'; f = o; o = window } if (window.attachEvent) { o.attachEvent('on' + e, f) } else { o.addEventListener(e, f, false) } };
function json(s) { try { return window.JSON ? JSON.parse(s) : eval('(' + s + ')') } catch (e) { } }
function offset(o) { var x = y = 0; while (o) { x += o.offsetLeft; y += o.offsetTop; o = o.offsetParent } return { x: x, y: y } }
function setCookie(name, value) { var t = new Date(); t.setTime(t.getTime() + 30 * 24 * 3600 * 1000); document.cookie = escape(name) + "=" + escape(value) + ";expires=" + t.toGMTString(); }
function getCookie(name) { if (new RegExp("\\b" + name + "=([^;]+)", "g").test(document.cookie)) return unescape(RegExp.$1 || ''); return ''; }
function encode(s) { return String(s).replace(/&/g, '&amp;').replace(/\</g, '&lt;').replace(/\>/g, '&gt;').replace(/ /g, '&nbsp;').replace(/\n/g, '<br>') }
function wheel(o, f) { o.onmousewheel = function (e) { e = e || event; f(e.wheelDelta > 0 || e.detail < 0, e); if (e.preventDefault) e.preventDefault(); e.cancelBubble = true; return false; }; if (o.addEventListener) o.addEventListener("DOMMouseScroll", o.onmousewheel, false) }
function ajax(o) {
    if (!o.hide) loading();
    var b = /POST/i.test(o.type), p = o.data || '', t = o.dataType || 'json', url = o.url || location.href, q = /\?/.test(url) ? '&' : '?',
        x = window.XMLHttpRequest ? new XMLHttpRequest() : (new ActiveXObject('Msxml2.XMLHTTP') || new ActiveXObject('Microsoft.XMLHTTP')),
        z = function (s) {
            if (x.readyState == 4) {
                if (!o.hide) {
                    clearTimeout(x.timer);
                    loading(1);
                }
                if (x.status == 200) {
                    s = x.responseText;
                    if (t == 'json') {
                        t = json(s);
                        s = t || { ret: -100, msg: s ? ('服务器错误(' + s + ')') : '网络不稳定，请稍候再试' }
                    }
                    if (b = o.success) b(s);
                } else {
                    o.success({ status: x.status, msg: x.statusText });
                }
            }
        };
    x.onreadystatechange = z; if (typeof p == 'object') { var r = []; for (var k in p) r.push(encodeURIComponent(k) + '=' + encodeURIComponent(p[k])); p = r.join('&') }
    x.open(b ? 'POST' : 'GET', url + (b ? '' : ((p ? q : '') + p + (o.cache ? '' : (((!p && q == '?') ? '?' : '&') + '_=' + new Date().getTime())))), true);
    if (b) x.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
    x.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
    x.send(p);
    if (!o.hide) x.timer = setTimeout(function () {
        loading(1);
        if (o.success) o.success({ ret: -200, msg: '请求超时，请重试' });
    }, (o.timeout || 10) * 1000);
    return x;
}
function jsonp(o) {
    var f = 'jsonp' + new Date().getTime(), script = document.createElement('script');
    script.src = o.url.replace('callback=?', 'callback=' + f);
    document.body.appendChild(script);
    if (o.onerror) script.onerror = o.onerror;
    window[f] = function (s) {
        document.body.removeChild(script);
        if (o.success) o.success(s)
    };
}
function loading(b) {
    var o = this.loadingObj, d = document.documentElement;
    if (!o) {
        o = document.createElement('div');
        o.style.display = 'none';
        o.className = 'loading';
        o.innerHTML = '<div><span><i>请稍候……</i></span></div>';
        o.onmousewheel = function (e) { e.cancelBubble = true };
        document.body.appendChild(o);
        this.loadingObj = o;
    }
    o.style.display = b ? 'none' : '';
    o.style.height = Math.max(d.scrollHeight, d.clientHeight) + 'px';
}


Fn = {
    rend: function (o, s) { return s.replace(/\{\w+\}/g, function (s) { s = o[s.replace(/\{|\}/g, '')]; if (s == undefined) s = ''; return s; }) },
    bind: function (r, callback, pre) { var o; if (r) for (var k in r) if (o = G((pre || '') + k)) callback(o, r[k], k) },
    getFloat: function (s) { return parseFloat(parseFloat(s || 0).toFixed(2)) },
    setPhone: function (s) { return s.replace(/\b([-\d]{7,})\b/g, '<a href="tel:$1">$1</a>') },
    highLight: function (s, k) { if (k) return s.replace(new RegExp('(' + k.replace(/,/g, '|') + ')', 'gi'), '<span style="color:red">$1</span>'); else return s; },
    getRequest: function (s) {
        var c, r = {}, s = s || location.href, a = s.match(/\w+=[^&]*/g) || [];
        for (var i = 0; i < a.length; i++) {
            c = a[i].split('=');
            r[decodeURIComponent(c[0])] = decodeURIComponent(c[1] || '');
        }
        return r;
    },
    trimText: function (o) {
        var s = o.value;
        o.value = s.replace(/\t/g, '    ').replace(/^[ ]+/gm, '    ');
    },
    formatDate: function (time, days) {
        return this.formatTime(time, (days || 0) * 24 * 3600, 10);
    },
    formatTime: function (time, seconds, len) {
        if (!time) time = new Date().getTime() / 1000;
        if (typeof time == 'string') time = new Date(time.replace(/-/g, '/')).getTime() / 1000;
        var t = new Date((time + (seconds || 0)) * 1000), t = { y: t.getFullYear(), m: t.getMonth() + 1, d: t.getDate(), H: t.getHours(), M: t.getMinutes(), S: t.getSeconds() };
        for (var k in t) if (t[k] < 10) t[k] = '0' + t[k];
        t = [t.y, '-', t.m, '-', t.d, ' ', t.H, ':', t.M, ':', t.S].join('');
        if (len) t = t.substr(0, len);
        return t;
    },
    getTime: function (s) {
        return Math.floor(new Date(s.replace(/-/g, '/')).getTime() / 1000)
    },
    calcTime: function (s, t) {
        if (!t) {
            t = window.ServerTime ? new Date(ServerTime.replace(/-/g, '/')) : new Date();
            if (typeof s == 'string' && s.length == 10) {
                t = new Date([t.getFullYear(), t.getMonth() + 1, t.getDate()].join('/'));
            }
            t = t.getTime();
        }
        if (typeof t == 'string') t = new Date(t.replace(/-/g, '/')).getTime();
        s = t - new Date(s.replace(/-/g, '/')).getTime();
        var b, d, h, m, z = 24 * 3600;
        if (s <= 0) { b = 1; s = -s }
        s /= 1000;
        d = Math.floor(s / z); s -= d * z; z = 3600;
        h = Math.floor(s / z); s -= h * z; z = 60;
        m = Math.floor(s / z);
        s -= m * z;
        t = { d: d, h: h, m: m, s: parseInt(s) };
        if (b) t.b = 1;
        return t;
    },
    leftTimes: function (t, n) {
        if (!t) return '';
        n = n || (window.ServerTime ? new Date(ServerTime.replace(/-/g, '/')) : new Date());
        var r = this.calcTime(t, n);
        if (r.b) return '';
        if (r.d > 10) return t.substr(5, 5).replace('-', '月') + '日';
        if (r.d > 0) return r.d + '天前';
        if (r.h > 0) return r.h + '小时前';
        if (r.m > 0) return r.m + '分钟前';
        if (r.s >= 0) return (r.s || 1) + '秒前';
        return t.substr(0, 10);
    },
    getRegion: function (prov) {
        var c, d, a = Data.region.split(',');
        for (var i = 0; i < a.length; i++) {
            c = a[i].split(':');
            d = c[0];
            for (var j = 1; j < c.length; j++) {
                if (c[j] == prov) return d;
            }
        }
        return '';
    }
}

Form = {
    submit: function (form, callback, param) {
        if (form.lock) return;
        if (!Check.check(form)) return;
        var data = this.json(form);
        form.lock = 1;
        if (!param) param = {};
        if (param.begin) if (param.begin() === false) return;
        ajax({
            type: form.getAttribute('method') == 'get' ? 'GET' : 'POST',
            url: form.action || '/ajax',
            dataType: 'json',
            data: data,
            hide: param.hide || '',
            success: function (r) {
                form.lock = 0;
                if (callback) callback(r);
            },
            error: function (r) {
                form.lock = 0;
                alert(r)
            }
        })
    },
    json: function (form) {
        var c, d, v, r = {}, ie = /IE (6|7|8)/.test(navigator.userAgent);
        for (var i = 0; i < form.length; i++) {
            c = form[i];
            if (c.type == 'radio' || c.getAttribute('unsubmit')) continue;
            if (d = (c.name || c.id)) {
                if (c.name && /^\!\w*/.test(c.name)) continue;
                v = c.value || '';
                if (ie && (c = c.getAttribute('placeholder')) && v == c) v = '';
                if (c.tagName != 'textarea' && c.type != 'password') v = v.trim();
                if (c.type == 'checkbox') v = c.checked ? '1' : '';
                r[d] = v;
            }
        }
        return r;
    }
}

Check = {
    RE: {
        chinese: /^[\u4E00-\u9FA5]{1,50}$/,
        name: /^[\w\u4E00-\u9FA5\-\(\)]{1,100}$/,
        nick: /^[\w\u4E00-\u9FA5]{2,20}$/,
        mobile: /^1[34578]\d{9}$/,
        phone: /^(0\d{2,3}[^\d]+)?\d{7,8}([^\d]+\d{1,6})?$/,
        email: /^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$/,
        account: /^([\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+)|(1[3458]\d{9})$/,
        website: /^http[s]?:\/\/.*$/,
        zipcode: /^\d{6}$/,
        username: /^[\w@\.]{3,50}$/,
        password: /^[a-zA-Z0-9]{6,12}$/,
        address: /^[\w\d\u4E00-\u9FA5\-\,\.\(\)\s\@\#]{4,50}$/,
        date: /^[\d]{4}-[\d]{2}-[\d]{2}$/,
        datetime: /^[\d]{4}-[\d]{2}-[\d]{2} [\d]{2}:[\d]{2}:[\d]{2}$/,
        minimemo: /^[\S\s]{1,500}$/,
        intro: /^[\S\s]{20,4000}$/,
        minintro: /^[\S\s]{20,1000}$/,
        memo: /^[\S\s]{1,4000}$/,
        empty: /^\s*$/,
        number: /^\d+$/
    },
    check: function (form, f) {
        var ret = true;
        if (f && typeof f != 'function') f = this.echo;
        if (!form) form = document.forms[0] || [];
        for (var i = 0; i < form.length; i++) { if (!this.chk(form[i], f)) { if (f) { ret = false } else { return false } } }
        return ret;
    },
    chk: function (o, f) {
        if (o.getAttribute('uncheck')) return true;
        var b, c, d, e, s = o.type == 'checkbox' ? (o.checked ? '1' : '') : o.value, a = (o.getAttribute('check') || '').split('||'), p = a.pop();
        if (/^\{/.test(p)) { p = eval('(' + p + ')') } else { a.push(p); p = {} };
        b = a.length % 2;
        if (b && !s.replace(/\s+/g, '').length) { e = a[0]; } else {
            for (var j = b; j < a.length; j += 2) {
                c = a[j]; d = a[j + 1];
                if (/^\[(.*),(.*)\]/.test(c)) {
                    b = RegExp.$1; c = RegExp.$2;
                    if (!s || isNaN(s) || (!(/\./.test(b) || /\./.test(c[1])) && /\./.test(s)) || (b && parseFloat(s) < parseFloat(b)) || (c && parseFloat(s) > parseFloat(c))) e = d;
                } else { b = 0; if (/^\/.+/.test(c)) { b = eval(c) } else { b = this.RE[c] } if ((b && !b.test(s)) || (!b && !eval(c.replace(/this.value/g, '"' + s + '"')))) e = d; }
                if (e) break;
            }
        }
        if (f) p.f = f;
        if (p.f) {
            p.f(o, e, p)
        } else if (e) {
            if (p.alert) {
                top.alert(e);
            } else {
                this.msg(o, e, p)
            }
        };
        return e ? false : true;
    },
    msg: function (o, s, p) {
        var _ = this, x = 0, y = 0, m, c = offset(o), p = p || {}, b = p.z || 0, t = _.tips(), w = document.documentElement.clientWidth;
        if (!c.x && !c.y) { XTip.show(s); return };
        //try { o.focus() } catch (e) { XTip.show(s); return };
        XTip.show(s); return;
        if (!o.close) { var f = function () { _.hide() }; E(o, 'blur', f); if (!p.keep) E(o, 'click', f); o.close = 1 };
        t.t.style.display = b == 0 ? '' : 'none';
        t.r.style.display = b == 1 ? '' : 'none';
        t.b.style.display = b == 2 ? '' : 'none';
        if (b == 0) m = t.t;
        if (b == 2) m = t.b;
        if (m) m.style.left = '5px';
        t.o.innerHTML = s;
        t.style.display = '';
        if (b == 0) y = -t.offsetHeight - 5;
        if (b == 1) x = o.offsetWidth + 5;
        if (b == 2) y = o.offsetHeight + 5;
        x = c.x + x + (p.x || 0);
        y = c.y + y + (p.y || 0);
        b = t.o.offsetWidth;
        if (m && (x + b > w)) { m.style.left = x + b - w + 5 + 'px'; x = w - b; }
        t.style.left = x + 'px';
        t.style.top = y + 'px';
    },
    hide: function () { if (this.t) this.t.style.display = 'none' },
    tips: function () {
        var _ = this, t = _.t;
        if (!t) {
            t = document.createElement('DIV');
            t.style.display = 'none';
            t.style.position = 'absolute';
            t.style.zIndex = '1000000000';
            if (/IE (6|7)/.test(navigator.userAgent)) t.style.height = '22px';
            t.innerHTML = '<div style="position:relative;background:#FFFDEB;color:#f00;border:solid 1px #EDCE70;cursor:default;padding:3px 5px !important;padding:3px 5px 1px 5px;line-height:1.3em;_position:absolute;white-space:nowrap;'
                + '-moz-border-radius:3px;border-radius:3px;-moz-box-shadow:1px 1px 3px #EDCE70;box-shadow:1px 1px 3px #EDCE70;"></div>'
                + '<div style="top:-10px;left:5px;position:absolute;width:0;height:0;overflow:hidden;border:5px solid transparent;_border-color:tomato;border-bottom-color:#EDCE70;_filter:chroma(color=tomato);display:none;"></div>'
                + '<div style="top:6px;left:-10px;position:absolute;width:0;height:0;overflow:hidden;border:5px solid transparent;_border-color:tomato;border-right-color: #EDCE70;_filter:chroma(color=tomato);display:none;"></div>'
                + '<div style="bottom:-10px;left:5px;position:absolute;width:0;height:0;overflow:hidden;border:5px solid transparent;_border-color:tomato;border-top-color:#EDCE70;_filter:chroma(color=tomato);display:none;"></div>'
            document.body.appendChild(t);
            var a = t.childNodes;
            _.t = t; t.o = a[0]; t.b = a[1]; t.r = a[2]; t.t = a[3];
        }
        return t;
    },
    bind: function (form, f) {
        var _ = this, c, d, a = form || document.forms[0], f = f || this.echo;
        for (var i = 0; i < a.length; i++) {
            c = a[i];
            if (c.getAttribute('check')) {
                E(c, 'focus', function () { Check.chk(this, function (o, e, p) { f(o, e, p, true) }) });
                E(c, 'blur', function () { Check.chk(this, f) });
            }
        }
    },
    echo: function (o, e, p, isfocus) {
        var obj = G(p.echo);
        if (!obj) return;
        var r = { t: 'green', s: '√' };
        if (isfocus) {
            r.t = 'gray';
            r.s = p.tip;
        } else if (e) {
            r.t = 'red';
            r.s = e;
        }
        obj.innerHTML = '<span style="color:' + r.t + '">' + r.s + '</span>';
    }
}

MWin = function () { this.init.apply(this, arguments) }
MWin.prototype = {
    init: function (p) {
        var _ = this, a, d, w, h, o = document.createElement('div');
        o.innerHTML = '<table cellpadding="0" cellspacing="0"><tr><td><div class="MWinBox"><div class="MWinTitle"><div class="t"></div><div class="x"></div></div><div class="MWinBody"></div></div></td></tr></table>';
        o.className = 'MWin';
        o.style.display = 'none';
        document.body.appendChild(o);
        d = o.getElementsByTagName('div')[0];
        _.Obj = o;
        _.Box = d;
        a = d.childNodes;
        _.Body = a[1];
        a = a[0].childNodes;
        _.Title = a[0];
        _.Close = a[1];
        _.setParam(p);
        window.addEventListener('resize', function () { _.resize() });
        d.onclick = function (e) { e.cancelBubble = true };
        o.onclick = function () { _.hide() };
        _.Close.onclick = function () { _.hide() };
    },
    resize: function () {
        var _ = this, c, d = _.Box, w = _.width || 0.8, h = _.height;
        if (w <= 1) w *= document.documentElement.clientWidth;
        d.style.width = w + 'px';
        c = document.documentElement.clientHeight - _.Title.offsetHeight - 2;
        if (!h && _.Body.offsetHeight > c) h = c;
        if (h) {
            if (h > c) h = c;
            _.Body.style.height = h + 'px';
        }
    },
    setParam: function (p) {
        if (!p) return;
        var _ = this, c;
        if (c = p.title) {
            _.Title.innerHTML = c || '';
            _.Title.style.display = c ? '' : 'none';
        }
        if (c = p.content) _.Body.innerHTML = c;
        for (var k in p) _[k] = p[k];
    },
    show: function (p) {
        if (!window.MWinIndex) MWinIndex = 1000;
        var _ = this, c = _.Obj;
        _.setParam(p);
        c.style.zIndex = MWinIndex++;
        c.style.display = '';
        _.resize();
    },
    hide: function () {
        var _ = this, c = _.Box;
        c.className = 'MWinBox MWinHide';
        setTimeout(function () {
            c.className = 'MWinBox';
            _.Obj.style.display = 'none';
            _.Body.style.height = 'auto';
        }, 200);
        if (_.onhide) _.onhide();
    }
}

XSelect = {
    init: function (o) {
        if (o && o.tagName == 'SELECT') {
            this.bind(o);
        } else {
            var a = (o || document).getElementsByTagName('select');
            for (var i = 0; i < a.length; i++) this.bind(a[i]);
        }
    },
    bind: function (o) {
        var c, s = '', p = o.previousSibling;
        if (p && p.o == o) p.parentNode.removeChild(p);
        p = document.createElement('ul');
        p.className = 'XSelect';
        for (var i = 0; i < o.length; i++) {
            c = o[i];
            s += '<li onclick="XSelect.check(this.parentNode,' + i + ')">' + c.text + '</li>';
        }
        p.innerHTML = s;
        o.parentNode.insertBefore(p, o);
        o.style.display = 'none';
        p.o = o;
        this.check(p, o.selectedIndex, 1);
    },
    check: function (p, i, b) {
        if (i < 0) return;
        var a = p.childNodes, c = a[i];
        a[p.index || 0].className = '';
        c.className = 'on';
        p.index = i;
        p.o.selectedIndex = i;
        if (!b && (c = p.o.onchange)) c();
    }
}

XTip = {
    ie8: /IE 8/.test(navigator.userAgent),
    show: function (s, p) {
        var o = this.o;
        if (!o) {
            o = document.createElement('div');
            o.appendChild(document.createElement('div'));
            document.body.appendChild(o);
            o.style.display = 'none';
            o.className = 'x_tip';
            this.o = o;
        }
        if (!p) p = {};
        o.delay = p.delay || 2;
        clearInterval(o.timer);
        o.children[0].innerHTML = s;
        o.n = -200;
        o.style.bottom = o.n + 'px';
        if (XTip.ie8) {
            o.style.filter = 'alpha(opacity=100)';
        } else {
            o.style.opacity = 1;
        }
        o.style.display = '';
        o.timer = setInterval(function () {
            o.n += (-o.n / 7 + 1);
            if (o.n > 0) {
                o.n = 0;
                clearInterval(o.timer);
                o.timer = setTimeout(function () {
                    clearTimeout(o.timer);
                    o.n = 1;
                    o.timer = setInterval(function () {
                        o.n -= 0.1;
                        if (o.n <= 0) {
                            o.n = 0;
                            o.style.display = 'none';
                            clearInterval(o.timer);
                        }
                        if (XTip.ie8) {
                            o.style.filter = 'alpha(opacity=' + Math.floor(o.n * 100) + ')';
                        } else {
                            o.style.opacity = o.n;
                        }
                    }, 50);
                }, 1000 * o.delay);
            }
            o.style.bottom = o.n + 20 + 'px';
        }, 10);
    },
    hide: function () {
        var o = this.o;
        if (o) {
            clearInterval(o.timer);
            clearTimeout(o.timer);
            o.style.display = 'none';
        }
    }
}

request = Fn.getRequest();

E(function () {
    if (window.ServerTime) {
        setInterval(function () {
            ServerTime = Fn.formatTime(ServerTime, 1);
        }, 1000);
    }
})
function stopBubble(e) {
    if (e && e.stopPropagation) {//非IE浏览器
        e.stopPropagation();
    }
    else {//IE浏览器
        window.event.cancelBubble = true;
    }
}
function changeaddress(area,obj){
    address=area;
    var barr=document.getElementsByTagName('b');
    var aarr=document.getElementsByTagName('a');
    for(var i = 0; i < barr.length; i++){
        barr[i].classList.remove("on");
    }
    for(var i = 0; i < aarr.length; i++){
        aarr[i].classList.remove("on");
    }
    obj.classList.add('on');
}
function getScrollTop(){
    var scrollTop = 0, bodyScrollTop = 0, documentScrollTop = 0;
    if(document.body){
        bodyScrollTop = document.body.scrollTop;
    }
    if(document.documentElement){
        documentScrollTop = document.documentElement.scrollTop;
    }
    scrollTop = (bodyScrollTop - documentScrollTop > 0) ? bodyScrollTop : documentScrollTop;
    return scrollTop;
}
//文档的总高度
function getScrollHeight(){
    var scrollHeight = 0, bodyScrollHeight = 0, documentScrollHeight = 0;
    if(document.body){
        bodyScrollHeight = document.body.scrollHeight;
    }
    if(document.documentElement){
        documentScrollHeight = document.documentElement.scrollHeight;
    }
    scrollHeight = (bodyScrollHeight - documentScrollHeight > 0) ? bodyScrollHeight : documentScrollHeight;
    return scrollHeight;
}
function getWindowHeight(){
    var windowHeight = 0;
    if(document.compatMode == "CSS1Compat"){
        windowHeight = document.documentElement.clientHeight;
    }else{
        windowHeight = document.body.clientHeight;
    }
    return windowHeight;
}