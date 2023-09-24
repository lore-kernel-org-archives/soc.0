Return-Path: <SRS0=j6Ik=FI=gmail.com=zhoubb.aaron@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35A4CE7A8A
	for <soc@archiver.kernel.org>; Sun, 24 Sep 2023 12:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 781F2C433C9; Sun, 24 Sep 2023 12:21:16 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D1E19C433C8;
	Sun, 24 Sep 2023 12:21:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D1E19C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-d815a5eee40so5189463276.2;
        Sun, 24 Sep 2023 05:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695558073; x=1696162873; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MTfZjqjMpvXRZj3b3a+JLvwqBqzdhBKsQPxsSKfm4jQ=;
        b=GUsGweIQF1GP4w8O0n/rcQ8RdLAxmWF8Ylwmx6gT9OUH0WNrqKrLIujsvKwG2mYGhr
         O9W7WYouw2A8QP2QPRXTrbjmU/LOrP2LyuJadS+FShJhSgkE/hw/ykZC0eh9RyZ9+phn
         lKy7kitksvoNjDOoQD8M5X42ImEUrepvLcayiTGKHXroiOSBgk4UwQEQo1M1CoU9RXyh
         gnC6QGa+LBqncHln94BkeVmAdwmUWLbgrWaSUUU96HtBcJrS2iuebEThAbY6TR5IOVDS
         nqsQ70SJ9SUUcj2JiIIzAKWGAe4bLAijGvzDwHJOXU7DuuUYtKJpUyU86O2USNfvfNvd
         0R4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695558073; x=1696162873;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MTfZjqjMpvXRZj3b3a+JLvwqBqzdhBKsQPxsSKfm4jQ=;
        b=U0FOAp9+xdWn+41lbsM9BpZ2spL0rbSGUMzTVeu9HRINhCOS1tK0vAErd/57Xb4hge
         lNKBZIcfwGBnb8VbuhPbh2GGqQnrTfFTJLPgRtJ5EwU+qnPi1rK5Ot7BTYSHX+/erxGm
         MM3djHc+CYAIFC43exUkMgaKHip2Ou4K/mWQLDAp3Xj1Xv40sb6C9wT9r+fyiyWsQaFA
         Zezl0zc0YoeENvYTQHREZz/vb2uVX72jcXb4gz9DiLsGo8gaTJjOANFbz4i5cF4Ezaf4
         kigDnqC2ycjHt52+zqi7JUrxAo04c6BCsg0jdkuQ0Vu1HbXF0wsXtWVMZeaRov3ORA3j
         1K/w==
X-Gm-Message-State: AOJu0YxEkbSk2gZboGkYXoFxjMqX+ThvrPC08AAXINEXyCsu9bO5n27s
	HUD5LaVGnB+jYITdgyNTxGU4BxYzNP8eyB25xm6D1V75qEjyyw==
X-Google-Smtp-Source: AGHT+IF2jNaWBk87Cb4LztG+3BYADZk5wQU4zwUp4/XjFmSp0zIWGQD+y5IecCnZhP1NNVheMxVGBydqfLx6BDN44Oo=
X-Received: by 2002:a25:a048:0:b0:d43:a84f:a6aa with SMTP id
 x66-20020a25a048000000b00d43a84fa6aamr3813704ybh.39.1695558073705; Sun, 24
 Sep 2023 05:21:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1693623752.git.zhoubinbin@loongson.cn> <16a37f6ad3cc9417b6638c2cd532d88c79468eb1.1693623752.git.zhoubinbin@loongson.cn>
 <885eab85-2c11-cf20-9187-55cd647fbe9f@infradead.org> <c7604f6c-4da7-47c4-abe9-e626b3efc665@infradead.org>
 <20230919-9ce82588fccdd641574b468c@fedora> <CAAhV-H73kp8zWJD7AKUvknmxow=f_cPBw9jctpmced6o_QCF6w@mail.gmail.com>
 <ea9ee2dd-b71a-4c97-a347-20536d7ad424@app.fastmail.com>
In-Reply-To: <ea9ee2dd-b71a-4c97-a347-20536d7ad424@app.fastmail.com>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Sun, 24 Sep 2023 20:21:02 +0800
Message-ID: <CAMpQs4Lp1y1=hp_Z7zRV7W0WCB047yDD5eqnuLHjdqHYZpchRQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] soc: loongson: loongson2_pm: Add dependency for INPUT
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Huacai Chen <chenhuacai@loongson.cn>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	loongson-kernel@lists.loongnix.cn, soc@kernel.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 10:43=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> On Tue, Sep 19, 2023, at 12:15, Huacai Chen wrote:
> > On Tue, Sep 19, 2023 at 11:48=E2=80=AFPM Conor Dooley <conor@kernel.org=
> wrote:
> >> On Tue, Sep 19, 2023 at 08:36:50AM -0700, Randy Dunlap wrote:
> >>
> >> Seemingly this was sent again in isolation 2 weeks ago, but neither th=
e
> >> maintainer (Huacai) nor soc@kernel.org were on cc:
> >>
> >> https://lore.kernel.org/all/20230905123629.4510-1-zhuyinbo@loongson.cn=
/
> > v3 indeed cc-ed soc@kernel.org. :)
> >
> > Arnd, could you please take this series to the soc tree? And also this
> > series:
> > https://lore.kernel.org/loongarch/cover.1693534134.git.zhoubinbin@loong=
son.cn/T/#t
>
> Sorry, I have been traveling and not pushed out the tree yet.
>
> Can you confirm that the input dependency is required for 6.6
> and the other series can wait until 6.7? When you send patches
> to soc@kernel.org, please always mention which tree you intend
> them for. I might disagree, but it's better than having to guess.
>
Hi Arnd:

Thanks for your reply.

As we know, this driver was just merged in during the v6.6 window, and
no release will use it until now:

commit 67694c076bd7 soc: loongson2_pm: add power management support
commit 6054a676e969 soc: dt-bindings: add loongson-2 pm

Now, since the Loongson-2K series SoCs are indifferent at the driver
level, we used fallback compatible and added
syscon-reboot/syscon-poweroff subnodes for power on/off functionality.
These somewhat break the original devicetree rules.
So, I think these patches need to be merged in before the v6.6 release
to avoid unnecessary compatibility issues.
Of course, I added the "Fixes:" tag in the corresponding patch.

Thanks.
Binbin

>      Arnd
