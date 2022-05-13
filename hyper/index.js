exports.decorateConfig = (config) => {
  return Object.assign({}, config, {
    backgroundColor: '#f5f5f5',
    foregroundColor: '#333333',
    cursorColor: '#635c6d',
    selectionColor: '#c7e3ed',
    borderColor: '#f5f5f5',
    css: `
      ${config.css || ''}

      .header_appTitle, .tabs_title {
        color: #333333;
      }
      .header_shape {
        color: #333333;
      }
      *::-webkit-scrollbar-thumb {
        background: rgba(196, 183, 215, 0.4);
      }
    `,
    colors: {
      black: '#333333',
      lightBlack: '#333333',
      red: '#cc5555',
      lightRed: '#cc5555',
      green: '#65a34c',
      lightGreen: '#65a34c',
      yellow: '#bca46d',
      lightYellow: '#bca46d',
      blue: '#5f7acc',
      lightBlue: '#5f7acc',
      magenta: '#c4b7d7',
      lightMagenta: '#c4b7d7',
      cyan: '#91cce0',
      lightCyan: '#91cce0',
      white: '#f5f5f5',
      lightWhite: '#f5f5f5',
    },
  });
};
