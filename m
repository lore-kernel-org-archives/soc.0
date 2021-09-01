Return-Path: <SRS0=S75E=NX=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BDB4C432BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Sep 2021 19:56:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4870360F90
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Sep 2021 19:56:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4870360F90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QfGF0qRO+4nWsHKnenPHfBh7eLLd1tl2QklFjUvCplA=; b=bTCvFdFEwqxqUw
	rPY24gwDITmwRcKTzSwk+F7dXnsSJ73D0s3zVe8tKO6N5AaO09AAh2WPEmtBj4GGHWwEjaXHmiUJd
	Fxmttn5gPpGe0Yh+qQWvpq8+Nq7TQ6hQrCeMsJdjP1Efq34u9Jpvk4GzUhY/lxnIsS4+QtLIWo9li
	YlDXfVIEExjZtRB9qUm8Ne6/LH1hVMWlbq0jMYG183tCq46iJjKQPZi3Kbl8PDzfMtXdvonD+2vZD
	VbweLLvtIeAg3LeTwWhbO9ucBFBRNkaUH1397k4HKFUHaq65qkrz2RrESgiPt0caM6ZTlzAXDASUW
	YoOcFCzZSnz1I0wUTrOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLWJy-0078lh-Na; Wed, 01 Sep 2021 19:54:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLWJu-0078lH-T7
 for linux-arm-kernel@lists.infradead.org; Wed, 01 Sep 2021 19:54:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EA56260F3A
 for <linux-arm-kernel@lists.infradead.org>;
 Wed,  1 Sep 2021 19:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630526090;
 bh=pH6akMMCftdaAdl/OZD0bcwyKaRWhox1RHbH2G0EZbs=;
 h=From:Date:Subject:To:List-Id:Cc:From;
 b=AXuzsMPdTVrtWKg7QvxshmW7mnA4KNrko1U6VF6xFkyVpPlrHoT9D/VI/nVXQxesk
 qDPG+rC02skymaiv07v2i5mzIgjKEgGfLAihjD5vr7zmdgTzHO1JKdpv0MJQE7FaFU
 nKJGYMJed/n/yvX3Iy8OhKqVMQOW60UkE1bQHT2mJGQ/bXHkvi7rjWByPUI5R572Ts
 ab69SDdqhavFx8wnePvTlMkQT6t+uRovKc6iwX90NxSwgzqCWmGdPLuA8I/3BoHsGD
 Ys+Yu/HBfVQgrPfCfLynuyFrOB5MvY8SDwJnGw+c0r2JWVmV9zTDDT89DchgTRyeA+
 QCjljnafqBX3Q==
Received: by mail-wr1-f51.google.com with SMTP id v10so1364273wrd.4
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 01 Sep 2021 12:54:49 -0700 (PDT)
X-Gm-Message-State: AOAM5319HVDiFox8A5U7DLtNOJ6K5oJEgGOp6hhBrZbEDSEz8l7Hizwi
 dj/vRlgHFJ3X4c2cYBuNDAMzojmO1/VTyJCdSqY=
X-Google-Smtp-Source: ABdhPJwnnitnVbJ+nH9+HM07f9rYnl2x86i2JnjsTb9oPXz3oPngU0lYo94kP4dHEvxPm+1FPIcn3RZjXcc1xKgSLnM=
X-Received: by 2002:a5d:58c8:: with SMTP id o8mr1183593wrf.361.1630526088549; 
 Wed, 01 Sep 2021 12:54:48 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 1 Sep 2021 19:54:32 +0000
X-Gmail-Original-Message-ID: <CAK8P3a2GtDmpEz0KzeeKXEZZScLff-_=vv3UkOr3Ds9605g-oA@mail.gmail.com>
Message-ID: <CAK8P3a2GtDmpEz0KzeeKXEZZScLff-_=vv3UkOr3Ds9605g-oA@mail.gmail.com>
Subject: [GIT PULL 0/4] ARM SoC branches for 5.15
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_125451_015663_47D922DA 
X-CRM114-Status: UNSURE (   9.94  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210901195432.6anYbhUsQhj_hQtL-lRdBmC2qc7Bs9becYOw8k6MjzY@z>

I'm still on vacation, so here is a little shorter summary than
usual. We got a few new SoCs, all of which are related to
already supported ones, and some cleanup for 32-bit platforms.
Overall nothing exceptional this time, just as we like it for
what will likely become the LTS kernel.

There are four branches included this time, but I have another
"late" branch for a few things that got sent at the last minute.
Unless there are any problems, I plan to send those early next
week.

There are 740 patches in total, mostly from the usual suspects.
I pulled in 61 branches from 22 platform and subsystem maintainers.
The most patches came from:

     39 Linus Walleij
     32 Michal Simek
     31 Konrad Dybcio
     29 Geert Uytterhoeven
     26 Claudiu Beznea
     25 Dmitry Osipenko
     16 Grygorii Strashko
     16 Christoph Niedermaier
     14 AngeloGioacchino Del Regno
     13 Vinod Koul
     13 Suman Anna
     13 Alain Volmat
     12 Tao Ren
     12 Robin Gong
     12 Peter Geis
     12 Johan Jonker
     10 Michael Riesch
     10 Cristian Marussi

Dirstat:
   0.4% Documentation/devicetree/bindings/arm/
   0.4% Documentation/devicetree/bindings/bus/
   0.3% Documentation/devicetree/bindings/gpio/
   1.3% Documentation/devicetree/bindings/power/
   0.4% Documentation/devicetree/bindings/reset/
   0.4% Documentation/devicetree/bindings/soc/qcom/
   0.4% Documentation/devicetree/bindings/
  34.2% arch/arm/boot/dts/
   0.5% arch/arm/configs/
   1.7% arch/arm/mach-at91/
   0.9% arch/arm/mach-ep93xx/
   7.7% arch/arm/mach-ixp4xx/
   0.3% arch/arm/
   0.2% arch/arm64/boot/dts/amlogic/
   0.2% arch/arm64/boot/dts/exynos/
   5.7% arch/arm64/boot/dts/freescale/
   3.6% arch/arm64/boot/dts/marvell/
   1.3% arch/arm64/boot/dts/nvidia/
  14.1% arch/arm64/boot/dts/qcom/
   2.5% arch/arm64/boot/dts/renesas/
   6.8% arch/arm64/boot/dts/rockchip/
   0.4% arch/arm64/boot/dts/ti/
   4.7% arch/arm64/boot/dts/xilinx/
   0.7% drivers/ata/
   1.0% drivers/bus/
   0.2% drivers/dma/
   3.6% drivers/firmware/arm_scmi/
   0.2% drivers/firmware/
   0.3% drivers/memory/
   0.5% drivers/reset/
   0.7% drivers/soc/mediatek/
   0.4% drivers/soc/qcom/
   0.6% drivers/soc/
   0.6% drivers/watchdog/
   0.2% drivers/
   0.4% include/soc/at91/
   0.2% include/

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
