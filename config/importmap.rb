# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true

pin "jquery", to: "https://ga.jspm.io/npm:jquery@3.6.0/dist/jquery.js"
pin "datatables.net", to: "https://ga.jspm.io/npm:datatables.net@1.11.5/js/jquery.dataTables.js"
pin "datatables.net-bs5", to: "https://ga.jspm.io/npm:datatables.net-bs5@1.11.5/js/dataTables.bootstrap5.js"

pin_all_from "app/javascript/controllers", under: "controllers"
pin_all_from "app/javascript/src", under: "src"
pin_all_from "app/javascript/custom", under: "custom"
