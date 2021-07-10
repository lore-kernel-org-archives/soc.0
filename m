Return-Path: <SRS0=B6XL=MC=i2se.com=stefan.wahren@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18610C07E95
	for <soc@archiver.kernel.org>; Sat, 10 Jul 2021 11:07:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C0259613D2; Sat, 10 Jul 2021 11:07:46 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADEEB6128A;
	Sat, 10 Jul 2021 11:07:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADEEB6128A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=stefan.wahren@i2se.com
Received: from localhost.localdomain ([37.4.249.97]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MuUSa-1lBzaB172o-00rXIz; Sat, 10 Jul 2021 13:05:17 +0200
From: Stefan Wahren <stefan.wahren@i2se.com>
To: Nicolas Saenz Julienne <nsaenz@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	soc@kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: [PATCH] ARM: multi_v7_defconfig: Make NOP_USB_XCEIV driver built-in
Date: Sat, 10 Jul 2021 13:04:55 +0200
Message-Id: <1625915095-23077-1-git-send-email-stefan.wahren@i2se.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:JtYWB41SYBnkLYHHoJnXpZzjkTRXL5U37XdOuCTqfVgtwpsArZV
 qGDVZkvplnCL9k0sw+Wn3JST15xMzUQ4Y98S/mls3PzMVDV05TbWmT6Go3id6PX2Tn32bG9
 iwQ3yiSf6X7/9gGw0Lq85Ks1OoXAE114OKeuBS7mC6RZD+gohghODhPe0256JvOXiLLDXhN
 QCXRlwfE5SuiHPykA83gg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fTKKdCF+HUA=:ex9Icdw3FUmBLKXpTOx9CU
 hiJ3RbpzOX7zT1/9Zm7gjFXSUxR/cN8D4zNIAmWZn5Ulh0hjkw2ticGaiKtXPiphEzF5l7SZz
 xMDhhMqVWS6j2N+sXGymFh+T8lCrNRGBPjjGaxcVqUZTA+lvhcYvxlsEL8h63lV3YZXyT1OLg
 xLwT/VOeDNL73V7Fg8RJ7dHUfVdYLuxoirNtHO4ka0s0N8+0sTCs87y5wRqfiE68QmQsg+Cim
 1c/xGTStK0NZnohTnUm+yTYuP+9/8NSa4gtoVTDRzGO5BDPJZdBdvMrDSOV+H0iX73lNz06fr
 hb4C+Et6M1vD0xxvp81eN0ASN6gkSt8x9gzvAh33eHOc04RTR6+PDEGANVsZR1i+nwysZQ6OB
 t+2kY+a0VyCzfloa882/LQ6a0MC5OzS5Vl+HBBq7W5jqRpQnRjsjvg/tcrbgtwuXSCITTux7y
 SoRD5974V7rjHZY8rcOBlpFaOKxcB85hMdkXuA//IZgoIUuqFDNUexWqES7SskOc4pXqrY4+K
 nPzLNA5jnH6DLyCkKJCBlr5z496CC1P/pLxxbrBJb4xBiiX6iHfJybPQg7K0zA8E0zhxtrEwj
 bB40a8hOnNqvNspkvULTj2urDUYJb0RlYNamjddYpFiXaAa3rK1qcqXLS88Y41O3ZnYntcYWy
 TZuB8ItydNHkE9cODFEAF9cjm3aJUlFv21moCnuNZa0xtXieV3GSKsxNfIu88gGM2rd+YTDVM
 41k2l8ewNPu0kyojlGiI0OrYl7g1RjUd4wqxRzRzC1Lx+0hiKk28wJ+Ey3L1oVaJrXdu5NmaX
 SulhmnRKjakPFnqFWEColTR9yDFRFzRL3qZWwqVPyuHJDqQod0q0XYMZu2h2eTbmAlvayOM7g
 34TkwBzQXynzhZNhknJQ==

The usage of usb-nop-xceiv PHY on Raspberry Pi boards with BCM283x has
been a "regression source" a lot of times. The last case is breakage of
USB mass storage boot has been commit e590474768f1 ("driver core: Set
fw_devlink=on by default") for multi_v7_defconfig. As long as
NOP_USB_XCEIV is configured as module, the dwc2 USB driver defer probing
endlessly and prevent booting from USB mass storage device. So make
the driver built-in as in bcm2835_defconfig and arm64/defconfig.

Reported-by: Ojaswin Mujoo <ojaswin98@gmail.com>
Fixes: e590474768f1 ("driver core: Set fw_devlink=on by default")
Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 52a0400..d9abaae 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -821,7 +821,7 @@ CONFIG_USB_ISP1760=y
 CONFIG_USB_HSIC_USB3503=y
 CONFIG_AB8500_USB=y
 CONFIG_KEYSTONE_USB_PHY=m
-CONFIG_NOP_USB_XCEIV=m
+CONFIG_NOP_USB_XCEIV=y
 CONFIG_AM335X_PHY_USB=m
 CONFIG_TWL6030_USB=m
 CONFIG_USB_GPIO_VBUS=y
-- 
2.7.4

