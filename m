Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BF8215046
	for <soc@lists.linux.dev>; Sun,  9 Feb 2025 22:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739138836; cv=none; b=Jsyn9WvhtvDPpwxBpZcrXOjzJKqyHXEAyxykMUjRG5YUMNcOJ9E4mXoZ2Xfx2ONUwR+iSs+MeNAumQ202s8KSO74ilB+wKDnN91+IgW91X0mvYdGIhnxFErBUktHh+jSrznxAN0gUOGTCUb1eG6QAHvnLUdk/5QBqC9DNs3ZwYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739138836; c=relaxed/simple;
	bh=uroPKKaN+hm8ZOaXXgQ6wTDHWe3x+0gyAjigUkvchR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LS7BWsqbuA8vYrOmO1smmFKq7Fcxp5PQOhOk2lt7G0lWEXxM0lzABtZwsRsaylgMkzDyVujRaYhjDaoBi6zJzPqTS6qHu1zoAp5fALuwMgsCTMftg5FnBFF66VPi/QtLeVSmDRcpXGBiHLIafbQHQGVEv5l2l8AuNvxXu59hw68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RRa9VYnV; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RRa9VYnV"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38dd14c99c3so851642f8f.3
        for <soc@lists.linux.dev>; Sun, 09 Feb 2025 14:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739138833; x=1739743633; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=369dAJGZKeB0JOjSvrMu1FUQdCgqdozrza7riiyrYK0=;
        b=RRa9VYnVsu+o3mQ1nCEkKNnRs3uxIl7eI9OQK/MKfCW53hpqpL1hYNz1ahne/klQA7
         UF8pNPt+6N72aZWqCT5UWMUA+f45PRINZPb/Ye6OBHnTjszrfMMGwxok+VMthvQ9yNPT
         oWF+kBx0134anSFSshkHndLlFoK7rOdPRhP/4jMVQoscclIc7Wlj6M6IMQvwdjExysqD
         rscmEPvoDus4hL1N6nx99OUwPacFluDyR6vq7CwHsHc916hDzbWvRn94A3kLRLTzaguo
         yGxXWFSOxE+3zPf+ddJ7NU80UjLoWf6BXiHv/uoEC9EK6rscFJE8MAIritTnxw6jsQIm
         FXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739138833; x=1739743633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=369dAJGZKeB0JOjSvrMu1FUQdCgqdozrza7riiyrYK0=;
        b=AlKU2ZHG286PTOozUDXfzFdemu39C9JwkcoouNMeRenVcmC+kZsQhc9u6RefX5Cp0h
         eEdmhFI5oG7l5GErYdac3Am7Tu6poq1tfNg79Nev+2rlNktbW1HYQOt+h+arFPCq5bkF
         I3v3JYIXEAboxxuR9DqcEvNyG/N637BOJPLOt/08hqFHZW97yPKP03ID+a3Tv7SGlypA
         TIXGTBz8KdhPR0UKi3ElNZXRU+xUp9M2SEnsbGdaXo+jDWlGB6Jvyy5UVwtjKxwHTxhn
         7jnb+44/ezLFxEwHkz6GV4qyKRJYGCpBh0yzvb8cS3xaVhdtNf0EvDF0pxoQy0AqCaYj
         CwJw==
X-Gm-Message-State: AOJu0YwIDjbiIrS2onkkeBp/Kke1cH8pkOlqbJFbD3BYDPhm5ABwmrca
	RkMakYILNr5dhEZWaeRqL6ACBRILFjDJwKu0vqbK5Z+CzVnBHMe+jX0GtX13
X-Gm-Gg: ASbGncvUCmkjPYjVz3m5oCO6vA28Z1UAJ35XJ3NSWor3GQbJbPgUZ+7l+xPbxQcOY0g
	b1KdNhTDZjyDtXvbxMR/az8HJCEW9e06FXP4JZI6R9glJWZIR/rU+lv0i95sJD6ShYanvdaFmAR
	U+sZRcNxKe+dLDaq9f2/gGGHTuBbJseKV4/23/afaNVHQ4XQZ8Zm1j6EbdMMZ3hGt2/fJWxIBHx
	TdXPgxja1qpvK5gPnWFmHAEtUiqRCilFIyVn86djuBblmS8DuAGlgbN1FhAW8oDU29t03l4EeNc
	G5WE9wSNjnS9k3+sYy2BPo/n6ocD
X-Google-Smtp-Source: AGHT+IGQNeDm9SkXrpQUSzcKpyxZS28meHGL8UbkTV9jZIpjqhrqbWvmN7mXz5mtgw2H/4aI14AXXQ==
X-Received: by 2002:a05:6000:4028:b0:38d:d767:364 with SMTP id ffacd0b85a97d-38dd7670e6fmr3783272f8f.13.1739138833224;
        Sun, 09 Feb 2025 14:07:13 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf2ed900sm10386544f8f.53.2025.02.09.14.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 14:07:12 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Sebastian Reichel <sre@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH 09/10] power: reset: cv18xx: New driver
Date: Sun,  9 Feb 2025 23:06:34 +0100
Message-ID: <20250209220646.1090868-10-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add new driver to support cold and warm reset on Cvitek CV18xx and Sophgo
SG2000 SoCs.

Link: https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v1.01/sg2000_trm_en.pdf
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 MAINTAINERS                        |  1 +
 drivers/power/reset/Kconfig        | 12 ++++
 drivers/power/reset/Makefile       |  1 +
 drivers/power/reset/cv18xx-reset.c | 89 ++++++++++++++++++++++++++++++
 4 files changed, 103 insertions(+)
 create mode 100644 drivers/power/reset/cv18xx-reset.c

diff --git a/MAINTAINERS b/MAINTAINERS
index e4f5d8f68581..b7fec02f7673 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22147,6 +22147,7 @@ M:	Chen Wang <unicorn_wang@outlook.com>
 M:	Inochi Amaoto <inochiama@outlook.com>
 T:	git https://github.com/sophgo/linux.git
 S:	Maintained
+F:	drivers/power/reset/cv18xx-reset.c
 N:	sophgo
 K:	sophgo
 
diff --git a/drivers/power/reset/Kconfig b/drivers/power/reset/Kconfig
index 60bf0ca64cf3..d41ed3c2a30d 100644
--- a/drivers/power/reset/Kconfig
+++ b/drivers/power/reset/Kconfig
@@ -75,6 +75,18 @@ config POWER_RESET_BRCMSTB
 	  Say Y here if you have a Broadcom STB board and you wish
 	  to have restart support.
 
+config POWER_RESET_CV18XX
+	bool "Cvitek CV18XX/Sophgo SG2000 reset driver"
+	depends on ARCH_SOPHGO || COMPILE_TEST
+	depends on MFD_SYSCON
+	default ARCH_SOPHGO
+	help
+	  This driver provides restart support for Cvitek CV18xx and
+	  Sophgo SG2000 SoCs.
+
+	  Say Y here if you have a Cvitek CV18xx or Sophgo SG2000 SoC and
+	  you wish to have restart support.
+
 config POWER_RESET_EP93XX
 	bool "Cirrus EP93XX reset driver" if COMPILE_TEST
 	depends on MFD_SYSCON
diff --git a/drivers/power/reset/Makefile b/drivers/power/reset/Makefile
index 10782d32e1da..ce24e74e0477 100644
--- a/drivers/power/reset/Makefile
+++ b/drivers/power/reset/Makefile
@@ -7,6 +7,7 @@ obj-$(CONFIG_POWER_RESET_ATC260X) += atc260x-poweroff.o
 obj-$(CONFIG_POWER_RESET_AXXIA) += axxia-reset.o
 obj-$(CONFIG_POWER_RESET_BRCMKONA) += brcm-kona-reset.o
 obj-$(CONFIG_POWER_RESET_BRCMSTB) += brcmstb-reboot.o
+obj-$(CONFIG_POWER_RESET_CV18XX) += cv18xx-reset.o
 obj-$(CONFIG_POWER_RESET_EP93XX) += ep93xx-restart.o
 obj-$(CONFIG_POWER_RESET_GEMINI_POWEROFF) += gemini-poweroff.o
 obj-$(CONFIG_POWER_RESET_GPIO) += gpio-poweroff.o
diff --git a/drivers/power/reset/cv18xx-reset.c b/drivers/power/reset/cv18xx-reset.c
new file mode 100644
index 000000000000..bc1797e7d3f5
--- /dev/null
+++ b/drivers/power/reset/cv18xx-reset.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/notifier.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/reboot.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+
+/* RTCSYS_CTRL registers */
+#define RTC_CTRL_UNLOCKKEY		0x04
+#define RTC_CTRL0			0x08
+#define  REQ_PWR_CYC			BIT(3)
+#define  REQ_WARM_RST			BIT(4)
+
+/* RTCSYS_CORE registers */
+#define RTC_EN_PWR_CYC_REQ		0xC8
+#define RTC_EN_WARM_RST_REQ		0xCC
+
+static struct regmap *rtcsys_ctrl_regs;
+static struct regmap *rtcsys_core_regs;
+
+static int cv18xx_restart_handler(struct sys_off_data *data)
+{
+	u32 reg_en = RTC_EN_WARM_RST_REQ;
+	u32 request = 0xFFFF0800;
+
+	if (data->mode == REBOOT_COLD) {
+		reg_en = RTC_EN_PWR_CYC_REQ;
+		request |= REQ_PWR_CYC;
+	} else {
+		request |= REQ_WARM_RST;
+	}
+
+	/* Enable reset request */
+	regmap_write(rtcsys_core_regs, reg_en, 1);
+	/* Enable CTRL0 register access */
+	regmap_write(rtcsys_ctrl_regs, RTC_CTRL_UNLOCKKEY, 0xAB18);
+	/* Request reset */
+	regmap_write(rtcsys_ctrl_regs, RTC_CTRL0, request);
+
+	return NOTIFY_DONE;
+}
+
+static int cv18xx_reset_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	int ret;
+
+	if (!np)
+		return -ENODEV;
+
+	rtcsys_ctrl_regs = syscon_regmap_lookup_by_phandle(np, "sophgo,rtcsys-ctrl");
+	if (IS_ERR(rtcsys_ctrl_regs))
+		return dev_err_probe(dev, PTR_ERR(rtcsys_ctrl_regs),
+				     "sophgo,rtcsys-ctrl lookup failed\n");
+
+	rtcsys_core_regs = syscon_regmap_lookup_by_phandle(np, "sophgo,rtcsys-core");
+	if (IS_ERR(rtcsys_core_regs))
+		return dev_err_probe(dev, PTR_ERR(rtcsys_core_regs),
+				     "sophgo,rtcsys-core lookup failed\n");
+
+	ret = devm_register_restart_handler(&pdev->dev, cv18xx_restart_handler, NULL);
+	if (ret)
+		dev_err(&pdev->dev, "Cannot register restart handler (%pe)\n", ERR_PTR(ret));
+	return ret;
+}
+
+static const struct of_device_id cv18xx_reset_of_match[] = {
+	{ .compatible = "sophgo,cv1800-reset" },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, cv18xx_reset_of_match);
+
+static struct platform_driver cv18xx_reset_driver = {
+	.probe = cv18xx_reset_probe,
+	.driver = {
+		.name = "cv18xx-reset",
+		.of_match_table = cv18xx_reset_of_match,
+	},
+};
+module_platform_driver(cv18xx_reset_driver);
+
+MODULE_AUTHOR("Alexander Sverdlin <alexander.sverdlin@gmail.com>");
+MODULE_DESCRIPTION("Cvitek CV18xx/Sophgo SG2000 Reset Driver");
+MODULE_ALIAS("platform:cv18xx-reset");
-- 
2.48.1

