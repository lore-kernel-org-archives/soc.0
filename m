Return-Path: <SRS0=PIKk=J2=linux.alibaba.com=yang.lee@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BC1C433ED
	for <soc@archiver.kernel.org>; Thu, 29 Apr 2021 01:26:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A1A4161059; Thu, 29 Apr 2021 01:26:54 +0000 (UTC)
Received: from out30-56.freemail.mail.aliyun.com (out30-56.freemail.mail.aliyun.com [115.124.30.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F0F56103E;
	Thu, 29 Apr 2021 01:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F0F56103E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=yang.lee@linux.alibaba.com
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R901e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04420;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=8;SR=0;TI=SMTPD_---0UX7837P_1619659609;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0UX7837P_1619659609)
          by smtp.aliyun-inc.com(127.0.0.1);
          Thu, 29 Apr 2021 09:26:51 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: lorenzo.pieralisi@arm.com
List-Id: <soc.lore.kernel.org>
Cc: mark.rutland@arm.com,
	sudeep.holla@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	arm@kernel.org,
	soc@kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH v2] psci: Remove unneeded semicolon
Date: Thu, 29 Apr 2021 09:26:29 +0800
Message-Id: <1619659589-4775-1-git-send-email-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1

Eliminate the following coccicheck warning:
./drivers/firmware/psci/psci.c:141:2-3: Unneeded semicolon

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
Acked-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
---

Change in v2:
--subject should read "psci: Remove unneeded semicolon"

 drivers/firmware/psci/psci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index 64344e8..6e7bac6 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -138,7 +138,7 @@ static int psci_to_linux_errno(int errno)
 		return -EINVAL;
 	case PSCI_RET_DENIED:
 		return -EPERM;
-	};
+	}
 
 	return -EINVAL;
 }
-- 
1.8.3.1

