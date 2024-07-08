Return-Path: <SRS0=Sopg=OI=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D471CC3271E
	for <soc@archiver.kernel.org>; Mon,  8 Jul 2024 15:32:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C7130C4AF0A; Mon,  8 Jul 2024 15:32:08 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51DBFC116B1;
	Mon,  8 Jul 2024 15:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 51DBFC116B1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i5e8616d7.versanet.de ([94.134.22.215] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sQqLV-00021H-HO; Mon, 08 Jul 2024 17:32:05 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 6.11 #2
Date: Mon, 08 Jul 2024 17:32:04 +0200
Message-ID: <2169115.3Lj2Plt8kZ@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 313da6f69fa41d044b03f2ea37e56fe49f1e8a42:

  ARM: dts: rockchip: add #sound-dai-cells to hdmi node on rk3128 (2024-06-27 20:57:05 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.11-rockchip-dts32-2

for you to fetch changes up to 9c29e5d7a2d1d91c29976c0c8aa7f42780e4a254:

  ARM: dts: rockchip: Drop ethernet-phy-ieee802.3-c22 from PHY compatible string on edgeble-neu2 (2024-07-04 19:42:44 +0200)

----------------------------------------------------------------
Removal of a fallback ethernet-phy compatible that is not conformant
to the binding.

----------------------------------------------------------------
Marek Vasut (1):
      ARM: dts: rockchip: Drop ethernet-phy-ieee802.3-c22 from PHY compatible string on edgeble-neu2

 arch/arm/boot/dts/rockchip/rv1126-edgeble-neu2-io.dts | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)



