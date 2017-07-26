class TriangleContainer {
  ArrayList<TriangleEntry> entries;
  
  public TriangleContainer() {
    entries = new ArrayList<TriangleEntry>();
  }
  
  public void addTriangle(SphereNode node1, SphereNode node2, SphereNode node3) {
    entries.add(new TriangleEntry(node1.getId(), node2.getId(), node3.getId()));
  }
  
  public void clear() {
    entries.clear();
  }
  
  public boolean triangleExists(SphereNode node1, SphereNode node2, SphereNode node3) {
    return entries.contains(new TriangleEntry(node1.getId(), node2.getId(), node3.getId()));
  }
}

class TriangleEntry {
  int id1, id2, id3;
  
  TriangleEntry(int id1, int id2, int id3) {
    this.id1 = id1;
    this.id2 = id2;
    this.id3 = id3;
  }
  
  @Override
  public boolean equals(Object obj) {
    if(!(obj instanceof TriangleEntry)) {
      return false;
    }
    
    TriangleEntry other = (TriangleEntry) obj;
    
    if(id1 != other.id1 || id1 != other.id2 || id1 != other.id3) {
      return false;
    }
    
    if(id2 != other.id1 || id2 != other.id2 || id2 != other.id3) {
      return false;
    }
    
    if(id3 != other.id1 || id3 != other.id2 || id3 != other.id3) {
      return false;
    }
    
    return true;
  }
}