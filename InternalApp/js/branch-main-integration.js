/***Notify Visitor and Brance.io Integration,User and Event Track Changes***/
(function (b, r, a, n, c, h, _, s, d, k) { if (!b[n] || !b[n]._q) { for (; s < _.length;) c(h, _[s++]); d = r.createElement(a); d.async = 1; d.src = "https://cdn.branch.io/branch-latest.min.js"; k = r.getElementsByTagName(a)[0]; k.parentNode.insertBefore(d, k); b[n] = h } })(window, document, "script", "branch", function (b, r) { b[r] = function () { b._q.push([r, arguments]) } }, { _q: [], _v: 1 }, "addListener applyCode autoAppIndex banner closeBanner closeJourney creditHistory credits data deepview deepviewCta first getCode init link logout redeem referrals removeListener sendSMS setBranchViewData setIdentity track validateCode trackCommerceEvent logEvent disableTracking".split(" "), 0);
var options = { no_journeys: true };
/*branch.init('key_test_bkSwYFzTWSqaJJ45FvwW8jjgzDgoKCg9', options, function (err, data) {
    console.log(err, data);
});*/
branch.init('key_live_cpGB9FBKYTwoTUW2yraS7pmnszpaGDiR', options, function (err, data) {
    console.log(err, data);
});
var nv = nv || function () { (window.nv.q = window.nv.q || []).push(arguments) }; nv.l = new Date; var notify_visitors = notify_visitors || function () {
    var e = { initialize: !1, ab_overlay: !1, auth: { bid_e: "DF4B1FB40F76C21F30E7E7CBCAC1EDB3", bid: "7951", t: "420" } };
    return e.data = { bid_e: e.auth.bid_e, bid: e.auth.bid, t: e.auth.t, iFrame: window !== window.parent, trafficSource: document.referrer, link_referrer: document.referrer, pageUrl: document.location, path: location.pathname, domain: location.origin, gmOffset: 60 * (new Date).getTimezoneOffset() * -1, screenWidth: screen.width, screenHeight: screen.height, isPwa: window.matchMedia && window.matchMedia("(display-mode: standalone)").matches ? 1 : 0, cookieData: document.cookie }, e.options = function (t) { t && "object" == typeof t ? e.ab_overlay = t.ab_overlay : console.log("Not a valid option") }, e.tokens = function (t) { e.data.tokens = t && "object" == typeof t ? JSON.stringify(t) : "" }, e.ruleData = function (t) { e.data.ruleData = t && "object" == typeof t ? JSON.stringify(t) : "" }, e.getParams = function (e) { url = window.location.href.toLowerCase(), e = e.replace(/[\[\]]/g, "\\$&").toLowerCase(); var t = new RegExp("[?&]" + e + "(=([^&#]*)|&|#|$)").exec(url); return t && t[2] ? decodeURIComponent(t[2].replace(/\+/g, " ")) : "" }, e.init = function () { if (e.auth && !e.initialize && (e.data.storage = e.browserStorage(), e.js_callback = "nv_json1", !e.data.iFrame && "noapi" !== e.getParams("nvcheck"))) { var t = "?"; if (e.ab_overlay) { var o = document.createElement("style"), n = "body{opacity:0 !important;filter:alpha(opacity=0) !important;background:none !important;}", a = document.getElementsByTagName("head")[0]; o.setAttribute("id", "_nv_hm_hidden_element"), o.setAttribute("type", "text/css"), o.styleSheet ? o.styleSheet.cssText = n : o.appendChild(document.createTextNode(n)), a.appendChild(o), setTimeout(function () { var e = this.document.getElementById("_nv_hm_hidden_element"); if (e) try { e.parentNode.removeChild(e) } catch (t) { e.remove() } }, 2e3) } for (var i in e.data) e.data.hasOwnProperty(i) && (t += encodeURIComponent(i) + "=" + encodeURIComponent(e.data[i]) + "&"); e.load("https://www.notifyvisitors.com/ext/v1/settings" + t), e.initialize = !0 } }, e.browserStorage = function () { var t = { session: e.storage("sessionStorage"), local: e.storage("localStorage") }; return JSON.stringify(t) }, e.storage = function (e) { var t = {}; return window[e] && window[e].length > 0 && Object.keys(window[e]).forEach(function (o) { -1 !== o.indexOf("_nv_") && (t[o] = window[e][o]) }), t }, e.load = function (e) { var t = document, o = t.createElement("script"); o.src = e, o.type = "text/javascript", t.body ? t.body.appendChild(o) : t.head.appendChild(o) }, e
}();
notify_visitors.init();

function setIdentityBr(UserRefId) {
    try {
        branch.setIdentity(UserRefId.toString());

        branch.setIdentity(UserRefId.toString(), function (err, data) {
            console.log(err, data);
        });
    }
    catch (ex) {
    }
    try {
        nv('user', UserRefId.toString(), {});
    }
    catch (ex) {
    }
}

function logEventBr(Events) {
    try {
        branch.logEvent(Events, {}, function (err) { console.log(err); });
    }
    catch (ex) {
    }
    try {
        if (Events == 'app_open') {
            nv('event', Events, {}, 100, 2);
        }
        else {
            nv('event', Events, {}, 100, 1);
        }
    }
    catch (ex) {
    }
}

function logEventBrAttributes(Events, Attributes_Status) {
    try {
        setTimeout(function () { branch.logEvent(Events, { txn_status: Attributes_Status }, function (err) { console.log(err); }); }, 3000);
    }
    catch (ex) {
    }
    try {
        nv('event', Events, { txn_status: Attributes_Status }, 100, 1);
    }
    catch (ex) {
    }
}
function logEventBrAttributesComplete(Events, Attributes_Status, Attributes_Time, Attributes_Amount) {
    try {
        setTimeout(function () { branch.logEvent(Events, { txn_status: Attributes_Status, txn_time: Attributes_Time, txn_amount: Attributes_Amount }, function (err) { console.log(err); }); }, 3000);
    }
    catch (ex) {
    }
    try {
        nv('event', Events, { txn_status: Attributes_Status, txn_time: Attributes_Time, txn_amount: Attributes_Amount }, 100, 1);
    }
    catch (ex) {
    }
}
/***Reference 
Below container used in Index.aspx Page for showing Banner and Survey
<div id='notifyvisitorstag'></div>
***/