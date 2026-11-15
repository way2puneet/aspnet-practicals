/* Programming in ASP.NET — Practical Programs. Shared page behaviour and demo helpers. */
(function () {
  "use strict";

  /* ---------- Code viewer: tabs, copy, download ---------- */
  document.querySelectorAll(".code").forEach(function (box) {
    var tabs = box.querySelectorAll(".code-tabs [role=tab]");
    var panels = box.querySelectorAll(".code-panel");
    tabs.forEach(function (t, i) {
      t.addEventListener("click", function () {
        tabs.forEach(function (x) { x.setAttribute("aria-selected", "false"); });
        panels.forEach(function (p) { p.classList.remove("active"); });
        t.setAttribute("aria-selected", "true");
        panels[i].classList.add("active");
      });
    });
    var copy = box.querySelector(".copy");
    if (copy) copy.addEventListener("click", function () {
      var p = box.querySelector(".code-panel.active pre");
      var text = Array.prototype.map.call(p.querySelectorAll(".ln"), function (l) { return l.textContent; }).join("\n");
      var done = function () { copy.textContent = "Copied"; setTimeout(function () { copy.textContent = "Copy"; }, 1400); };
      if (navigator.clipboard && window.isSecureContext) navigator.clipboard.writeText(text).then(done, fallback);
      else fallback();
      function fallback() {
        var ta = document.createElement("textarea"); ta.value = text; document.body.appendChild(ta);
        ta.select(); try { document.execCommand("copy"); done(); } catch (e) {} document.body.removeChild(ta);
      }
    });
    var dl = box.querySelector(".dl");
    if (dl) dl.addEventListener("click", function () {
      var p = box.querySelector(".code-panel.active");
      var a = document.createElement("a"); a.href = p.getAttribute("data-src"); a.download = p.getAttribute("data-name");
      document.body.appendChild(a); a.click(); document.body.removeChild(a);
    });
  });

  /* ---------- Demo helpers (window.Demo) ---------- */
  var Demo = {};

  Demo.esc = function (s) {
    return String(s).replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/>/g, "&gt;").replace(/"/g, "&quot;");
  };

  /* Show the server round trip: dim the page briefly, then run fn and print the events. */
  Demo.postback = function (root, events, fn) {
    var page = root.querySelector(".page");
    page.classList.add("posting");
    setTimeout(function () {
      page.classList.remove("posting");
      var ev = fn ? fn() : null;
      Demo.log(root, ev || events);
    }, 260);
  };
  Demo.log = function (root, events) {
    var el = root.querySelector(".serverlog .evs");
    if (!el) return;
    el.innerHTML = events.map(function (e) { return '<span class="ev">' + Demo.esc(e) + "</span>"; }).join('<span class="arrow">→</span>');
  };

  /* Shortcuts */
  Demo.$ = function (root, id) { return root.querySelector('[data-id="' + id + '"]'); };
  Demo.val = function (root, id) { return Demo.$(root, id).value; };

  /* Format a date like .NET "dd MMMM yyyy" etc. */
  var MONTHS = ["January","February","March","April","May","June","July","August","September","October","November","December"];
  var DAYS = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
  Demo.fmt = function (d, pattern) {
    var dd = ("0" + d.getDate()).slice(-2);
    return pattern
      .replace("dddd", "\u0001").replace("MMMM", "\u0002").replace("MMM", "\u0003")
      .replace("dd", dd).replace("yyyy", d.getFullYear())
      .replace("\u0001", DAYS[d.getDay()]).replace("\u0002", MONTHS[d.getMonth()]).replace("\u0003", MONTHS[d.getMonth()].slice(0, 3));
  };
  Demo.dayName = function (d) { return DAYS[d.getDay()]; };

  /* A small ASP.NET-style Calendar (Monday first). opts: {month: Date, selected: Date|null, selectable(d), onSelect(d), onMonth(d)} */
  Demo.calendar = function (host, opts) {
    var state = { month: new Date(opts.month.getFullYear(), opts.month.getMonth(), 1), selected: opts.selected || null };
    function same(a, b) { return a && b && a.getFullYear() === b.getFullYear() && a.getMonth() === b.getMonth() && a.getDate() === b.getDate(); }
    function draw() {
      var m = state.month, y = m.getFullYear(), mo = m.getMonth();
      var first = new Date(y, mo, 1);
      var offset = (first.getDay() + 6) % 7; // Monday first
      var start = new Date(y, mo, 1 - offset);
      var prev = MONTHS[(mo + 11) % 12].slice(0, 3), next = MONTHS[(mo + 1) % 12].slice(0, 3);
      var h = '<table class="cal"><tr class="title"><td><a data-nav="-1" title="Go to the previous month">&lt;</a></td><td colspan="5">' + MONTHS[mo] + " " + y +
        '</td><td><a data-nav="1" title="Go to the next month">&gt;</a></td></tr><tr>';
      ["Mon","Tue","Wed","Thu","Fri","Sat","Sun"].forEach(function (d) { h += "<th>" + d + "</th>"; });
      h += "</tr>";
      for (var w = 0; w < 6; w++) {
        h += "<tr>";
        for (var k = 0; k < 7; k++) {
          var d = new Date(start.getFullYear(), start.getMonth(), start.getDate() + w * 7 + k);
          var cls = [];
          if (d.getMonth() !== mo) cls.push("other");
          if (same(d, state.selected)) cls.push("sel");
          var ok = opts.selectable ? opts.selectable(d) : true;
          if (!ok) { cls.push("off"); h += '<td class="' + cls.join(" ") + '">' + d.getDate() + "</td>"; }
          else h += '<td class="' + cls.join(" ") + '"><a data-day="' + d.getTime() + '">' + d.getDate() + "</a></td>";
        }
        h += "</tr>";
      }
      host.innerHTML = h + "</table>";
    }
    host.addEventListener("click", function (e) {
      var a = e.target.closest("a"); if (!a) return;
      if (a.hasAttribute("data-nav")) {
        state.month = new Date(state.month.getFullYear(), state.month.getMonth() + Number(a.getAttribute("data-nav")), 1);
        if (opts.onMonth) opts.onMonth(state.month); draw();
      } else {
        var d = new Date(Number(a.getAttribute("data-day")));
        state.selected = d; draw(); if (opts.onSelect) opts.onSelect(d);
      }
    });
    draw();
    return {
      get selected() { return state.selected; },
      clear: function () { state.selected = null; draw(); },
      show: function (d) { state.month = new Date(d.getFullYear(), d.getMonth(), 1); draw(); }
    };
  };

  /* Sample CollegeDB data, the same as the book's SQL script. Each demo gets a fresh copy. */
  Demo.freshDB = function () {
    return {
      nextId: 7,
      courses: [
        { CourseCode: "BCA", CourseName: "Bachelor of Computer Applications", DurationYears: 3, AnnualFee: 45000 },
        { CourseCode: "BSc IT", CourseName: "B.Sc. Information Technology", DurationYears: 3, AnnualFee: 40000 },
        { CourseCode: "MCA", CourseName: "Master of Computer Applications", DurationYears: 2, AnnualFee: 60000 }
      ],
      students: [
        { StudentID: 1, RollNo: "BCA101", StudentName: "Aman Verma", Course: "BCA", Semester: 3, City: "Ludhiana", Marks: 82 },
        { StudentID: 2, RollNo: "BCA102", StudentName: "Simran Kaur", Course: "BCA", Semester: 3, City: "Amritsar", Marks: 91 },
        { StudentID: 3, RollNo: "BCA103", StudentName: "Rohit Sharma", Course: "BCA", Semester: 5, City: "Jalandhar", Marks: 76 },
        { StudentID: 4, RollNo: "MCA201", StudentName: "Neha Gupta", Course: "MCA", Semester: 1, City: "Ludhiana", Marks: 88 },
        { StudentID: 5, RollNo: "BSC301", StudentName: "Arjun Mehta", Course: "BSc IT", Semester: 3, City: "Patiala", Marks: 69 },
        { StudentID: 6, RollNo: "MCA202", StudentName: "Priya Singh", Course: "MCA", Semester: 1, City: "Chandigarh", Marks: 94 }
      ]
    };
  };
  Demo.sortBy = function (rows, key, dir) {
    var r = rows.slice().sort(function (a, b) {
      var x = a[key], y = b[key];
      if (typeof x === "string") { x = x.toLowerCase(); y = y.toLowerCase(); }
      return x < y ? -1 : x > y ? 1 : 0;
    });
    return dir === "DESC" ? r.reverse() : r;
  };
  /* Render rows as an ASP.NET GridView-like table. cols: [[field, header]] */
  Demo.grid = function (rows, cols, opts) {
    opts = opts || {};
    if (!rows.length) return opts.empty ? "<div>" + Demo.esc(opts.empty) + "</div>" : "";
    var h = '<table class="grid' + (opts.navy ? " navy" : "") + '"><tr>';
    cols.forEach(function (c) { h += "<th>" + c[1] + "</th>"; });
    h += "</tr>";
    rows.forEach(function (r, i) {
      h += "<tr" + (opts.alt && i % 2 ? ' class="alt"' : "") + ">";
      cols.forEach(function (c) { h += "<td>" + Demo.esc(r[c[0]]) + "</td>"; });
      h += "</tr>";
    });
    return h + "</table>";
  };

  window.Demo = Demo;
})();
