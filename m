Return-Path: <SRS0=8exe=VG=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC19CC433EF
	for <soc@archiver.kernel.org>; Thu, 28 Apr 2022 07:04:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A3458C385A0; Thu, 28 Apr 2022 07:04:54 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A988C385A9;
	Thu, 28 Apr 2022 07:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1A988C385A9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f180.google.com ([209.85.219.180]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mg6JS-1oM1iG3Ll0-00hijc; Thu, 28 Apr 2022 09:04:51 +0200
Received: by mail-yb1-f180.google.com with SMTP id r189so7383254ybr.6;
        Thu, 28 Apr 2022 00:04:50 -0700 (PDT)
X-Gm-Message-State: AOAM531PDtl2Wa/ASoILlJnbKK90unP/GtzzOlh5J7WvryemKwwezhi0
	EkgI4Z9qj2PZ3fAwzhjhIJws8OXTGMvc5npX3ig=
X-Google-Smtp-Source: ABdhPJxPFdoAK53KrDUJDvXZZBNItrxVRstFggJZqPSzN1hTf5QMiOJMiJirNLjAI0bMczN8kVmmcLMEGUTHnXYsKxk=
X-Received: by 2002:a25:31c2:0:b0:641:660f:230f with SMTP id
 x185-20020a2531c2000000b00641660f230fmr29428750ybx.472.1651129489342; Thu, 28
 Apr 2022 00:04:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220331092235.3000787-1-hasegawa-hitomi@fujitsu.com>
 <20220331092235.3000787-2-hasegawa-hitomi@fujitsu.com> <YkWVTEG5oFO82GPL@kroah.com>
 <CAK8P3a0jnzse4sG58taO5+Yd5vCgh1uddqbtAuim_z9r15Q3BA@mail.gmail.com>
 <20220408133246.fyw5554lgli4olvg@maple.lan> <CAK8P3a0u2xa9BFmakG+f4kyLsqNZQbE6KQ6jz2356Fyen=1EHw@mail.gmail.com>
 <YlBE6hZHmLo9/wrU@kroah.com> <CAK8P3a3v4+AO5avGoxeZSyNTOWqk8YS95xQLWSBZ=yV_3DKggg@mail.gmail.com>
 <20220408150202.yhn3qppqwm7wzmo3@maple.lan> <OSZPR01MB7050BE18BC9E8DA05C00F478EBF29@OSZPR01MB7050.jpnprd01.prod.outlook.com>
 <OSZPR01MB70504BD8347355EB51F7CCB8EBFD9@OSZPR01MB7050.jpnprd01.prod.outlook.com>
In-Reply-To: <OSZPR01MB70504BD8347355EB51F7CCB8EBFD9@OSZPR01MB7050.jpnprd01.prod.outlook.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 Apr 2022 09:04:34 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2aHBxRJbOcXBGM7gjAqpErBAeaG3NmfgBTn4TNYscSgw@mail.gmail.com>
Message-ID: <CAK8P3a2aHBxRJbOcXBGM7gjAqpErBAeaG3NmfgBTn4TNYscSgw@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] soc: fujitsu: Add A64FX diagnostic interrupt driver
To: "hasegawa-hitomi@fujitsu.com" <hasegawa-hitomi@fujitsu.com>
List-Id: <soc.lore.kernel.org>
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, Sumit Garg <sumit.garg@linaro.org>, 
	Olof Johansson <olof@lixom.net>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Jason Wessel <jason.wessel@windriver.com>, 
	Doug Anderson <dianders@chromium.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>, 
	Peter Zijlstra <peterz@infradead.org>, Mike Travis <mike.travis@hpe.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:3xHeUSjOFhUo+JH6XEVgVn7rnay62+aGnKT3HnJN1hEHk9I3w4e
 rBqdTVnhF3jxHkntQz/qz4+HODLuKMxUX86mfKyjCqmvSYN459gRxHLv5Gw82Km2PFhvLFZ
 Qp4VFEZqAvg908zKNtJIwJ11LsTUM/S+uxKuW/I6wpZGEgt3lT+g2GIS9BXTM00YbehrfVV
 t1l6NLLQMxryS8NSAQXLg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZPTDJlqUv7E=:qDBBVG4WzRLwwzOYFoYrtM
 RQtHLluptnHHbDEDRbUEWjTN+lcYzFgEpMGu5yFL3EECD1G6JjL/qBy9PsbEX8DyEYA7moKHL
 +nltDhP5oZkwdFzTsmMmoRzc3Udyc4LyAKNF2KeUKPePTghCBy/saCt1yNwWaqKeo6oPN6bFs
 3EOY3T5spxXBoeyPBq4QmvBSZ8PqRvK3F/ed70zdwSeZhugfvkmbaEUcr6Y1hhRPbrDVnWrpC
 n2vv+KBRT6GE+BGXHZg0N1HKy1veW5XhTkssqhia3KmvjYGC03Et8LSjCFbJuP3pfwYiZosRs
 FnLBDiEIf0Iu/txXkDkpucZqFarEiRRMHIA6ij9I2TWIGz/14oAsYrtTer1xnPyNvhQgDrw/M
 KupvZr4lekFzs+w36bFtWb7lbExfFbzf5XrbGFOfbHi7cZkDq2j87LAAPjVObHxnD33oM2VqV
 /RHWGzXnz546LIAHEohhIbLHYdom2g8xoqfMOTtX+8mOF1w0tRXC7Y6nn1JREpZ/O5SJlV2Zz
 Uvk3UxxnBEB3rBImBkdku4BKUvMStrX4vZPsxKZG6MxMXwJcqpk/N+I+7xIp7Hg07MHxJA+N+
 ZCJ6uHuBerrPCPpasMr7wCc54pKVlYhPJw6xPwxtWFMeJVGuE1H8/KwI2xiTqyiKcGkjpoXUF
 qnFsiMBLG7lVKqOyaVVkNw8ZQdcfjyyW1kjNlxyl1Py8bqY92My7r79McoGlTcZq9PTv7Go+N
 brwiZMO15X/NiCCVzSg43imfSznO33AMIR2wyOzs4kb/gL1YAWKpTEC98kvzLEbGdA4OtTWoX
 dEacfexjGkSJ4r7UOvb8Ah0Tr4O+Y+A6wo4UfI03RKuzwT0KA8=

On Thu, Apr 28, 2022 at 4:15 AM hasegawa-hitomi@fujitsu.com
<hasegawa-hitomi@fujitsu.com> wrote:
>
> Hi Greg, Arnd, and Daniel,
>
> > I understand that it is not appropriate to hardcode c.
> > How about using __setup() to add a new kernel parameter and allow the admin
> > to specify the sysrq command when booting?
>
> I have received a lot of advice regarding sysrq, but after some consideration,
> I would like to change to calling panic() directly as in v1 instead of sysrq.
>
> If the administrator wants to request a diagnostic, I think they usually
> expect crash with NMI like x86 and take a dump the kernel. It's not common
> to handle diagnostic interrupts with sysrq now, so I don't think
> it's necessary to make this driver extensible at this time.

Ok, fair enough. Matching x86 behavior sounds like a reasonable outcome.
If we want to make this configurable in the future, that can still be done then,
and it should work the same across architectures but adding the logic
in nmi_panic() directly.

        Arnd
