Return-Path: <broonie@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AF98C433FE
	for <soc@archiver.kernel.org>; Thu,  5 May 2022 12:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D172C385AE; Thu,  5 May 2022 12:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A297CC385A8;
	Thu,  5 May 2022 12:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651755463;
	bh=ivI79bC2wF/Ow2n6bvzcazos+8naPsyyaqFGtKumZFw=;
	h=From:To:List-Id:Cc:Subject:Date:From;
	b=gXJzduWFmMH8bCr90VpopmG5y8yVoM+LfysVkNOE+MFwGgKds6FByOZuSOP1Fb37z
	 IZvNKIxIGLwy79YqpF6rOSqLKYbDjtjmlUt4wNKWHc9x/0LOmd3ktGmjkGSGXpu0Vf
	 /65uV4i9F8IERbnfPReXAHMXw0ZR2nVMEagt1YYnLrFg8d298gNptJ8QEQV7m7VzoB
	 DKZXb+I/mm3K/IPgeT6bmrFcglm6Pxra9sPm/BSKvtk71+UlzP+SLUdMJF5X0z6x4i
	 M4VxVcWrlRQaLrfVOuho6ipkg5wNwCF0NJ1Zg2l0Fj+1mOHSgbWPwSbkP6OhKGK2ch
	 PjOldehw+68jQ==
From: Mark Brown <broonie@kernel.org>
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	soc@kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH RESEND] ARM: configs: at91: Enable options required for systemd
Date: Thu,  5 May 2022 13:57:36 +0100
Message-Id: <20220505125736.207029-1-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1201; h=from:subject; bh=ivI79bC2wF/Ow2n6bvzcazos+8naPsyyaqFGtKumZFw=; b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBic8mHZoeUoi7AlK/cFocK3+LjJFB90MmANF1jNQbG UX1LbVWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYnPJhwAKCRAk1otyXVSH0O5wB/ 9HYlhoi4yltNWX2WjZn1QqHWKUcRGq6PawWL7Dij2kJCwVymJObbwY53U5xzVSKolrBS2BIxZMnAmA xUo7EsUaxi9+X6Ap/t2ZHaofjs0fbcO4iit6qNdw1GEbLKxnnf0NuM3HhBVKl7gUnDCsy7X/9PjDgf 9CmF1xlnlRPYdGuQTivY4s8VW8hx7oioDDRLTvUqIM3MJfhkPkdwaCH55z/6P9IO0bdvOkrC6ddKgG +xnh/UtV6Xq5rDX9iV+NgGdyIpzAAJf6EQytgBv/+o2A6X8WoMHPHHpj8HDNraZWiMS9uDaZ+bXwDV 7m3SWkrO7ADlBkgNdxs9TJorNRa3sf
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

This would be useful for KernelCI which uses a systemd based rootfs for
many tests.

 arch/arm/configs/at91_dt_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/at91_dt_defconfig b/arch/arm/configs/at91_dt_defconfig
index 549d01be0b47..bbb7f400a57f 100644
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
+CONFIG_AUTOFS4_FS=m
 CONFIG_FANOTIFY=y
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
-- 
2.30.2

