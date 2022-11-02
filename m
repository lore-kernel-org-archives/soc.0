Return-Path: <SRS0=OCyK=3C=bootlin.com=kory.maincent@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42325C4332F
	for <soc@archiver.kernel.org>; Wed,  2 Nov 2022 17:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 026E7C433D7; Wed,  2 Nov 2022 17:10:23 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 20179C433D6;
	Wed,  2 Nov 2022 17:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 20179C433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: kory.maincent@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id F03D210000B;
	Wed,  2 Nov 2022 17:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667409017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MV9j9Bu5TXuRkblIFDbUBZYqzjooHXJ8S9umIGNR0lE=;
	b=l5MiST3b7TjEP/Jwk5lnDNZVIU/J3RGUY2aVgpeb4zuzS85/k4xHlHaR82bH7/cWUb8wox
	ZyvvOaM9DyxM3avB78UIho+ZCh5jHRxH+D/sYXzTTtMsn7WFtNytovE3WZSGl4Lbyg/rtW
	Gqf5PBYOEt6QrONMGhtljv0yJf8EZcAxkyZlYtYJQhEfBXpHVZR6TSXBGKNNTb0xKtBKzg
	34Lf88kYQlXSz0++22OZVHOCvJuMtyvAz6LnpAK9aT2+v28hYgS2C3R9/h5GzOCYqEgCnh
	lBj8seKJCqAt9xLMu16el/KW3L0Czh4GRYCEPLPe4v+c0+8rMuGW4wewlCvKPA==
From: =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
To: viresh.kumar@linaro.org,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Vipin Kumar <vipin.kumar@st.com>,
	Vijay Kumar Mishra <vijay.kumar@st.com>,
	Deepak Sikri <deepak.sikri@st.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Kory Maincent <kory.maincent@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	Viresh Kumar <vireshk@kernel.org>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Rajeev Kumar <rajeev-dlh.kumar@st.com>,
	Vipul Kumar Samar <vipulkumar.samar@st.com>
Subject: [PATCH v2 0/6] Support new features to the SPEAr600
Date: Wed,  2 Nov 2022 18:10:04 +0100
Message-Id: <20221102171012.49150-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kory Maincent <kory.maincent@bootlin.com>

This patches series adds two features of the SPEAr600 SOC:

- Enable the display controller

- Enable the SPI buses using the SSP controller

Changes in v2:
- Keep the I2C_CONFIG in the spear6xx_defconfig while enabling DRM.
- Send cover letter which was not sent in v1 due to a mistake in my git
  mail config.

Viresh, will you take the patches and submit a pull request to the ARM SoC
maintainers?

Kory Maincent (6):
  arm: configs: spear6xx: Refresh defconfig
  arm: dts: spear600: Fix clcd interrupt
  arm: configs: spear6xx: Enable PL110 display controller
  clk: spear: Fix CLCD clock definition on SPEAr600
  arm: dts: spear600: Add ssp controller nodes
  clk: spear: Fix SSP clock definition on SPEAr600

 arch/arm/boot/dts/spear600.dtsi     | 32 ++++++++++++++++++++++++++++-
 arch/arm/configs/spear6xx_defconfig |  7 ++-----
 drivers/clk/spear/spear6xx_clock.c  |  8 ++++----
 3 files changed, 37 insertions(+), 10 deletions(-)

-- 
2.25.1

