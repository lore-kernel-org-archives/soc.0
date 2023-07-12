Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70231EB64D9
	for <soc@archiver.kernel.org>; Wed, 12 Jul 2023 12:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 38B8BC433C9; Wed, 12 Jul 2023 12:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78D26C433C8;
	Wed, 12 Jul 2023 12:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689165001;
	bh=7Nh3ZHtw9GX87D+Rssk/zZbhNNsuuFmQd/DWtJ1ZxC8=;
	h=From:Date:Subject:List-Id:To:Cc:From;
	b=cPnm6UFUPcIOgs6r9WiJ10eH1cU+cNWdpANkj6yHczv5N9k5UOpilyYnJtWMJ7ELa
	 1xY7IZpdxVY3lTacacjptH+c0w0ciGQD0pSd7En+g3OB4r6guqCSiBl03e15FOTWpE
	 4uGPegPsLQkeqIaFHjXS6WYuK+NL029Z5xlG3GSfDyRkA84KXz8DTR/zNAyTQAAQAk
	 o2k76GrSO6y8mAEG57FIyrAJUHKDRAAYZD7fV/4Zk3hO9FAykU+NWSDFhVruymGH/d
	 bDOUP8k5M4TgXhumuSINc5lVbg5jR1kC1aHKaGkEIYgZW7VVBuikQjzWywAdi2gFDo
	 jXrE+AyPRN9Zg==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 12 Jul 2023 13:29:51 +0100
Subject: [PATCH] ARM: multi_v7_defconfig: Enable TLV320AIC3x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230712-arm-tlv320aic31xx-config-v1-1-2422142cb88d@kernel.org>
X-B4-Tracking: v=1; b=H4sIAL6crmQC/x3MQQqAIBBA0avErBswrYyuEi3MxhooC40QorsnL
 d/i/wciBaYIffFAoJsjHz6jKguwq/ELIc/ZIIVUQguNJux4bbeSwrBVVUpoD+94QddI03VtW+t
 5gpyfgRynfz2M7/sBPNQYzWoAAAA=
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Tony Lindgren <tony@atomide.com>, 
 =?utf-8?q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=974; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7Nh3ZHtw9GX87D+Rssk/zZbhNNsuuFmQd/DWtJ1ZxC8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkrpzGBbP/Q/Zcbz2cVq6qpk+DqydztBLpUfs9cOSt
 Gt33EC6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZK6cxgAKCRAk1otyXVSH0BeUB/
 sE9ad2D05e4r+AIKQnmmMiQQfpV9aeoHWv21cN5rUA8GFFERA0Vhq5IZxSYNJ8+gpz76djUc667syR
 bD44Fsbog0oqt99ntPxCm59sxNNEkbdWxHQbnB0fhp91hV9KLOKjt4ZOjFwdooVMVp8vYj379PLe2I
 5RMsUSXyD8mJOZlASW6VEaKIBdGyd8LI1HbjUzjizmhsUCWVN9khbOpbjq4aa6nRdCcaLCoGdIbAzN
 A/zs8fFYPcHvywXBR1GVorDAh/ACbMighIUM42kYxfBg+WhdF/V9puEKDJLOIOZFXwa46dgKD6Qbep
 qMtjITllHJTMqDstVtZ/v6rzfz5sV0
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

A number of TI based platforms use TLV320AIC3x since it was their
standard audio CODEC for quite some time, including the Beagle X15.
Enable it multi_v7_defconfig to improve test coverage.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index f0800f806b5f..00e95220e08d 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -825,6 +825,7 @@ CONFIG_SND_SOC_SGTL5000=m
 CONFIG_SND_SOC_STI_SAS=m
 CONFIG_SND_SOC_TLV320AIC32X4=m
 CONFIG_SND_SOC_TLV320AIC32X4_I2C=m
+CONFIG_SND_SOC_TLV320AIC3X_I2C=m
 CONFIG_SND_SOC_WM8960=m
 CONFIG_SND_SOC_WM8962=m
 CONFIG_SND_SOC_WM8978=m

---
base-commit: 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5
change-id: 20230707-arm-tlv320aic31xx-config-f52a886647db

Best regards,
-- 
Mark Brown <broonie@kernel.org>

