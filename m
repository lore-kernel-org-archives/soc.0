Return-Path: <SRS0=veTA=3P=bootlin.com=kory.maincent@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957E3C43217
	for <soc@archiver.kernel.org>; Tue, 15 Nov 2022 13:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5748BC43148; Tue, 15 Nov 2022 13:58:29 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C9FDCC4314F;
	Tue, 15 Nov 2022 13:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C9FDCC4314F
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: kory.maincent@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6FB381C001E;
	Tue, 15 Nov 2022 13:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668520699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GbCsgekaHtIeV8Zu1tUsRWhr+2lncTq96b31p1AFJtw=;
	b=H3hzWagYKQhAzCQ1+QMx4o4N6Sv+Ycu5jHgDd4f3KT2AdKbFFxlZMTSXQdKluGJs+uD5hu
	79hn47FY7CuytoE30etuEECf6tg5kHSgMbZLHtWJIbJp6WO3Do1odm7luV+Vyn8277Rzw4
	HmN3q6J1XWFgmoAXi1EVkdfOliXBJAU/YO5uPSTtl+ktuqVrTvb1utNgBUG/Hp7RH2Z9GP
	3KxLHBhBaGTmokq8zpQ4cwNmi7VDK/cc2Vmm+9SmnMU1p8pkruuyiTr8ybVP1a+epn5xLd
	sXY5XqeWf824+JAYcWk1m8U0vT7sBdGF53Gj6mDTmL0udgMEWPMws0kILrOoPg==
From: =?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Kory Maincent <kory.maincent@bootlin.com>,
	thomas.petazzoni@bootlin.com,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org
Subject: [PATCH v3 0/2] Support new features to the SPEAr600
Date: Tue, 15 Nov 2022 14:58:11 +0100
Message-Id: <20221115135814.214388-1-kory.maincent@bootlin.com>
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

The arm patches have been merged thanks to Arnd. Could you deal with the
clock patches to merged them through the clock tree?

Kory Maincent (2):
  clk: spear: Fix CLCD clock definition on SPEAr600
  clk: spear: Fix SSP clock definition on SPEAr600

 drivers/clk/spear/spear6xx_clock.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

-- 
2.25.1

