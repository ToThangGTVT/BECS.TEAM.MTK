package fa.tranning.becs.utility;

import java.io.Serializable;

public class ReportContent implements Serializable {
    private String title;
    private String content;

    public ReportContent() {

    }

    public ReportContent(String title, String content) {
        this.title = title;
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Override
    public String toString() {
        return "ReportContent{" +
                "title='" + title + '\'' +
                ", content='" + content + '\'' +
                '}';
    }
}
