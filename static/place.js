Place = {
    check: 0,
    data: {},
    showPlace: function (port) {
        var win = this.win_place;
        if (!win) {
            win = new MWin({
                title: '港口定位',
                width: 310,
                content: '<div id="win_place_list"></div>'
                + '<a class="submit margin" href="javascript:Place.savePlace()">确认</a>'
            });
            this.win_place = win;
            this.box = G('win_place_list');
            this.fillPlace();
            this.all = this.box.querySelector('li');
        }
        win.show();
        var p = this.data;
        var port = p.city || p.prov || '';
        this.checkPlace(port);
        this.all.style.display = this.check ? 'none' : '';
    },
    fillPlace: function () {
        var c, d, a = Data.city.split('|'), s = '';
        s += '<ul class="portlist">';
        s += '<li>';
        s += '<b>港口</b>';
        s += '<a onclick="Place.selectPort(this)">全国</a>';
        s += '</li>';
        for (var i = 0; i < a.length; i++) {
            d = a[i].split(',');
            s += '<li>';
            s += '<b onclick="Place.selectPort(this)">' + d[0] + '</b>';
            for (var j = 1; j < d.length; j++) {
                s += '<a onclick="Place.selectPort(this)">' + d[j] + '</a>';
            }
            s += '</li>';
        }
        s += '</ul>';
        this.box.innerHTML = s;
    },
    checkPlace: function (port) {
        if (!port) port = '全国';
        var c, d, e, a = this.box.querySelectorAll('*'), s = '';
        for (var i = a.length - 1; i >= 0; i--) {
            c = a[i];
            d = c.tagName;
            if (d == 'B' || d == 'A') {
                if (c.innerHTML == port) {
                    this.selectPort(c);
                    break;
                }
            }
        }
    },
    selectPort: function (o) {
        var c, d = this.selected, p = this.data, s = o.innerHTML;
        if (o == d) return;

        if (s == '全国') {
            p.prov = '';
            p.city = '';
        } else {
            if (o.tagName == 'B') {
                p.prov = s;
                p.city = '';
            } else {
                p.prov = o.parentNode.children[0].innerHTML;
                p.city = s;
            }
        }
        o.className = 'on';
        if (d) d.className = '';
        this.selected = o;
    },
    savePlace: function () {
        var p = this.data, n = this.check;
        if (n && ((n == 1 && !p.prov) || (n == 2 && !p.city))) {
            XTip.show('请选择港口');
            return;
        }
        this.win_place.hide();
        this.setPlace();
        if (this.onsave) this.onsave();
    },
    setPlace: function () {
        var p = this.data, form = this.form || G('form');
        form.prov.value = p.prov || '';
        form.city.value = p.city || '';
        form.area.value = p.area || '';
        (this.place || G('place')).innerHTML = (p.area || p.city || p.prov || this.holder || '全国');
    },
    saveMyPlace: function () {
        var p = this.data;
        var prov = p.prov || '';
        var city = p.city || '';
        var area = p.area || '';
        ajax({
            hide: 1,
            url: '/Service/SaveMyPlace',
            data: {
                prov: prov,
                city: city,
                area: area
            },
            success: function (r) {
                if (r.ret != 1) {
                    XTip.show(r.msg);
                }
            }
        })
    }
}


Place2 = {
    data: {},
    showPlace: function () {
        var win = this.win_place;
        if (!win) {
            win = new MWin({
                title: this.title || '港口定位',
                width: 310,
                content: '<form id="win_place" class="places">'
                + '<ul>'
                + '<li>区域: <select name="prov" style="font-size:16px;"><option value="">' + (this.holder ? '区域' : '全国') + '</option></select>'
                + '<a onclick="G(\'win_place\').reset()" style="margin-left:15px;">重选</a>'
                + '</li>'
                + '<li>港口: <select name="city" style="font-size:16px;"><option value="">港口</option></select></li>'
                + '<li style="display:none;">区域: <select name="area" style="font-size:16px;"><option value="">区域</option></select></li>'
                + '</ul>'
                + '<a class="submit margin" href="javascript:Place.savePlace()">确认</a>'
                + '</form>'
            });
            this.win_place = win;
            var form = G('win_place');
            Data.bindCity(form.prov, form.city, form.area);
        }
        var form = G('win_place'), p = this.data;
        form.reset();
        win.show();
        var prov = p.prov || '';
        var city = p.city || '';
        var area = p.area || '';
        if (prov) {
            form.prov.value = prov;
            form.prov.onchange();
        }
        if (city) {
            form.city.value = city;
            form.city.onchange();
        }
        if (area) {
            form.area.value = area;
        }
    },
    savePlace: function () {
        var p = this.data,
            form = G('win_place'),
            prov = form.prov.value,
            city = form.city.value,
            area = form.area.value;
        p.prov = prov;
        p.area = area;
        p.city = city;
        if (this.holder && !p.prov && !p.area && !p.city) {
            XTip.show('请选择区域');
            return;
        }
        this.win_place.hide();
        this.setPlace();
        if (this.onsave) this.onsave();
    },
    setPlace: function () {
        var p = this.data || {}, form = this.form || G('form');
        form.prov.value = p.prov;
        form.city.value = p.city;
        form.area.value = p.area;
        (this.place || G('place')).innerHTML = (p.area || p.city || p.prov || this.holder || '全国');
    },
    saveMyPlace: function () {
        var p = this.data,
            form = G('win_place'),
            prov = form.prov.value,
            city = form.city.value,
            area = form.area.value;
        ajax({
            url: '/Service/SaveMyPlace',
            data: {
                prov: prov,
                city: city,
                area: area
            },
            success: function (r) {
                if (r.ret != 1) {
                    XTip.show(r.msg);
                }
            }
        })
    }
}