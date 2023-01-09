Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF3AAC5479D
	for <soc@archiver.kernel.org>; Mon,  9 Jan 2023 23:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9DD99C433F0; Mon,  9 Jan 2023 23:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BD77C433EF;
	Mon,  9 Jan 2023 23:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673308031;
	bh=ht4Wv9Cglhs60TpBP+Y7ZEPhCYdlzBXlzkOX9GVh1aY=;
	h=From:Date:Subject:List-Id:To:Cc:From;
	b=KEO24XSBeSu0zXeoSXLt054rhifebgRRCxAtQZXZZZsP2AbxqE9dl0JHuK1MqEXLt
	 8ssdTycWPd9PG0K9ooAIkbwDY7/q97vng0DSX6kSm1TCPLIlscrMJIg2jSRwLUqb+M
	 YnK9Y+D5VQAEWBpbkl4Z6lAvJp9F64OUG+yYEeIPh24HfMY14kZhYjtDO0OKCOI/CL
	 gIrVuFi4GGb5+CG8JZyFUtlt3VaZnDpN3lQYtvNj3EgG2JmB9mqzDslrOu7oGwryq0
	 ndL1k0LAavudb9tf0mDMALOTfrvjuIFkRaK04mCZqhHgejlbc/lCScziTvw8Mg8Kd/
	 dL3+gC0lsTfjw==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 09 Jan 2023 23:46:53 +0000
Subject: [PATCH] ARM: multi_v5_defconfig: Enable I2C_GPIO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230109-arm-multi-v5-i2c-gpio-v1-1-78e191358548@kernel.org>
X-B4-Tracking: v=1; b=H4sIAG2nvGMC/x2NQQ6CMBAAv0L27CbtikT8iuHQlhU2Sku2iiSEv
 1s8ziST2SCzCme4VRsoL5IlxQL2VEEYXRwYpS8MZOhsrGnR6YTT5/UWXC4oFHCYJWHdULA9X1vf
 EJTWu8zo1cUwHvU36fPQs/JD1v/u3u37D0j1Wj9+AAAA
List-Id: <soc.lore.kernel.org>
To: Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.12-dev-8b3d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=938; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ht4Wv9Cglhs60TpBP+Y7ZEPhCYdlzBXlzkOX9GVh1aY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBjvKd9bakbQXSeXh42Nc8xLhFuQqZuFa9sl1N/3LNH
 4ZIPbeKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCY7ynfQAKCRAk1otyXVSH0MvlB/
 9rqAjKtmXjzXsrucrjw3RpdI8kzpGfh0/m0aVasEMRMAFK2hXvhdtqD7yQpfiFjEkyJWooqvQEMC8J
 VsKEJ+5MFOTY+EPgOn00MglmjjGi3WfV8wo9fymIkv7n1uZx/RfeCfS9SfFkMytO6sPog/AJI4a7KL
 Vbz/ARRC9oOW6hYCHmpSHbj5vC1DD2ZGBgEmxo99wwwt27EymZymWUkgvy1QRc3gnxbgqpEzzoMj+i
 gu9MvEy/d5nERXb0afW2oU83lTr1EvRkpeomf5dIvethyIxxOZ4QaxxZBIGjdN7SJcgQvd/n6cq53L
 wKMSVocAlWCSFCxVo3Mdsnpwb40PI2
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

A GPIO based I2C bus is used by at least some Atmel reference boards,
including the AT91SAM9G20-EK which is in CI, enable the driver as a
module to improve test coverage and help users of systems that happen to
use it.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm/configs/multi_v5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
index 60fc52b95690..aaeb924d21eb 100644
--- a/arch/arm/configs/multi_v5_defconfig
+++ b/arch/arm/configs/multi_v5_defconfig
@@ -138,6 +138,7 @@ CONFIG_HW_RANDOM_TIMERIOMEM=m
 CONFIG_I2C_CHARDEV=y
 CONFIG_I2C_ASPEED=m
 CONFIG_I2C_AT91=y
+CONFIG_I2C_GPIO=m
 CONFIG_I2C_IMX=y
 CONFIG_I2C_MV64XXX=y
 CONFIG_SPI=y

---
base-commit: 30a0b95b1335e12efef89dd78518ed3e4a71a763
change-id: 20230109-arm-multi-v5-i2c-gpio-462c1de89b62

Best regards,
-- 
Mark Brown <broonie@kernel.org>
