Return-Path: <SRS0=VTwl=JP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C00A1C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Apr 2021 19:25:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BB86610CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Apr 2021 19:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BB86610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ui1bIuVeuCFTZPOCO9qUh594dl6wlM49hPxTs/PIU0Y=; b=nift6GcZATVzgYTlStLQ4lQ9e4
	Nr+z76onardI7FziVzKIJSjJY/o2usdhQNPSrKBWZ2vo+QdqtHFM7xmOex07xYaAhvknC3udN9QQ1
	9j0Pkw488c1Z0Ew0K+fCLg54UBJWZjQ+DgaGR8Hv+BryaX+Gyyg5idJ4dMMnyQ7uMV9iJXXngHM0I
	3bwLD6vmh/UMnIeVq0VTL14v/rmg/9yJuABHJnK3d22rygQLc5u9xk+wgPqI7/NzElWAeydjL+l7A
	92c0qkdeGB3tD/PybHanTVQ4xrGQ5+GkNq9dwRthu1mzF3sNK/XNkYGM4t49EEKJBKbqr9iwwF574
	aWKOFiDw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYD13-008T17-VT; Sun, 18 Apr 2021 19:23:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYD11-008T0v-TM
 for linux-arm-kernel@desiato.infradead.org; Sun, 18 Apr 2021 19:23:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:List-Id:To:Subject:
 Message-ID:Date:From:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=h//EOCmVElKFC2OrUR3KpxfaXn4LFokHT6Uw4+vir6E=; b=jkHmDAaED8WfHBPFoK2BI8cpLa
 kkHgiNNtlbe2HI5sL1osB7e/olmcRGyupNwujOCF097CS2JNE4Zr6UKCwnJK7L8Wv54Xxd1lQLuqC
 StSu5a6inuqADaFjdOd+QomlhMu9h75f6CRbEB+Aa0SkgSd1YMFX9xvbUQlyKUDnEGqaDmMD4GFQD
 i48zOl5s70EWEHsnRIMTrQuQMwz7Qq56Ii/o+hWLQa0ebsgHESGeC8mo+BtqRCpEqS9hRiVn5WnNR
 ZyK6fX0lE9s0R+U/IkqepPt9WLxAMCx/dve/6U/e13nk9kJoGF2vG0rQdgJkDI4UV6I0BQYgteAVP
 3kvau4VQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYD0z-00AcVB-0c
 for linux-arm-kernel@lists.infradead.org; Sun, 18 Apr 2021 19:23:30 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 26999610CC
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 18 Apr 2021 19:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618773808;
 bh=iB9FjRppP4uPT4mx09Rjt69lVT8mFvl7Tz7PFiF60P8=;
 h=From:Date:Subject:To:List-Id:Cc:From;
 b=uFpyLfh3FkDQDFV0qW4xd/qVVi3sSe0FvtRvhW6tBQVrIsumFnW44LpoNv/H/aU0W
 krv5i6gbWP6mhFrQp7cL2Ana+8m5hTEBxb2q18xFGwFDpKO7VPwkSlLm7BG1JU/NFs
 vmuaWMVx7oVtmEVpHqEIkJuTPfzmc18jqUid7SOYkTe3aJmmBZgh6LkQxvAPH2SWzB
 KdGVjQq+L5ulU7aqNp/AIKikBB6DIb47lb3dPmj+yCk0NHdqp7gl2K7o1mjtOG1NK9
 bkcxjlRiCAdTYbb1GC4eJ5nCqLC3aVjvsJnFFzPE3UcDFq+JzTVm9+dtf2aqtc6fVl
 0nKpbkypFCYCQ==
Received: by mail-wm1-f48.google.com with SMTP id w186so12479494wmg.3
 for <linux-arm-kernel@lists.infradead.org>;
 Sun, 18 Apr 2021 12:23:28 -0700 (PDT)
X-Gm-Message-State: AOAM533KtrYN5eik7ybFln17m3Hav/2cHOAiZXlamoegD/X075s557uF
 kB8i+EAzMECg+RQ/IP1tQpRa5kyhWyG04N/SK5s=
X-Google-Smtp-Source: ABdhPJyep2PToWXfhdBPzkd1wKVu3Qxp/XkPWTmabl4hRd99S2xazTQ77LZjLurtd7N8uEdQMwNXXOFH2hVTyD6hkE0=
X-Received: by 2002:a05:600c:2282:: with SMTP id
 2mr18324883wmf.84.1618773806698; 
 Sun, 18 Apr 2021 12:23:26 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Sun, 18 Apr 2021 21:23:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3h0QDvv-0yTVOMjx-8vUUcAFTQ6di71b2DwCELHNpPLw@mail.gmail.com>
Message-ID: <CAK8P3a3h0QDvv-0yTVOMjx-8vUUcAFTQ6di71b2DwCELHNpPLw@mail.gmail.com>
Subject: ARM SoC fixes for v5.12, part 2
To: Linus Torvalds <torvalds@linux-foundation.org>
List-Id: <soc.lore.kernel.org>
Cc: SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tony Lindgren <tony@atomide.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_122329_128238_CED3281F 
X-CRM114-Status: GOOD (  14.07  )
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
Message-ID: <20210418192310.y-OTUzl7GemyBYkRqO6v0yZBX2q55zk16WNRGaoN6LQ@z>

The following changes since commit e49d033bddf5b565044e2abe4241353959bc9120:

  Linux 5.12-rc6 (2021-04-04 14:15:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-fixes-5.12-3

for you to fetch changes up to b9a9786a13ea158ee3b23614217f2e3158178421:

  Merge tag 'omap-for-v5.12/fixes-rc6-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/fixes (2021-04-08 17:56:09 +0200)

----------------------------------------------------------------
ARM SoC fixes for v5.12, part 2

Another smaller set of fixes for three of the Arm platforms:

TI OMAP:

    Fix swapped mmc device order also for omap3 that got changed with the
    recent PROBE_PREFER_ASYNCHRONOUS changes. While eventually the aliases
    should be board specific, all the mmc device instances are all there in
    the SoC, and we do probe them by default so that PM runtime can idle the
    devices if left enabled from the bootloader.

Qualcomm Snapdragon:

    This bypasses the, recently introduced, interconnect handling in the
    GENI (serial engine) driver when running off ACPI, as this causes the
    GENI probe to fail and the Lenovo Yoga C630 to boot without keyboard
    and touchpad.

Allwinner:

    One 32kHz clock fix for the beelink gs1, a CD polarity fix for the SoPine,
    some MAINTAINERS maintainance, and a clk / reset switch to our headers.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Andre Przywara (1):
      arm64: dts: allwinner: Fix SD card CD GPIO for SOPine systems

Arnd Bergmann (3):
      Merge tag 'sunxi-fixes-for-5.12-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux into
arm/fixes
      Merge tag 'qcom-drivers-fixes-for-5.12' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/fixes
      Merge tag 'omap-for-v5.12/fixes-rc6-signed' of
git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap into
arm/fixes

Chen-Yu Tsai (1):
      arm64: dts: allwinner: h6: Switch to macros for RSB clock/reset indices

Jernej Skrabec (1):
      arm64: dts: allwinner: h6: beelink-gs1: Remove ext. 32 kHz osc reference

Maxime Ripard (2):
      MAINTAINERS: Add our new mailing-list
      MAINTAINERS: Match on allwinner keyword

Shawn Guo (1):
      soc: qcom: geni: shield geni_icc_get() for ACPI boot

Tony Lindgren (3):
      ARM: OMAP2+: Fix warning for omap_init_time_of()
      ARM: dts: Fix swapped mmc order for omap3
      ARM: OMAP2+: Fix uninitialized sr_inst

 MAINTAINERS                                             | 2 ++
 arch/arm/boot/dts/omap3.dtsi                            | 3 +++
 arch/arm/mach-omap2/board-generic.c                     | 2 +-
 arch/arm/mach-omap2/sr_device.c                         | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64-pine64-lts.dts | 4 ++++
 arch/arm64/boot/dts/allwinner/sun50i-a64-sopine.dtsi    | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6-beelink-gs1.dts | 4 ----
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi            | 4 ++--
 drivers/soc/qcom/qcom-geni-se.c                         | 3 +++
 9 files changed, 17 insertions(+), 9 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
