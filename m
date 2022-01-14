Return-Path: <SRS0=dxDo=R6=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA131C433EF
	for <soc@archiver.kernel.org>; Fri, 14 Jan 2022 00:45:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 899FCC36AEA; Fri, 14 Jan 2022 00:45:57 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3E131C36AE3;
	Fri, 14 Jan 2022 00:45:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3E131C36AE3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f43.google.com ([209.85.128.43]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MnZwp-1mRROZ0CYv-00jVeu; Fri, 14 Jan 2022 01:45:54 +0100
Received: by mail-wm1-f43.google.com with SMTP id l12-20020a7bc34c000000b003467c58cbdfso6422510wmj.2;
        Thu, 13 Jan 2022 16:45:53 -0800 (PST)
X-Gm-Message-State: AOAM531LJGt6Jjhscr6napgmJp054KOv8MMl6QagoZE0Otc5nErqKfGM
	DkdHuI0KF7958i9vH6nKlVyh2oN536PhNW8cYos=
X-Google-Smtp-Source: ABdhPJwV4G3A5mpFnAW11HwlY/Tf7y1xRC36rwdQkkqDkkOWfKAxxiuv8Puk8O7tRRiiu1Ah39q+R3OAJUeOa6nnmfM=
X-Received: by 2002:a05:600c:287:: with SMTP id 7mr6081734wmk.98.1642121153661;
 Thu, 13 Jan 2022 16:45:53 -0800 (PST)
MIME-Version: 1.0
References: <20220113171921.17466-1-philippe.cornu@foss.st.com> <20220113171921.17466-2-philippe.cornu@foss.st.com>
In-Reply-To: <20220113171921.17466-2-philippe.cornu@foss.st.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 14 Jan 2022 01:45:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0Nn3fwEMtb9f0DZhbyY+mLva5XR332XfXqX=WSmB9a8w@mail.gmail.com>
Message-ID: <CAK8P3a0Nn3fwEMtb9f0DZhbyY+mLva5XR332XfXqX=WSmB9a8w@mail.gmail.com>
Subject: Re: [PATCH 1/2] MAINTAINERS: Update Benjamin Gaignard maintainer status
To: Philippe Cornu <philippe.cornu@foss.st.com>
List-Id: <soc.lore.kernel.org>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Liam Mark <lmark@codeaurora.org>, 
	Laura Abbott <labbott@redhat.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <john.stultz@linaro.org>, Christian Konig <christian.koenig@amd.com>, 
	SoC Team <soc@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:IXMEoRjfaWWXvwHHTukprO2QXR06/6J2rthpcAIF/nMUV+r7gmu
 LrtEtIt+vJjhKt6dn1sp02Pjuw3pJ02ps02YHdqt7I9vTNqCgcqtBnnmH6u4t/Gr0oDzXun
 pCYC2kOqejbdzSC7CtT/WZSPcDO9YNEAiY1w/0oA7nVzrjkOips6wow7yO2GkQfDpkZuHIn
 oE31I9x9BFn1zc0WmhHfw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZWdhXKlrd+c=:kPLl09RFCLlo/SwkML4Kxj
 Dwk5McdNIB7Qv+vhDrEJyuX4+i+HvmuazUzGHOlFtZMGQpAXm0cYnmy1G5hw5PZ3bw/rywHXV
 XmPtB2SDXpkF9fomCrVZEjW1eMmBnttJxGdK8RBqt1SNi+WbWdBa3kBA6NAqwq2z7V0U+N9Ce
 vJ1IAQu0U8SgMXkG2hR9Wie4mIwR3xazfiy86hQffE+BQYUH+6mTE8TbDZnSORrxLe2w6QNPi
 sLS8QpTWasoTAQYI+fJZiFxspz9uwHruif2emiwTEtJIJCLkfYrrpDpjzOQgky+ZGKsYbjFRP
 8zrfKpVgJPSx7rflfeCz7DiZrGbigRFejaStA116QByl0dZc9hR1lTSwKuoQ0ZUE9/TR8I1Mm
 jeFAtCfQ2xk7PaZWnvPXXcvleLDcK5j3TAI1GJBxtgcA2ipThebijmYniX068aAjHOZBwpmJZ
 jJ3E/rF2Vs4os50xSstttCpPfA0NJiFYFDWRkuvoj2lqxktU0vTy9M+Eob/ToCnRx87bOnN5B
 NNt/TKGDKB7jhkqdRO0ykzFeIa/OgB6Eop9n4+bcBuOTT4fu3/oLCtU2DseFRdr9LrLVhXt/v
 d50bSsIwSD4CJb1aez5IGyJdyHg1F3zYuYNwhuz8ZWPPr8DNRFR4/GRUPAjY89eNGFsk3fTXO
 syoAcERr0OsQjZCbIBCd31XEjVgcX/E01TnPPxeTqGkC23o80RR5Rkvg9Y9s4uqrN68wIhykh
 TTTeazT+G2dItMWvKbdtpiutsrudS0fBvaZYZaCOJS22Rrs67VVRfWOI4225AjniNtyE90TQi
 uSDpw20Q+xltQzOavYPT3LbXCpkZXRcglWE7zX8obIQD9M7/Y8=

On Thu, Jan 13, 2022 at 6:19 PM Philippe Cornu
<philippe.cornu@foss.st.com> wrote:
>
>  DRM DRIVERS FOR STI
> -M:     Benjamin Gaignard <benjamin.gaignard@linaro.org>
>  L:     dri-devel@lists.freedesktop.org
>  S:     Maintained
>  T:     git git://anongit.freedesktop.org/drm/drm-misc

If there is no longer a maintainer, I suppose it should also be marked as

S: Orphaned

         Arnd
