// @ts-check
// Protractor configuration file, see link for more information
// https://github.com/angular/protractor/blob/master/lib/config.ts

const { config } = require('./protractor.conf');

/**
 * @type { import("protractor").Config }
 */
exports.config = Object.assign({}, config, {
  capabilities: {
    browserName: 'chrome',
    chromeOptions: {
      args: [ "--headless", "--no-sandbox" ]
    }
  }
});