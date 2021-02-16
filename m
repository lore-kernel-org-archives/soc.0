Return-Path: <SRS0=jaBP=HS=foss.st.com=patrice.chotard@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21ADC433E6
	for <soc@archiver.kernel.org>; Tue, 16 Feb 2021 07:49:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5122C64DDA; Tue, 16 Feb 2021 07:49:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6693A64DFF
	for <soc@kernel.org>; Tue, 16 Feb 2021 07:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6693A64DFF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=patrice.chotard@foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11G7joHB004321;
	Tue, 16 Feb 2021 08:49:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=LrUK6hoS4xK9IUX9jQJinDko9cXhFmAHldaOuuelF/0=;
 b=DYLU503bFV1CPr+qSOgpRrA/KrRHSzSag3bpIutH+jJMyGMl9gog6UNdUnX8RaQU7yfU
 5FvblqICdQEawAky5tUq/czBRRri7IIbj68zNBNPbswubIbY8/E2otoFb3U8/z2vm4HB
 2CZ2V8Lz6UMG47AI9c5baCTmq70NxzZsMI0GqVhRHYVcKpe0my2Y7zwO09Trtoq2D6gb
 Bja4OfrqKv98eqvxfbAsGyuOaxPQPkcnZcrwgcILL+Rd0kBw2F3gkXU2HvoA0fyLsPL+
 jFEUTUCt6rp2ksMX24O9DjeTywJ6sb8EC/nZUuFO7U6hP95b8TOmyBdFC7bTKKap/X3b lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 36p706e610-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Feb 2021 08:49:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4B2E9100038;
	Tue, 16 Feb 2021 08:49:41 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4356A21CA8A;
	Tue, 16 Feb 2021 08:49:41 +0100 (CET)
Received: from localhost (10.75.127.48) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 16 Feb 2021 08:49:41
 +0100
From: <patrice.chotard@foss.st.com>
List-Id: <soc.lore.kernel.org>
To: <linux-kernel@vger.kernel.org>, <soc@kernel.org>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>,
        Vincent Abriou <vincent.abriou@st.com>
Subject: [RESEND PATCH 2/3] MAINTAINERS: Remove Vincent Abriou for STM/STI DRM drivers.
Date: Tue, 16 Feb 2021 08:49:28 +0100
Message-ID: <20210216074929.29033-3-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210216074929.29033-1-patrice.chotard@foss.st.com>
References: <20210216074929.29033-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-15_16:2021-02-12,2021-02-15 signatures=0

From: Patrice Chotard <patrice.chotard@foss.st.com>

Remove Vincent Abriou's email as he has no more review activities on
STM/STI DRM drivers.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Vincent Abriou <vincent.abriou@st.com>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 98802b71385b..c6266d311061 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5966,7 +5966,6 @@ F:	drivers/gpu/drm/rockchip/
 
 DRM DRIVERS FOR STI
 M:	Benjamin Gaignard <benjamin.gaignard@linaro.org>
-M:	Vincent Abriou <vincent.abriou@st.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
@@ -5977,7 +5976,6 @@ DRM DRIVERS FOR STM
 M:	Yannick Fertre <yannick.fertre@foss.st.com>
 M:	Philippe Cornu <philippe.cornu@foss.st.com>
 M:	Benjamin Gaignard <benjamin.gaignard@linaro.org>
-M:	Vincent Abriou <vincent.abriou@st.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git git://anongit.freedesktop.org/drm/drm-misc
-- 
2.17.1

