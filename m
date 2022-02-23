Return-Path: <SRS0=moCm=TG=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F6DC433EF
	for <soc@archiver.kernel.org>; Wed, 23 Feb 2022 06:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 43F16C340EC; Wed, 23 Feb 2022 06:48:18 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0FC2FC340E7
	for <soc@kernel.org>; Wed, 23 Feb 2022 06:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 0FC2FC340E7
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Received: by mail-pl1-f176.google.com with SMTP id q1so9231387plx.4
        for <soc@kernel.org>; Tue, 22 Feb 2022 22:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NQkdZuW0iA6F1PJub5RLw1uipDy5PXh4MjzK0bf9siY=;
        b=hSIfpUcfiVfbUpjcdyVn27CfwOqNaNAOPFUqfEtwR2tdtsLF7rjMv6QkVaDOTIoGOf
         PzaUpNZc6jDLAbbbT4J1Vgg9zoMZ7N6k/MbpJKNi3WHi3Nw1tE7JbK6tfXXb7wUsGE1q
         C4Y0uUI5PQnQV/M5ehevdPmj0la0z8/ZSufI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NQkdZuW0iA6F1PJub5RLw1uipDy5PXh4MjzK0bf9siY=;
        b=epr0YUdIKMP62JdcFFN4IfLJtJ/MKPjwQgjEMgj7XQYkfo8Wl/6ZD2NLzwV3x7UPwA
         KrmrioZF8pwRyKrxhuWW/QaFOh1sl1v8uHElg1vvqjlJ3bd5O7iPlKn6AYkFyUqFNPpj
         fGdHn5Bq93Co4Slt9E/pacNLWdBMfilUmbGdXLIP7cbvAWvmOvlVQrbDSzjjOqSr4J6A
         mk84VPUEDnCy5UgPoK4JSGEzW4LtTNQPV/0pJ86850oH7HA8ceplcSIYL6bTKlmQN29q
         V7QaPndcHC7eK1IXS3YENSMkha++yGM54w0ffP18qcveFJ+nT1grRlB2882AwOpeVrjg
         xBNw==
X-Gm-Message-State: AOAM533LsZwhoMLMbwRlZYQ7SFgJY4K8tt9X3aT+GD7PI/dmhT2CK8/q
	12/TzfXqyfi6BqOBbjwM07Xjpb5BZBR/kQ==
X-Google-Smtp-Source: ABdhPJwUFStu9Ofd9ZOPhC4AtPbqkqCqBNCEWbWF5QovUpN5pg36B6khO4jl1hvh/aSGU4046f07QA==
X-Received: by 2002:a17:902:b490:b0:14c:da4a:deca with SMTP id y16-20020a170902b49000b0014cda4adecamr26788557plr.134.1645598896195;
        Tue, 22 Feb 2022 22:48:16 -0800 (PST)
Received: from shiro.work (p1206043-ipngn200715sizuokaden.shizuoka.ocn.ne.jp. [118.13.44.43])
        by smtp.googlemail.com with ESMTPSA id v17-20020a17090a459100b001b93ef45c13sm1621204pjg.55.2022.02.22.22.48.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 22:48:15 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	romain.perier@gmail.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH] ARM: mstar: Select ARM_ERRATA_814220
Date: Wed, 23 Feb 2022 15:48:07 +0900
Message-Id: <20220223064807.261878-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All of the SoCs that are supported so far are Cortex A7 r0p5.
So it seems like this errata is present.

Signed-off-by: Daniel Palmer <daniel@0x0f.com>
---
 Arnd/Olof: Please apply this directly if acceptable.
 I don't think we'll have enough for a PR.

 arch/arm/mach-mstar/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-mstar/Kconfig b/arch/arm/mach-mstar/Kconfig
index 647355a94aa9..cd0e949a4f69 100644
--- a/arch/arm/mach-mstar/Kconfig
+++ b/arch/arm/mach-mstar/Kconfig
@@ -1,6 +1,7 @@
 menuconfig ARCH_MSTARV7
 	bool "MStar/Sigmastar Armv7 SoC Support"
 	depends on ARCH_MULTI_V7
+	select ARM_ERRATA_814220
 	select ARM_GIC
 	select ARM_HEAVY_MB
 	select MST_IRQ
-- 
2.35.1

