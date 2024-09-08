Return-Path: <SRS0=EDZP=QG=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F98ECE577
	for <soc@archiver.kernel.org>; Sun,  8 Sep 2024 21:51:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1217EC4CEC6; Sun,  8 Sep 2024 21:51:27 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2214AC4CEC3;
	Sun,  8 Sep 2024 21:51:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2214AC4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5KSEBpzCfk9umS5Xi6DplM0ldO0x2R3UbNCXnNWmLnY=; b=w+qLyfssZfpeSw4oCCOiHSr5oL
	P0RtcKAXBwgVencul3QwceLOEMSYlJs6+BVoDp/iPz2NPFBORx91YeCtvr/W91McTM2RLfOkgOzmf
	wm9i3MUq5IgJJ7rYH5sEJsQPQuqGg726ztJzB4r7Sq479hRLDw44D8sDTzUtDD64mCWv74u3R1cbr
	f80oYSGS7VLTdQhI+4fppq4vDuhcHCk84dtFOV1wZUDy7TAQC7FE1PEo9mDX498vYWQLizqwry4pa
	sf/oLN2bfRznDAGK0Aulmx/Gzy09U5v96VLP/uDMLE0GvTibqZPZCBZTrkvauK6Dc1JNVoqYeoRNT
	wU9x0how==;
Received: from i5e8616cc.versanet.de ([94.134.22.204] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1snPoZ-0004Hs-AB; Sun, 08 Sep 2024 23:51:23 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.12 #2
Date: Sun, 08 Sep 2024 23:53:37 +0200
Message-ID: <11663608.jrtcCam0TZ@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Arnd, Kevin, Olof,

please find below and in a subsequent pull-requests
some more Rockchip changes for for 6.12 .

Please pull if there is still time.

Thanks
Heiko


The following changes since commit 78d500329b65217c45422ac0adf5c030783d3e58:

  arm64: dts: rockchip: drop unsupported regulator-property from NanoPC-T6 (2024-08-29 23:55:32 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.12-rockchip-dts64-2

for you to fetch changes up to e00bf11185033456f3d4345bcd366df1f7cc7255:

  arm64: dts: rockchip: add CAN0 and CAN1 interfaces to mecsbc board (2024-09-05 22:15:06 +0200)

----------------------------------------------------------------
New boards the Odroid-M2 and GameForce Ace, CAN on rk3568, RGA2 on rk3588
and some non-critical dts cleanups.

----------------------------------------------------------------
Alex Zhao (1):
      arm64: dts: rockchip: rk3588s fix sdio pins to pull up

Chris Morgan (2):
      dt-bindings: arm: rockchip: Add GameForce Ace
      arm64: dts: rockchip: Add GameForce Ace

David Jander (2):
      arm64: dts: rockchip: add CAN-FD controller nodes to rk3568
      arm64: dts: rockchip: add CAN0 and CAN1 interfaces to mecsbc board

Diederik de Haas (1):
      arm64: dts: rockchip: Add missing tshut props to tsadc on quartz64-b

FUKAUMI Naoki (1):
      arm64: dts: rockchip: remove duplicate nodes from dts for ROCK 4SE

Heiko Stuebner (1):
      arm64: dts: rockchip: drop hp-pin-name property from audio card on nanopc-t6

Jianfeng Liu (1):
      arm64: dts: rockchip: Add RGA2 support to rk3588

Jonas Karlman (2):
      dt-bindings: arm: rockchip: Add Hardkernel ODROID-M2
      arm64: dts: rockchip: Add Hardkernel ODROID-M2

 .../devicetree/bindings/arm/rockchip.yaml          |   10 +
 arch/arm64/boot/dts/rockchip/Makefile              |    2 +
 arch/arm64/boot/dts/rockchip/rk3399-rock-4se.dts   |   15 -
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-b.dts |    2 +
 arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dts     |   14 +
 arch/arm64/boot/dts/rockchip/rk3568.dtsi           |   39 +
 .../boot/dts/rockchip/rk3588-base-pinctrl.dtsi     |   10 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   11 +
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi |    1 -
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts    | 1237 ++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts |  903 ++++++++++++++
 11 files changed, 2223 insertions(+), 21 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts



