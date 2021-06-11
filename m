Return-Path: <SRS0=LBA9=LF=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13905C48BE0
	for <soc@archiver.kernel.org>; Fri, 11 Jun 2021 22:20:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E61CE61181; Fri, 11 Jun 2021 22:20:42 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8860F613CF;
	Fri, 11 Jun 2021 22:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8860F613CF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=heiko@sntech.de
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <heiko@sntech.de>)
	id 1lrpW5-0004pq-89; Sat, 12 Jun 2021 00:20:41 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 5.13
Date: Sat, 12 Jun 2021 00:20:40 +0200
Message-ID: <3405741.0S5aU1g85B@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find below a patch that unbreaks the PCIe on rk3399 that
broke in 5.13. As the tag messages states, there are more changes
pending that handle the backward compatiblity but will go through
the PCI subsystem.

Please pull, thanks
Heiko

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v5.13-rockchip-dtsfixes1

for you to fetch changes up to 8efe01b4386ab38a36b99cfdc1dc02c38a8898c3:

  arm64: dts: rockchip: Update RK3399 PCI host bridge window to 32-bit address memory (2021-06-11 23:44:00 +0200)

----------------------------------------------------------------
Fix PCIe address ranges that are affected by recent PCI changes.
There are 3 additional patches pending that handle the backward
compatiblity inside the PCI subsystem, but the address ranges
should be fixed anyway.

----------------------------------------------------------------
Punit Agrawal (1):
      arm64: dts: rockchip: Update RK3399 PCI host bridge window to 32-bit address memory

 arch/arm64/boot/dts/rockchip/rk3399.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)



