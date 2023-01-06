Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C41C5479D
	for <soc@archiver.kernel.org>; Fri,  6 Jan 2023 23:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ADC28C433F1; Fri,  6 Jan 2023 23:14:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982CFC433D2;
	Fri,  6 Jan 2023 23:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673046870;
	bh=4sB6/VsKnXRfbrX5AiLN/qY8TgHZr90p2+7LOOEDOyU=;
	h=From:Date:Subject:To:List-Id:Cc:From;
	b=chsidwTB3BjBJyFfrmC6AXn7M+u2JcFq1y9rY82DCpjpX39opdH0I59BSYkt0HEWG
	 c13sQMnyWsf9w7aZpvq2VXrXsOjmengyTairf5rcwTqNmyyRHXwT3iyD51zRG2h1Qh
	 bUJo2DSHeSoYRUIwjD0Ycsp3FvYymhlrBlI2Xbh0btuYlA66If5HIwodKVT/qyLIpC
	 XQR30alhRtucaExzGlsnhBSCOWCXsfx50Vao2b7ud7WD9ABGxhhTIBaYmW38v/Jp7K
	 s9hkishdEgYwfvBuq+7QhZzNj4g2dwx9CgClDBCBEwmTn+DZIMploc12S8Ui894UuP
	 X5mGQBIvrRvaQ==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 06 Jan 2023 23:14:12 +0000
Subject: [PATCH] ARM: multi_v7_defconfig: Enable wm896x audio CODECs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230106-arm-wm896x-v1-1-441c564a9cd1@kernel.org>
X-B4-Tracking: v=1; b=H4sIAEWruGMC/x2NQQqDMBAAvyJ7diGxNUS/Ij2sca1LMcoGakD8e
 2OPMzDMCYlVOEFfnaD8lSRbLGDrCsJC8c0oU2FoTPMw1jgkXfFYfecyehdosk/yremgBCMlxlEp
 huVOjk0/t96VZ8n/x/C6rh+94zfycwAAAA==
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: NXP Linux Team <linux-imx@nxp.com>, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.12-dev-8b3d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=987; i=broonie@kernel.org;
 h=from:subject:message-id; bh=4sB6/VsKnXRfbrX5AiLN/qY8TgHZr90p2+7LOOEDOyU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBjuKtTKTs86IqluBnRHHAChsAhASi+G79SwJlaj5VD
 zWMFb/yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY7irUwAKCRAk1otyXVSH0N3cB/
 9ofUWLAF2/ja8qwZjcRsGnK0I7Y4yfALpgSRimQB3ognCpllIMp/0BKJPwQYIahaj+pAgxreZp/oei
 Tr2AStfdSEt/xTvgebubNZ//Kdgk2J4/v9clKmMjT0bO0gU83iT1NswOcAZadnQqTOp/MSPeuK60Aq
 6aiarx803PjIx76GBlaab6dsC9p8M3N+HQre7Rm7OJfsmu/wvEAK14LzjyvYpoqDqwUcZzDNPcQkDG
 h1XjtGzWfcJIqIN/+ieMA80YFRQgHqAJA2swdGFed+mBIWEUET/GakHK4fPOFssRIfJJmu8oUAxK7d
 3QQw8ig44QlXvKSuvRKnVxsmaE5phC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

The wm896x series of audio CODECs is used on a number of Freescale
reference designs, enable the drivers in multi_v7_defconfig to improve
testing coverage of those systems and their derivatives.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index ee184eb37adc..36a0809890ce 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -821,6 +821,8 @@ CONFIG_SND_SOC_MSM8916_WCD_ANALOG=m
 CONFIG_SND_SOC_MSM8916_WCD_DIGITAL=m
 CONFIG_SND_SOC_SGTL5000=m
 CONFIG_SND_SOC_STI_SAS=m
+CONFIG_SND_SOC_WM8960=m
+CONFIG_SND_SOC_WM8962=m
 CONFIG_SND_SOC_WM8978=m
 CONFIG_SND_AUDIO_GRAPH_CARD=m
 CONFIG_USB=y

---
base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
change-id: 20230106-arm-wm896x-86cad14a8509

Best regards,
-- 
Mark Brown <broonie@kernel.org>
