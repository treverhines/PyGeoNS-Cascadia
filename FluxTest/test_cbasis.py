import numpy as np
import rbf.basis
import rbf.cbasis
import time
time.time()

itr = 3
x = np.random.random((10000,2))
c = np.random.random((15000,2))
eps = np.random.random((15000,))


# find the time it takes to generate a se matrix without cython
rbf.basis.exp._cache_diff((0,))
rbf.basis.exp._cache_diff((0,0))
start = time.time()
for i in range(itr):
  out1 = rbf.basis.exp(x,c,eps=eps)

stop = time.time()  
print('runtime without cython : %s' % ((stop-start)/itr))

# find the time it takes to generate a se matrix with cython
rbf.cbasis.cache_cythonized_diffs()
start = time.time()
for i in range(itr):
  out2 = rbf.basis.exp(x,c,eps=eps)

stop = time.time()  
print('runtime with cython : %s' % ((stop-start)/itr))

print(np.all(out1 == out2))
#x1 = np.random.random((2,1))
#x2 = np.random.random((2,1))
#c1 = np.random.random((1,3))
#c2 = np.random.random((1,3))
#eps = np.random.random((3,))
#
#rbf.basis.exp._cache_diff((0,))
#rbf.basis.se._cache_diff((0,))
#rbf.basis.exp._cache_diff((0,0))
#rbf.basis.se._cache_diff((0,0))
#
#print(rbf.basis.se.cache[(0,)](x1,c1,eps))
#print(rbf.cbasis.se_0(x1,c1,eps))
#
#
