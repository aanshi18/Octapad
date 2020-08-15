/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Octapad;

/**
 *
 * @author User
 */
import java.io.File;
import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import javax.sound.sampled.DataLine;
import javax.sound.sampled.SourceDataLine;

public class GenerateSound {
    String filename;
    static final int EXTERNAL_BUFFER_SIZE = 524288;

    public GenerateSound(String filename) {
        this.filename = filename;
    }
    
    public void readFile() {
        File soundFile = new File(filename);

        if (!soundFile.exists()) {
            System.err.println("Wave file not found: " + filename);
            return;
        }

        AudioInputStream audioInputStream = null;
        try {
            audioInputStream = AudioSystem.getAudioInputStream(soundFile);
        } catch(Exception e) {
            e.printStackTrace();
            return;
        }

        AudioFormat format = audioInputStream.getFormat();

        SourceDataLine auline = null;

        DataLine.Info info = new DataLine.Info(SourceDataLine.class, format);

        try {
            auline = (SourceDataLine) AudioSystem.getLine(info);
            auline.open(format);
        } catch(Exception e) {
            e.printStackTrace();
            return;
        }

        auline.start();

        int nBytesRead = 0;
        byte[] abData = new byte[EXTERNAL_BUFFER_SIZE];

        try {
            while (nBytesRead != -1) {
                nBytesRead = audioInputStream.read(abData, 0, abData.length);
                if (nBytesRead >= 0) {
                    auline.write(abData, 0, nBytesRead);
                }
            }
        } catch(Exception e) {
            e.printStackTrace();
            return;
        }
        finally {
            auline.drain();
            auline.close();
        }
    }
}
