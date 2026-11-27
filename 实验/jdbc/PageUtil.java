package shop.util;

import java.util.ArrayList;
import java.util.List;

public class PageUtil {
    public static String page(String url,int pageNo,int totalPage, int num){
        Pagination pagination = new Pagination(pageNo, totalPage, num);
        List<String> pages = pagination.getPages();
        if(url.contains("?"))
            url += "&";
        if(!url.endsWith("&"))
            url += "?";

        StringBuffer pageStr = new StringBuffer();
        pageStr.append("<style>.page ul{list-style: none;}.page ul li{float: left;margin-right:5px;background-color: #ffffff;border: 1px solid #dddddd;border-radius: 6px;}.page .dot{padding:3px 8px;border: none;}.page ul li.current{border: 1px solid #ff5f00;background-color: #ff5f00;}.page ul li.current a{color: #ffffff;}.page ul li a{display: block;text-decoration: none;font-size:14px;padding: 6px 10px;color: #111111;}.page ul li a:hover{background-color: #ff5f00;color: #fff;border-radius: 6px;}.page select{outline: none;width:80px;height:30px;border:1px solid #dddddd;border-radius:6px;font-size: 14px;margin-right:5px;text-align: center;}.page input[type=\"text\"]{outline: none;width: 30px;height: 30px;font-size:14px;line-height: 30px;border-radius: 6px;text-align: center;margin-right:5px;border: 1px solid #dddddd;}.page input[type=\"text\"]:focus{border-color: #ff5f00;background-color: #FFFFFF;box-shadow: 0 0 0 2px rgba(255,95,0,0.2);}.page input[type=\"button\"]:hover{background-color:#f7f8fa;} .page input[type=\"button\"]{outline: none;width: 45px;height: 30px;line-height: 26px;border-radius: 6px;text-align: center;border: 1px solid #dddddd;background-color: #ffffff;cursor: pointer;font-color: 14px;}</style>");
        pageStr.append("<div class=\"page\">");
        pageStr.append("<ul>");
        if(pageNo == 1){
            pageStr.append("<li><a>&lt; 上一页</a></li>");
        }else{
            pageStr.append("<li><a href='" + url + "pageNo=" + (pageNo -1) + "'>&lt; 上一页</a></li>");
        }
        for(int i=0;i<pages.size();i++){
            if("...".equals(pages.get(i))){
                pageStr.append("<li class=\"dot\">...</li>");
            }else{
                if((pageNo+"").equals(pages.get(i)))
                    pageStr.append("<li class=\"current\"><a>"+ pages.get(i) +"</a></li>");
                else
                    pageStr.append("<li><a href='" + url + "pageNo=" + pages.get(i) + "'>"+ pages.get(i) +"</a></li>");
            }
        }

        if(pageNo == totalPage){
            pageStr.append("<li><a>下一页 &gt;</a></li>");
        }else{
            pageStr.append("<li><a href='" + url + "pageNo=" + (pageNo + 1) + "'>下一页 &gt;</a></li>");
        }


        pageStr.append("</ul>");

        pageStr.append("<script>");
        pageStr.append("function goPage(page){ ");
        pageStr.append("window.location='" + url + "pageNo=' + page;");
        pageStr.append("}");
        pageStr.append("function goPage1(){ ");
        pageStr.append("var page = document.getElementById('page').value;");
        pageStr.append("window.location='" + url + "pageNo=' + page;");
        pageStr.append("}");
        pageStr.append("</script>");


        pageStr.append("<select onchange='goPage(this.value)'>");
        for(int i=1;i<=totalPage;i++){
            if(i==pageNo)
                pageStr.append("<option selected value='" + i + "'>第" + i + "页</option>");
            else
                pageStr.append("<option value='" + i + "'>第" + i + "页</option>");

        }

        pageStr.append("</select>");

        pageStr.append("<input type='text' id='page'/>");
        pageStr.append("<input type='button' value='确定' onclick='goPage1();'/>");



        pageStr.append("<script>");
        pageStr.append("document.getElementById('page').value='" + pageNo +"';");
        pageStr.append("</script>");

        pageStr.append("</div>");

        return pageStr.toString();
    }
}

class Pagination {
    private int pageNo;
    private int pageCount;
    private int floatCount;
    public int getPageNo() {
        return pageNo;
    }
    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }
    public int getPageCount() {
        return pageCount;
    }
    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public int getFloatCount() {
        return floatCount;
    }
    public void setFloatCount(int floatCount) {
        this.floatCount = floatCount;
    }
    public Pagination() {
        super();
    }
    public Pagination(int pageNo, int pageCount, int floatCount) {
        super();
        this.pageNo = pageNo;
        this.pageCount = pageCount;
        this.floatCount = floatCount;
    }

    public List<String> getPages(){
        List<String> pages = new ArrayList<String>();
        if(pageCount<=floatCount){
            for(int i=1;i<=pageCount;i++){
                pages.add(i + "");
            }
        }else if(pageNo<=floatCount/2){
            for(int i=1;i<=floatCount;i++){
                pages.add(i + "");
            }
            pages.add("...");
            pages.add(pageCount + "");
        }else if(pageNo>floatCount/2&&pageNo<pageCount-floatCount/2){
            pages.add("1");
            pages.add("...");
            for(int i=pageNo - floatCount/2 + 1;i<=pageNo + floatCount/2;i++){
                pages.add(i + "");
            }
            if(pageNo + floatCount/2 + 1!= pageCount)
                pages.add("...");
            pages.add(pageCount + "");
        }else{
            pages.add("1");
            pages.add("...");
            for(int i=pageCount-floatCount;i<=pageCount;i++){
                pages.add(i + "");
            }
        }

        return pages;
    }

}