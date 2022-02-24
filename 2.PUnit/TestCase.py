from TestResult import TestResult


class TestCase:
    def __init__(self, name):
        self.name = name
        self.log = ""
    
    def run(self):
        result = TestResult()
        result.testStarted()
        self.setUp()
        try:
            # 파이썬의 장점 클래스 이름이나 메서드 이름을 함수처럼 다룰 수 있다.
            method = getattr(self, self.name)
            method()
        except:
            result.testFailed()
        self.tearDown()
        return result

    def testMethod(self):
        pass

    def setUp(self):
        pass

    def tearDown(self):
        pass