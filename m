Return-Path: <SRS0=rX+9=5P=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180D6C32793
	for <soc@archiver.kernel.org>; Wed, 18 Jan 2023 05:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D907DC433F0; Wed, 18 Jan 2023 05:17:54 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E95A0C433D2
	for <soc@kernel.org>; Wed, 18 Jan 2023 05:17:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E95A0C433D2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id n20-20020a17090aab9400b00229ca6a4636so317265pjq.0
        for <soc@kernel.org>; Tue, 17 Jan 2023 21:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5K68XBKebRwhyiLKHy5IYTl9KheU+UynXm/6VyzeOQ=;
        b=fZLAn167F2tx4XKNulWWnUHcva2CRn29WXINHgWDcMNpDdKewLAwGWMWB3Ogbx+0gw
         JGS1iz9fooVdOWIp8d2r+fhYIftTMIZXuc9hgf4EqR1gM9IpBAmUQmCh/fxKhzB6Z9b0
         J0IZC+3l8fa11DEQy4sAifCfDK/BlTi5uu8rqTSj+LfSnrSD0L6fwzfUZJlHeF+yrWPV
         pxhJoO1tpOIW+rEkOpd0j0/xyB/t+Cr9HnmFRqbiD8dPZOmlPSNVLUnL+6F6n1EKdIJt
         cnPg8fdfPWR+pQl8hUyJWCDjy9D2qL30yLXfct8ig/aEJUCqrXmTPE9vVHhysVX+BtBS
         +GgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q5K68XBKebRwhyiLKHy5IYTl9KheU+UynXm/6VyzeOQ=;
        b=AYC328bdMXONJ0LGGb92OsScpLhnUqOo2qmyF6o9lztfB0tDAv5NgsLskb9Lm+wVjF
         1GqhOgloAeMcC4Zo5In80L4OH/HYW9tUBFFeH4fM3InjZ0V1IT9k1BDUiOwd4rTbXQ0L
         jfwK9tU2nYsI5OzdeueJGlWY3Xhl1fF+iB6ORNqZvrHxO1dKargxNelghWPBzJO1NEpH
         fdYV3U+TR4As5LNmvkLD1sU2/qmz19xEBBX1TDfNlOU/pl7LF6JtWNtqgArz8ONcZiJk
         5LH93T+jgFE2u7qZmK1n0K+bnT/FvKrEqE2dd5SplvI8RAqovoAj0l+gsewqr5PSlPjy
         1C3Q==
X-Gm-Message-State: AFqh2ko7xtjFWGNM6w3zEXFWYfy9a79QX/iVQilgOfjOM2T8zt1xt7Dx
	GV0x5dAfmDVaigXNv6uQJQ7ZvgbioAsEWw==
X-Google-Smtp-Source: AMrXdXuolRBfARoco+zusbNC2OVUK86pEOG7kycmbxvPKT5Gntkmq4Gaz571p6pitGErR48ajxSfDg==
X-Received: by 2002:a17:902:b20f:b0:194:a268:1201 with SMTP id t15-20020a170902b20f00b00194a2681201mr5824317plr.43.1674019071736;
        Tue, 17 Jan 2023 21:17:51 -0800 (PST)
Received: from localhost.localdomain ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id x4-20020a1709029a4400b00192aa53a7d5sm22088406plv.8.2023.01.17.21.17.49
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 21:17:50 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [PATCH] ARM: dts: aspeed: Fix pca9849 compatible
Date: Wed, 18 Jan 2023 15:47:36 +1030
Message-Id: <20230118051736.246714-1-joel@jms.id.au>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eddie James <eajames@linux.ibm.com>

Missed a digit in the PCA9849 compatible string.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Fixes: 65b697e5dec7 ("ARM: dts: aspeed: Add IBM Bonnell system BMC devicetree")
Link: https://lore.kernel.org/r/20220826194457.164492-1-eajames@linux.ibm.com
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Dear soc maintainers, please apply as a fix, thanks!

 arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
index d1971ddf06a5..7f755e5a4624 100644
--- a/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-ibm-bonnell.dts
@@ -751,7 +751,7 @@ tmp435@4c {
 	};
 
 	pca9849@75 {
-		compatible = "nxp,pca849";
+		compatible = "nxp,pca9849";
 		reg = <0x75>;
 		#address-cells = <1>;
 		#size-cells = <0>;
-- 
2.39.0

