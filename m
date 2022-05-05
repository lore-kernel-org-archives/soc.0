Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBD8C433F5
	for <soc@archiver.kernel.org>; Thu,  5 May 2022 17:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 543EFC385AC; Thu,  5 May 2022 17:10:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C871DC385A8;
	Thu,  5 May 2022 17:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651770653;
	bh=evU35nJBqrpeiAhnQv1WH0Y0gYx6b8Gctz53hEFMvu4=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=dPWJUHTzZFnnN7fj+8yn0XUKNnvxtYidSCtO22IYlc8KRRiJLFFAv1sKBPAjkPkyK
	 mNEr7vym2ymp5pBZHkEUgrxH5H5r+7J1iDTjeqoe2uzIQvIQJZbhQ5NWwnMG6/nFrn
	 4bqD7So1gsom7dGXvK7aaudsP7YVKTFgYbTGiMTILhqlCXltyTUMs4RQDG2PZb89ur
	 aLYrQnP/vuethByCmFWUxvM18jpaTkqv4tOHUzMOUScjiUX/TrqS1aq7YAdcELLGYd
	 aDU+Fv+JQN3iLy1RdHQhQCZ8wjg4lsAwALwgMWpjdzfoemlAXeA+BmeFBN0npVEqq8
	 iXoFjBjPlB8Ew==
From: Mark Brown <broonie@kernel.org>
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v2] ARM: configs: at91: Enable options required for systemd
Date: Thu,  5 May 2022 18:10:43 +0100
Message-Id: <20220505171043.553079-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1161; h=from:subject; bh=evU35nJBqrpeiAhnQv1WH0Y0gYx6b8Gctz53hEFMvu4=; b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBidATiezup2Vfl7OPMn1V3Bqj3TteUYHUruP1SroZX tDlQJQmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYnQE4gAKCRAk1otyXVSH0EnsB/ 92sNQqdpDiu3nHliqFs076OchqHUUtpa369pPjMqpMWyT5ojnEACwbNlU5URm7y0VJfEwwGp76sL32 J2EIMF4NbpbQ1rWA97lTHHphAj37tuMhiAvSLzbJy0AS8nVHTtxTMzQmthiDOHPHjgUd2Y0sM6C4Wc 5Npd7LygSUYuxRiQs+CGHDb/GbtDOcBpQ2lEDcongrJUnNhEsx1UO1kq27GNyovl+jYEVcUyjtCNlF JPQUqmkxcgL8O+h4VWdH4BVJHW8VqYW8VEQ9WlmmYDMJqWMwC9wu2ybnsMGB5zV9YdWnZnCh7R04jy KN26Ii8kT4XfMlSlKxAGGLRHXXpuLO
X-Developer-Key: i=broonie@kernel.org; a=openpgp; fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit

Even smaller embedded systems are using systemd these days, as
are test automation systems like KernelCI, so it is useful to be
able to use systemd on these boards by default. Enable options
that are missing in the at91_dt_defconfig, cgroups which is
critical and autofs4 which is less critical but causes warnings
on boot when not available.

Signed-off-by: Mark Brown <broonie@kernel.org>
---

v2:
 - s/CONFIG_AUTOFS4_FS/CONFIG_AUTOFS_FS/

 arch/arm/configs/at91_dt_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
index 549d01be0b47..a58293fdfff2 100644
--- a/arch/arm/configs/at91_dt_defconfig
+++ b/arch/arm/configs/at91_dt_defconfig
@@ -4,6 +4,7 @@ CONFIG_SYSVIPC=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_LOG_BUF_SHIFT=14
+CONFIG_CGROUPS=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 CONFIG_KALLSYMS_ALL=y
@@ -205,6 +206,7 @@ CONFIG_PWM_ATMEL=y
 CONFIG_PWM_ATMEL_HLCDC_PWM=y
 CONFIG_PWM_ATMEL_TCB=y
 CONFIG_EXT4_FS=y
+CONFIG_AUTOFS_FS=m
 CONFIG_FANOTIFY=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
-- 
2.30.2

