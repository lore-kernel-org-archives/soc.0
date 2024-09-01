Return-Path: <SRS0=nhTP=P7=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BBCC54FC6
	for <soc@archiver.kernel.org>; Sun,  1 Sep 2024 21:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A3325C4CEC8; Sun,  1 Sep 2024 21:37:40 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 29EC8C4CEC3;
	Sun,  1 Sep 2024 21:37:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 29EC8C4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=snnfLF0zX/k6vqmUSCiyJxmlQT9GI+pf+ndg4Yy93Ck=; b=Yp1HZvUftrRvWQHkgMFySa/8Eb
	rG2N8y7Mb7wR8wV40Q9Gpud1O63UcJOFQG7wAwjspq1AOkQhCvnhVZbOen8vUtDEqEZDPRR3W0PVc
	zNq+BjOfsvfAomDTwOF/QBbz2Y+CTafnKJqvLteJPyqUXz+d4coQ481LUPLLu7Ycamq9AT5hLPZvt
	bA+nUMeCdYsO7HeaVBSLiGeVouZguFzzBtBLLjMrdaN0bo3doDnn9Lf0CR8XHG0V1ru0tGY74voEw
	ZFIP9MtgkI9spangP1HsY0unzx9bYw4DHzTE9LQfHj2PcFGTjVlhjmHOgrUCozG6CAS7dSAUUefkz
	GJGTBLNg==;
Received: from i5e860d0f.versanet.de ([94.134.13.15] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sksGG-0006Y1-LE; Sun, 01 Sep 2024 23:37:28 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.11
Date: Sun, 01 Sep 2024 23:39:02 +0200
Message-ID: <7602696.A5hrfCrGMc@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find a below a collection of fixes for the current release 6.11
cycle.

Please pull

Thanks
Heiko


The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.11-rockchip-dtsfixes

for you to fetch changes up to 5956ee09c8254273c587b07f5b4d42da59a0325c:

  arm64: dts: rockchip: Fix compatibles for RK3588 VO{0,1}_GRF (2024-08-29 13:54:33 +0200)

----------------------------------------------------------------
A number of pin fixes for Puma, Rock-Pi-E and rk356x, and as it turns
out the VO0 and VO1 general register files are not identical as suggested
by their original compatible. As there are no users of those yet,
everybody agreed that we should fix the compatibles.

----------------------------------------------------------------
Alexander Shiyan (1):
      arm64: dts: rockchip: Remove broken tsadc pinctrl binding for rk356x

Cristian Ciocaltea (2):
      dt-bindings: soc: rockchip: Fix compatibles for RK3588 VO{0,1}_GRF
      arm64: dts: rockchip: Fix compatibles for RK3588 VO{0,1}_GRF

FUKAUMI Naoki (1):
      arm64: dts: rockchip: fix PMIC interrupt pin in pinctrl for ROCK Pi E

Quentin Schulz (2):
      arm64: dts: rockchip: fix eMMC/SPI corruption when audio has been used on RK3399 Puma
      arm64: dts: rockchip: override BIOS_DISABLE signal via GPIO hog on RK3399 Puma

 .../devicetree/bindings/soc/rockchip/grf.yaml      | 10 +++++-
 arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts  |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      | 36 ++++++++++++++++++++--
 arch/arm64/boot/dts/rockchip/rk356x.dtsi           |  7 ++---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  6 ++--
 5 files changed, 49 insertions(+), 12 deletions(-)



