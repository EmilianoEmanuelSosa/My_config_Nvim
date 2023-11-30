function debounce(fn, millis) {
    let timer;
    return ()=>{
        clearTimeout(timer);
        timer = setTimeout(fn, millis);
    };
}
function findLast(array, predicate) {
    return array?.slice().reverse().find(predicate);
}
function getInjectConfig() {
    const peek = Reflect.get(window, 'peek');
    if (peek) return peek;
    const params = {};
    new URLSearchParams(location.search).forEach((value, key)=>{
        params[key] = value;
    });
    params.serverUrl = params.serverUrl || location.host;
    return params;
}
function slidingWindows(array, size, { step = 1, partial = false } = {}) {
    if (!Number.isInteger(size) || !Number.isInteger(step) || size <= 0 || step <= 0) {
        throw new RangeError("Both size and step must be positive integer.");
    }
    const length = Math.floor((array.length - (partial ? 1 : size)) / step + 1);
    const result = [];
    for(let i = 0; i < length; i++){
        result.push(array.slice(i * step, i * step + size));
    }
    return result;
}
var k = 11;
function ee(e, f) {
    var a = f.attributes, t, n, d, u, g;
    if (!(f.nodeType === k || e.nodeType === k)) {
        for(var O = a.length - 1; O >= 0; O--)t = a[O], n = t.name, d = t.namespaceURI, u = t.value, d ? (n = t.localName || n, g = e.getAttributeNS(d, n), g !== u && (t.prefix === "xmlns" && (n = t.name), e.setAttributeNS(d, n, u))) : (g = e.getAttribute(n), g !== u && e.setAttribute(n, u));
        for(var y = e.attributes, U = y.length - 1; U >= 0; U--)t = y[U], n = t.name, d = t.namespaceURI, d ? (n = t.localName || n, f.hasAttributeNS(d, n) || e.removeAttributeNS(d, n)) : f.hasAttribute(n) || e.removeAttribute(n);
    }
}
var L, ae = "http://www.w3.org/1999/xhtml", c = typeof document > "u" ? void 0 : document, te = !!c && "content" in c.createElement("template"), ne = !!c && c.createRange && "createContextualFragment" in c.createRange();
function ie(e) {
    var f = c.createElement("template");
    return f.innerHTML = e, f.content.childNodes[0];
}
function re(e) {
    L || (L = c.createRange(), L.selectNode(c.body));
    var f = L.createContextualFragment(e);
    return f.childNodes[0];
}
function fe(e) {
    var f = c.createElement("body");
    return f.innerHTML = e, f.childNodes[0];
}
function le(e) {
    return e = e.trim(), te ? ie(e) : ne ? re(e) : fe(e);
}
function B(e, f) {
    var a = e.nodeName, t = f.nodeName, n, d;
    return a === t ? !0 : (n = a.charCodeAt(0), d = t.charCodeAt(0), n <= 90 && d >= 97 ? a === t.toUpperCase() : d <= 90 && n >= 97 ? t === a.toUpperCase() : !1);
}
function ve(e, f) {
    return !f || f === ae ? c.createElement(e) : c.createElementNS(f, e);
}
function de(e, f) {
    for(var a = e.firstChild; a;){
        var t = a.nextSibling;
        f.appendChild(a), a = t;
    }
    return f;
}
function K(e, f, a) {
    e[a] !== f[a] && (e[a] = f[a], e[a] ? e.setAttribute(a, "") : e.removeAttribute(a));
}
var W = {
    OPTION: function(e, f) {
        var a = e.parentNode;
        if (a) {
            var t = a.nodeName.toUpperCase();
            t === "OPTGROUP" && (a = a.parentNode, t = a && a.nodeName.toUpperCase()), t === "SELECT" && !a.hasAttribute("multiple") && (e.hasAttribute("selected") && !f.selected && (e.setAttribute("selected", "selected"), e.removeAttribute("selected")), a.selectedIndex = -1);
        }
        K(e, f, "selected");
    },
    INPUT: function(e, f) {
        K(e, f, "checked"), K(e, f, "disabled"), e.value !== f.value && (e.value = f.value), f.hasAttribute("value") || e.removeAttribute("value");
    },
    TEXTAREA: function(e, f) {
        var a = f.value;
        e.value !== a && (e.value = a);
        var t = e.firstChild;
        if (t) {
            var n = t.nodeValue;
            if (n == a || !a && n == e.placeholder) return;
            t.nodeValue = a;
        }
    },
    SELECT: function(e, f) {
        if (!f.hasAttribute("multiple")) {
            for(var a = -1, t = 0, n = e.firstChild, d, u; n;)if (u = n.nodeName && n.nodeName.toUpperCase(), u === "OPTGROUP") d = n, n = d.firstChild;
            else {
                if (u === "OPTION") {
                    if (n.hasAttribute("selected")) {
                        a = t;
                        break;
                    }
                    t++;
                }
                n = n.nextSibling, !n && d && (n = d.nextSibling, d = null);
            }
            e.selectedIndex = a;
        }
    }
}, x = 1, ue = 11, Y = 3, $ = 8;
function b() {}
function se(e) {
    if (e) return e.getAttribute && e.getAttribute("id") || e.id;
}
function ce(e) {
    return function(a, t, n) {
        if (n || (n = {}), typeof t == "string") if (a.nodeName === "#document" || a.nodeName === "HTML" || a.nodeName === "BODY") {
            var d = t;
            t = c.createElement("html"), t.innerHTML = d;
        } else t = le(t);
        var u = n.getNodeKey || se, g = n.onBeforeNodeAdded || b, O = n.onNodeAdded || b, y = n.onBeforeElUpdated || b, U = n.onElUpdated || b, q = n.onBeforeNodeDiscarded || b, w = n.onNodeDiscarded || b, E = n.onBeforeElChildrenUpdated || b, H = n.childrenOnly === !0, S = Object.create(null), D = [];
        function R(l) {
            D.push(l);
        }
        function X(l, r) {
            if (l.nodeType === x) for(var i = l.firstChild; i;){
                var v = void 0;
                r && (v = u(i)) ? R(v) : (w(i), i.firstChild && X(i, r)), i = i.nextSibling;
            }
        }
        function M(l, r, i) {
            q(l) !== !1 && (r && r.removeChild(l), w(l), X(l, i));
        }
        function z(l) {
            if (l.nodeType === x || l.nodeType === ue) for(var r = l.firstChild; r;){
                var i = u(r);
                i && (S[i] = r), z(r), r = r.nextSibling;
            }
        }
        z(a);
        function m(l) {
            O(l);
            for(var r = l.firstChild; r;){
                var i = r.nextSibling, v = u(r);
                if (v) {
                    var p = S[v];
                    p && B(r, p) ? (r.parentNode.replaceChild(p, r), P(p, r)) : m(r);
                } else m(r);
                r = i;
            }
        }
        function J(l, r, i) {
            for(; r;){
                var v = r.nextSibling;
                (i = u(r)) ? R(i) : M(r, l, !0), r = v;
            }
        }
        function P(l, r, i) {
            var v = u(r);
            v && delete S[v], !(!i && (y(l, r) === !1 || (e(l, r), U(l), E(l, r) === !1))) && (l.nodeName !== "TEXTAREA" ? Q(l, r) : W.TEXTAREA(l, r));
        }
        function Q(l, r) {
            var i = r.firstChild, v = l.firstChild, p, A, N, _, h;
            e: for(; i;){
                for(_ = i.nextSibling, p = u(i); v;){
                    if (N = v.nextSibling, i.isSameNode && i.isSameNode(v)) {
                        i = _, v = N;
                        continue e;
                    }
                    A = u(v);
                    var C = v.nodeType, T = void 0;
                    if (C === i.nodeType && (C === x ? (p ? p !== A && ((h = S[p]) ? N === h ? T = !1 : (l.insertBefore(h, v), A ? R(A) : M(v, l, !0), v = h) : T = !1) : A && (T = !1), T = T !== !1 && B(v, i), T && P(v, i)) : (C === Y || C == $) && (T = !0, v.nodeValue !== i.nodeValue && (v.nodeValue = i.nodeValue))), T) {
                        i = _, v = N;
                        continue e;
                    }
                    A ? R(A) : M(v, l, !0), v = N;
                }
                if (p && (h = S[p]) && B(h, i)) l.appendChild(h), P(h, i);
                else {
                    var I = g(i);
                    I !== !1 && (I && (i = I), i.actualize && (i = i.actualize(l.ownerDocument || c)), l.appendChild(i), m(i));
                }
                i = _, v = N;
            }
            J(l, v, A);
            var j = W[l.nodeName];
            j && j(l, r);
        }
        var s = a, V = s.nodeType, F = t.nodeType;
        if (!H) {
            if (V === x) F === x ? B(a, t) || (w(a), s = de(a, ve(t.nodeName, t.namespaceURI))) : s = t;
            else if (V === Y || V === $) {
                if (F === V) return s.nodeValue !== t.nodeValue && (s.nodeValue = t.nodeValue), s;
                s = t;
            }
        }
        if (s === t) w(a);
        else {
            if (t.isSameNode && t.isSameNode(s)) return;
            if (P(s, t, H), D) for(var o = 0, Z = D.length; o < Z; o++){
                var G = S[D[o]];
                G && M(G, G.parentNode, !1);
            }
        }
        return !H && s !== a && a.parentNode && (s.actualize && (s = s.actualize(a.ownerDocument || c)), a.parentNode.replaceChild(s, a)), s;
    };
}
var pe = ce(ee), Ae = pe;
function init() {
    const peek = getInjectConfig();
    mermaid.initialize({
        startOnLoad: false,
        theme: peek?.theme === 'light' ? 'neutral' : 'dark'
    });
}
function render(id, definition, container) {
    return new Promise((resolve)=>{
        try {
            mermaid.mermaidAPI.render(id, definition, resolve, container);
        } catch  {
            resolve();
        }
    });
}
const __default = {
    init,
    render
};
function setKeybinds() {
    document.addEventListener('keydown', (event)=>{
        switch(event.key){
            case 'j':
                window.scrollBy({
                    top: 50
                });
                break;
            case 'k':
                window.scrollBy({
                    top: -50
                });
                break;
            case 'd':
                window.scrollBy({
                    top: window.innerHeight / 2
                });
                break;
            case 'u':
                window.scrollBy({
                    top: -window.innerHeight / 2
                });
                break;
            case 'g':
                window.scrollTo({
                    top: 0
                });
                break;
            case 'G':
                window.scrollTo({
                    top: document.body.scrollHeight
                });
                break;
        }
    });
}
addEventListener('DOMContentLoaded', ()=>{
    const markdownBody = document.getElementById('markdown-body');
    const base = document.getElementById('base');
    const peek = getInjectConfig();
    if (peek.theme) markdownBody.classList.add(peek.theme);
    setKeybinds();
    let source;
    let blocks;
    let scroll;
    onload = ()=>{
        const item = sessionStorage.getItem('session');
        if (item) {
            const session = JSON.parse(item);
            base.href = session.base;
            onPreview({
                html: session.html,
                lcount: session.lcount
            });
            onScroll({
                line: session.line
            });
        }
    };
    onbeforeunload = ()=>{
        sessionStorage.setItem('session', JSON.stringify({
            base: base.href,
            html: markdownBody.innerHTML,
            lcount: source?.lcount,
            line: scroll?.line
        }));
    };
    const decoder = new TextDecoder();
    const socket = new WebSocket(`ws://${peek.serverUrl}/`);
    socket.binaryType = 'arraybuffer';
    socket.onclose = (event)=>{
        if (!event.wasClean) {
            close();
            location.reload();
        }
    };
    socket.onmessage = (event)=>{
        const data = JSON.parse(decoder.decode(event.data));
        switch(data.action){
            case 'show':
                onPreview(data);
                break;
            case 'scroll':
                onScroll(data);
                break;
            case 'base':
                base.href = data.base;
                break;
            default:
                break;
        }
    };
    const onPreview = (()=>{
        __default.init();
        const renderMermaid = debounce((()=>{
            const parser = new DOMParser();
            async function render(el) {
                const svg = await __default.render(`${el.id}-svg`, el.getAttribute('data-graph-definition'), el);
                if (svg) {
                    const svgElement = parser.parseFromString(svg, 'text/html').body;
                    el.appendChild(svgElement);
                    el.parentElement?.style.setProperty('height', window.getComputedStyle(svgElement).getPropertyValue('height'));
                }
            }
            return ()=>{
                Array.from(markdownBody.querySelectorAll('div[data-graph="mermaid"]')).filter((el)=>!el.querySelector('svg')).forEach(render);
            };
        })(), 200);
        const morphdomOptions = {
            childrenOnly: true,
            getNodeKey: (node)=>{
                if (node instanceof HTMLElement && node.getAttribute('data-graph') === 'mermaid') {
                    return node.id;
                }
                return null;
            },
            onNodeAdded: (node)=>{
                if (node instanceof HTMLElement && node.getAttribute('data-graph') === 'mermaid') {
                    renderMermaid();
                }
                return node;
            },
            onBeforeElUpdated: (fromEl, toEl)=>{
                if (fromEl.hasAttribute('open')) {
                    toEl.setAttribute('open', 'true');
                } else if (fromEl.classList.contains('mermaid') && toEl.classList.contains('mermaid')) {
                    toEl.style.height = fromEl.style.height;
                }
                return !fromEl.isEqualNode(toEl);
            },
            onBeforeElChildrenUpdated (_, toEl) {
                return toEl.getAttribute('data-graph') !== 'mermaid';
            }
        };
        const mutationObserver = new MutationObserver(()=>{
            blocks = slidingWindows(Array.from(document.querySelectorAll('[data-line-begin]')), 2, {
                step: 1,
                partial: true
            });
        });
        const resizeObserver = new ResizeObserver(()=>{
            if (scroll) onScroll(scroll);
        });
        mutationObserver.observe(markdownBody, {
            childList: true
        });
        resizeObserver.observe(markdownBody);
        return (data)=>{
            source = {
                lcount: data.lcount
            };
            Ae(markdownBody, `<main>${data.html}</main>`, morphdomOptions);
        };
    })();
    const onScroll = (()=>{
        function getBlockOnLine(line) {
            return findLast(blocks, (block)=>line >= Number(block[0].dataset.lineBegin));
        }
        function getOffset(elem) {
            let current = elem;
            let top = 0;
            while(top === 0 && current){
                top = current.getBoundingClientRect().top;
                current = current.parentElement;
            }
            return top + window.scrollY;
        }
        return (data)=>{
            scroll = data;
            if (!blocks || !source) return;
            const block = getBlockOnLine(data.line) || blocks[0];
            const target = block[0];
            const next = target ? block[1] : blocks[0][0];
            const offsetBegin = target ? getOffset(target) : 0;
            const offsetEnd = next ? getOffset(next) : markdownBody.scrollHeight;
            const lineBegin = target ? Number(target.dataset.lineBegin) : 1;
            const lineEnd = next ? Number(next.dataset.lineBegin) : source.lcount + 1;
            const pixPerLine = (offsetEnd - offsetBegin) / (lineEnd - lineBegin);
            const scrollPix = (data.line - lineBegin) * pixPerLine;
            window.scroll({
                top: offsetBegin + scrollPix - window.innerHeight / 2 + pixPerLine / 2
            });
        };
    })();
});
