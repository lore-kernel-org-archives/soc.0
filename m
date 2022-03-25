Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E6A3C433EF
	for <soc@archiver.kernel.org>; Fri, 25 Mar 2022 15:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1A1CEC340E9; Fri, 25 Mar 2022 15:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0807C36AE2;
	Fri, 25 Mar 2022 15:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1648222396;
	bh=AWBxOhZ8G2NcA+v3xSDS7tuQrOljT8MnfBJLg2MRTcs=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=TrdKuMTGGXC/AnERBlShWugWcen941XwgSuzwIG8e9/FXbR/GUqtGCRvWTRShZBRw
	 SLMIZozJtcJZKhCA4YPusHkhPvzxVLL6m+udinED10CeGVqNkS765Gqy9LJmbsB+5Y
	 /fY3FOEQrCXBLXLHF43BpX0/uvKTiI18lPnXlfkcJQaDbbrELrj+N5ctdpnEUhVTBm
	 3K8xRQgsQbQa05z17dVK/AI7VtxY8S6heranoTKqVFSivApCNa54nZDwCo31Q1agOg
	 B8FDSuPbTmrHVUM6SRT1cg0QAVpk3iaCQA4GDNCkMAlz8yQor7EPK6foFFfHBH43Zo
	 iqQYnbAirL/uw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	Mark Brown <broonie@kernel.org>,
	soc@kernel.org
Subject: [PATCH v1 7/7] ARM: configs: Update multi_v5_defconfig for WM8731 bus refactoring
Date: Fri, 25 Mar 2022 15:31:21 +0000
Message-Id: <20220325153121.1598494-8-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220325153121.1598494-1-broonie@kernel.org>
References: <20220325153121.1598494-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=840; h=from:subject; bh=AWBxOhZ8G2NcA+v3xSDS7tuQrOljT8MnfBJLg2MRTcs=; b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiPeBI+8hhUyrAB9konZFbE6QBpOXwo19/k9GOEAKZ McW27kaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYj3gSAAKCRAk1otyXVSH0OP5B/ 4k9hwaZDR+RXEc4lZMqfglkGk0309vFUPvwfdse81h2AyWYu/A9c/Z++ZQAQMYtCcu9TRlWi6tBVKC ynvtz6b+BVbGkjXW9InYfj++TBaH5jaGMFBEnSMRC71/r+RVns51m+l6Dj4G2RI0LklCQtTzuNBTx2 sS623vYQG9wpECfbKRLfnGTMBDguVEj7aVQXThGYHrbqqNatHcQcT93UWvZt6go6G/YuS/xDyIUfa8 rIzpavR4xGVTPgRgu5L+p/bDznWLgyqdDfm9ZDm97MeDBOp59EBNFD8GoV59fHGpnvYb5Um3xaensU IZG40FZugKgMJlzTKdtw16CJS10r5Q
X-Developer-Key: i=broonie@kernel.org; a=openpgp; fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit

The WM8731 driver has been refactored so the I2C and SPI bus code is
separate modules. Refresh multi_v5_defconfig to reflect this.

Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: soc@kernel.org
---
 arch/arm/configs/multi_v5_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
index fe8d760256a4..38a939d91a32 100644
--- a/arch/arm/configs/multi_v5_defconfig
+++ b/arch/arm/configs/multi_v5_defconfig
@@ -208,7 +208,8 @@ CONFIG_SND_ATMEL_SOC_WM8904=m
 CONFIG_SND_AT91_SOC_SAM9X5_WM8731=m
 CONFIG_SND_KIRKWOOD_SOC=y
 CONFIG_SND_SOC_ALC5623=y
-CONFIG_SND_SOC_WM8731=y
+CONFIG_SND_SOC_WM8731_I2C=y
+CONFIG_SND_SOC_WM8731_SPI=y
 CONFIG_SND_SIMPLE_CARD=y
 CONFIG_HID_DRAGONRISE=y
 CONFIG_HID_GYRATION=y
-- 
2.30.2

