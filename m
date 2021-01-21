Return-Path: <SRS0=R3qi=GY=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE66FC433DB
	for <soc@archiver.kernel.org>; Thu, 21 Jan 2021 20:33:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8A9B723A5B; Thu, 21 Jan 2021 20:33:10 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AAA8230F9
	for <soc@kernel.org>; Thu, 21 Jan 2021 20:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AAA8230F9
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pj1-f52.google.com with SMTP id g15so2422169pjd.2
        for <soc@kernel.org>; Thu, 21 Jan 2021 12:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DY+ZmwUFDeBBbHPbHW748N6FfBEKKhKhrw4BhYU5fvM=;
        b=Xz5ppRsjZlXSv8lpan09KcEM1QpBvB695bRgByIVy7Hviy6UTA+iYRadX3w1oWnUjT
         L02ee+0WyHsxWmfyOT1btJGu3D6X1HOHq11ntgogxpL3rMgfDnOL+nU2xUwsnQhs058R
         zQlIMVaud1cgZ4+0Sj5/LU19ADQWvu7AZlo/trWPwHHv2ljLP08efJ0Fo1sHmQgmvLvd
         gQCY9DWDIB/qg7TPSvYnmBiU4DNStsXSIotrlyGfl0yLoHTbuXbXio7ih2eexCzbXvWh
         RiVbfj18fO0wNp95Zl8cmZ+zexNsBYg7dxLch2xRM2Y4MjT+N10E4n7Djn1t5md3+vGC
         3LGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DY+ZmwUFDeBBbHPbHW748N6FfBEKKhKhrw4BhYU5fvM=;
        b=gmPLRhVTVcwgo9cM7EX/RivHR65HSaMVcF0Cr9fDOCs/7+Li2oDM+MDTS+9XwPGz5D
         L1LMb06wDRzCgsyzDs4302JFGByeKtaTmOg5oNEzezdyy+xtTYpFqJtu6LWWHL0PjtH5
         5qm8/DBviMf4HXX1AC+zTfmYO3O4r4MVoFTNYJlViYpDs0RSfBm5n0IKTEKGWhHu4gha
         /iGUsip1D6jmFIVTqh4/QgArwSWndOHSt9TbjS90rDKWQer64fGO2ZiVZg/ufZ3IKMeD
         uxxoDFQ3G6T5LRhzwbv3+CVJMLCS5UfYunf/awVL4HjXs4f8s1f4hY3eGzEoByWL2pmy
         R7hA==
X-Gm-Message-State: AOAM533CaNPXL7y2jrkrSWc0CaBXg4BG6LUoss164GbcbPPueDG9Qp2g
	rpxzDh30Zc+hAonqo+zc/GyXpHyAMZw=
X-Google-Smtp-Source: ABdhPJwJRyh3jXCov7ZNS/AcuNENaKqc+Px4Ku/kK72CGg7Km9yh+EU64g60Fpg/LhvExKr0oxyf0A==
X-Received: by 2002:a17:902:8642:b029:de:2bf1:b061 with SMTP id y2-20020a1709028642b02900de2bf1b061mr1072049plt.10.1611261189424;
        Thu, 21 Jan 2021 12:33:09 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id q12sm6305667pgj.24.2021.01.21.12.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 12:33:08 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Florian Fainelli <f.fainelli@gmail.com>
Subject: [PATCH] MAINTAINERS: Include bcm2835 subsequents into search
Date: Thu, 21 Jan 2021 12:33:02 -0800
Message-Id: <20210121203302.3639841-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210121203302.3639841-1-f.fainelli@gmail.com>
References: <20210121203302.3639841-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Wahren <stefan.wahren@i2se.com>

Change the bcm2835 maintainer info in order to handle subsequent SoCs.
After this get_maintainers.pl provides the proper maintainers for
irqchip-bcm2836.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 00836f6452f0..a3829680bf37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3411,7 +3411,7 @@ F:	Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
 F:	drivers/pci/controller/pcie-brcmstb.c
 F:	drivers/staging/vc04_services
 N:	bcm2711
-N:	bcm2835
+N:	bcm283*
 
 BROADCOM BCM281XX/BCM11XXX/BCM216XX ARM ARCHITECTURE
 M:	Florian Fainelli <f.fainelli@gmail.com>
-- 
2.25.1

