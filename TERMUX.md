# Termux Support for althttpd

This version of althttpd includes flexible support for different environments, including Termux on Android.

## Building for Different Environments

### Standard Build (uses /tmp by default)
```bash
make althttpd
```

### Termux Build (uses Termux temp directory by default)
```bash
make althttpd-termux
```

### Custom Build
```bash
cc -DDEFAULT_TMP_DIR='"/your/custom/tmp/path"' -o althttpd althttpd.c
```

## Runtime Configuration

You can override the temporary directory at runtime using environment variables:

### Method 1: ALTHTTPD_TMPDIR (highest priority)
```bash
export ALTHTTPD_TMPDIR="/data/data/com.termux/files/usr/tmp"
./althttpd --port 8080 --root /path/to/web/root
```

### Method 2: TMPDIR (standard POSIX variable)
```bash
export TMPDIR="/custom/tmp/directory"  
./althttpd --port 8080 --root /path/to/web/root
```

## Priority Order

The temporary directory is determined in this order:
1. `ALTHTTPD_TMPDIR` environment variable (if set and non-empty)
2. `TMPDIR` environment variable (if set and non-empty)
3. Compile-time `DEFAULT_TMP_DIR` (set via -D flag or defaults to "/tmp")

## Termux Usage Examples

### Option 1: Use environment variable (recommended)
```bash
export ALTHTTPD_TMPDIR="/data/data/com.termux/files/usr/tmp"
make althttpd
./althttpd --port 8080 --root ./www
```

### Option 2: Build with Termux defaults
```bash
make althttpd-termux
./althttpd --port 8080 --root ./www
```

## Benefits

- **Backward Compatibility**: Original functionality is preserved
- **Easy Synchronization**: No need to modify the source code for updates
- **Flexible Configuration**: Works with different environments out of the box
- **Runtime Override**: Can be changed without recompilation

## Migration from Hardcoded Version

If you previously modified the source code directly, you can now:

1. Revert to the original source code
2. Use one of the configuration methods above
3. Enjoy easier updates from the upstream repository