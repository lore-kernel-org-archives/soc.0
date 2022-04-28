Return-Path: <SRS0=8exe=VG=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3E2C433F5
	for <soc@archiver.kernel.org>; Thu, 28 Apr 2022 20:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 38E53C385AD; Thu, 28 Apr 2022 20:57:19 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9BE85C385A9;
	Thu, 28 Apr 2022 20:57:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9BE85C385A9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=arndb.de
Received: from mail-yb1-f174.google.com ([209.85.219.174]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MYehP-1nNmae1rVb-00VeBC; Thu, 28 Apr 2022 22:57:15 +0200
Received: by mail-yb1-f174.google.com with SMTP id i38so11140821ybj.13;
        Thu, 28 Apr 2022 13:57:15 -0700 (PDT)
X-Gm-Message-State: AOAM533HI0sMH8KdD7ljFOTb4ctYeEwWy9xzBTk+wO0ikQHQGIcEwyrS
	j1Yn2J2uBVbJEEYc3QG6JsmGM+XaBXy7wKInTn8=
X-Google-Smtp-Source: ABdhPJxZ0jJTKv13jEU1ixYQwpduWcc1BZiMpsGqsbIhCzoeqzzL54Ca2wlwAbMvXrkH4d8qIV52yQztcIMUSlYcS+s=
X-Received: by 2002:a25:d3c2:0:b0:645:74df:f43d with SMTP id
 e185-20020a25d3c2000000b0064574dff43dmr32292197ybf.394.1651179434204; Thu, 28
 Apr 2022 13:57:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220427162123.110458-1-maukka@ext.kapsi.fi> <CAK8P3a0p-ev50UfGiHCpMM5Jz5Mf8pdfQtNep0M7qi7PANSBVg@mail.gmail.com>
 <1509d16c-d244-19c7-610b-4c8ea8ca1624@ext.kapsi.fi>
In-Reply-To: <1509d16c-d244-19c7-610b-4c8ea8ca1624@ext.kapsi.fi>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 28 Apr 2022 22:56:58 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3g4CZjiVHHoBqJLrdN0chghaskODVvtWY1Fjj8TcB8KQ@mail.gmail.com>
Message-ID: <CAK8P3a3g4CZjiVHHoBqJLrdN0chghaskODVvtWY1Fjj8TcB8KQ@mail.gmail.com>
Subject: Re: [RFC RFT PATCH v1 0/1] ARM: orion5x: convert D-Link DNS-323 to
 the Device Tree
To: Mauri Sandberg <maukka@ext.kapsi.fi>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, SoC Team <soc@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>, 
	Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:cgnQRQg2aspKA8oLShLUnNY3iu/0xniweKZQQQ76AtDuF6+2P0w
 N5sIuAh3N2DJUrxGXQZMv5osJLC82qnd2Rli7qn/PrTd+s/1MOXiUfrY62mm+TtbXSp4csu
 S371fvX1lhGLi8QSGPGWlTzcKBGwe3rUPYWP4VxwlAaUDcQDs7wEwetArjg3JSW8LWlRz0s
 SMKkF3w1BMBH90RaoPkaw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Zsfk77LJL7w=:uEhPRj+6H5qownHxfGLqp8
 TiaD7wjA3LPMEB2eAQ6DCQq+GJT3dOucdQ+n8/25CHQ9/Wo/UgISZKFb+5UP5txCUN0XPXZZa
 /Kg/mu14OtmvNzl44oJGaBb2B3hw618q8xFsl0EAwlgAI0Jqrs9YUcZBYQAoT3uuPBrpM3NFs
 SbKUrhOnMvfHImhMzWyUEaoHgyIELzuRsNrhqPKxlMPUVmiNGvukFsHqDTv0ffAuYlskGebVZ
 paJyYZKSLpxuP7qeKRvtxr9/01dREoNMfAWBYsq7v1z3JGx7KS+U0WgTLVIOo8DP3xhAiat3V
 2yzde0FT9RxjSfx85RxnZj5GHEIwWsgLBZtNeVw90vp4ONrXVeHRwcYaIk2dJvDYm3ZVr2D+X
 ICCYdNR8FvBMa5L5pXaP9RAmAIaeQZCtbYiTWSsE9SVLeZ5iZWQ58KZo/S1uapfR1nvATKgHg
 PTpvpJXEi6VnYSuPv8mOGcuv+zxA3Junm7BE+aHuTDsghUp3pBP8oCnbZpW1hTk17eYhnFAee
 cph1Jg3wyuF8pLDKn91XAr8UpuRVTKW/yxmYP3BMaCDKfU0bdc2tyQREoNrD0s0AOTO4bSa/K
 DYzENymAUW5U58fcWqWk+uGiYTtF+4i28ksJ2/R2g1UUD2+tS5Bvuf+EhdGhZDCi2wnBulykT
 NTYxm9jstme/WLC2I7pa7Ha7FUvfjL4eSjQ9LQcRxtwV1z6PDODNdtOa2Ysm2XyIakJSN5Ca2
 RiOwcxAeRRxB6RbK32r3EK7wP/FDjZ6EIIc7U2yF+F7Hj+QHklmdB3vZpDHD5RQb8jNp17F1v
 EDtLOt0wc9f9MV66ru63LRvtCDFOaesxxih8fwcgD8Ey7MyWN4=

On Thu, Apr 28, 2022 at 10:01 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:
> On 27.4.2022 21.10, Arnd Bergmann wrote:
> > On Wed, Apr 27, 2022 at 6:21 PM Mauri Sandberg <maukka@ext.kapsi.fi> wrote:
> > This is all normal: with a board file, all on-board IRQs are statically
> > assigned to fixed numbers. With DT based boot, IRQ controllers
> > usually define their own IRQ domains, which get a number space assigned
> > according to probe order, and above the preallocated IRQ numbers.
> >
> >> - sata_mv fails to initialise with -22 (-EINVAL)
> >
> > No idea, I'd try inserting a printk in every code path that can return -EINVAL
> > from there
> >
> I had something like that but I didn't get any wiser immediately. Then I
> suspected it's something to do with initialisation of the PCIe bus and
> that clashing with sata_mv initialisation and thought it's better to
> ask. The PCIe initialisation uses hardwired irq and maybe that was
> getting in the way. Is there a way to describe the PCIe bus in the
> device tree? The initalisation of that bus is done for rev A1 only.

I'm not too familiar with the platform, but my interpretation is that the
DT support here is incomplete:

The DT based PCI probe using drivers/pci/controller/pci-mvebu.c
is not hooked up in orion5x.dtsi, and the traditional pci code does
not work with DT.

I see that orion5x has two separate blocks --  a PCIe host that is
similar to the kirkwood one, and a legacy PCI host that needs
a completely separate driver.

Which of the two do you actually need here?

> >> - there is no concensus on how to get ascii formatted MAC address from mtd
> >>    partitions so eth is not fully functional without setting the MAC from
> >>    userspace
> >
> > Ideally this is handled by the boot loader, but that requires being
> > able to update
> > it. If you cannot, this could perhaps be done using something like
> > https://github.com/zonque/pxa-impedance-matcher
>
> I had a look at the pxa-impedance-matcher but I am not sure how to use
> it. Should it be flashed on the device and then it would the boot the
> rest of the system? Maybe I'll have to add some dns323 specifics there
> too first. On the dns323 there are these mtd partitions MTD1 and MTD2,
> which I am not really sure what they are for. Maybe those could
> accommodate a 3rd stage loader. But I'll consider it as my last resort
> as they put it in their documentation too. In linux-mtd there's been a
> few attempts to find a solution and I am hoping one will be found
> eventually.
>
> Adding support in the u-boot was stalled back in the days for some
> reason and I am not sure I will be much wiser than the previous people
> that were at it. But I have jtag programmer that should be suitable.

I think the idea of the impedance-matcher is that you can combine it
with a DT-enabled kernel image into a file that looks to the existing
boot loader like an old kernel and then provides both a way for
code to run before booting the kernel, and for adding in the DT.

       Arnd
