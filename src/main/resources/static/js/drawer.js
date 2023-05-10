import { Element } from "./utils.js";

export default class Drawer {

    _styleList = {
        DRAWER_ROOT: {
            transition: 'all 200ms ease',
            transform: 'translateX(0)',
            transformReverse: 'translateX(100%)'
        }
    }

    constructor(trigger, header, content, props = null) {
        this._trigger = trigger;
        this._title = header;
        this._content = content;
        this._portal = document.getElementById("portal");

        this._state = {
            isOpen: false,
        }

        this._props = {
            width: '500px',
            ...props
        }

        this._onClick = this._onClick.bind(this);
        this._handleClose = this._handleClose.bind(this);
        this._handleOutsideClick = this._handleOutsideClick.bind(this);
        this._render = this._render.bind(this);

        this._trigger.addEventListener("click", this._onClick);
    }

    _onClick() {
        if (!this._state.isOpen) {
            this._render();
            this._state.isOpen = true;
        } else {
            this._destroy();
            this._state.isOpen = false;
        }
    }

    _handleOutsideClick(e) {
        if (!this.drawer.contains(e.target) && this._state.isOpen) {
            this._onClick();
        }
    }

    _handleClose(e) {
        const target = e.target.closest(".drawer-close-btn");
        if (target) {
            this._onClick();
        }
    }

    _header() {
        const header = Element("div", "drawer-header", `
            <h1>${this._title}</h1>
        `)
        this.closeBtn = Element("button", "drawer-close-btn", `
            <i class="fa-solid fa-xmark"></i>
        `)
        header.appendChild(this.closeBtn)
        return header;
    }

    _render() {
        document.documentElement.style.overflow = 'hidden'
        this.overlay = Element("div", "drawer-overlay");
        this._portal.appendChild(this.overlay);

        this.drawerRoot = Element("div", "drawer-root");
        this._portal.appendChild(this.drawerRoot);

        this.drawer = Element("div", "drawer-content", null);
        this.drawer.style.width = this._props.width;
        this.drawer.appendChild(this._header())
        this.drawer.innerHTML += this._content;

        this.drawerRoot.style.transition = this._styleList.DRAWER_ROOT.transition;
        this.drawerRoot.appendChild(this.drawer);

        setTimeout(() => {
            this.drawerRoot.style.transform = this._styleList.DRAWER_ROOT.transform;
            document.addEventListener("click", this._handleClose)
            document.addEventListener("click", this._handleOutsideClick)
        }, 0);
    }

    _destroy() {
        this._portal.removeChild(this.overlay);
        this.drawerRoot.style.transform = this._styleList.DRAWER_ROOT.transformReverse;
        setTimeout(() => {
            this._portal.removeChild(this.drawerRoot);
            document.removeEventListener("click", this._handleClose);
            document.removeEventListener("click", this._handleOutsideClick);
        }, 400);
        document.documentElement.style.overflow = ''
    }
}
