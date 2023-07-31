Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0766BC001DE
	for <soc@archiver.kernel.org>; Mon, 31 Jul 2023 11:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C31D6C433C9; Mon, 31 Jul 2023 11:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CE50C433C8;
	Mon, 31 Jul 2023 11:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690804417;
	bh=7Nh3ZHtw9GX87D+Rssk/zZbhNNsuuFmQd/DWtJ1ZxC8=;
	h=From:Date:Subject:List-Id:To:Cc:From;
	b=XZ4JpHisvKHahVecwuyAZ/zCzYnoUSziIn/QOtkmYHvm99+Jy+aKV0R5jG+3zWorC
	 y01VThF8nEhvulp2rhuyM+qicDJkEpQ32IhpbqOS04NkQyMi9DHd/4EYEZbM4iVOus
	 82m7qM5XHjr+KJEiuIwDvlV5U/4uejVKstbuI6FuiE5CI32hZ+x92pUkmoAoNcj0Sv
	 j9486yV5zJy03kJq5qFa2xskH89jTcqDvCcjHSeNkqYdltzH9Tn0Ufbaf0qyTrK1yb
	 7PWVEbjFBBldDloFViwaOQwSbNVRTu18hLFKG7qrH2csbmULVrL+/ZzcgM7ioIHFUg
	 UEpwtITGUQgXA==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 31 Jul 2023 12:53:27 +0100
Subject: [PATCH RESEND] ARM: multi_v7_defconfig: Enable TLV320AIC3x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230731-arm-tlv320aic31xx-config-v1-1-013c8c321dad@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Tony Lindgren <tony@atomide.com>, 
 =?utf-8?q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=974; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7Nh3ZHtw9GX87D+Rssk/zZbhNNsuuFmQd/DWtJ1ZxC8=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkx6C+RcJR/jD56Wwmh2TJDy7FHtBa2XvVDHLYXdzO
 FY5iXXyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZMegvgAKCRAk1otyXVSH0KTcB/
 4g2DjaUHq1IdPjRh35fS3AsL5LQl62FUQsznxUYx7amei/tNAv8ujm1jO4MiUuhtnBqRKaKcFhJ3+w
 /pwzyq+eDCk/4kHTjuI31P0x+79uFb5rR3ADy9w1XYIBgxwfUgUOBvXYXSFP1WnGv+K1oky0my0mMD
 7+qZCpH1MCKO7CI5pcpltbC54goO1Ban0hEZ55VRipbWNAcYeCMdSc6wiNSSiNSSwSeozX3310mqxY
 HA8FIrWCsih7XLMYTMyYDqJT7RTC7w5MSYfb9sASbHqq2ABsTW1gSkL8RQiFijF1xYQIt/3Mt7CAi0
 HdH4S80el86AjOOaPr5Gi02L2135l9
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

