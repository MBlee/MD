module.exports = {
	rules:{
		"prettier/prettier":[
			"warn",
			{
				singleQuote: true,
				semi: false,
				printWidth: 80,
				trailingComma: 'none',
				endOfLine: 'auto'
			}
		],
		"vue/multi-word-component-names":[
			'warn',
			{
				ignores: ['index']
			}
		],
		"vue/no-setup-props-destructure": ['off'],
		'no-undef': 'error'
	}
}

// vscode-settings.json

"editor.codeActionsOnSave": {
	"source.fixAll": true
}
"editor.formatOnSave": false
