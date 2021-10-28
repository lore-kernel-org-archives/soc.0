Return-Path: <SRS0=J5wj=PQ=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49633C433EF
	for <soc@archiver.kernel.org>; Thu, 28 Oct 2021 16:37:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 29AB060C4B; Thu, 28 Oct 2021 16:37:59 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED67D61056
	for <soc@kernel.org>; Thu, 28 Oct 2021 16:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ED67D61056
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id w16so4836961plg.3
        for <soc@kernel.org>; Thu, 28 Oct 2021 09:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PkruJgvCEKtNeBSTAXmn2WZSAWgjf0MRa1oVEnouC/M=;
        b=X7tHd4KEratHyV1cjf9TZ3xzAajzacshGUPb0/1twCiqXn6CscCL63H+tTB+9gFXso
         wc8/Feq2gDuQskNPyy9X7bR439iQUB0fMZH/As9CE6A7y5T05Qbx1jGMGyCZPFVQ/71h
         XbQHGCVtJZnHWBH4ZM5nBBwBcMqDe85PlYP7hrC+YVeysOzIdOsoerHnKXAqjTmFhsBv
         nCJGJeHI5MOpV2be0rFE3Eck/lCfeUOWXU9iQHJdErUPMgIscQ6TZSs+XUKM2Gzmp5z9
         uxlCP2bTUZstLxYPafkt2+ncYXsQzKKU0Wdj1Y9Jad49DS+Dx1sHRDvdYKsPT7NAYs2q
         xu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PkruJgvCEKtNeBSTAXmn2WZSAWgjf0MRa1oVEnouC/M=;
        b=vX6ufTZUweHzJenxQQAeTdMBgAE4CKKqsnRYEhHyVX1NFWQHUOhjGIt7SwPx1rC97g
         FUh2Q+xjqf9oPrxgDwMjPzX3pF0uB++wKaoso7n8PHVQp3UqK/rFFEoGvH3NE5em9YyR
         xNkGrHKIZhZtBk+ipwXSjfSTVP8kMWQkZ8wS4p7QPnjEZNigEeGOQfVyQxYbOu+ds1Nv
         9vnLYAPAlGluBksj9Em9SdtGG+vUouhWe7M0eJTRTzVlSGq/3mW3CeAImsPCnkTafp6p
         By0OhBET9uVxJtIlDla895lzIJFf9fVQTX1WquZnX1SZhSwVUx/mpfWLkETDZKTSI8in
         gC4g==
X-Gm-Message-State: AOAM532gr2LYptAaXnPr56SiHMZDbw/To1Ht+mgNRaIWDSkAk0Fhna1s
	XBVHp1981CcNM2XNaMkNN/7Xm9qGlRI=
X-Google-Smtp-Source: ABdhPJzAA+I1WxBM6NEmBXEEiJJfndd52j2hrja2YR3AE4b0sWzFdJEA/mzD84O6sNsdW5j0zrznAQ==
X-Received: by 2002:a17:902:da90:b0:140:55f8:ca63 with SMTP id j16-20020a170902da9000b0014055f8ca63mr4883894plx.72.1635439078522;
        Thu, 28 Oct 2021 09:37:58 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2sm4445481pfj.42.2021.10.28.09.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 09:37:58 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-arm-kernel@lists.infradead.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] MAINTAINERS: Update BCM7XXX entry with additional patterns
Date: Thu, 28 Oct 2021 09:37:56 -0700
Message-Id: <20211028163756.4014059-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Broadcom STB systems use the bcm7038 pattern as well as the bcm7120
pattern for some of its drivers, add those to the existing entry.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index eeb4c70b3d5b..c61fd406acc5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3609,6 +3609,8 @@ F:	arch/arm/mm/cache-b15-rac.c
 F:	drivers/bus/brcmstb_gisb.c
 F:	drivers/pci/controller/pcie-brcmstb.c
 N:	brcmstb
+N:	bcm7038
+N:	bcm7120
 
 BROADCOM BDC DRIVER
 M:	Al Cooper <alcooperx@gmail.com>
-- 
2.25.1

