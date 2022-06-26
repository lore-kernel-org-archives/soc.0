Return-Path: <SRS0=Bt3X=XB=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A83C433EF
	for <soc@archiver.kernel.org>; Sun, 26 Jun 2022 07:45:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A4C4CC341CC; Sun, 26 Jun 2022 07:45:22 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 37735C34114
	for <soc@kernel.org>; Sun, 26 Jun 2022 07:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 37735C34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f45.google.com with SMTP id x3so11547898lfd.2
        for <soc@kernel.org>; Sun, 26 Jun 2022 00:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YlM9GiprgFOyNtROO1ii7MARSHvqwDSW1NlgCyjOuPk=;
        b=GLxMbuxt+jS4rZDPC+JeePZyQk+2rew3/BnygEIbRyxgzLavwMAFiOzesNm4v5dXTP
         Kk6zlfa41+CIneERbm7J5/ZTTmfZPeyLfjiGjAxS8OXIFTMUaAAIcp3RZan3886r9/WZ
         xXKoQHID/Xujf/ofwesvGEwgckJRcoFfvOswqxg9x64grZcht5lSZgNPzKebgS80r+LX
         f45x2NnWvfJx0yrhWqIOIiOsstjnuYewFhv/lalmxE+x8JdHwhmKjKhlnq8RA8A2P2fB
         Y19JvE/rmSFNLMnrd0luqFJhvuZrZxj5UbZvE2Iia6UsdCEJnMdIltiSO8Y3mRIX3XFq
         oueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YlM9GiprgFOyNtROO1ii7MARSHvqwDSW1NlgCyjOuPk=;
        b=vGCQlycGpzUpEpXJ+KggGTczpMND6p0TVq1qDoIPs2dIxd8f/wJSAoVy9epktVRKaB
         QYVWiZy0xuXWdglQBu9iYgF+N0pGcM4pDsOKnarv/zGPzT4GG6hXGG9l2HRmQTuhI748
         tCKrKrYTuFOh/m+qcL0utF5otc3Hxnz08tWIt/bWG0K5Mi2pCoAI7sgoU7iYGsQ2qVdg
         ZPRmY76TVb64uNvzy8RisCPcL/BIy2KXyld97PochVfKUrjft0D/OTVvhdA+bIC36ghy
         1JuJ7vOVs2zUofZGfSN9MYMWDE9RBZfnOYd3vDaq71xWthPIu9+q64eckQG5yfuivue1
         M0Dg==
X-Gm-Message-State: AJIora8gifOS7FMqDg6/bdaWnmM9W7RFM1Ggt2IBWy55Ka9v7Z46xyX+
	dJo+NO1y1LDfPvjSmA40iyn56Q==
X-Google-Smtp-Source: AGRyM1vKfXolfvfRjTppTkRN4uSJUpOChHM1lu3FJ/fmxtVj9qEn9YcVgaugtLwXfQVDSpypomHbOA==
X-Received: by 2002:ac2:4f03:0:b0:47f:4c43:b4f with SMTP id k3-20020ac24f03000000b0047f4c430b4fmr4553496lfr.303.1656229518120;
        Sun, 26 Jun 2022 00:45:18 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id e16-20020a196910000000b0047f6ab55fdbsm1240045lfc.267.2022.06.26.00.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jun 2022 00:45:17 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] soc: ixp4xx/npe: Fix unused match warning
Date: Sun, 26 Jun 2022 09:43:15 +0200
Message-Id: <20220626074315.61209-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel test robot found this inconsistency:

  drivers/soc/ixp4xx/ixp4xx-npe.c:737:34: warning:
  'ixp4xx_npe_of_match' defined but not used [-Wunused-const-variable=]
     737 | static const struct of_device_id ixp4xx_npe_of_match[] = {

This is because the match is enclosed in the of_match_ptr()
which compiles into NULL when OF is disabled and this
is unnecessary.

Fix it by dropping of_match_ptr() around the match.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC folks: please apply this directly for fixes.
---
 drivers/soc/ixp4xx/ixp4xx-npe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/ixp4xx/ixp4xx-npe.c b/drivers/soc/ixp4xx/ixp4xx-npe.c
index 613935cb6a48..58240e320c13 100644
--- a/drivers/soc/ixp4xx/ixp4xx-npe.c
+++ b/drivers/soc/ixp4xx/ixp4xx-npe.c
@@ -758,7 +758,7 @@ static const struct of_device_id ixp4xx_npe_of_match[] = {
 static struct platform_driver ixp4xx_npe_driver = {
 	.driver = {
 		.name           = "ixp4xx-npe",
-		.of_match_table = of_match_ptr(ixp4xx_npe_of_match),
+		.of_match_table = ixp4xx_npe_of_match,
 	},
 	.probe = ixp4xx_npe_probe,
 	.remove = ixp4xx_npe_remove,
-- 
2.36.1

