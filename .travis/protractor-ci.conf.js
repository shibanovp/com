const config = require('../protractor.conf').config;

config.capabilities = {
  browserName: 'chrome',
  specs: [
    '../e2e/**/*.e2e-spec.ts'
  ],
  chromeOptions: {
    args: ['--no-sandbox', '--headless']
  }
};

exports.config = config;