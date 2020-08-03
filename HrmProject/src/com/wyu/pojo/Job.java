package com.wyu.pojo;

public class Job {
    private Integer jid;

    private String jname;

    private String jremark;

    public Integer getJid() {
        return jid;
    }

    public void setJid(Integer jid) {
        this.jid = jid;
    }

    public String getJname() {
        return jname;
    }

    public void setJname(String jname) {
        this.jname = jname == null ? null : jname.trim();
    }

    public String getJremark() {
        return jremark;
    }

    @Override
	public String toString() {
		return "Job [jid=" + jid + ", jname=" + jname + ", jremark=" + jremark + "]";
	}

	public void setJremark(String jremark) {
        this.jremark = jremark == null ? null : jremark.trim();
    }
}