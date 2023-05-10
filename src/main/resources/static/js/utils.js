/**
 * Select a single DOM element based on specified
 * selector.
 */
export const _E = (e) => document.querySelector(e);


/**
 * Creates a DOM Element with a class list and children
 * passed as html.
 */
export const Element = (tag, classList = null, innerHTML = null) => {
    const e = document.createElement(tag);
    if (classList) {
        e.classList.add(...classList.split(" "));
    }
    if (innerHTML) {
        e.innerHTML = innerHTML
    }
    return e;
}

/**
 * Formats a Timestamp to `x time ago` format.
 */
export const xTimeAgo = (date) => {
    const seconds = Math.floor((new Date().getTime() - date.getTime()) / 1000)
    let interval = Math.floor(seconds / 31536000)
    if (interval > 1) {
        return interval + ' years ago'
    }
    interval = Math.floor(seconds / 2592000)
    if (interval > 1) {
        return interval + ' months ago'
    }
    interval = Math.floor(seconds / 86400)
    if (interval > 1) {
        return interval + ' days ago'
    }
    interval = Math.floor(seconds / 3600)
    if (interval > 1) {
        return interval + ' hours ago'
    }
    interval = Math.floor(seconds / 60)
    if (interval > 1) {
        return interval + ' minutes ago'
    }
    return Math.floor(seconds) + ' seconds ago'
}

/**
 * Attaches an event listener to an element if it is
 * present in the dom.
 */
export const attachEventListener = (e, event, callBack) => {
    const element = _E(e);
    if (element) {
        element.addEventListener(event, callBack);
    }
}

