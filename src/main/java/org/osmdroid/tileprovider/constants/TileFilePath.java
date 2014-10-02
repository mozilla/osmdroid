package org.osmdroid.tileprovider.constants;
import java.io.File;
import android.os.Environment;

public class TileFilePath {

  private static File directoryOverride;

  public static synchronized void setDirectoryOverride(File f) {
      directoryOverride = f;
  }

  public static synchronized File getStorageDirectory() {
      if (directoryOverride != null) {
          return directoryOverride;
      }
      return new File(Environment.getExternalStorageDirectory(), "osmdroid");
  }
}
