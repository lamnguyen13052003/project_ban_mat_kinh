package db;

public abstract class AbsThread extends Thread{

    @Override
    public void run() {
        while(true) {
            synchronized (this) {
                try {
                    sleep(10);
                } catch (Exception e) {
                }
            }
        }
    }

    public abstract void execute();
}