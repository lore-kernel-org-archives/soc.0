Return-Path: <SRS0=kMA2=VV=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41B56C433F5
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 10:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1680BC34118; Fri, 13 May 2022 10:14:04 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8F32EC34100;
	Fri, 13 May 2022 10:14:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8F32EC34100
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yw1-f181.google.com ([209.85.128.181]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MvsR7-1o5sWr43r5-00svbv; Fri, 13 May 2022 12:13:55 +0200
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-2f16645872fso85139447b3.4;
        Fri, 13 May 2022 03:13:54 -0700 (PDT)
X-Gm-Message-State: AOAM530FnVE9TS7YO++zOe5wkmOq2yU3uQehEdRBIzlbPYhVyqEpn6lm
	aaInMqVZtjTKo6v5hsM2UBMYDWGhLnQVmUtBTao=
X-Google-Smtp-Source: ABdhPJyHEUP1cRPCzvCwXdPdUSFS+Voh0iZfVi5t4LZi15vwg6YIdcUM0F8JfOUB45yvtXzHOEpnm/S+mdBFUW/UN8c=
X-Received: by 2002:a0d:cd06:0:b0:2f8:f39c:4cfc with SMTP id
 p6-20020a0dcd06000000b002f8f39c4cfcmr4713890ywd.495.1652436833571; Fri, 13
 May 2022 03:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220511062113.2645747-1-hasegawa-hitomi@fujitsu.com>
 <20220511062113.2645747-2-hasegawa-hitomi@fujitsu.com> <Yntcn4esjJRS50Am@kroah.com>
In-Reply-To: <Yntcn4esjJRS50Am@kroah.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 13 May 2022 12:13:36 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3rF7Y27UiGyk34b0KTfvU30rkuoN5GyuNuwcA-V61_-w@mail.gmail.com>
Message-ID: <CAK8P3a3rF7Y27UiGyk34b0KTfvU30rkuoN5GyuNuwcA-V61_-w@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] soc: fujitsu: Add A64FX diagnostic interrupt driver
To: Greg KH <gregkh@linuxfoundation.org>
List-Id: <soc.lore.kernel.org>
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>, 
	"open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>, Sumit Garg <sumit.garg@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Jason Wessel <jason.wessel@windriver.com>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Doug Anderson <dianders@chromium.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, kgdb-bugreport@lists.sourceforge.net, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:Fu6npXRcHhoT3S/r4S2aVRnvea8FuRLwRJEnzvYGs6AuaGGAvcz
 3o4JFwYrAarQY4uy8lW3VVN9SD5p3uQl1J4GHRvh+Hf6x7diKDVHxbYRx1Y5KGf3WpBRcju
 moc4ir811/+F2QNc7azE344GwZA8U3HuVPQWfOsCBYpKiFbAhtAxUwZkjeeb3lLlRv2h0lz
 GFAfnof3WM4En4r4ymwew==
X-UI-Out-Filterresults: notjunk:1;V03:K0:j+ErxuvGRzw=:fUHIDkxFXmvbvnAH7efpWB
 rtjEL09duP5/AGs6bonZNmm1GqyN5gR45dcrnpyi3aP1Hn6SyWmR7bukkNq+Zo1ofQCMbSLWW
 /RZLKrCAIqOekYMu5urS4cyqexfqxtS/Su4oNGJcnXvIZQlCOWnKWqDbYaGsDKNV3nY/SS5zF
 e7ox4XjMU7uU8m7CRA/F855zvRR8rjAC2kel2tBF84kfVF5AEh2preqnIqQ/z74HfdnTfs41o
 KqAezylqlf1nKDbSZySzJH/5jUomG6RdeX59USs7ymfPHlf5M8w765dTeSzezwpWYuiAtSWYo
 qbn3oMYxM/lai/wnsdl4lnGPkkKx8kDa4SZzclrH7SIlLphLo4GeYr1HZMqUg/P+FTaP0fvgt
 7uP7R6AqVLuWXpLrDMmLaMKaW9UFigo1xV+08XPxQxE9vsQSucZtwSlD/GM6a6nzGxtD1qBHh
 xK9c0dYookodYaBd1nXrIXpnUSrwiNrDxFMTdm7qHFy6oMURst4kzb63SZPLV+dmQmXpYttLe
 LnpUwvT3EsoMVajDjuWVptc2TQyxB1od4E5Iti2JYhGetcnmQZevJt8wCGuW+WPG9rHIS2J+J
 jx5XTCOp3AvnrSeudkUvVshVVCt4ldlcDJoHzdo55xyQUgsIKSAq5CppuK1P2V1QPff36zTEJ
 Nt4rVfMw+54Hi+fx5paaDhCGswiFiTg4Mh3wrfdnbH1UPHuMwbXLWmLB0sJ4lIU2yDHqnnytg
 SQ2k5vyzb84IfiRRfrdo6teQISbpIYnU/CsPlY8+QWpVpxiQ31O8bU0rKwinKWdhrOZxdxuh+
 8bdBP6BjVeb2MTneoo1HxqttzUJLCYt0lnyFzvwZXisHSoKneI=

On Wed, May 11, 2022 at 8:50 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > --- a/drivers/soc/Makefile
> > +++ b/drivers/soc/Makefile
> > @@ -12,6 +12,7 @@ obj-$(CONFIG_SOC_CANAAN)    += canaan/
> >  obj-$(CONFIG_ARCH_DOVE)              += dove/
> >  obj-$(CONFIG_MACH_DOVE)              += dove/
> >  obj-y                                += fsl/
> > +obj-y                                += fujitsu/
>
> Why a sub directory for just one .c file?

All the other drivers/soc/ contents are in subdirectories, so I think
I'd keep it like this.
There are also other drivers that have been proposed for fujitsu a64fx.

        Arnd
