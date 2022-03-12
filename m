Return-Path: <SRS0=pvkH=TX=gmail.com=singh.kuldeep87k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11244C433EF
	for <soc@archiver.kernel.org>; Sat, 12 Mar 2022 18:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F00CDC340F5; Sat, 12 Mar 2022 18:06:25 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 59252C340EB;
	Sat, 12 Mar 2022 18:06:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 59252C340EB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id m2so10351808pll.0;
        Sat, 12 Mar 2022 10:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Rg+SMFQ7I6btufFbQp88Hcx5Wyx4dzXyqKTTiQmvp0k=;
        b=RQvjp4ycwxIQwR2GBMP9qI1VmQoyYIfRKVaysG/rk2FXb6x/IlpVdi32uOnlSd3XTh
         EgduNBzRR9eZsOtgO42eW56lPYAP23OoBLGah1SzFCO8pikykHakY37ewwKPGNCR0w3U
         ff0pyrNivvpmD/M2Fqnf/ztr7CbxDdRBpglFZmakKAWBJqI2xF3Tl4XG/l0B6GQHEr74
         iS/yZCWv7NgEnpiEmXQGm7FibHx/UGgXGqH6iGGj6oLUzxt9Cv5DMl/kHk5nQU/nnORC
         tDf7FWdceMPVaU9U/eT6BmcgnXv8Y5tgtrkBNv8nHCUdDAZSf8NPivEFrQgi0zIx1oZO
         kcdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Rg+SMFQ7I6btufFbQp88Hcx5Wyx4dzXyqKTTiQmvp0k=;
        b=CJLHNfbjRyvnjuR6dSlxaTjr/jzXyLaHOT8eBt6usF0qy+G5wbEikxKkUgM+8SmWil
         1Lo0fXTwQ6hMqSZ0/FsRmSvac4ir3zhkxJ6qj1/Fn3uvIgt5Yp0sDp5lguBChsOcMRd4
         kT93WUrk33ZZpWf2IaTGqUO5SZaiv7M1WzHNC8AzXxzrfIinC9IHovbOH+hbXVGb3OOQ
         fJApldUrdo9bD28Jsx60k9OM55c/Mup6WRdeBdtWQ3a01oByLWhLPoGknucMPBJz2GEz
         LvarU8WX4L+WTTAHYfgUXgmwP66di42kUVAZF1HfTlTi6lT3TkRLDkCjJqiHnXbJSnBS
         yN8A==
X-Gm-Message-State: AOAM530gmVwXDNcp4n54wTlrDLj5sFl+uTqjXJXQiaOoBE25EjentqM0
	8vNRNXowZVtWiJH2PVMU+ouDQaQlDDI=
X-Google-Smtp-Source: ABdhPJyh5JaL7NhXCYJ+47rVd51aiB32DpTuUTxS95UI46CPhXiHeb55UFRusMqFam5ZCHkpGYRVzQ==
X-Received: by 2002:a17:90a:5291:b0:1bb:ef4d:947d with SMTP id w17-20020a17090a529100b001bbef4d947dmr27752846pjh.243.1647108384583;
        Sat, 12 Mar 2022 10:06:24 -0800 (PST)
Received: from localhost.localdomain ([122.161.53.68])
        by smtp.gmail.com with ESMTPSA id z72-20020a627e4b000000b004f70cbcb06esm14017951pfc.49.2022.03.12.10.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 10:06:24 -0800 (PST)
From: Kuldeep Singh <singh.kuldeep87k@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ARM: dts: spear13xx: Update SPI dma properties
Date: Sat, 12 Mar 2022 23:36:14 +0530
Message-Id: <20220312180615.68929-2-singh.kuldeep87k@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220312180615.68929-1-singh.kuldeep87k@gmail.com>
References: <20220312180615.68929-1-singh.kuldeep87k@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder dmas and dma-names property for spi controller node to make it
compliant with bindings.

Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
---
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

