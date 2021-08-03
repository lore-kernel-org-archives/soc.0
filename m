Return-Path: <SRS0=tnVs=M2=foss.st.com=prvs=28490fd7ee=patrice.chotard@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69D7CC4320A
	for <soc@archiver.kernel.org>; Tue,  3 Aug 2021 12:45:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 02F9460F9C; Tue,  3 Aug 2021 12:45:24 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63C7860F93;
	Tue,  3 Aug 2021 12:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 63C7860F93
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 173CXJ3k031828;
	Tue, 3 Aug 2021 14:45:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=oQNf3irtNVfOxL6klUF0V/W94mMn2Ppq+SP44k3H70A=;
 b=xaKS8i0FwVVngNQy4DNL0WZXiQju5Dvh/WF1scUUI8AkSWSlImuVRhEqkbrtvvbagPlp
 Pr34/R19Qzy01G00zxGKublEnn8H2o87B/yVatAwjVnRvebjm/MyanPUFVpErFHzUeqq
 ca5QE+bWlwJ/lYKIT/ORUdCXzIc0w++WI/YhsYBFlIXdqGXWgdyYljh8qdEowYuNw7YM
 /WHgNa4Kc4jFchZBnXLjUeSVjx61D+aPdKdgeNqZX6gAw2sEMxfMnz1AyIY/f6IR1+rs
 LjSWQs/xJ2QKa6ud4XUKWpwqI+H/diwSD3Z1Hdq3NC4a6LkfNaiycKigBH9qgv2nu4/T yw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 3a74mx8e24-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Aug 2021 14:45:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6A72910002A;
	Tue,  3 Aug 2021 14:45:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5F8ED222C86;
	Tue,  3 Aug 2021 14:45:18 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 3 Aug 2021 14:45:17
 +0200
From: <patrice.chotard@foss.st.com>
To: <robh+dt@kernel.org>, <mark.rutland@arm.com>, <linux@armlinux.org.uk>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
List-Id: <soc.lore.kernel.org>
CC: <patrice.chotard@foss.st.com>, <soc@kernel.org>
Subject: [PATCH 1/4] ARM: dts: sti: remove clk_ignore_unused from bootargs for stih407-b2120
Date: Tue, 3 Aug 2021 14:45:03 +0200
Message-ID: <20210803124506.23365-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210803124506.23365-1-patrice.chotard@foss.st.com>
References: <20210803124506.23365-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-03_02:2021-08-03,2021-08-03 signatures=0

From: Patrice Chotard <patrice.chotard@foss.st.com>

Remove clk_ignore_unused from bootargs as it's no more needed.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/stih407-b2120.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/stih407-b2120.dts b/arch/arm/boot/dts/stih407-b2120.dts
index 31c85f945c6b..9c79982ee7ba 100644
--- a/arch/arm/boot/dts/stih407-b2120.dts
+++ b/arch/arm/boot/dts/stih407-b2120.dts
@@ -11,7 +11,6 @@
 	compatible = "st,stih407-b2120", "st,stih407";
 
 	chosen {
-		bootargs = "clk_ignore_unused";
 		stdout-path = &sbc_serial0;
 	};
 
-- 
2.17.1

