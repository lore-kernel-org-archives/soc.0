Return-Path: <SRS0=qzOq=PJ=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC635C433F5
	for <soc@archiver.kernel.org>; Thu, 21 Oct 2021 12:55:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A4E0160F25; Thu, 21 Oct 2021 12:55:48 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87E5E61186
	for <soc@kernel.org>; Thu, 21 Oct 2021 12:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87E5E61186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id x27so690804lfu.5
        for <soc@kernel.org>; Thu, 21 Oct 2021 05:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AeWqycYIuVt19sWOnyHEv1PGs8MPa9Z3i7y2gAAE/yk=;
        b=NawLACvWDNKuQZVM7gNhU33JZAmxzGAz0vAmzpC5uZmVYq9AxySnJhJUX7p4ZldZdf
         +LZOrKPc0ZBTJ1LxLk/yCZbuT8EOCxT93xgzD6jcR77fab2x2z0EP8GMxYLm6ecL+eKS
         Qo4TDqE3Skv/DOpgzZV0MRDfgEJHaHxMcMqGZv8/zJf2Bwsx52rQWramOL0xY+ZYc3A5
         lOzTOMiegLmfaM7ZWuMYvOIrZc6dBmPN68MK6/U7RjeOAXH1t8tuYKyR+MlkDP/nWrlt
         PVuDS1e6CSQffOi1epq0sOqsdA7FmEFdiwqrSVCl+yMiFZvZ5cdxb35WQrxDFJ3dVOcz
         /lSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AeWqycYIuVt19sWOnyHEv1PGs8MPa9Z3i7y2gAAE/yk=;
        b=MuCh49gB7BgyuAmyKmrrmmmo5SVfoSlWeZHZa83cAYbnPCWh1k0UNBkHL7W0LTOXXY
         QvDP3wwsiMhGiGK/9FrnduIkUd6BUaPj3l7vmR7nyUC1qkTk0sP0Ixi2PQwwZ3Il6p9V
         rvpizvATKx7KnL4TYNwerRdkfO/Us3UAXLPD0bR9pzmMLJU2w9W0vfVXKV3RYtXTmy1P
         /2jNxBCYHHkl+sYSJJzJ6vekG1Me0P8PgzQTw1+JEYyL7H0bccNBvDEQVn/DP6P+2nKd
         XzZYkz8pp7but69+tiQmLELd+SYUpxnrZQeirKrCXLYNNx927JPYJ2K2JeeVZMoeIvjB
         q+Rg==
X-Gm-Message-State: AOAM530qwqUmJwzq4KyQlLMTTaub/iTyAngm4kMOWaFUZFFwUetqGaZw
	KAySiGjjtr3Ouk0yScGwuHAuc1QCd9N/DA==
X-Google-Smtp-Source: ABdhPJxFzmGm3er4wZIEDT2Ppy5LMXVNyzH3mHvH0sSXnZoZwxhSW/0taeZrEqARBPg20tX5wEYXAw==
X-Received: by 2002:ac2:4bc1:: with SMTP id o1mr5100924lfq.553.1634820945937;
        Thu, 21 Oct 2021 05:55:45 -0700 (PDT)
Received: from jade.urgonet (h-94-254-48-165.A175.priv.bahnhof.se. [94.254.48.165])
        by smtp.gmail.com with ESMTPSA id r30sm455285lfp.298.2021.10.21.05.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 05:55:45 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: arm-soc <arm@kernel.org>,
	OP-TEE TrustedFirmware <op-tee@lists.trustedfirmware.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH] optee: smc_abi.c: add missing #include <linux/mm.h>
Date: Thu, 21 Oct 2021 14:55:39 +0200
Message-Id: <20211021125539.3858495-1-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds missing #include <linux/mm.h> drivers/tee/optee/smc_abi.c to fix
compile errors like:
drivers/tee/optee/smc_abi.c:405:15: error: implicit
declaration of function 'page_to_section'
[-Werror,-Wimplicit-function-declaration]
        optee_page = page_to_phys(*pages) +
                     ^
arch/arm/include/asm/memory.h:148:43: note: expanded from
macro 'page_to_phys'
                                               ^
include/asm-generic/memory_model.h:52:21: note: expanded
from macro 'page_to_pfn'
                    ^
include/asm-generic/memory_model.h:35:14: note: expanded
from macro '__page_to_pfn'
        int __sec = page_to_section(__pg);                      \
                    ^
drivers/tee/optee/smc_abi.c:405:15: note: did you mean
'__nr_to_section'?
arch/arm/include/asm/memory.h:148:43: note: expanded from
macro 'page_to_phys'
                                               ^
include/asm-generic/memory_model.h:52:21: note: expanded
from macro 'page_to_pfn'
                    ^
include/asm-generic/memory_model.h:35:14: note: expanded
from macro '__page_to_pfn'
        int __sec = page_to_section(__pg);                      \
                    ^
include/linux/mmzone.h:1365:35: note: '__nr_to_section'
declared here
static inline struct mem_section *__nr_to_section(unsigned long nr)

Fixes: c51a564a5b48 ("optee: isolate smc abi")
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---

I wasn't able to reproduce the error above. It obviously involves
CONFIG_SPARSEMEM=y, but something more seems to be needed to trigger the
error. Nonetheless, including <linux/mm.h> should fix the error.

Thanks,
Jens


 drivers/tee/optee/smc_abi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index 9a787fb4f5e5..6196d7c3888f 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -10,6 +10,7 @@
 #include <linux/errno.h>
 #include <linux/io.h>
 #include <linux/sched.h>
+#include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
-- 
2.31.1

