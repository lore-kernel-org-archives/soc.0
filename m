Return-Path: <SRS0=dMJD=UC=gmail.com=singh.kuldeep87k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85DD0C433EF
	for <soc@archiver.kernel.org>; Wed, 23 Mar 2022 17:59:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4B4A9C340EE; Wed, 23 Mar 2022 17:59:28 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 949F0C340E8;
	Wed, 23 Mar 2022 17:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 949F0C340E8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id mj15-20020a17090b368f00b001c637aa358eso7210912pjb.0;
        Wed, 23 Mar 2022 10:59:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TeKF1IrVTPwtitTV8dgbmN8AVqD0Mtciv+RTNtchAtM=;
        b=CvS8qLVfcrk3NGlCqS+dzql75jrHonuWq7qfMNBpfDuWkx+hMOOp9iOU9e0kom/Vzu
         PoEoodYURFWHBLM/vjzBIi1mkmM8fHUnSIZrKe7yhVUsBFioL4HmZDJQ89Mh8v+2al/l
         /9qJUdoMxL/wc5GDlc7snCBOhfpm+krsr4wX0aQrLjUa2cx5atgPYYeZ1Ogj5a1qfmOm
         i8r1AC/3qQiPyO/k+NEc//VJmgKq3WyYkzAogz3FE2klGCXhdxgnFNsrtmTPQRcbXZWj
         bC2exxhscNLB5MsO79gtUxB0jgrfhQKfy3nMB+SHVX7tUTFRrHzEQZysXgpD/wTcJjMf
         qK8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TeKF1IrVTPwtitTV8dgbmN8AVqD0Mtciv+RTNtchAtM=;
        b=ntQwjNfgzMv8gyQwCQPNKoxn6f4iQQX0PMQFT7/VJlE1/WtOt2oTUgyNS3sCuTj0EL
         mlFElULhRKRbKlUZVWz0zjB3CPncaIchAnhwdTqVY53gaPyv2dNwyLhLnglnJ+yjb6Ci
         VF68gbD6DDOhgmwB9SfWcn1R0iuXREs0mLUH8ytB+4eoyFDAK4eFfFT0VNrHw+XuCVCs
         97+9b1f9W0qv3P+lx5rkPhDFngmHg+azYX+346Dxh//NOTnNkykjXSiF5u8/rpsQHmVJ
         EHEZD0aKG7+dN3qxJ1AN0X6QeVgW0yKajIGqjOWvbwQ23M3LCbpWyMxC/0rwE4swg0+z
         ez1w==
X-Gm-Message-State: AOAM532sUEfsCeTbxCLiDUj1SJgatho3tQN9A78jwJyVhzrXCjDLOleL
	bAP1pcxAwPBNVx09ZJkaEHgPTBPowjA=
X-Google-Smtp-Source: ABdhPJwaHPOu98pWAjMGLcxyok9W+oPp/AYZC/v0jL+r/3wC+oBxGKiyJZhBZ8kX81WieVhTk9diBw==
X-Received: by 2002:a17:90a:cce:b0:1bf:6387:30d9 with SMTP id 14-20020a17090a0cce00b001bf638730d9mr13199933pjt.196.1648058366984;
        Wed, 23 Mar 2022 10:59:26 -0700 (PDT)
Received: from localhost.localdomain ([122.161.51.18])
        by smtp.gmail.com with ESMTPSA id q2-20020a056a00084200b004f761a7287dsm551622pfk.131.2022.03.23.10.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 10:59:26 -0700 (PDT)
From: Kuldeep Singh <singh.kuldeep87k@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ARM: dts: spear13xx: Update SPI dma properties
Date: Wed, 23 Mar 2022 23:29:20 +0530
Message-Id: <20220323175920.93155-1-singh.kuldeep87k@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder dmas and dma-names property for spi controller node to make it
compliant with bindings.

Fixes: 6e8887f60f60 ("ARM: SPEAr13xx: Pass generic DW DMAC platform data from DT")
Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
---
v2:
- Add fixes tag
- Remove 1/2 patch from series as it's not required
- v1 discussion link:
  https://lore.kernel.org/linux-devicetree/20220312180615.68929-2-singh.kuldeep87k@gmail.com/

 arch/arm/boot/dts/spear13xx.dtsi | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/spear13xx.dtsi b/arch/arm/boot/dts/spear13xx.dtsi
index c87b881b2c8b..45f0b2a33e02 100644
--- a/arch/arm/boot/dts/spear13xx.dtsi
+++ b/arch/arm/boot/dts/spear13xx.dtsi
@@ -284,9 +284,8 @@ spi0: spi@e0100000 {
 				#size-cells = <0>;
 				interrupts = <0 31 0x4>;
 				status = "disabled";
-				dmas = <&dwdma0 4 0 0>,
-					<&dwdma0 5 0 0>;
-				dma-names = "tx", "rx";
+				dmas = <&dwdma0 5 0 0>, <&dwdma0 4 0 0>;
+				dma-names = "rx", "tx";
 			};
 
 			rtc@e0580000 {
-- 
2.25.1

