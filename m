Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1F7C77B7A
	for <soc@archiver.kernel.org>; Tue, 16 May 2023 15:33:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E75BDC433D2; Tue, 16 May 2023 15:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3BC3C433A7;
	Tue, 16 May 2023 15:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684251185;
	bh=C4SQH88o4X8B0aZDjwE/ytf02UfVOzvqYZUgEam+Yak=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q/8wxST6e4Z+JZ+RhzY/zoHGngrClR10FXgLYUTQhzQPnn6BqbNnHSWPBclX/ijHr
	 MPlKyvyjHyavoBTrerlvk7AhR1ZSyLUVOeV8I5JzsggGk4lk6aj4AgzHZGLTkB0uAU
	 Igz8wNgGKfKTwxXOt5FYTmPd4IW/ilWnVFQXk8sw1EoFI6b0VdZTiOjdLUzvmLCANw
	 hbrml1KqP8PM1Lvpzxe5JzNmgrEuMaixcAUAe+upaDoq1++2N21SbAmoDO961KedR7
	 uLaQsXgNa/8BZOgdLjOG95NljNNx3DrW7m2f/N8MvvzWEhaPbGq8OUP16LiA/H4SMq
	 vHc1T58kI5phw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Russell King <linux@armlinux.org.uk>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 13/13] ARM: versatile: mark mmc_status() static
Date: Tue, 16 May 2023 17:31:09 +0200
Message-Id: <20230516153109.514251-14-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516153109.514251-1-arnd@kernel.org>
References: <20230516153109.514251-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

mmc_status() is only used in the file it is defined in, and
no longer has an 'extern' declaration:

arch/arm/mach-versatile/versatile.c:56:14: error: no previous prototype for 'mmc_status'

Fixes: 16956fed35fe ("ARM: versatile: switch to DT only booting and remove legacy code")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-versatile/versatile.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-versatile/versatile.c b/arch/arm/mach-versatile/versatile.c
index 02ba68abe533..7ef03d0c224d 100644
--- a/arch/arm/mach-versatile/versatile.c
+++ b/arch/arm/mach-versatile/versatile.c
@@ -53,7 +53,7 @@
 
 static void __iomem *versatile_sys_base;
 
-unsigned int mmc_status(struct device *dev)
+static unsigned int mmc_status(struct device *dev)
 {
 	struct amba_device *adev = container_of(dev, struct amba_device, dev);
 	u32 mask;
-- 
2.39.2

