Return-Path: <SRS0=FUiy=D5=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E06C0015E
	for <soc@archiver.kernel.org>; Sat, 12 Aug 2023 21:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BFC3FC433CA; Sat, 12 Aug 2023 21:25:58 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1F455C433C8;
	Sat, 12 Aug 2023 21:25:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1F455C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id A205D40004;
	Sat, 12 Aug 2023 21:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691875548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=Ud1VmrcGNGTAcXuZjrh56qlPvKEMQq5BDd/w2Pd2f9I=;
	b=Zghb/txT3oHVYRGeImgaAERQ6lnkoZ0FI7COm/ftbUosrCCC4sfkTjvhNH+n1V+/sPt4Kd
	M/SX7FELm5LyqOWEfAXmP1nYWI87NyokqTEN8BOANoh1qofWw6DiluuOd5rfJraVIFpt3y
	te6dL8BCMlybDmfVJjFJOPjUS1DdraES5c32+EKb+F7Mi4d/YME8NESaXHmGIztyC42yQb
	jL82U6A8GAMpRI4Smp23atePpXQtDqtyX1HIj3n1fr4Y7N0uIscbquWNUC7F0rTyxL4KJm
	OdacQUtLou0TJM1aFkWKI6uM0eCHrM8i/BLrYKw96fj6P/9+8E9fzdSG5zpDDA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 <arm@kernel.org>, soc@kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, <linux-arm-kernel@lists.infradead.org>
Subject: [GIT PULL] ARM: mvebu: dt64 for v6.6 (#1)
Date: Sat, 12 Aug 2023 23:25:46 +0200
Message-ID: <87edk8t0kl.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: gregory.clement@bootlin.com

Hi,

Here is the first pull request for dt64 for mvebu for v6.6.

Gregory

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/gclement/mvebu.git tags/mvebu-dt64-6.6-1

for you to fetch changes up to 58fe732052196777112fdba536fb9db5cdd42ec6:

  arm64: dts: marvell: Add NAND flash controller to AC5 (2023-07-13 10:58:51 +0200)

----------------------------------------------------------------
mvebu dt64 for 6.6 (part 1)

Add the NAND Flash Controller on the AC5/AC5X SOC device tree
Fix style issue

----------------------------------------------------------------
Chris Packham (1):
      arm64: dts: marvell: Add NAND flash controller to AC5

Krzysztof Kozlowski (1):
      arm64: dts: marvell: add missing space before {

 arch/arm64/boot/dts/marvell/ac5-98dx25xx.dtsi        | 20 ++++++++++++++++++--
 arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts |  2 +-
 2 files changed, 19 insertions(+), 3 deletions(-)

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
