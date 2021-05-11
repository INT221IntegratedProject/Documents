// vue.config.js
// Permits Cross-origin sharing.
module.exports = {
        devServer: {
            proxy: {
                '/marketApp': {
                    target: 'http://localhost:8086',
                    changeOrigin: true
                }

            }
        }
    }