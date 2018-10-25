FROM homdx/kivymd-store:001


RUN mkdir app

COPY . app

RUN sudo chown user ${WORK_DIR}/app -Rv

#USER root
#RUN chown user /home/user/ -R && chown -R user /home/user/hostcwd
#USER ${USER}

RUN cd app && buildozer init && patch -p0 <buildozer-patch.patch && time buildozer android debug || echo "Fix build apk"

CMD tail -f /var/log/faillog

#ENTRYPOINT ["buildozer"]
