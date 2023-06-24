Return-Path: <SRS0=Relq=CM=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77613EB64DA
	for <soc@archiver.kernel.org>; Sat, 24 Jun 2023 12:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2A917C433C9; Sat, 24 Jun 2023 12:21:48 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 165B4C433C0
	for <soc@kernel.org>; Sat, 24 Jun 2023 12:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 165B4C433C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2b6985de215so1841261fa.2
        for <soc@kernel.org>; Sat, 24 Jun 2023 05:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687609305; x=1690201305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VBAeuEKi4TumGQZarWYAofM/kt/WlzX0ayFAaSfgRg0=;
        b=isELkhleoirfZfTIzL1phvML2a4utiN1s+Zc5tXECihFYMuaobFx17Zh3KJZH+1tUT
         iF075/7CBZtw87MNe+CyogWJhShfq+7mq95W4BOMxqWsbxMWu5FwihAkFItzEbikpV6m
         Rl4TU1w3u1EQsWGjQbdYah3K0EGR1Avl6qY4gGvgV8q5HqxcsocO9R08fXcEuvE91Vfw
         Fm1eJwKoD2Vp3T0P7jffYkWOf0l6xIeseCKkXkggEjSFLmZYIlNqFrvY8UykzOt6S0B1
         SH0rHqp314/6f7N2ZStlSSd4pQctAUFAvI29HgL3B/cBMoKen4KMPeA25Q5gIlRGZgXq
         0aTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687609305; x=1690201305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VBAeuEKi4TumGQZarWYAofM/kt/WlzX0ayFAaSfgRg0=;
        b=kcuYmCiZlh8LuyLNCPZmPPnnSI8rncPCRDxg0nnULHJ9iHKv3gSxLskiK3XIcpg5rc
         9j80vPOL4u/NyIhiwMsuminPeYkdQhRz9wQIVIxseRaEtcF2hKhBmW+yq7rgzv0CCWAp
         m7ScAokuJfrdonjGHXPAbbDw3I5qeBwXHwZkffksCJhqQcYUdhbeRB0piCE68hu6bHuL
         nKik0wPpoGU1vwmaDY5Sf/orQvJzMsMX4X6AXAYgL77RuWA+LJO9X/8e8BBA8BR9b6K2
         u1kiCPc39HnS/pAObbWLJNRsQYa0nriIqQg1OunAyqUxfyWecx5tm+Crs3iV0a88HaGW
         7AKw==
X-Gm-Message-State: AC+VfDwJjg4OsH2Dk+PLzHr+dYDVNBOnG3UNIJb0ALMOJAANvgP/lLYJ
	d8I3tXLYmuuDTnnSkNX3vgPhUQ==
X-Google-Smtp-Source: ACHHUZ46nD0x2dHG5p6zlGBmn2pjrt4AVodkjdoyLQ+u979hnQlVdrR/RZGt7MpW7gDA9SaM2xnx0g==
X-Received: by 2002:a2e:7e11:0:b0:2b5:95a8:412b with SMTP id z17-20020a2e7e11000000b002b595a8412bmr3617667ljc.52.1687609304977;
        Sat, 24 Jun 2023 05:21:44 -0700 (PDT)
Received: from Fecusia.lan (c-05d8225c.014-348-6c756e10.bbcust.telenor.se. [92.34.216.5])
        by smtp.gmail.com with ESMTPSA id p15-20020a2e740f000000b002b4d766bda5sm256819ljc.124.2023.06.24.05.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jun 2023 05:21:44 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Jonas Gorski <jonas.gorski@gmail.com>,
	stable@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] bus: ixp4xx: fix IXP4XX_EXP_T1_MASK
Date: Sat, 24 Jun 2023 14:21:39 +0200
Message-Id: <20230624122139.3229642-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jonas Gorski <jonas.gorski@gmail.com>

The IXP4XX_EXP_T1_MASK was shifted one bit to the right, overlapping
IXP4XX_EXP_T2_MASK and leaving bit 29 unused. The offset being wrong is
also confirmed at least by the datasheet of IXP45X/46X [1].

Fix this by aligning it to IXP4XX_EXP_T1_SHIFT.

[1] https://www.intel.com/content/dam/www/public/us/en/documents/manuals/ixp45x-ixp46x-developers-manual.pdf

Cc: stable@vger.kernel.org
Fixes: 1c953bda90ca ("bus: ixp4xx: Add a driver for IXP4xx expansion bus")
Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
Link: https://lore.kernel.org/r/20230624112958.27727-1-jonas.gorski@gmail.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC maintainers: please apply this for fixes.
---
 drivers/bus/intel-ixp4xx-eb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bus/intel-ixp4xx-eb.c b/drivers/bus/intel-ixp4xx-eb.c
index f5ba6bee6fd8..320cf307db05 100644
--- a/drivers/bus/intel-ixp4xx-eb.c
+++ b/drivers/bus/intel-ixp4xx-eb.c
@@ -33,7 +33,7 @@
 #define IXP4XX_EXP_TIMING_STRIDE	0x04
 #define IXP4XX_EXP_CS_EN		BIT(31)
 #define IXP456_EXP_PAR_EN		BIT(30) /* Only on IXP45x and IXP46x */
-#define IXP4XX_EXP_T1_MASK		GENMASK(28, 27)
+#define IXP4XX_EXP_T1_MASK		GENMASK(29, 28)
 #define IXP4XX_EXP_T1_SHIFT		28
 #define IXP4XX_EXP_T2_MASK		GENMASK(27, 26)
 #define IXP4XX_EXP_T2_SHIFT		26
-- 
2.40.1

