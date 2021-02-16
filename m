Return-Path: <SRS0=jaBP=HS=foss.st.com=patrice.chotard@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25985C433E9
	for <soc@archiver.kernel.org>; Tue, 16 Feb 2021 07:49:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C682964DC3; Tue, 16 Feb 2021 07:49:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F178864E00
	for <soc@kernel.org>; Tue, 16 Feb 2021 07:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F178864E00
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=patrice.chotard@foss.st.com
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11G7lrXU020586;
	Tue, 16 Feb 2021 08:49:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=I6TOgfKl+pMmb59kh6Aus4pqCDixCG4eRt9BnmNSryM=;
 b=k6/9N7zFYtt26k4kna1/ttslrw9zqSLB+UbwGeFiD5BZcGVVCl8uquGNFFfniFDGoWsN
 1CXIcE8e80yNG40Qofe2Ph/rNrELWd3/30c0KqpQ1teeKmyUSsdFdccni9G9mngzpNH4
 TEb2xvgctLXBQhQJMAlGwrC9NMuOFrUhFu2seQ2PMkmqK1o6k/5CmzR9iwCQEnCESDeE
 Pf67I+rFpqlIhb7fOj188QKYoeFTb0T0tKvGXtzAB45W1soqt98wLfv97JjZSQIip5P3
 bpmq3wAsXfzIm20hgpZwf2YoRiJw/ytLNBgF3yKra9CWjIAeChqNlC5xcXE03g1UuPiT mA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 36p547ekwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Feb 2021 08:49:42 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E3B5C10002A;
	Tue, 16 Feb 2021 08:49:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D8F6121CA8A;
	Tue, 16 Feb 2021 08:49:41 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 16 Feb 2021 08:49:41
 +0100
From: <patrice.chotard@foss.st.com>
List-Id: <soc.lore.kernel.org>
To: <linux-kernel@vger.kernel.org>, <soc@kernel.org>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>,
        <alain.volmat@foss.st.com>
Subject: [RESEND PATCH 3/3] MAINTAINERS: Add Alain Volmat as STM32 I2C/SMBUS maintainer
Date: Tue, 16 Feb 2021 08:49:29 +0100
Message-ID: <20210216074929.29033-4-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210216074929.29033-1-patrice.chotard@foss.st.com>
References: <20210216074929.29033-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-15_16:2021-02-12,2021-02-15 signatures=0

From: Patrice Chotard <patrice.chotard@foss.st.com>

Add Alain Volmat as STM32 I2C/SMBUS driver co-maintainer.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: alain.volmat@foss.st.com
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c6266d311061..7de268e4aec0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16812,6 +16812,7 @@ F:	drivers/media/i2c/st-mipid02.c
 
 ST STM32 I2C/SMBUS DRIVER
 M:	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
+M:	Alain Volmat <alain.volmat@foss.st.com>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
 F:	drivers/i2c/busses/i2c-stm32*
-- 
2.17.1

