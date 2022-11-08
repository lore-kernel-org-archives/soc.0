Return-Path: <SRS0=aDTb=3I=zx2c4.com=Jason@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918F0C433FE
	for <soc@archiver.kernel.org>; Tue,  8 Nov 2022 12:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5361EC433C1; Tue,  8 Nov 2022 12:38:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F421C433D6;
	Tue,  8 Nov 2022 12:38:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="OLxlnuHB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1667911092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9uRK7wMr7Y44nZE6XoPp8VtGCCuJKO228edFPqgNojo=;
	b=OLxlnuHBDuXNTQOvr+YyCidRIfsBFwbL91Hy82KeAOIzDCsJD+YCfcpRpZn+Z1kmXAsJ74
	dj+1Dk2XKV+1f4Xm/6XmoSklg6vTuvZK+VF6F5X/odNL05Y78Zt4Dcm7FIUvhRaONNyaWp
	SaxK9jlqzgR0IvVgza8cphFR5WlKRxw=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4ac5c731 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Tue, 8 Nov 2022 12:38:11 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
List-Id: <soc.lore.kernel.org>
To: linus.walleij@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	soc@kernel.org,
	linux@armlinux.org.uk
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	stable@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH RESEND] ARM: ux500: do not directly dereference __iomem
Date: Tue,  8 Nov 2022 13:37:55 +0100
Message-Id: <20221108123755.207438-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sparse reports that calling add_device_randomness() on `uid` is a
violation of address spaces. And indeed the next usage uses readl()
properly, but that was left out when passing it toadd_device_
randomness(). So instead copy the whole thing to the stack first.

Fixes: 4040d10a3d44 ("ARM: ux500: add DB serial number to entropy pool")
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/202210230819.loF90KDh-lkp@intel.com/
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 drivers/soc/ux500/ux500-soc-id.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/soc/ux500/ux500-soc-id.c b/drivers/soc/ux500/ux500-soc-id.c
index a9472e0e5d61..27d6e25a0115 100644
--- a/drivers/soc/ux500/ux500-soc-id.c
+++ b/drivers/soc/ux500/ux500-soc-id.c
@@ -167,20 +167,18 @@ ATTRIBUTE_GROUPS(ux500_soc);
 static const char *db8500_read_soc_id(struct device_node *backupram)
 {
 	void __iomem *base;
-	void __iomem *uid;
 	const char *retstr;
+	u32 uid[5];
 
 	base = of_iomap(backupram, 0);
 	if (!base)
 		return NULL;
-	uid = base + 0x1fc0;
+	memcpy_fromio(uid, base + 0x1fc0, sizeof(uid));
 
 	/* Throw these device-specific numbers into the entropy pool */
-	add_device_randomness(uid, 0x14);
+	add_device_randomness(uid, sizeof(uid));
 	retstr = kasprintf(GFP_KERNEL, "%08x%08x%08x%08x%08x",
-			 readl((u32 *)uid+0),
-			 readl((u32 *)uid+1), readl((u32 *)uid+2),
-			 readl((u32 *)uid+3), readl((u32 *)uid+4));
+			   uid[0], uid[1], uid[2], uid[3], uid[4]);
 	iounmap(base);
 	return retstr;
 }
-- 
2.38.1

