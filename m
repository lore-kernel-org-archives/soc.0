Return-Path: <SRS0=6Im1=YW=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECBC8C00140
	for <soc@archiver.kernel.org>; Thu, 18 Aug 2022 12:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AB12CC433D7; Thu, 18 Aug 2022 12:07:01 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8F0F3C433D6;
	Thu, 18 Aug 2022 12:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8F0F3C433D6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-ed1-f54.google.com ([209.85.208.54]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1Mi2Fj-1nlTrk0uRd-00e5fq; Thu, 18 Aug 2022 14:06:57 +0200
Received: by mail-ed1-f54.google.com with SMTP id r4so1605828edi.8;
        Thu, 18 Aug 2022 05:06:57 -0700 (PDT)
X-Gm-Message-State: ACgBeo3igBqNg+hk1AOsKmrlvwPV2bguquWxE21tWL0Q0QOPTq0n50Z5
	JcjkidQgnE8NBs5DTwFSbm5iaFKMXFFYy9D1QZQ=
X-Google-Smtp-Source: AA6agR7Sz6NPJtIQZSUoxG0aPUAHiTh3EAkYGAZrmlAF1RKyRr2hih2GPF/vQbUl19Y1aDytKituxOjsVxorJ/QDiyA=
X-Received: by 2002:a05:6402:520e:b0:43d:df14:fbed with SMTP id
 s14-20020a056402520e00b0043ddf14fbedmr2078468edd.16.1660824416882; Thu, 18
 Aug 2022 05:06:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220817071539.176110-1-quan@os.amperecomputing.com>
 <20220817071539.176110-3-quan@os.amperecomputing.com> <CACPK8XdDpG3ONM1=-E6qvHL1FgMNWSMPoL_sVGJK6BmmnT3w_w@mail.gmail.com>
In-Reply-To: <CACPK8XdDpG3ONM1=-E6qvHL1FgMNWSMPoL_sVGJK6BmmnT3w_w@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 18 Aug 2022 14:06:40 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2LZKfZpdTQ-R4o9mJ6dk52VRF+Bxj=PJEx-1MA4yH8+w@mail.gmail.com>
Message-ID: <CAK8P3a2LZKfZpdTQ-R4o9mJ6dk52VRF+Bxj=PJEx-1MA4yH8+w@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: aspeed: Add device tree for Ampere's Mt.
 Mitchell BMC
To: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
Cc: Quan Nguyen <quan@os.amperecomputing.com>, Arnd Bergmann <arnd@arndb.de>, openbmc@lists.ozlabs.org, 
	Olof Johansson <olof@lixom.net>, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Jeffery <andrew@aj.id.au>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	Open Source Submission <patches@amperecomputing.com>, Phong Vo <phong@os.amperecomputing.com>, 
	thang@os.amperecomputing.com
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:X6mHFu+/bWo5pvYTaig0Q6UWd4gxr8GVfJuolhJqYIvLBEFE31k
 tHvP/3ylu8NzldcTzE3Ex9QmkR2J2rDDke4wKuc/uCBCiuAo3zuqhMFaKdQf1Fbr0ad/rQQ
 M9vOi0VEO14E0NjVvkYvYI1zhfp2Yj3OE3Y1UPack7acyJAQmtS7NJODr3CNBdOIwPqTK0R
 XhjxDErcVsOaHFkCaeHLw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aoJRnwXIp2o=:/D6AoY9BzM00QOBkbDEPKL
 S3hFvlvM3/JKnA0v9tRU0M2HtnimzNJKDRbwcvUktA26rzs152552lpPkNayz3glpYZDPolvh
 0dNMTnlgQgS7C+Pl7eFAu8MRMDUoOoAP7RL+U3Iy1B03VYvZw1gwcXxc7fAtRUtkdnpiBU4FY
 zGdDWlJNMhcB0pz3K881/qv2XOZpzATYQFuen2KcwYsBbCMwZKXF4MlxfcJvs+D7r3/+Lmpdm
 e60qULktrLiT23OT8YLYzIEuDTOoP+92bWJiys8DXYB8icf9IqfGlEggFebiDKOO8gKM1Kyun
 /cEq6YFW2GQ9XbxW8qI2xBwHQ8aY1fU/aoYfgUD/pkTf5VHLh6RSgS/7vHzONQALT6lYtCb1r
 R0bqs8KCnBCym+Gr6ck5Qte521Iq7ArY9r7jOgKotLlD/go4b/cfGxsKGxVvB+Ibdfkur2mV9
 QexKnwY5PWah6fsYSpZfuT4zc7EUoaxLsrDW0aD2Xcav76cM1lQDdd9ky0sUX6dkEOL8EJk1c
 5pstiLgx8n7dHxROQ2pTu+XPOQdf3qgNVyUXdMTkJtr4kdEEZmuofeaMSGFHUKI4mtC7/smke
 qGDgdBq3fXBiNGIFG7d2sLkzMui98SFyOskx9B1P5wISzhoT/g/PJSrpzR7hTTS2eInhPQU6u
 /HRr0JPoRMLZt9LFdzrls/6LAU4tn+nzcDWNLyWwVAZQDBq23Tvkp+jjijLIceph+n9DXb+H1
 Kw1RZWa7bBgLTnW60rozaA8Jh/AwnALOF+6hez5AHwJuww+faYFkeFyTDEG8jwOQkb+B+ZFB0
 P90O63iKU0XUIjJO43MHNZ67jW1VVvLIiILzKGr1DwMxRAf1ZfKalKAZUTwUpU6alb4rz03A1
 eBGilazbDPrLy/znuZhg==

On Thu, Aug 18, 2022 at 9:33 AM Joel Stanley <joel@jms.id.au> wrote:
> > +
> > +/ {
> > +       model = "Ampere Mt.Mitchell BMC";
> > +       compatible = "ampere,mtmitchell-bmc", "aspeed,ast2600";
> > +
> > +       chosen {
> > +               stdout-path = &uart5;
>
> I know you've been told by Arnd and others to remove the default
> command line here, but without it your device tree fails to produce
> any output in my tests:
>
> qemu-system-arm -M ast2600-evb -nographic -dtb
> arch/arm/boot/dts/aspeed-bmc-ampere-mtmitchell.dtb -kernel
> arch/arm/boot/zImage
>
> Without a working test, I can't tell the difference between a broken
> device tree and one that omits the serial device on the command line.
> Can you work with Arnd to come to a solution here?

If you use qemu as the boot loader, I think the expected way to do
this is to use the "-append" command line argument along with "-kernel".

Is there any reason for this machine to be special here?

       Arnd
