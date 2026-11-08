// Recibe las confirmaciones de la invitación y las anota en la hoja "Respuestas".
// Pega este código en Extensiones > Apps Script de tu Google Sheets.

const HOJA = 'Respuestas';

function doPost(e) {
  const lock = LockService.getScriptLock();
  lock.waitLock(10000);
  try {
    const ss = SpreadsheetApp.getActiveSpreadsheet();
    const sh = ss.getSheetByName(HOJA) || ss.insertSheet(HOJA);
    if (sh.getLastRow() === 0) {
      sh.appendRow(['Fecha', 'Invitados', 'Cantidad', 'Asistencia', 'Correo', 'Teléfono', 'Mensaje', 'Enlace (para)']);
      sh.getRange(1, 1, 1, 8).setFontWeight('bold');
      sh.setFrozenRows(1);
    }
    const p = e.parameter || {};
    const invitados = limpio(p.invitados);
    const cantidad = invitados ? invitados.split(',').filter(s => s.trim()).length : 0;
    sh.appendRow([
      new Date(),
      invitados,
      cantidad,
      limpio(p.asistencia),
      limpio(p.email),
      "'" + String(p.telefono || '').slice(0, 40),
      limpio(p.mensaje),
      limpio(p.para)
    ]);
    return ContentService.createTextOutput('ok');
  } finally {
    lock.releaseLock();
  }
}

// Evita que un texto que empiece con = + - @ se interprete como fórmula.
function limpio(v) {
  const s = String(v || '').slice(0, 2000);
  return /^[=+\-@]/.test(s) ? "'" + s : s;
}
