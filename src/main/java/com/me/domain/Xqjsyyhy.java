package com.me.domain;

public class Xqjsyyhy {
    private int gc_id;
    private String id;
    private String pid;
    private String name;

    public int getGc_id() {
        return gc_id;
    }

    public void setGc_id(int gc_id) {
        this.gc_id = gc_id;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Xqjsyyhy(int gc_id, String id, String pid, String name) {
        this.gc_id = gc_id;
        this.id = id;
        this.pid = pid;
        this.name = name;
    }

    public Xqjsyyhy() {
    }
}
