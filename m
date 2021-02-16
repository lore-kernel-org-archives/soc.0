Return-Path: <SRS0=jaBP=HS=foss.st.com=patrice.chotard@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47C98C433DB
	for <soc@archiver.kernel.org>; Tue, 16 Feb 2021 07:49:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0F9C764E04; Tue, 16 Feb 2021 07:49:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EF7E64DF0
	for <soc@kernel.org>; Tue, 16 Feb 2021 07:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EF7E64DF0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=patrice.chotard@foss.st.com
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11G7lqVF020502;
	Tue, 16 Feb 2021 08:49:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=wzSj/5knRM9anl9sAZxKpG9mFEEMIEUZ596ktPuU9Uw=;
 b=s4uFnnyQ0TSSU/VBdAuZzsO3vIGNDUhTp0Qo8zvfgc5ICVDLGH3NizfFwnStv8+JfeQh
 J37BeYODkyDSbuG0HqTMzh+HFvzunyJiW9Oiu3LFmZA6m3y6wz7f1CRuZqzKPXkE3LJP
 ilOIyt8E5+JfADYPyE+VNIWDli/UODHLpzAjbUg5hXY2V2qyUEkXpBkc8t8vdGQSi9E0
 j4JCZ58DUwtCYIzYsct4/JNOzvQoTsk0G6o7xDCHMy4fevEADPg00a1v2irrPXU31Kne
 Cvyr+ODT86SZO6LvLflkL1Ck7/VbRME/BA4CH8+XFSGEbFBB+s3U6S0p0UGdvRMqQt8w Tg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 36p547ekwu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Feb 2021 08:49:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 11FE910002A;
	Tue, 16 Feb 2021 08:49:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0173121CA8A;
	Tue, 16 Feb 2021 08:49:39 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 16 Feb 2021 08:49:39
 +0100
From: <patrice.chotard@foss.st.com>
List-Id: <soc.lore.kernel.org>
To: <linux-kernel@vger.kernel.org>, <soc@kernel.org>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>
Subject: [RESEND PATCH 0/3] MAINTAINERS: update STMicroelectronics email
Date: Tue, 16 Feb 2021 08:49:26 +0100
Message-ID: <20210216074929.29033-1-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-15_16:2021-02-12,2021-02-15 signatures=0

From: Patrice Chotard <patrice.chotard@foss.st.com>

This series:
  _ Update st.com to foss.st.com email for some maintainers.
  _ Remove Vincent Abriou as STI/STM DRM driver
  _ Add Alain Volmat as STM32 I2C/SMBUS driver maintainer

Patrice Chotard (3):
  MAINTAINERS: Update some st.com email addresses to foss.st.com
  MAINTAINERS: Remove Vincent Abriou for STM/STI DRM drivers.
  MAINTAINERS: Add Alain Volmat as STM32 I2C/SMBUS maintainer

 MAINTAINERS | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

-- 
2.17.1

