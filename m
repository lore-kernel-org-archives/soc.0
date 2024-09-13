Return-Path: <SRS0=A4oH=QL=maquefel.me=nikita.shubin@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3CA2EEEC0E
	for <soc@archiver.kernel.org>; Fri, 13 Sep 2024 04:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5F39AC4CEC5; Fri, 13 Sep 2024 04:58:52 +0000 (UTC)
Received: from forward101a.mail.yandex.net (forward101a.mail.yandex.net [178.154.239.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E42AAC4CEC0
	for <soc@kernel.org>; Fri, 13 Sep 2024 04:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E42AAC4CEC0
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=maquefel.me
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=maquefel.me
Received: from mail-nwsmtp-smtp-production-main-64.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-64.vla.yp-c.yandex.net [IPv6:2a02:6b8:c15:2984:0:640:b1d5:0])
	by forward101a.mail.yandex.net (Yandex) with ESMTPS id 86259608FF;
	Fri, 13 Sep 2024 07:58:37 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-64.vla.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id awcGL8EOgSw0-TzE9EhXP;
	Fri, 13 Sep 2024 07:58:37 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=maquefel.me; s=mail;
	t=1726203517; bh=rDRf8WGcWmjoRMmiOxD3FPDRPD2xPEAkm9w+XLay4d0=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=dDYl8EZNh/sNVVe2VNUS/IYZsdB1/KgKhyrjww/UeaXoxrFpi2NZtnm59QhT5leya
	 QBaZun9VZNZYeG24l8bZimwsUoravoNUtBoKgK+//F7L0k+oMRRgIWqRsOSP9fFn2k
	 6cMNPEp6/MZQ7JsS5iM0tR42SARerZ8wgLvoq4VI=
Authentication-Results: mail-nwsmtp-smtp-production-main-64.vla.yp-c.yandex.net; dkim=pass header.i=@maquefel.me
From: Nikita Shubin <nikita.shubin@maquefel.me>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Nikita Shubin <nikita.shubin@maquefel.me>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] pinctrl: ep93xx: Fix raster pins typo
Date: Fri, 13 Sep 2024 07:58:29 +0300
Message-ID: <20240913045829.11904-1-nikita.shubin@maquefel.me>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix raster_on_sdram0_pins used in PMX_GROUP() instead of
raster_on_sdram3_pins as it should be.

Fixes: d1661439f5a3 ("pinctrl: add a Cirrus ep93xx SoC pin controller")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409130426.1OzNAC9M-lkp@intel.com/
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 drivers/pinctrl/pinctrl-ep93xx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ep93xx.c b/drivers/pinctrl/pinctrl-ep93xx.c
index 458cb0e99c65..abafbbb8fd6a 100644
--- a/drivers/pinctrl/pinctrl-ep93xx.c
+++ b/drivers/pinctrl/pinctrl-ep93xx.c
@@ -714,7 +714,7 @@ static const struct ep93xx_pin_group ep9307_pin_groups[] = {
 	PMX_GROUP("i2s_on_ac97", ac97_ep9301_pins, EP93XX_SYSCON_DEVCFG_I2SONAC97,
 						EP93XX_SYSCON_DEVCFG_I2SONAC97),
 	PMX_GROUP("rasteronsdram0grp", raster_on_sdram0_pins, EP93XX_SYSCON_DEVCFG_RASONP3, 0),
-	PMX_GROUP("rasteronsdram3grp", raster_on_sdram0_pins, EP93XX_SYSCON_DEVCFG_RASONP3,
+	PMX_GROUP("rasteronsdram3grp", raster_on_sdram3_pins, EP93XX_SYSCON_DEVCFG_RASONP3,
 							EP93XX_SYSCON_DEVCFG_RASONP3),
 	PMX_GROUP("gpio2agrp", gpio2a_9307_pins, EP93XX_SYSCON_DEVCFG_GONK,
 						EP93XX_SYSCON_DEVCFG_GONK),
@@ -1159,7 +1159,7 @@ static const struct ep93xx_pin_group ep9312_pin_groups[] = {
 	PMX_GROUP("i2s_on_ac97", ac97_ep9312_pins, EP93XX_SYSCON_DEVCFG_I2SONAC97,
 						EP93XX_SYSCON_DEVCFG_I2SONAC97),
 	PMX_GROUP("rasteronsdram0grp", raster_on_sdram0_pins, EP93XX_SYSCON_DEVCFG_RASONP3, 0),
-	PMX_GROUP("rasteronsdram3grp", raster_on_sdram0_pins, EP93XX_SYSCON_DEVCFG_RASONP3,
+	PMX_GROUP("rasteronsdram3grp", raster_on_sdram3_pins, EP93XX_SYSCON_DEVCFG_RASONP3,
 							EP93XX_SYSCON_DEVCFG_RASONP3),
 	PMX_GROUP("gpio2agrp", gpio2a_9312_pins, EP93XX_SYSCON_DEVCFG_GONK,
 						EP93XX_SYSCON_DEVCFG_GONK),
-- 
2.43.2

