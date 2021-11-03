Return-Path: <SRS0=8DV1=PW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA14C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Nov 2021 22:57:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE68361184
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Nov 2021 22:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AE68361184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WYWJAYWBw6SrXcWSFRf2ZZz6XoN+ty2IFUDTnMPLvUI=; b=Mib//WLw5w4sBW6KiSNYmj4Cip
	azTB/vTxMJ7fofpdJ5nkk1plhDVobF6sulerRN11hBTgjcj3accDcztGbJEU1wubF5olqcs1ghAhk
	YmZmtfS7dTCF/Ubm+GfsQ3IMtIxJ9S39Tm61vIKLASdIoyXDi23BhngN/mH6rqVEEtUeJ2IV9yvdr
	FjMOfSHwGOfDwhf5aiu+DIH5cW7Q4ORfRwfXx0xpJWpZFXLV9oe1zn4oDwvatwXj//HUihj9wLOUJ
	7OJPkuLpWVc4Dxz5FJnZJ+4byCV255Fty/9uYxpWNbB3i8aysBN6rrxlRkx44Ee9tzhhzKChPDHh/
	BdooPUuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miPBW-006rRC-SQ; Wed, 03 Nov 2021 22:56:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miPBS-006rQ1-Dt
 for linux-arm-kernel@lists.infradead.org; Wed, 03 Nov 2021 22:56:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id ACE62611C1
 for <linux-arm-kernel@lists.infradead.org>;
 Wed,  3 Nov 2021 22:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635980201;
 bh=LKIzISCHGuvLVtj7yY9nXM5RUWiKpq2yeusvTq1hNZ4=;
 h=References:In-Reply-To:From:Date:Subject:List-Id:To:From;
 b=OonINC0IMTdMlP6x9zb0zOyCzlVV8eWUuZKYHJ78sIE7gI64t3bzIYt7IQzAI3cYU
 9mGbn5q0kouJkRpXHgNpvqoH5tH8e8mpU0RtzdG73lHsu3/OgiTiDfKG/ZkpU69D5k
 6N8R5bb1wGn68rGiX967UYOZ21tZ8kjNdjBvs6zy6CIgFAplPoLvGGT7E61tF+CT4k
 n9q+tNY1xc//PSc8HnX5PT0vBscYpFN4WN17uZr5TWa9QH/BjQo3i2QYWXOU8p7bqO
 eATUUasfeS0XSFgrpVRjZFg9Htt6k0CSGY3oWGp/oRN8WBtQVk4FrGLI6551ZFYV9i
 cAmbOfpHidTqw==
Received: by mail-wm1-f51.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so5854689wme.0
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 03 Nov 2021 15:56:41 -0700 (PDT)
X-Gm-Message-State: AOAM530ATMghThgbPgyALx3BWvtS172XzqPiKvvfHTQH5D8KltSfhVnH
 /2MpZur+T9nNx+eEuD0LTDx7vGupp9klDsKqF20=
X-Google-Smtp-Source: ABdhPJxLvoGtkmhJhFsrNk0uNOilNMGBy9c52nEt2dyqXxqJVZuPYuLEx8Q/JZuVqguAo3KoG8K73lVVt5L9E90uSWM=
X-Received: by 2002:a1c:1c1:: with SMTP id 184mr18832057wmb.1.1635980200249;
 Wed, 03 Nov 2021 15:56:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2FokRce-oN3dRJPihmDPWuqgWfWg1FNG6WKpWiUa4eNQ@mail.gmail.com>
In-Reply-To: <CAK8P3a2FokRce-oN3dRJPihmDPWuqgWfWg1FNG6WKpWiUa4eNQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 3 Nov 2021 23:56:24 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0Y3t+79z1CvdPUBA04M84Fw6ErFKA0oUc74F-MFEDa9Q@mail.gmail.com>
Message-ID: <CAK8P3a0Y3t+79z1CvdPUBA04M84Fw6ErFKA0oUc74F-MFEDa9Q@mail.gmail.com>
Subject: [GIT PULL 4/4] ARM: defconfig updates for 5.16
List-Id: <soc.lore.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_155642_541925_7828939B 
X-CRM114-Status: UNSURE (   8.82  )
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
Message-ID: <20211103225624.DtYgLJc1HmhuTsNhNFBzlvuAFYvX6eLqzPA0j343Hj8@z>

The following changes since commit 5816b3e6577eaa676ceb00a848f0fd65fe2adc29:

  Linux 5.15-rc3 (2021-09-26 14:08:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/defconfig-5.16

for you to fetch changes up to fa348938dbfccc1df1dc902f6bcb76d4f05029e7:

  Merge tag 'qcom-arm64-defconfig-for-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/defconfigs (2021-10-26 18:16:46 +0200)

----------------------------------------------------------------
ARM: defconfig updates for 5.16

These are the usual changes to enable newly added driver
by default, and to do some housekeeping around changing
Kconfig symbols.

----------------------------------------------------------------
Alistair Francis (1):
      ARM: imx_v6_v7_defconfig: Enable HID I2C

Arnd Bergmann (8):
      Merge tag 'multiv7-defconfig-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc into
arm/defconfigs
      Merge tag 'renesas-arm-defconfig-for-v5.16-tag1' of
git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel into
arm/defconfigs
      Merge tag 'tegra-for-5.16-arm64-defconfig' of
git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux into
arm/defconfigs
      Merge tag 'mvebu-defconfig-5.16-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu into
arm/defconfigs
      Merge tag 'visconti-arm-defconfig-for-v5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/iwamatsu/linux-visconti
into arm/defconfigs
      Merge tag 'imx-defconfig-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into
arm/defconfigs
      Merge tag 'aspeed-5.16-defconfig' of
git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc into
arm/defconfigs
      Merge tag 'qcom-arm64-defconfig-for-5.16' of
git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into
arm/defconfigs

Biju Das (5):
      arm64: defconfig: Enable RIIC
      arm64: defconfig: Enable RZ/G2L USBPHY control driver
      arm64: defconfig: Enable RZ_DMAC
      arm64: defconfig: Enable SOUND_SOC_RZ
      arm64: defconfig: Enable SND_SOC_WM8978

Bjorn Andersson (3):
      arm64: defconfig: Disable firmware sysfs fallback
      arm64: defconfig: Enable Qualcomm prima/pronto drivers
      arm64: defconfig: Enable Qualcomm LMH driver

Joel Stanley (10):
      ARM: configs: aspeed_g5: Reneable DRM_FBDEV_EMULATION
      ARM: config: multi v7: Drop unavailable options
      ARM: config: multi v7: Clean up enabled by default options
      ARM: config: multi v7: Add renamed symbols
      ARM: config: multi v7: Regenerate defconifg
      ARM: configs: aspeed: Disable IPV6 SIT device
      ARM: configs: aspeed: Enable commonly used drivers
      ARM: configs: aspeed: Enable pstore and lockup detectors
      ARM: config: aspeed: Enable Network Block Device
      ARM: configs: aspeed: Remove unused USB gadget devices

Lad Prabhakar (1):
      arm64: defconfig: Enable RZG2L_ADC

Marcel Ziswiler (7):
      ARM: imx_v6_v7_defconfig: enable mtd physmap
      ARM: imx_v6_v7_defconfig: change snd soc tlv320aic3x to i2c variant
      ARM: imx_v6_v7_defconfig: rebuild default configuration
      ARM: imx_v6_v7_defconfig: build imx sdma driver as module
      ARM: imx_v6_v7_defconfig: enable bpf syscall and cgroup bpf
      ARM: mvebu_v7_defconfig: enable mtd physmap
      ARM: mvebu_v7_defconfig: rebuild default configuration

Maulik Shah (1):
      arm64: defconfig: Enable Sleep stats driver

Nobuhiro Iwamatsu (1):
      arm64: defconfig: Visconti: Enable PCIe host controller

Sai Prakash Ranjan (1):
      arm64: defconfig: Enable QTI SC7280 pinctrl, gcc and interconnect

Sameer Pujar (1):
      arm64: defconfig: Enable few Tegra210 based AHUB drivers

Wolfram Sang (1):
      arm64: defconfig: Add Renesas TPU as module

Zenghui Yu (1):
      arm64: defconfig: drop obsolete ARCH_* configs

 arch/arm/configs/aspeed_g4_defconfig |  1 +
 arch/arm/configs/aspeed_g5_defconfig | 35 +++++++++------
 arch/arm/configs/imx_v6_v7_defconfig | 47 ++++++++-----------
 arch/arm/configs/multi_v7_defconfig  | 87 +++++++++++++-----------------------
 arch/arm/configs/mvebu_v7_defconfig  | 18 ++++----
 arch/arm64/configs/defconfig         | 27 +++++++++--
 6 files changed, 102 insertions(+), 113 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
