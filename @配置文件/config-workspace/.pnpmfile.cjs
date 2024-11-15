function readPackage(pkg, context) {
    // Override the manifest of foo@1.x after downloading it from the registry
    if (pkg.name === 'foo' && pkg.version.startsWith('1.')) {
        // Replace bar@x.x.x with bar@2.0.0
        pkg.dependencies = {
            ...pkg.dependencies,
            bar: '^2.0.0'
        }
        context.log('bar@1 => bar@2 in dependencies of foo')
    }

    // This will change any packages using baz@x.x.x to use baz@1.2.3
    if (pkg.dependencies.baz) {
        pkg.dependencies.baz = '1.2.3';
    }

    return pkg
}

function afterAllResolved(lockfile, context) {
    // ...
    return lockfile
}

module.exports = {
    hooks: {
        readPackage,
        afterAllResolved
    }
}