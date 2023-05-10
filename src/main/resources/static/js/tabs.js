import { _E, Element } from './utils.js'

export default class Tabs {
    constructor(root, tabRenderer, viewRenderer, data,  props = null) {

        this._props = {
            width: '100%',
            proportions: 40,
            ...props
        }
        this.tabRenderer = tabRenderer;
        this._viewRenderer = viewRenderer;
        this._dataList = data;
        this._root = _E(root)
        this._render()
    }

    _buttonList() {
        this._dataList.forEach((item, idx) => {
            const e = Element("div")
            e.innerHTML = this.tabRenderer(this._dataList[idx])
            e.dataset.tabId = idx+1;
            this.tabsButtonList.appendChild(e);
            e.addEventListener("click", () => this._updateTabView(idx))
        })
    }

    _updateTabView(tabIndex) {
        this.tabsView.innerHTML = this._viewRenderer(this._dataList[tabIndex])
    }

    _render() {
        this.tabsRoot = Element("div", "flex h-full")
        this.tabsButtonList = Element("div", `w-[${ this._props.proportions}%] flex flex-col`)
        this.tabsView = Element("div", "grow flex")
        this._buttonList()
        this._updateTabView(0)
        this.tabsRoot.appendChild(this.tabsButtonList);
        this.tabsRoot.appendChild(this.tabsView);
        this._root.appendChild(this.tabsRoot);
    }
}