Return-Path: <SRS0=jaBP=HS=foss.st.com=patrice.chotard@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61483C433E0
	for <soc@archiver.kernel.org>; Tue, 16 Feb 2021 07:49:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0EF2064E02; Tue, 16 Feb 2021 07:49:44 +0000 (UTC)
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EF3B64DC3
	for <soc@kernel.org>; Tue, 16 Feb 2021 07:49:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EF3B64DC3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=patrice.chotard@foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 11G7jqlu004368;
	Tue, 16 Feb 2021 08:49:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=fqFNPxZyrzv0A8keYuqx1CT/gSMzhL+t99dKRsxNPzU=;
 b=xspmAL/tgSTvPGMuzGwTumhEisfHo4ytXkFlTrZT1H8unsMYjYJEyMPLUYntq/ibbILh
 fUOFPYJ5tqnOL1y/7DFbBa0ATSZ9hinrCR/PeIS9yxZ4StpKrL1SKnz5FN0Y/jNJlQIE
 a9VtzfsJ/7H0/TRoA214fXPLMXoDfXyJQytBsYbewOTF4c1dYwqxYs4QaUAHe5a72x0/
 uKrtB5zBbvlBbyWt12UKtDTwQDqW87X5jrI3OnzthjrpcmUSbgLtuNvilANtitgAj4F0
 NWuaSrudA5scUDQI8QLAofDKmCAFaNmVfhtQwwwngmXc4ZPi65sv54D2X2X92z6XaMUx tw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 36p706e60y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Feb 2021 08:49:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id A94D4100034;
	Tue, 16 Feb 2021 08:49:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9C9FE21CA8A;
	Tue, 16 Feb 2021 08:49:40 +0100 (CET)
Received: from localhost (10.75.127.51) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 16 Feb 2021 08:49:40
 +0100
From: <patrice.chotard@foss.st.com>
List-Id: <soc.lore.kernel.org>
To: <linux-kernel@vger.kernel.org>, <soc@kernel.org>
CC: <linux-stm32@st-md-mailman.stormreply.com>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>
Subject: [RESEND PATCH 1/3] MAINTAINERS: Update some st.com email addresses to foss.st.com
Date: Tue, 16 Feb 2021 08:49:27 +0100
Message-ID: <20210216074929.29033-2-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210216074929.29033-1-patrice.chotard@foss.st.com>
References: <20210216074929.29033-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-02-15_16:2021-02-12,2021-02-15 signatures=0

From: Patrice Chotard <patrice.chotard@foss.st.com>

Update some st.com to foss.st.com addresses related to STMicroelectronics
drivers. All these people will now use this new email address for upstream
activities.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 MAINTAINERS | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 667d03852191..98802b71385b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2504,7 +2504,7 @@ N:	sc27xx
 N:	sc2731
 
 ARM/STI ARCHITECTURE
-M:	Patrice Chotard <patrice.chotard@st.com>
+M:	Patrice Chotard <patrice.chotard@foss.st.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 W:	http://www.stlinux.com
@@ -2537,7 +2537,7 @@ F:	include/linux/remoteproc/st_slim_rproc.h
 
 ARM/STM32 ARCHITECTURE
 M:	Maxime Coquelin <mcoquelin.stm32@gmail.com>
-M:	Alexandre Torgue <alexandre.torgue@st.com>
+M:	Alexandre Torgue <alexandre.torgue@foss.st.com>
 L:	linux-stm32@st-md-mailman.stormreply.com (moderated for non-subscribers)
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
@@ -3149,7 +3149,7 @@ C:	irc://irc.oftc.net/bcache
 F:	drivers/md/bcache/
 
 BDISP ST MEDIA DRIVER
-M:	Fabien Dessenne <fabien.dessenne@st.com>
+M:	Fabien Dessenne <fabien.dessenne@foss.st.com>
 L:	linux-media@vger.kernel.org
 S:	Supported
 W:	https://linuxtv.org
@@ -5042,7 +5042,7 @@ S:	Maintained
 F:	drivers/platform/x86/dell-wmi.c
 
 DELTA ST MEDIA DRIVER
-M:	Hugues Fruchet <hugues.fruchet@st.com>
+M:	Hugues Fruchet <hugues.fruchet@foss.st.com>
 L:	linux-media@vger.kernel.org
 S:	Supported
 W:	https://linuxtv.org
@@ -5974,8 +5974,8 @@ F:	Documentation/devicetree/bindings/display/st,stih4xx.txt
 F:	drivers/gpu/drm/sti
 
 DRM DRIVERS FOR STM
-M:	Yannick Fertre <yannick.fertre@st.com>
-M:	Philippe Cornu <philippe.cornu@st.com>
+M:	Yannick Fertre <yannick.fertre@foss.st.com>
+M:	Philippe Cornu <philippe.cornu@foss.st.com>
 M:	Benjamin Gaignard <benjamin.gaignard@linaro.org>
 M:	Vincent Abriou <vincent.abriou@st.com>
 L:	dri-devel@lists.freedesktop.org
@@ -8196,7 +8196,7 @@ F:	include/linux/hugetlb.h
 F:	mm/hugetlb.c
 
 HVA ST MEDIA DRIVER
-M:	Jean-Christophe Trotin <jean-christophe.trotin@st.com>
+M:	Jean-Christophe Trotin <jean-christophe.trotin@foss.st.com>
 L:	linux-media@vger.kernel.org
 S:	Supported
 W:	https://linuxtv.org
@@ -11101,7 +11101,7 @@ T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/dvb-frontends/stv6111*
 
 MEDIA DRIVERS FOR STM32 - DCMI
-M:	Hugues Fruchet <hugues.fruchet@st.com>
+M:	Hugues Fruchet <hugues.fruchet@foss.st.com>
 L:	linux-media@vger.kernel.org
 S:	Supported
 T:	git git://linuxtv.org/media_tree.git
@@ -16813,7 +16813,7 @@ F:	Documentation/devicetree/bindings/media/i2c/st,st-mipid02.txt
 F:	drivers/media/i2c/st-mipid02.c
 
 ST STM32 I2C/SMBUS DRIVER
-M:	Pierre-Yves MORDRET <pierre-yves.mordret@st.com>
+M:	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
 L:	linux-i2c@vger.kernel.org
 S:	Maintained
 F:	drivers/i2c/busses/i2c-stm32*
@@ -16944,7 +16944,7 @@ S:	Maintained
 F:	drivers/block/skd*[ch]
 
 STI AUDIO (ASoC) DRIVERS
-M:	Arnaud Pouliquen <arnaud.pouliquen@st.com>
+M:	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/sound/st,sti-asoc-card.txt
@@ -16964,15 +16964,15 @@ T:	git git://linuxtv.org/media_tree.git
 F:	drivers/media/usb/stk1160/
 
 STM32 AUDIO (ASoC) DRIVERS
-M:	Olivier Moysan <olivier.moysan@st.com>
-M:	Arnaud Pouliquen <arnaud.pouliquen@st.com>
+M:	Olivier Moysan <olivier.moysan@foss.st.com>
+M:	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
 L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/iio/adc/st,stm32-*.yaml
 F:	sound/soc/stm/
 
 STM32 TIMER/LPTIMER DRIVERS
-M:	Fabrice Gasnier <fabrice.gasnier@st.com>
+M:	Fabrice Gasnier <fabrice.gasnier@foss.st.com>
 S:	Maintained
 F:	Documentation/ABI/testing/*timer-stm32
 F:	Documentation/devicetree/bindings/*/*stm32-*timer*
@@ -16982,7 +16982,7 @@ F:	include/linux/*/stm32-*tim*
 
 STMMAC ETHERNET DRIVER
 M:	Giuseppe Cavallaro <peppe.cavallaro@st.com>
-M:	Alexandre Torgue <alexandre.torgue@st.com>
+M:	Alexandre Torgue <alexandre.torgue@foss.st.com>
 M:	Jose Abreu <joabreu@synopsys.com>
 L:	netdev@vger.kernel.org
 S:	Supported
-- 
2.17.1

