def('qiniu', [ 'qiniu.Asset', 'qiniu.Bucket', 'qiniu.Image', 'qiniu.utils', 'qiniu.deps.Events', 'qiniu.deps.shim', 'qiniu.deps.file', 'qiniu.deps.Ajax' ], function(require, exports) {

  var _configData = {
    uploadUrl : 'up.qiniu.com',
    rsUrl     : 'rs.qbox.me',
    rsfUrl    : 'rsf.qbox.me'
  };

  if ('undefined' !== typeof define && define.amd) {
    var Asset  = arguments[0](_configData);
    var Bucket = arguments[1](_configData);
    var _Image = arguments[2];
    var utils  = arguments[3];
    var events = arguments[4];
    var file   = arguments[6];
    var ajax   = arguments[7];
  } else {
    var Asset  = require('qiniu.Asset')(_configData);
    var Bucket = require('qiniu.Bucket')(_configData);
    var _Image = require('qiniu.Image');
    var utils  = require('qiniu.utils');
    var events = require('qiniu.deps.Events');
    var file   = require('qiniu.deps.file');
    var ajax   = require('qiniu.deps.Ajax');
  }

  var qiniu = exports;

  /**
   * Global Config
   * Example:
   * ```
   * qiniu.config({
   *   foo: '-----'
   * });
   *
   * qiniu.config('foo', 'bar');
   * qiniu.config('foo');
   * ``` 
   * @param  {String/Object} key   key of config
   * @param  {Mix}           value value
   */
  qiniu.config = function(key, value) {
    if (arguments.length > 1 && key instanceof String) {
      // set config data normally
      qiniu.set(key, value);
    } else {
      switch (true) {
        case utils.isString(key):
          // Get config data
          return qiniu.get(key);
          break;
        case utils.isObject(key):
          // Set config data with a object
          for (var ii in key) {
            (function(_key) {
              qiniu.set(_key, key[_key]);
            })(ii);
          }
          break;
      }
    }

    return this;
  };

  /**
   * Set config data
   * @param  {String} key   key
   * @param  {Mix}    value value
   * @return {Object}       qiniu object
   */
  qiniu.set = function(key, value) {
    _configData[key] = value;

    return this;
  };

  /**
   * Get config data
   * @param  {String} key   key
   * @return {Mix}          config value
   */
  qiniu.get = function(key) {
    return _configData[key];
  };

  /**
   * Binding the select button
   * @param  {HTMLElement} el      select button
   * @param  {Object} options options
   * @return {Object}         qiniu
   */
  qiniu.bind = function(el, options) {
    options = options || {};

    var css = ".qiniu-transparent { \
      z-index: 1000; \
      zoom: 1; \
      opacity: 0; \
      -moz-opacity: 0; \
      -khtml-opacity: 0; \
      filter: 'alpha(opacity=0)'; \
      *filter: alpha(opacity=0); \
    }";
    var head = document.getElementsByTagName('head')[0];
    var style = document.createElement('style');

    style.type = 'text/css';
    if (style.styleSheet) {
      style.styleSheet.cssText = css;
    } else {
      style.appendChild(document.createTextNode(css));
    }

    head.appendChild(style);

    var tmp = document.createElement('div');
    var html = '<div class="js-fileapi-wrapper qiniu-transparent"></div>';
    tmp.innerHTML = html;
    var wrapper = tmp.firstChild;

    if (el.jquery) {
      el
        .before(wrapper)
        .addClass('select-btn');
    } else {
      var parentNode = el.parentNode;
      parentNode.insertBefore(wrapper, el);
    }

    var input       = document.createElement('input');
    input.type      = 'file';
    input.className = 'qiniu-transparent';
    input.multiple  = true;

    wrapper.appendChild(input);

    el = el.jquery ? el.get(0) : el;

    utils.css(wrapper, {
      top      : el.style.top,
      right    : el.style.right,
      position : "absolute",
      width    : el.offsetWidth + 5,
      height   : el.offsetHeight + 5,
      margin   : el.style.margin
    });
    utils.css(input, {
      width    : el.offsetWidth + 5,
      height   : el.offsetHeight + 5,
      position : 'relative'
    });

    file.event.on(input, 'change', function(evt) {
      var files = file.getFiles(evt);
      var filter = options.filter || false;

      var filters = {
        'image': /image/,
        'audio': /audio/,
        'video': /video/,
        'media': /audio|video/
      };

      switch (true) {
        case utils.isString(filter):
          if (filters[filter]) {
            files = file.filter(files, function(_file) {
              return filters[filter].test(_file.type);
            });
          }
          break;
        case utils.isArray(filter):
          for (var i = 0; i < filter.length; i++) {
            (function(index) {
              files = file.filter(files, function(_file) {
                return filters[filter[index]].test(_file.type);
              });
            })(i);
          }
          break;
        case (filter instanceof RegExp):
          files = file.filter(files, function(_file) {
            return filter.test(_file.type);
          });
          break;
      }

      for (var i = 0; i < files.length; i++) {
        (function(index) {
          qiniu.emit('file', _Image.extend(files[index]));
        })(i);
      }
    });

    return this;
  };

  /**
   * Binding the drag and drop aera
   * @param  {HTMLElement} el      aera
   * @param  {Object} options options
   * @return {Object}         qiniu
   */
  qiniu.bind.dnd = function(el, options) {
    if (file.support.dnd) {
      file.event.dnd(
        (el.jquery ? el.get(0) : el),
        function(files) {
          var filter = options.filter || false;

          var filters = {
            'image': /image/,
            'audio': /audio/,
            'video': /video/,
            'media': /audio|video/
          };

          switch (true) {
            case utils.isString(filter):
              if (filters[filter]) {
                files = file.filter(files, function(_file) {
                  return filters[filter].test(_file.type);
                });
              }
              break;
            case utils.isArray(filter):
              for (var i = 0; i < filter.length; i++) {
                (function(index) {
                  files = file.filter(files, function(_file) {
                    return filters[filter[index]].test(_file.type);
                  });
                })(i);
              }
              break;
            case (filter instanceof RegExp):
              files = file.filter(files, function(_file) {
                return filter.test(_file.type);
              });
              break;
          }

          for (var i = 0; i < files.length; i++) {
            (function(index) {
              qiniu.emit('file', _Image.extend(files[index]));
            })(i);
          }
        }
      );

      file.event.on(
        (el.jquery ? el.get(0) : el),
        'dragover dragleave',
        function(evt) {
          switch (evt.type) {
            case 'dragover':
              (options.over && utils.isFunction(options.over) ? options.over : noop)
                .call(null);

              qiniu.emit('over');
              break;
            case 'dragleave':
              (options.out && utils.isFunction(options.out) ? options.out : noop)
                .call(null);

              qiniu.emit('out');
          }
        }
      );

      (options.success && utils.isFunction(options.success) ? options.success : noop).call(null);
      qiniu.emit('dnd.success');
    } else {
      qiniu.emit('dnd.error', 'no support');
      (options.error && utils.isFunction(options.error) ? options.error : noop).call(null, 'no support');
    }

    return qiniu;
  };

  qiniu.supportDnd = file.support.dnd;

  qiniu.bucket = function(bucket, config) {
    return new Bucket(bucket, config);
  };

  qiniu.Asset = Asset;
  qiniu.Bucket = Bucket;
  qiniu.Image = _Image;

  utils.objExtend(qiniu, events.EventEmitter.prototype);
  events.EventEmitter.call(qiniu);

  function noop() {
    return false;
  }

  return qiniu;
});