Return-Path: <SRS0=zv6/=UO=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFAEEC433EF
	for <soc@archiver.kernel.org>; Mon,  4 Apr 2022 22:04:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 70FE7C34110; Mon,  4 Apr 2022 22:04:25 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DA009C2BBE4;
	Mon,  4 Apr 2022 22:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DA009C2BBE4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-wr1-f49.google.com ([209.85.221.49]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MlwBf-1oIlhm3KUd-00j4pY; Tue, 05 Apr 2022 00:04:21 +0200
Received: by mail-wr1-f49.google.com with SMTP id k23so3999911wrd.8;
        Mon, 04 Apr 2022 15:04:21 -0700 (PDT)
X-Gm-Message-State: AOAM530pa8C7W9brlf+cdjppe5RaopVCHX8bsLb2Oh72ly9QxSDb0MEp
	RpeCcZ7sqIK6kKWrhwo3AmdHLqMXKYIHnDWPwHE=
X-Google-Smtp-Source: ABdhPJxdB4SXEExhGLOnNOou5PzL8CTbrHl2NxdVHZQrrPYcJQIoUaGDfpVns8hWsOV0sMm8eIe8VQFd/8q9TF2PhCI=
X-Received: by 2002:adf:cd02:0:b0:206:ff2:236 with SMTP id w2-20020adfcd02000000b002060ff20236mr254545wrm.192.1649109861434;
 Mon, 04 Apr 2022 15:04:21 -0700 (PDT)
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
 <CAK8P3a1Cc+2oY9djdp11PuOW+TBQ0zf+p8QaDY3aerk1QqaG-g@mail.gmail.com> <PH0PR84MB1718925AA3C8FA998C486D7C88E59@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To: <PH0PR84MB1718925AA3C8FA998C486D7C88E59@PH0PR84MB1718.NAMPRD84.PROD.OUTLOOK.COM>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 5 Apr 2022 00:02:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3RSST6yvv8Oy13RFd6eZ6cS5yX9TOuK6wxXKUO-qdQ=Q@mail.gmail.com>
Message-ID: <CAK8P3a3RSST6yvv8Oy13RFd6eZ6cS5yX9TOuK6wxXKUO-qdQ=Q@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] arch: arm: boot: dts: Introduce HPE GXP Device tree
To: "Hawkins, Nick" <nick.hawkins@hpe.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "Verdun, Jean-Marie" <verdun@hpe.com>, Olof Johansson <olof@lixom.net>, 
	"soc@kernel.org" <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:0hcosptNNCPRejT/2YsnbKv8iI6HQ8AO84/DD4H9dtdXcCYaeOc
 1SDjIt+IsHM+70TCxC66vhGD1XeLc63GI1s3ZxCL3KtiT1splEk2l9VBpqgqa1FLmEqdE4P
 w+j0x/TJlA8IDeWun6UxsGAldKd1n8MWWi4MeRWhNkN4rvToRPtT+LGUzepcIjUqByPstJJ
 3QJmJzOYzO4ye63pfjklw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:hlRPWoEcxVo=:LVETsYkJ0LgzUvLKUUc1KP
 m8oVXiGGSusi6EWmZlJ1dAkcyaYNCR2Y7hD6M3QdKip4IHO4ksMmyMJC1EUizUPjBbbGlZjDp
 mHYdt0yTr9Y8m9HVoVpwjXKwZV6OGOSRY2NTY4fF2J/0IhDHhTWFXdeFk/XFmcWb44t3TuRCC
 5SSuSr45q8w+ZM5p9eMG2JHFJ+V35wivmMdPN8NU44Wf1EmFs8p4UxBbtpOrincy9lbsPdpts
 R/0BCcZT6pxj9JuJH+tZezdn8qku2hWJBlhYuB2EG35q+79JN/HzCwk3zai5VqnJL64LhiAuB
 L73O+J9KBdGiUDIcYWhDnTXNENrETnMdi6bFWkvRKcyIDfZPvQKK+3cJrRHbrlFCAAfFzyy2D
 FSbFfg/1TNc0qstI6xQ4Dd+30MhlVmnAqLRMc8WbsNc1nlzkRpLchSDSm0Wph9jqryRs4q0YN
 DVj7BvSjuRnEo7tiXkXcpokWIuOVFua35sp9eixSDe35H8UkqD3HbEI9FMUnuUL275M9IAU9K
 SyoejyHDTUsk65jfy2PHHTY0nRf7D82kQtTDu2/OPWFfMOh7hYPqzOxIn234/6obFINtCDTED
 p8v+Fk73BM1At2i+oQp6y7SnEcqhlEA28CzP8IsfMghX+lXecg8o7n4dK/NzUSLi6I+FBEiDB
 h2Ttf+NwahkEVPylcH0KyPZ0laEOq/WZutNe8GqkYQo9wRywVUkZeoOBaFjKrAkj5qSQ=

On Mon, Apr 4, 2022 at 10:22 PM Hawkins, Nick <nick.hawkins@hpe.com> wrote:
> > > I would put it into drivers/clocksource/, I don't think drivers/mtd would be any better, but there is a chance that the clocksource maintainers don't want to have the watchdog code in their tree.
>
> While trying to discover how to creating two devices in one driver I ran across an interesting .dtsi and I was wondering if this would be a valid approach for my situation as well. The pertinent files are:
> 1) drivers/clocksource/timer-digicolor.c
> 2) arch/arm/boot/dts/cx92755.dtsi
> 3) drivers/watchdog/digicolor_wdt.c
>
> Here they are just sharing the same register area:
>
> timer@f0000fc0 {
>         compatible = "cnxt,cx92755-timer";
>         reg = <0xf0000fc0 0x40>;
>         interrupts = <19>, <31>, <34>, <35>, <52>, <53>, <54>, <55>;
>         clocks = <&main_clk>;
> };
>
> rtc@f0000c30 {
>         compatible = "cnxt,cx92755-rtc";
>         reg = <0xf0000c30 0x18>;
>         interrupts = <25>;
> };
>
> watchdog@f0000fc0 {
>         compatible = "cnxt,cx92755-wdt";
>         reg = <0xf0000fc0 0x8>;
>         clocks = <&main_clk>;
>         timeout-sec = <15>;
> };

Right, it is possible to make this work, but it's not recommended, and you have
to work around the sanity checks in the code that try to keep you from doing it
wrong, as well as any tooling that tries to check for these in the DT.

         Arnd
