Return-Path: <SRS0=l7M8=GL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F37C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 17:13:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DBCC22E02
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Jan 2021 17:13:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DBCC22E02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=prkrmid1wzMdxE/JX7g2R5B0Tr3KNIkFU2ISoifYBUM=; b=FVdKHj5uDsF4T9MbtUpIkjfxX5
	5QC9gwx0GyCUui4TeYsOhAdPMQ+HuadZBAapgk28fTlLCXXG6Qwla7SOI1XpL+r2uJHT0CELuwb6g
	cHPcili+sC/m6J4c03LeN+PE88v/jpBicbyk672vtdQ5l9iOraAHHEKMGr6tljkSi17WxmZuOmwbE
	4hMLk0rNmvJzF0sxsXwhFmwv/lzIHM3bcLjWWONnJznKBa3mS046c8nVeNRa/qTLB7hIT3nvQi/4K
	rJAkYL2dIJrKMfEQRuxpkpn20211P4Dl50r2L93dJ+/Q5FOD3tyhMTT3V67XFMq3KXzo0HusTwmql
	IALc5uUg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxvIQ-000416-V2; Fri, 08 Jan 2021 17:11:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxvI1-00040a-5s
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Jan 2021 17:11:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F43122E02
 for <linux-arm-kernel@lists.infradead.org>;
 Fri,  8 Jan 2021 17:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610125864;
 bh=Xc4j0qz7H2FXRAjtz1+jJpsThB7uINBxmDddnINUDgQ=;
 h=From:Date:Subject:To:List-Id:Cc:From;
 b=H9mgeSuHAnONTu+HvY/y2k+dWJA+LknMnJTuKqQ5QZvXJnwl3Op9UVx+WbRuFxJvr
 bIyTVu7dImUJZCs8cv87SGbJsyqanEV4kshqJKrduVOo5KQl/oryBRIhSdQOBJG6Tf
 vWutANr+mJALKG3v66B1GKPovGtYfrhM20KU4v9ANujnj056EfwyVGiHmmQ9GzwqEs
 22tUuuce5Em6EBNJJlPtw8Jz4cXTjiMm/7f/XT6mpRSaUViTC3nWJLY1ZsDeaVzka5
 Z/DT/Ce/16OOS0EDxhnruT/50PlSwzDKI5BzC138hO1/5PO6U1cSpLYtBq6+B4WCRZ
 7PGB/a+AGKnKA==
Received: by mail-ot1-f42.google.com with SMTP id r9so10245146otk.11
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 08 Jan 2021 09:11:04 -0800 (PST)
X-Gm-Message-State: AOAM530H5Q4TFU2szOd+jzLiWB02se5962NHcjKeGpAKiW2xDi7mQbb9
 ejMkNGIGfUAI5BJ50mW3qorhQeDSgMKXgfTqjUA=
X-Google-Smtp-Source: ABdhPJz7qkGenCk7YSSFXPr9juATtboGHKXhOj6RkWr3T33mheh2GHCv/XF3NzC2n3RzgebVnoXyPQB8IW3/qS8iYZY=
X-Received: by 2002:a9d:7a4b:: with SMTP id z11mr3297026otm.305.1610125863473; 
 Fri, 08 Jan 2021 09:11:03 -0800 (PST)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 8 Jan 2021 18:10:47 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3aQwtP9kpujNeErTVHDOxALMtEpg5QQgKJMfQ+ZaFn4w@mail.gmail.com>
Message-ID: <CAK8P3a3aQwtP9kpujNeErTVHDOxALMtEpg5QQgKJMfQ+ZaFn4w@mail.gmail.com>
Subject: [GIT PULL] ARM: SoC fixes for v5.11
To: Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_121105_467905_114C57CA 
X-CRM114-Status: GOOD (  12.10  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: Tony Lindgren <tony@atomide.com>, SoC Team <soc@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210108171047.6ObfgVxJsFnUUNAWhk4vwvMnYvKrMi7vEHMi-TC7xHs@z>

The following changes since commit 69fe24d1d80feac4289778582cf0a15256d59baf:

  firmware: xilinx: Mark pm_api_features_map with static keyword
(2020-12-09 23:00:22 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-fixes-5.11-1

for you to fetch changes up to bac717171971176b78c72d15a8b6961764ab197f:

  ARM: picoxcell: fix missing interrupt-parent properties (2021-01-08
16:23:37 +0100)

----------------------------------------------------------------
ARM: SoC fixes for v5.11

These are a small number of bug fixes that all came in before or during
the merge window, most for the omap platform:

 - One boot regression fix for Nokia N9 (OMAP3).

 - Two small defconfig changes for omap2, to reflect changes in drivers

 - Warning fixes for DT issues on omap2, picoxcell and bitmap SoCs.
   The picoxcell platform will be removed in v5.12, but fixing it
   first makes it easier to backport to the fix to stable kernels
   and get a clean build with new dtc versions

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Aaro Koskinen (1):
      ARM: dts: OMAP3: disable AES on N950/N9

Andreas Kemnade (2):
      ARM: OMAP2+: omap_device: fix idling of devices during probe
      ARM: omap2plus_defconfig: enable SPI GPIO

Andrey Zhizhikin (1):
      ARM: omap2plus_defconfig: drop unused POWER_AVS option

Arnd Bergmann (3):
      Merge tag 'omap-for-v5.10/fixes-rc6-signed' of
git://git.kernel.org/.../tmlind/linux-omap into arm/fixes
      Merge tag 'omap-for-v5.11/defconfig-late-signed' of
git://git.kernel.org/.../tmlind/linux-omap into arm/fixes
      ARM: picoxcell: fix missing interrupt-parent properties

Carl Philipp Klemm (1):
      ARM: omap2: pmic-cpcap: fix maximum voltage to be consistent
with defaults on xt875

Jisheng Zhang (1):
      arm64: dts: bitmain: Use generic "ngpios" rather than "snps,nr-gpios"

Linus Walleij (1):
      ARM: dts: ux500/golden: Set display max brightness

 arch/arm/boot/dts/omap3-n950-n9.dtsi           | 8 ++++++++
 arch/arm/boot/dts/picoxcell-pc3x2.dtsi         | 4 ++++
 arch/arm/boot/dts/ste-ux500-samsung-golden.dts | 1 +
 arch/arm/configs/omap2plus_defconfig           | 7 ++++++-
 arch/arm/mach-omap2/omap_device.c              | 8 +++++---
 arch/arm/mach-omap2/pmic-cpcap.c               | 2 +-
 arch/arm64/boot/dts/bitmain/bm1880.dtsi        | 6 +++---
 7 files changed, 28 insertions(+), 8 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
