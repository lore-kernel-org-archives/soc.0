Return-Path: <SRS0=9ssg=J6=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3C6C48BEB
	for <soc@archiver.kernel.org>; Wed, 21 Feb 2024 23:01:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 41B1CC433B1; Wed, 21 Feb 2024 23:01:25 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0F4EAC43390;
	Wed, 21 Feb 2024 23:01:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0F4EAC43390
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i5e861914.versanet.de ([94.134.25.20] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1rcvaa-0000rv-NM; Thu, 22 Feb 2024 00:01:20 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip driver changes for 6.9 #1
Date: Thu, 22 Feb 2024 00:01:20 +0100
Message-ID: <5997473.alqRGMn8q6@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

in expectation of more real driver-related changes I had started these
binding additions in a driver-branch, but in hindsight they could've also
just lived in the dt branch. So sorry about the additional pull.

Heiko


The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.9-rockchip-drivers1

for you to fetch changes up to 85a33544afa8895803798553c7510658dcbd3546:

  dt-bindings: soc: rockchip: add rk3588 USB3 syscon (2024-02-13 19:37:15 +0100)

----------------------------------------------------------------
dt-binding additions for some syscons (rk3588 usb3, hdptxphy) and a
clock addition to the rk3588 VO syscon binding.
6#

----------------------------------------------------------------
Cristian Ciocaltea (1):
      dt-bindings: soc: rockchip: Add rk3588 hdptxphy syscon

Sebastian Reichel (2):
      dt-bindings: soc: rockchip: add clock to RK3588 VO grf
      dt-bindings: soc: rockchip: add rk3588 USB3 syscon

 .../devicetree/bindings/soc/rockchip/grf.yaml      | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)



