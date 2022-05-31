exports.decorateConfig = (config) => {
  return Object.assign({}, config, {
    backgroundColor: '#f8f8f8',
    foregroundColor: '#222222',
    cursorColor: '#635c6d',
    selectionColor: '#c7e3ed',
    borderColor: '#f8f8f8',
    css: `
      ${config.css || ''}

      .header_appTitle, .tabs_title {
        color: #222222;
      }
      .header_shape {
        color: #222222;
      }
      *::-webkit-scrollbar-thumb {
        background: rgba(196, 183, 215, 0.4);
      }
    `,
    colors: {
      black: '#222222',
      lightBlack: '#222222',
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
      white: '#f8f8f8',
      lightWhite: '#f8f8f8',
    },
  });
};
