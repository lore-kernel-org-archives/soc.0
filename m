Return-Path: <SRS0=wVjZ=PA=z3ntu.xyz=luca@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C768EC433EF
	for <soc@archiver.kernel.org>; Tue, 12 Oct 2021 17:54:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8339A60EFE; Tue, 12 Oct 2021 17:54:46 +0000 (UTC)
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE28461050;
	Tue, 12 Oct 2021 17:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EE28461050
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=z3ntu.xyz
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=z3ntu.xyz
Received: from g550jk.localnet (unknown [62.240.134.74])
	by mail.z3ntu.xyz (Postfix) with ESMTPSA id 493A6C9740;
	Tue, 12 Oct 2021 17:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
	t=1634061284; bh=vw/u1+TRdbPbMlWhcKJ4P6ntQXXSxoIiYsV1GYAXpDs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=EszIvTl8z/YYB8i9IdSQ7Z76+m2YEuxr3PMJR+fXCfYcDwb2ob5fYnKjks+FvKxZ9
	 BenrzW5z5PIl0OEBejVr2nfL01SYY2R9UekBHsiD38G1bpMqb2xWhdpygoh7gFAut7
	 MdaJmhMQ9XnPcwJSuHVQ+ZpEglW07L7ts5PvFbTw=
From: Luca Weiss <luca@z3ntu.xyz>
To: linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, Arnd Bergmann <arnd@arndb.de>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, Fabien Parent <fparent@baylibre.com>, Hsin-Yi Wang <hsinyi@chromium.org>, Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, Seiya Wang <seiya.wang@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, soc@kernel.org
Subject: Re: [PATCH 2/2] arm: dts: mt6589: Add device tree for Fairphone 1
Date: Tue, 12 Oct 2021 19:54:38 +0200
Message-ID: <5755444.lOV4Wx5bFT@g550jk>
In-Reply-To: <686404ce-2e0b-5470-b095-1c1fd7c18250@gmail.com>
References: <20211005202833.96526-1-luca@z3ntu.xyz> <20211005202833.96526-2-luca@z3ntu.xyz> <686404ce-2e0b-5470-b095-1c1fd7c18250@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Matthias,

On Freitag, 8. Oktober 2021 13:49:25 CEST Matthias Brugger wrote:
> On 05/10/2021 22:28, Luca Weiss wrote:
> > Add rudimentary support for the Fairphone 1, based on MT6589 to boot to
> > UART console.
> > 
> > The recently added SMP support needs to be disabled for this board as
> > the kernel panics executing /init with it, even though the CPUs seem to
> > start up fine - maybe a stability issue.
> > 
> > [    0.072010] smp: Bringing up secondary CPUs ...
> > [    0.131888] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
> > [    0.191889] CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
> > [    0.251890] CPU3: thread -1, cpu 3, socket 0, mpidr 80000003
> > [    0.251982] smp: Brought up 1 node, 4 CPUs
> > [    0.254745] SMP: Total of 4 processors activated (7982.28 BogoMIPS).
> > [    0.255582] CPU: All CPU(s) started in SVC mode.
> > 
> > [    0.472039] Run /init as init process
> > [    0.473317] Kernel panic - not syncing: Attempted to kill init!
> > exitcode=0x00000004
> Would be nice to find out why. Did you tried to boot the system with
> enable-method set but with bringing up just one or two cpus?

Answered further down.

> 
> > Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> > ---
> > 
> >   arch/arm/boot/dts/Makefile                 |  1 +
> >   arch/arm/boot/dts/mt6589-fairphone-fp1.dts | 30 ++++++++++++++++++++++
> >   2 files changed, 31 insertions(+)
> >   create mode 100644 arch/arm/boot/dts/mt6589-fairphone-fp1.dts
> > 
> > diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
> > index 7e0934180724..24f402db2613 100644
> > --- a/arch/arm/boot/dts/Makefile
> > +++ b/arch/arm/boot/dts/Makefile
> > @@ -1437,6 +1437,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += \
> > 
> >   	mt2701-evb.dtb \
> >   	mt6580-evbp1.dtb \
> >   	mt6589-aquaris5.dtb \
> > 
> > +	mt6589-fairphone-fp1.dtb \
> > 
> >   	mt6592-evb.dtb \
> >   	mt7623a-rfb-emmc.dtb \
> >   	mt7623a-rfb-nand.dtb \
> > 
> > diff --git a/arch/arm/boot/dts/mt6589-fairphone-fp1.dts
> > b/arch/arm/boot/dts/mt6589-fairphone-fp1.dts new file mode 100644
> > index 000000000000..32c14ecf2244
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/mt6589-fairphone-fp1.dts
> > @@ -0,0 +1,30 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2021, Luca Weiss <luca@z3ntu.xyz>
> > + */
> > +
> > +/dts-v1/;
> > +#include "mt6589.dtsi"
> > +
> > +/ {
> > +	model = "Fairphone 1";
> > +	compatible = "fairphone,fp1", "mediatek,mt6589";
> > +
> > +	chosen {
> > +		stdout-path = &uart3;
> > +	};
> > +
> > +	cpus {
> 
> I'd expected "&cpus" why can we overwrite delete the node property like this
> here?

Both results in the same, dtc just merges everything together, so as long as 
the node name is identical, it works.
Also I cannot use &cpus because cpus in mt6589.dtsi doesn't have a label set.

Regarding SMP:
I have tried setting maxcpus=2 in cmdline and that still makes the kernel 
panic. With maxcpus=1 and leaving the deleting out of the dts the kernel is 
stable and works properly.

So I think it's better to leave this out of the dts and keep maxcpus=1 in 
cmdline (until this gets fixed).

I've also heard from the person adding enable-method to mt6589.dtsi that it 
still works on their board, so something's different, maybe a different SoC 
revision, different bootloader behavior or whatever.

If that's fine with you, I'll send a v2 with that fixed.

> > +		/* SMP is not stable on this board, makes the kernel 
panic */
> > +		/delete-property/ enable-method;
> > +	};
> > +
> > +	memory {

Also I was told off-list that this should be called memory@80000000 because of 
the reg, will fix in v2.

Regards
Luca

> > +		device_type = "memory";
> > +		reg = <0x80000000 0x40000000>;
> > +	};
> > +};
> > +
> > +&uart3 {
> > +	status = "okay";
> > +};




