Return-Path: <SRS0=tnVs=M2=foss.st.com=prvs=28490fd7ee=patrice.chotard@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADD1BC4338F
	for <soc@archiver.kernel.org>; Tue,  3 Aug 2021 12:45:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 940CA60184; Tue,  3 Aug 2021 12:45:26 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E82E160F92;
	Tue,  3 Aug 2021 12:45:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E82E160F92
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 173Cfude029523;
	Tue, 3 Aug 2021 14:45:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=t33nap2m+wTs8JCQipvrVQGIr/dqZ3SB4X0QkZjBKfc=;
 b=BUoUMmLXE8nH1PLGUyilUAednM8S59P8TLA/a4paDd60ySqy7Iiv9p0mqoK9YJRmhZWD
 R0SMK00Mg9+nmt7sDFn9o5whY2WboRVVEMXkL0H9yzeWke14iC2K4KNl2FCnccMWhUB4
 s4FphflfWdqLxJxtiUxHljMgvUx6WD5BK5+H28jtr4+Fk1s03z/Nz+gOQRDOt2Snjqoe
 Sn+RKDniNMYgNr3WHwf7rvbcBJBJIE3zfqxHmnByOWf3SRABd3uIoPUYNDmCneUgOnlG
 CFM0KsfU3AVvVa3Vy4iUpdGVEaskEn4RD2ipDBpAbvIFcgfksmT/9XN1arHTLuuOzItK YA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 3a70js1utg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Aug 2021 14:45:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4AC87100034;
	Tue,  3 Aug 2021 14:45:22 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3F30A222C87;
	Tue,  3 Aug 2021 14:45:22 +0200 (CEST)
Received: from localhost (10.75.127.47) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 3 Aug 2021 14:45:21
 +0200
From: <patrice.chotard@foss.st.com>
To: <robh+dt@kernel.org>, <mark.rutland@arm.com>, <linux@armlinux.org.uk>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>
List-Id: <soc.lore.kernel.org>
CC: <patrice.chotard@foss.st.com>, <soc@kernel.org>
Subject: [PATCH 4/4] ARM: dts: sti: remove clk_ignore_unused from bootargs for stih410-b2260
Date: Tue, 3 Aug 2021 14:45:06 +0200
Message-ID: <20210803124506.23365-5-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210803124506.23365-1-patrice.chotard@foss.st.com>
References: <20210803124506.23365-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG1NODE3.st.com (10.75.127.3) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-03_02:2021-08-03,2021-08-03 signatures=0

From: Patrice Chotard <patrice.chotard@foss.st.com>

Remove clk_ignore_unused from bootargs as it's no more needed.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm/boot/dts/stih410-b2260.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/stih410-b2260.dts b/arch/arm/boot/dts/stih410-b2260.dts
index e2bb59783146..9d579c16c295 100644
--- a/arch/arm/boot/dts/stih410-b2260.dts
+++ b/arch/arm/boot/dts/stih410-b2260.dts
@@ -12,7 +12,6 @@
 	compatible = "st,stih410-b2260", "st,stih410";
 
 	chosen {
-		bootargs = "clk_ignore_unused";
 		stdout-path = &uart1;
 	};
 
-- 
2.17.1

