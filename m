Return-Path: <SRS0=UGbC=UL=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C42C433F5
	for <soc@archiver.kernel.org>; Fri,  1 Apr 2022 16:30:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EA86BC340F2; Fri,  1 Apr 2022 16:30:46 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 06BB8C2BBE4;
	Fri,  1 Apr 2022 16:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 06BB8C2BBE4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f42.google.com ([209.85.221.42]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N3sZy-1o0tUo43rU-00zqJt; Fri, 01 Apr 2022 18:30:43 +0200
Received: by mail-wr1-f42.google.com with SMTP id i4so5023310wrb.5;
        Fri, 01 Apr 2022 09:30:42 -0700 (PDT)
X-Gm-Message-State: AOAM533zH5Ezi/0nkG9jvDr5LWuSWbCIuVfu09uEjE/wuYn6ojESq/Di
	71YEON2u6/HR0B4SVacDYRIsQdq1oA9ZXX1zCpc=
X-Google-Smtp-Source: ABdhPJwyW/9yDumqLlMXuT9IiGs4++GAwrVsH9ehz5Nj8vorMda1+nQReZXN9clMCgy38axwXXENGm/jEqa+upBHgYo=
X-Received: by 2002:a5d:6505:0:b0:205:9a98:e184 with SMTP id
 x5-20020a5d6505000000b002059a98e184mr7945225wru.317.1648830642616; Fri, 01
 Apr 2022 09:30:42 -0700 (PDT)
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
 <CAK8P3a2b+ESAAkc=_2hqx0kOxwYVS6mNjMGBKhhipaSj_5jV9g@mail.gmail.com> <PH0PR84MB17182115D57EF6032782659C88E09@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <PH0PR84MB17182115D57EF6032782659C88E09@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 1 Apr 2022 18:30:26 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1Cc+2oY9djdp11PuOW+TBQ0zf+p8QaDY3aerk1QqaG-g@mail.gmail.com>
Message-ID: <CAK8P3a1Cc+2oY9djdp11PuOW+TBQ0zf+p8QaDY3aerk1QqaG-g@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] arch: arm: boot: dts: Introduce HPE GXP Device tree
To: "Hawkins, Nick" <nick.hawkins@hpe.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "Verdun, Jean-Marie" <verdun@hpe.com>, Olof Johansson <olof@lixom.net>, 
	"soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:SaPgkEcLA9CkmNBlmQtSAwC2aLEkmcFd9pQ20CnMCskaVq1nIk2
 WzQJBT0unxD57I0JnoE5/R7sJLNLOJJtWubhWLCXFXkV1cro2Ya++Ka+UnVqm0NcgQCeKjW
 oU4DhCJIBA8IMum/9elVcqpY4vB/5LCjWA9HtA+oNbNFOeq2yX5HjD0IarkMRXT6AXm91Pi
 hvyKrZvkJil+i6Dy9WgLQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Xyir/Aps7tA=:XScjfHxr+/nLpgzRwK/aZc
 FJYhok0vqEhWvamt4oYSQ0xErQVr7QYJdy8EvfvGLy915rDjEHSDynlCCk5F8Bq77QLN38lVZ
 FIhX7sYqNXB1cvdtZ9fv/nlm9xAsxrxSKYd9W0mYkuy9oyYZA/Ij7rOgPWnhH3lriyzJ+IDZD
 LV/Sbgk3CaNdTKbM/hUN/Yehpnt4Rwuh1tsOJxJnKe8+zSsnr+n2yxc7vNvGDpTdbhaGtOBOA
 cxk5ynxTzlvqhLLEKLb1OFTC2KALWrBtmnB6i+UCMuMmd02xtnDleLc/2WWPU5p6PPnjD0IUI
 EeGIVqdp5n3/HtCkm5zDmztU+GgVjS9WRz1osZmBuaUxLp01gLZy96o9bLVnnCdwPbPIoTIiN
 oO3DMRXlyu7k9ny1WPbfIQthg04Ze4QI9P2IsV+ts0nKRYfJc/ZbXuRuELwWcj6WFWFv157lE
 HMl72cqfkbugRK6T9mY6Y9HXeQ8tVB8yRaApyw9A7Dj1HNHD7Cstxol/xeemy62n+olpA1+YC
 Te8pdhy6VSWKW0CWBCsoDbXKtn+rYOvArEcq0gUL8F0vQxf+nZ953cgYAa5FBVEeIEpKdjGkH
 LqD6H6YWHiVfgPtwYMHnz20FbWFyDRGYoUroVZLT5V8CXzkFP6bTv4t6M25xgLdDpeyqYbY/7
 tR3blZPrn233PugO3fsHlZpixRW2zNu6VzMy64Zlmtk2w9O0iWix4N6qOnRPyOjKfYag=

On Fri, Apr 1, 2022 at 6:05 PM Hawkins, Nick <nick.hawkins@hpe.com> wrote:
> > I don't think you can do this, if you are using the syscon regmap, you go through the regmap indirection rather than accessing the mmio register by virtual address, and this may result in some extra code in your driver, and a little runtime overhead.
>
> > If you prefer to avoid that, you can go back to having the timer node as the parent, but without being a syscon. In this case, the watchdog would be handled in one of these ways:
>
> > a) a child device gets created from the clocksource driver and bound to the
>     watchdog driver, which then uses a private interface between the clocksource
>     and the watchdog to access the registers
>
> > b) the clocksource driver itself registers as a watchdog driver, without
>     having a separate driver module
>
> > One thing to consider is whether the register range here contains any registers that may be used in another driver, e.g. a second timer, a PWM, or a clk controller. If not, you are fairly free to pick any of these approaches.
>
> I will try to use the b) approach everything in that range is timer or watchdog related. There is a second timer however there are no plans on using that. Should the combined code still live inside the driver/timer directory or should it be moved to mfd?

I would put it into drivers/clocksource/, I don't think drivers/mtd
would be any better,
but there is a chance that the clocksource maintainers don't want to
have the watchdog
code in their tree.

        Arnd
