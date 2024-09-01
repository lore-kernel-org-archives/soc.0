Return-Path: <SRS0=nhTP=P7=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57693CA101E
	for <soc@archiver.kernel.org>; Sun,  1 Sep 2024 22:11:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3EA5BC4CEC6; Sun,  1 Sep 2024 22:11:29 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 23753C4CEC3;
	Sun,  1 Sep 2024 22:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 23753C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=YJsQp1ZYdLAQCSxiJPBr4/irOtv5k9nFOSCxmP27BZE=; b=jrMTr9PQXSReXh6Bg5ek4EF42A
	2wfpL0HNThQbEs5bYro2OGTroSoh2If04CCgrlQ8pB76DQdp5afMsX9FsSIBcI3mQ+p6gVarDX1J0
	m/6R/cKqv0SkUDRHaxgKHBa/qMJcyheJDYmoM2seyuHltUWAOPSwuf98NeROldb2y8JcE93PAIJ6G
	G9x7MkKLlFY832ERVgGJn/Db2nuTIST16wEUcRK932PuNxzZNk+LlloVOK6+gvSHCQDU4Phfj8otQ
	1rhMnekpd4H5grhbxzSAzIQLiWTslGLxgscN/+TuuKtKK/OSiupI701JvYhIl19jdlFvW3fAaB14G
	LCrsMAMw==;
Received: from i5e860d0f.versanet.de ([94.134.13.15] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sksn7-0006hT-Dy; Mon, 02 Sep 2024 00:11:25 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 6.12 #1
Date: Mon, 02 Sep 2024 00:12:59 +0200
Message-ID: <3405397.RL5eaSpR8r@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.12-rockchip-dts32-1

for you to fetch changes up to 0296f20c72d23f41ca0ccd64eb849e9ef1aa8977:

  ARM: dts: rockchip: Do not describe unexisting DAC device on rv1108-elgin-r1 (2024-08-29 19:37:00 +0200)

----------------------------------------------------------------
spidev on the elgin-r1 got a real compatible, the rk3128 could enable its
VPU for video decoding and the rk3128 sfc node can use the clock constant
now after the merge-window.

----------------------------------------------------------------
Alex Bee (1):
      ARM: dts: rockchip: Add vpu nodes for RK3128

Fabio Estevam (1):
      ARM: dts: rockchip: Do not describe unexisting DAC device on rv1108-elgin-r1

Heiko Stuebner (1):
      ARM: dts: rockchip: use constant for HCLK_SFC on rk3128

 arch/arm/boot/dts/rockchip/rk3128.dtsi         | 26 +++++++++++++++++++++++++-
 arch/arm/boot/dts/rockchip/rv1108-elgin-r1.dts |  4 ++--
 2 files changed, 27 insertions(+), 3 deletions(-)



