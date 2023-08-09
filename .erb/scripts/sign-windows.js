const path = require('path');
const fs = require('fs');
const childProcess = require('child_process');

const TEMP_DIR = path.join(__dirname, '../../release/build', 'temp');
if (!fs.existsSync(TEMP_DIR)) fs.mkdirSync(TEMP_DIR, { recursive: true });

if (!fs.statSync(TEMP_DIR).isDirectory()) {
  fs.mkdirSync(TEMP_DIR);
}

function sign(configuration) {
  // credentials from ssl.com
  const USER_NAME = process.env.WINDOWS_SIGN_USER_NAME;
  const USER_PASSWORD = process.env.WINDOWS_SIGN_USER_PASSWORD;
  const CREDENTIAL_ID = process.env.WINDOWS_SIGN_CREDENTIAL_ID;
  const USER_TOTP = process.env.WINDOWS_SIGN_USER_TOTP;
  if (USER_NAME && USER_PASSWORD && USER_TOTP && CREDENTIAL_ID) {
    console.log(`Signing ${configuration.path}`);
    const { name, dir } = path.parse(configuration.path);
    // CodeSignTool can't sign in place without verifying the overwrite with a
    // y/m interaction so we are creating a new file in a temp directory and
    // then replacing the original file with the signed file.
    childProcess.execSync(`echo java --version`);
    const cstPath = path.join(__dirname, 'CodeSignTool-v1.2.7');
    const tempFile = path.join(TEMP_DIR, `${name}.exe`);
    const setDir = `cd ${cstPath} && ./CodeSignTool.sh`;
    const signFile = `./CodeSignTool.sh sign -input_file_path="${configuration.path}" -output_dir_path="${TEMP_DIR}" -credential_id="${CREDENTIAL_ID}" -username="${USER_NAME}" -password="${USER_PASSWORD}" -totp_secret="${USER_TOTP}"`;
    const moveFile = `mv "${tempFile}" "${dir}"`;
    childProcess.execSync(`${setDir} && ${signFile} && ${moveFile}`, {
      stdio: 'inherit',
    });
  } else {
    console.warn(`sign.js - Can't sign file ${
      configuration.path
    }, missing value for:
${USER_NAME ? '' : 'WINDOWS_SIGN_USER_NAME'}
${USER_PASSWORD ? '' : 'WINDOWS_SIGN_USER_PASSWORD'}
${CREDENTIAL_ID ? '' : 'WINDOWS_SIGN_CREDENTIAL_ID'}
${USER_TOTP ? '' : 'WINDOWS_SIGN_USER_TOTP'}
`);
    process.exit(1);
  }
}

exports.default = sign;
