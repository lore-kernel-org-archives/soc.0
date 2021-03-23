Return-Path: <SRS0=9Fyi=IV=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4554C433C1
	for <soc@archiver.kernel.org>; Tue, 23 Mar 2021 08:34:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8E74B619BD; Tue, 23 Mar 2021 08:34:13 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26B61619B1
	for <soc@kernel.org>; Tue, 23 Mar 2021 08:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26B61619B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linus.walleij@linaro.org
Received: by mail-lf1-f41.google.com with SMTP id o10so25395071lfb.9
        for <soc@kernel.org>; Tue, 23 Mar 2021 01:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LTCHs9NzisZTm+iK2m5HxkWlZe42alRl6zgULFPo5I0=;
        b=l6FvNmzGN05KeNQF7pKhVoX8mqWVPlNtL8mfmgFMLYUD3VdpWgUKDgQbBqDhocji6L
         BpIfXCt3qnw1ocY//PGDHO8UhsbDVAtwCSzbivDdvnBCsAyqxKS5jKRbox3g9mpTFGNX
         m/0zkhXXAxmkOQDkY/S7yuHHPOB8uMP9sHrJnoox2+g72D2btePqmYjOgbrkrSpSjjvR
         lShcYB3K20tjX7/f88gmgdnHF1c/tU0j4POSonkXnLSFDcqrvZYileJhmLEl4r4WwT6E
         czW/GC5z76Fqm+cBSyNP7SV1rn62Zy05/2kuS/VHkWWcTADyQHmi8ynTT5UE8vu6/UP9
         mMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LTCHs9NzisZTm+iK2m5HxkWlZe42alRl6zgULFPo5I0=;
        b=j/1YtYBmjyF4YP6J5Z9mi55keJt9tnQfB1fm/QoRAcUofi79Uhddnj+DCE67sMZf17
         316R3ZvoIlwVqvW6cigcGadbqh72lZME3VtJEtx7HpmTzxYc7pt9j2/0iHnOKPXc4gxX
         YTu5l0RYjh14q5xNHeY1W06INhBncd7NmK1P3RP95cMZJidwWUH42SJJkjclD31l3Kiw
         0PN2PuajW/X1jB3nFMe2R2Z0ypMj2z+EfEUYk/UY6Mws/ilMykKxdCho0wNSfTtGUytC
         lBSr+J10AR1iQIvYt4KbcNxfcuIU3igfOK/bolxM1+1DbWASIr8LcEn+qVlZ0AmETb4d
         B+QA==
X-Gm-Message-State: AOAM532frfcs8iU+df+krK8oedRrUMGUe26tRPK2HDzbJsCGddpfA4aI
	F9ID/YvyYYeI3rBfxN7dxi9+5oBLm2qlmX0hpVI=
X-Google-Smtp-Source: ABdhPJyIRaQqWO+4qSVhK6vKcmYb6fyFak0I5VwgVrcHtVCzS/1FG5Ugs6h/tN5YObY+sQ/hGiS7fg==
X-Received: by 2002:a19:7fc3:: with SMTP id a186mr1920074lfd.626.1616488451353;
        Tue, 23 Mar 2021 01:34:11 -0700 (PDT)
Received: from localhost.localdomain (c-d7cb225c.014-348-6c756e10.bbcust.telenor.se. [92.34.203.215])
        by smtp.gmail.com with ESMTPSA id p11sm1786329lfr.235.2021.03.23.01.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 01:34:10 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: ux500: make ux500_cpu_die static
Date: Tue, 23 Mar 2021 09:32:03 +0100
Message-Id: <20210323083203.1646842-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ben Dooks <ben.dooks@codethink.co.uk>

The ux500_cpu_die function is not exported so make it static
to avoid the following warning:

arch/arm/mach-ux500/platsmp.c:89:6: warning: symbol 'ux500_cpu_die' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ARM SoC folks: please apply this patch directly. No
other Ux500 patches are queued.
---
 arch/arm/mach-ux500/platsmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-ux500/platsmp.c b/arch/arm/mach-ux500/platsmp.c
index 0810f3abd810..415d8ad2a3c1 100644
--- a/arch/arm/mach-ux500/platsmp.c
+++ b/arch/arm/mach-ux500/platsmp.c
@@ -86,7 +86,7 @@ static int ux500_boot_secondary(unsigned int cpu, struct task_struct *idle)
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
-void ux500_cpu_die(unsigned int cpu)
+static void ux500_cpu_die(unsigned int cpu)
 {
 	wfi();
 }
-- 
2.29.2

