#-*- coding: utf-8 -*- 

import sys
# # reload(sys)
# sys.setdefaultencoding('utf-8')rr

import pandas as pd
import numpy as np
# 데이터 파일 읽기
bookdf1=pd.read_csv('C:\\Users\\oreho\\git\\WM-MONSTARBOOKS\\Monstarbooks\\src\\main\\webapp\\resources\\pycode\\bookinfo.csv')

from sklearn.feature_extraction.text import TfidfVectorizer
#백터화 작업 - bookinfo의 텍스트를 벡터로 변환
tfidf=TfidfVectorizer(stop_words='english')
tfidf_matrix_book=tfidf.fit_transform(bookdf1['bstory'])

from sklearn.metrics.pairwise import linear_kernel

#코사인 유사도 계산
cosine_sim_book=linear_kernel(tfidf_matrix_book,tfidf_matrix_book)

#도서의 인덱스 설정
indices_book=pd.Series(bookdf1.index,index=bookdf1['btitle']).drop_duplicates()

bookdf1.columns=['no', 'isbn', 'btitle', 'bstory', 'bwriter', 'bpub', 'bprice', 'bdate']
# def get_title(code):
#     import cx_Oracle
#     connStr = 'hr/123456@localhost:1521/xe'
#     con = None
#     try:
#         conn = cx_Oracle.connect(connStr, encoding="UTF-8")
#     #     conn=cx_Oracle.connect(connStr)

#         cur = conn.cursor()
#         cur.execute('select btitle from bookinfo where isbnno=9791162996522')
#         out_data = cur.fetchone()
#         print("==>", out_data[0])
#     except Exception as err:
#         print('Error con db')
#         print(err)
#     finally:
#         if(conn):
#             cur.close()
#             conn.close()
#     return out_data[0]

def get_recommendations_book(btitle,cosine_sim_book=cosine_sim_book):
    #index값을 가져오기
    idx_book=indices_book[btitle]
    sim_scores_book=list(enumerate(cosine_sim_book[idx_book]))
    # 코사인 유사도매트릭스 cosine_sim에서 idx에 해당하는 데이터를 (idx, 유사도)
    sim_scores_book=sorted(sim_scores_book,key=lambda x:x[1],reverse=True)
    # 코사인 유사도 기준으로 내림차순정렬
    sim_scores_book=sim_scores_book[4:9] 
    # 자신을 제외한 6개의 추천 대상를 슬라이싱
    # 추천서적목록 인덱스 정보 추출
    movie_indices_book=[i[0] for i in sim_scores_book]
    return bookdf1['btitle'].iloc[movie_indices_book]
# print(get_recommendations_book('업무의 잔머리 '))

#1차원 배열로 저장된 값들중 인덱스 값만 뽑아옴
def callsim(v4):
    btitle=get_recommendations_book(v4+" ")
    # print(btitle)
    df = btitle.to_frame()
    for idx, row in df.iterrows():
        print(idx + 1)

    # print(v4)
    # v4=v4+" "
    # print(print(type(v4)))
    # print(v4)

def main(argv):
    #callsim(argv[1], argv[2])
    callsim(argv[1])
    

def sum(v1,v2):
    result = int(v1) + int(v2)
    print(result)

if __name__ == "__main__":
    main(sys.argv)