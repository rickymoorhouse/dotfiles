from powerline_shell.utils import BasicSegment
import subprocess

def getcontext():
  try:
      context = subprocess.run(["kubectl", "config", "get-contexts"], stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
      data = context.stdout.decode('utf-8').split("\n")
      for line in data:
        if '*' in line:
          segment = line.split()
          cluster = segment[1].split('/')[0]
          ns = segment[-1]
#          return("{} : {}".format(cluster,ns))
          return(cluster,ns)
  except:
    return('','')

class Segment(BasicSegment):
    def add_to_powerline(self):
      (cluster, ns) = getcontext()
      self.powerline.append(cluster,15,4)
      self.powerline.append(ns,0,13)
      #self.powerline.append(getcontext(),15,4)

if __name__ == "__main__":
  print(getcontext())
