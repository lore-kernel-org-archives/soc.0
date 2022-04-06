Return-Path: <SRS0=FI0R=UQ=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBDEC433F5
	for <soc@archiver.kernel.org>; Wed,  6 Apr 2022 07:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 114AEC385A5; Wed,  6 Apr 2022 07:25:01 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 37C26C385A1;
	Wed,  6 Apr 2022 07:24:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 37C26C385A1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wm1-f48.google.com ([209.85.128.48]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1M8xsm-1nfsBq48bW-00657L; Wed, 06 Apr 2022 09:24:57 +0200
Received: by mail-wm1-f48.google.com with SMTP id m67-20020a1ca346000000b0038e6a1b218aso1044795wme.2;
        Wed, 06 Apr 2022 00:24:56 -0700 (PDT)
X-Gm-Message-State: AOAM531UWaXMZwzDSIFsfguPcuL6ckSJUO9Y8Jxrz+SyLek2WlzIJ7Xx
	yOhTtV4SH3OncEBWtrwx0dnedaJgO/dmmw+ib/8=
X-Google-Smtp-Source: ABdhPJwu5LvNECmW4HyBVpv2Cer4xxd1JvOZpZs+VR8+dhKNlRWp+EIRBOEzkloFndgC0TmlXfWSyv+rVVHS3rSKUo4=
X-Received: by 2002:a7b:cd13:0:b0:38b:f39c:1181 with SMTP id
 f19-20020a7bcd13000000b0038bf39c1181mr6437333wmj.20.1649229896617; Wed, 06
 Apr 2022 00:24:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220310195229.109477-1-nick.hawkins@hpe.com> <20220310195229.109477-9-nick.hawkins@hpe.com>
 <eb66cc83-2da9-8e19-db69-633e34fef946@canonical.com> <PH0PR84MB1718C31DB71AA2A67FEC5F6E88119@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <b1cc2566-cd78-7cb4-f8a5-d6fc8065fe6e@canonical.com> <PH0PR84MB1718292B1C11F4FE83326A5388119@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <fb4def96-4b20-604f-d15d-fef87eb2232d@canonical.com> <PH0PR84MB1718A2CFBFC90C9C0CAA5515881E9@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <CAK8P3a0fCE_NM=z68d1m9BTfuKixh1pKLw3gn+Sr7SxKb6UJAg@mail.gmail.com>
 <PH0PR84MB17181C316E55073EBC28C386881E9@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <PH0PR84MB17185ADBA824F9CC9EB3E022881F9@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <CAK8P3a1080yz9jggOrwz2iQ1sAB2Xe2Emh22uCuqRok60BQSiA@mail.gmail.com>
 <PH0PR84MB17186189F5025374AA39584D88E19@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <CAK8P3a2b+ESAAkc=_2hqx0kOxwYVS6mNjMGBKhhipaSj_5jV9g@mail.gmail.com>
 <PH0PR84MB17182115D57EF6032782659C88E09@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <CAK8P3a1Cc+2oY9djdp11PuOW+TBQ0zf+p8QaDY3aerk1QqaG-g@mail.gmail.com>
 <PH0PR84MB1718925AA3C8FA998C486D7C88E59@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
 <CAK8P3a3RSST6yvv8Oy13RFd6eZ6cS5yX9TOuK6wxXKUO-qdQ=Q@mail.gmail.com> <PH0PR84MB1718C7447207BF210FBB477788E49@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <PH0PR84MB1718C7447207BF210FBB477788E49@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 6 Apr 2022 09:24:40 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3jr-FkyxLff2cK4=X-4AShnKkeYMRKsvUg=2W0bTviiQ@mail.gmail.com>
Message-ID: <CAK8P3a3jr-FkyxLff2cK4=X-4AShnKkeYMRKsvUg=2W0bTviiQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] arch: arm: boot: dts: Introduce HPE GXP Device tree
To: "Hawkins, Nick" <nick.hawkins@hpe.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "Verdun, Jean-Marie" <verdun@hpe.com>, Olof Johansson <olof@lixom.net>, 
	"soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wu4f9mH3V2TnUmX0FywzM0mbPXaD3c8LOU86xidHqY+sK3g9aAj
 Q33RW48K/8o7S3P2J0Y//DOlSV9f7WAy6d2vVpZBs9YCdaP55B+gdPf63eVUMQwmLWOyvFG
 MAgfS1P6TnXpU0BUDFTE9wCwowGyYiSwPX7twUPQvS+QBCXIB/1S+kv0F8o8LRKdnCWgTll
 8TsldPd0XhTlCrTh47noA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DR+CDj31Lx4=:DpZlnggOfxQz81uKITB+/l
 G2mVlDgDCxxBs0/WeAsJesROefjEjdLg1PK420tr0qrnY5KeTCXeSr94AcU2Ww0/EBtNbLeov
 frOBrWdGfyh0zqoxDihCA2Djl0brvCXJz9gDtSfVQISlca88P7l7pPXTPFw90LInidCCeOCE+
 byJoY+Xf5pdg606OTo5L5ARQ9qMAJs9RYlGR75VGTWxTXbcJGXLRaZ0Rf1iIKOiBlbvAXX5WX
 tROzHnLpgAUWZt3U9sAUKm9uYoDD239miFz8yjkbhNXQht/nD0DMRR9UTwSmBUzR1ZViMPTU1
 y3ib1KjF5zvQztQnoHRjREphJi/jWEOGvs67fQAUsW6va9RlKMtW75faOYxHUqLEw4Xv2cmvr
 o/6aSk65i2QB1SsgIp7e3C4W0VFcZGKA+yWSq6Ay8oUrZsEbFekksC/zSPdNCSVRhBdyCZlt4
 rNxP+5HptL1h20k6zGU423bnf4nIWovrd288obowEF/hASFQvQ91Ex+Z7aXeplcZioaeyjTca
 NvqzKSLGPbZunNUw+95CQiVO73nhCfiCiN/u1eOoFUPxZNA4k3jNRNtKrHDp93n4jmL4NaK7r
 1YOWx0UORga8yan+FVFunWFP2VBC2lVbGvYfBLPqFyNJ2atdaLLk319zo8RO3xQlxk/zbwMnh
 hiaxz4X2qY3fcwKd+pcT60NzUoVW6MFF8PehRxyuizrPv5kcIfTRHFZtds03s1F2qE2g=

On Tue, Apr 5, 2022 at 11:21 PM Hawkins, Nick <nick.hawkins@hpe.com> wrote:
>
> > Right, it is possible to make this work, but it's not recommended, and =
you have to work around the sanity checks in the code that try to keep you =
from doing it wrong, as well as any tooling that tries to check for these i=
n the DT.
>
> I found an example in the kernel where the timer creates a child watchdog=
 device and passes it the base address when creating it. I used this to mod=
el the gxp-timer and gxp-wdt. The following files were what I have referenc=
ed:
> drivers/watchdog/ixp4xx_wdt.c
> drivers/clocksource/timer-ixp4xx.c

Yes, I think that is a good example.

> This seems very similar to what you suggested previously except I do not =
see a private interface in there between the parent and the child device. I=
s it mandatory to have the private interface between the two? If it is, wha=
t would you recommend that interface be? So far without the private interfa=
ce I am not seeing any issues accessing the registers.

I would count passing a register address to the child device as a
private interface.
It's a minimalistic one, but that is not a bad thing here.

         Arnd
