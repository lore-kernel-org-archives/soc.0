Return-Path: <SRS0=ONuN=TM=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B73C433F5
	for <soc@archiver.kernel.org>; Tue,  1 Mar 2022 10:44:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F156AC340EF; Tue,  1 Mar 2022 10:44:02 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8FDE9C340EE
	for <soc@kernel.org>; Tue,  1 Mar 2022 10:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8FDE9C340EE
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Received: by mail-pl1-f176.google.com with SMTP id p17so13108598plo.9
        for <soc@kernel.org>; Tue, 01 Mar 2022 02:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qmdWZ0Ngl9nlWWgEJzu97RHRmPhanMjm7buTdrAowbQ=;
        b=QnSZWYzZdu9pqqIrseh0j/wMKrMxCoz1ovhyc32RMroAy9PX81dIaqyWXzuBcd+Ing
         38+fyN5e1R5RX5MjBQ2hFz81qRwouo2brDxy+SavYZ15NksmlfWinKxuEjsCXLX1twnK
         2M/vcNiXIbmFtFvCY2cHvFLR2XHsbBdBzUOL4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qmdWZ0Ngl9nlWWgEJzu97RHRmPhanMjm7buTdrAowbQ=;
        b=n9zei5gD2gvs+KmFAkJmYsw67rxbODiIbIgxiuUvWPKHPsdRpVfck4pWxADDAyIOhb
         axVC/PIQp1KRegYNbsapglow1inkjweNeri9GEROBluXbHtpbvdsmaGhRRLurktdtSMN
         UB46HsfvuaH0y4zA4IS19etjp8k0DCdH2dVMGL7s+estsMOla9CvNxaopnFnbqQsuvnN
         a3Ic3LUC0sWm6SyTIrA0L21PgY2EyN8zsGCmnqViJI1l2Aa7KPpvZyqW9RgEAGP5mu4y
         IgHKm/847EIJyaoGLLZJVC5YI9zm9K8roquWUaJdOeebpW0KORFofml4q4KuwP1M/RD/
         s0ng==
X-Gm-Message-State: AOAM5316EF9hb41XYkSGC05JTQxt8tOh+UFkJt9e6fdxfzYMe25VyhQu
	kqVPnZMzPvAA1yJN1XCl9o2UMRG+R3kAKQ==
X-Google-Smtp-Source: ABdhPJwrSX2GUxypOi5r5JZLVm6VZm/peM4ozIYt2gLhPM/CN+YBAry5prx9rHsksurFwbXdzwGRCg==
X-Received: by 2002:a17:902:cf02:b0:14f:e0c2:1514 with SMTP id i2-20020a170902cf0200b0014fe0c21514mr25090497plg.90.1646131440627;
        Tue, 01 Mar 2022 02:44:00 -0800 (PST)
Received: from shiro.work ([2400:4162:2428:2f01:7285:c2ff:fe8e:66d7])
        by smtp.googlemail.com with ESMTPSA id m20-20020a634c54000000b003739af127c9sm12832867pgl.70.2022.03.01.02.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 02:44:00 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	romain.perier@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH] ARM: mstar: Select HAVE_ARM_ARCH_TIMER
Date: Tue,  1 Mar 2022 19:43:49 +0900
Message-Id: <20220301104349.3040422-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mstar SoCs have an arch timer but HAVE_ARM_ARCH_TIMER wasn't
selected. If MSC313E_TIMER isn't selected then the kernel gets
stuck at boot because there are no timers available.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---

I moved one of my CI builds from a 5.16 based tree to a 5.17
based one and it stopped booting. At some point I had broken my DTB
so the MStar timer wasn't getting probed anymore and at
the same time the arch timer driver wasn't getting built in.
I'm not entirely sure why the arch timer driver was built
before but isn't now. Anyhow, all of the other ARMv7 machines
seem to do this so I guess it's right.

Arnd/Olof, please apply directly if acceptable. Maybe this should
be in 5.17 as a fix?

 arch/arm/mach-mstar/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-mstar/Kconfig b/arch/arm/mach-mstar/Kconfig
index cd300eeedc20..0bf4d312bcfd 100644
--- a/arch/arm/mach-mstar/Kconfig
+++ b/arch/arm/mach-mstar/Kconfig
@@ -3,6 +3,7 @@ menuconfig ARCH_MSTARV7
 	depends on ARCH_MULTI_V7
 	select ARM_GIC
 	select ARM_HEAVY_MB
+	select HAVE_ARM_ARCH_TIMER
 	select MST_IRQ
 	select MSTAR_MSC313_MPLL
 	help
-- 
2.35.1

