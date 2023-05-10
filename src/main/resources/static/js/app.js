import Drawer from "./drawer.js";
import { _E, xTimeAgo, attachEventListener } from "./utils.js";
import Tabs from "./tabs.js";

/**
 * Sets all the drawers.
 */
const setDrawers = () => {
    const templates = {
        adminCompaniesPage: (name, profile) => {
            const overview = profile.description.replace(/\n/g, "<br>");
            const categories = {
                SOFTWARE_AND_IT: "Software And IT",
                DESIGN: "Design",
                SALES_AND_MARKETING: "Sales And Marketing",
                FINANCE_AND_ACCOUNTING: "Finance And Accounting",
                LEGAL: "Legal",
                HR: "Human Resource",
                MANUFACTURING: "Manufacturing",
                AUTOMOTIVE: "Automotive",
                AVIATION: "Aviation",
                FASHION: "Fashion",
                BANKING: "Banking",
                LOGISTICS: "Logistics",
                EDUCATION: "Education",
                RESEARCH: "Research",
                SPORTS: "Sports"
            }
            const sizes = {
                ONE_TO_TEN : "1 -10",
                TEN_TO_FIFTY : "10 - 100",
                HUNDRED_TO_FIVE_HUNDRED : "100 - 500",
                FIVE_HUNDRED_TO_THOUSAND : "500 - 1000",
                THOUSAND_TO_TEN_THOUSAND: "1000 - 10000",
                GREATER_THAN_TEN_THOUSAND : "10001+"
            }
            return `
                <div class="flex flex-col h-full overflow-y-auto pb-8">
                    <div class="mb-3"><img class="h-14 w-14" src="${profile.logo}"></div>
                    <p class="mb-3 leading-4">${profile.headLine}</p>
                    <div class="text-[--muted]">${categories[profile.category]} <span class="bullet">${profile.headquarters}</span></div>
                    <div class="my-3">
                        <a href="/#/company/${name.toLocaleLowerCase().split(" ").join("-")}" target="_blank" class="btn h-8 text-xs">
                            View Jobs<i class="fa-solid fa-arrow-up-right-from-square ml-1"></i>
                        </a>
                    </div>
                    <h1 class="my-2 text-base font-semibold">Overview</h1>
                    <p class="text-justify leading-5">${overview}</p>
                    <h1 class="mt-2 mb-1 text-base font-semibold">Website</h1>
                    <a class="text-[--blue] font-medium cursor" href="${profile.website}">${profile.website}</a>
                    <h1 class="mt-2 mb-1 text-base font-semibold">Headquarters</h1>
                    <p>${profile.headquarters}</p>
                    <h1 class="mt-2 mb-1 text-base font-semibold">Company Size</h1>
                    <p>${sizes[profile.companySize]} Employees</p>
                    <h1 class="mt-2 mb-1 text-base font-semibold">Founded</h1>
                    <p>${profile.founded}</p>
                </div>
            `
        },
        unlistedCompanies: (profiles) => {

            let unlistedRows = ""
            profiles.forEach((profile) => {
                unlistedRows += `
                     <tr class="data-row">
                        <td class="text-[--blue] hover:underline">${profile.name}</td>
                        <td>${profile.email}</td>
                        <td>${xTimeAgo(new Date(profile.createdAt))}</td>
                    </tr>
                `
            })

            return `
                <div class="flex flex-col h-full overflow-y-auto pb-8">
                    <div class="mb-3">
                        <span class="font-medium text-red-500">${UNLISTED_COMPANIES.length}</span> Companies have not completed their profile yet. Not completing their profile        
                        will restrict them from posting any jobs or any visibility on Jobspot.
                    </div>
                     <div>
                        <table>
                            <thead class="sticky bg-white top-0">
                                <tr><th>Name</th><th>Email</th><th>Joined</th></tr>
                            </thead>
                            <tbody>${unlistedRows}</tbody>
                        </table>
                    </div>
                </div>
            `
        }
    }

    // Admin/Companies Pages
    const companyInfoTriggers = document.querySelectorAll('[data-drawer-id]');
    if (companyInfoTriggers.length > 0) {
        const profileMap = {}
        PROFILE_COMPLETED_COMPANIES.forEach((company) => {
            profileMap[company.id] = company
        })
        companyInfoTriggers.forEach(e => {
            const profile = profileMap[e.dataset.drawerId];
            new Drawer(e, profile.name, templates.adminCompaniesPage(profile.name, profile.companyProfile));
        });
    }

    // Admin/Companies Unlisted
    const unlistedCompaniesTrigger = _E("#jsUnlistedCompanies");
    if (unlistedCompaniesTrigger) {
        new Drawer(unlistedCompaniesTrigger, "Unlisted Companies", templates.unlistedCompanies(UNLISTED_COMPANIES), {width: '650px'});
    }

    // Companies/Applications
    const viewApplicationsTrigger = _E("#jsViewApplications")
    if (viewApplicationsTrigger) {
        new Drawer(viewApplicationsTrigger, "Applications", '<p>Hello</p>', {width: '650px'});
    }
}


/**
 * Toggle visibility of password field
 */
const togglePasswordVisibility = () => {
    const input = _E("#jsPassControlInput");
    const icon = _E("#jsPassControlIcon")

    if (input.type === "password") {
        icon.classList.remove("fa-eye");
        icon.classList.add("fa-eye-slash");
        input.removeAttribute("type");
    }
    else {
        icon.classList.remove("fa-eye-slash");
        icon.classList.add("fa-eye");
        input.setAttribute("type", "password");
    }
}

/**
 * Format time on all elements where xTimeAgo data attribute
 * is present.
 */
const formatTimeAsXTimeAgo = () => {
    const xTimeElements = document.querySelectorAll('[data-js="xTime"]');
    xTimeElements.forEach(e => {
        const time = new Date(e.textContent);
        e.innerHTML = xTimeAgo(time);
    });
}

/**
 * Search filter for tables.
 */
const tableSearchFilter = () => {
    const filterInputs = document.querySelectorAll('[data-js-filter]');
    if (filterInputs) {
        filterInputs.forEach((input) => {
            const filterTable = _E(`[data-js-filter-table="${input.dataset.jsFilter}"]`);
            if (filterTable) {
                input.addEventListener("input", (e) => {
                    const value = e.target.value.toLowerCase();
                    Array.from(filterTable.tBodies).forEach(tbody => {
                        Array.from(tbody.rows).forEach(row => {
                            const text = row.textContent.toLowerCase();
                            row.style.display = text.includes(value) ? 'table-row' : 'none';
                        });
                    });
                })
            }
        })
    }
}

/**
 * Sets all the event listeners
 */
const setEventListeners = () => {
    const eventMap = [
        ["#jsPassControl", "click", togglePasswordVisibility]
    ]

    eventMap.forEach((e) => {
        const [element, event, cb] = e;
        attachEventListener(element, event, cb);
    })
}

const renderTabsView = () => {
    new Tabs("#jsTabsRoot", () => `Tab`, () => `view`, [1,2,3,4,5,6,7,8])
}

(async () => {
    setDrawers();
    formatTimeAsXTimeAgo();
    tableSearchFilter();
    setEventListeners();
    // renderTabsView();
})();