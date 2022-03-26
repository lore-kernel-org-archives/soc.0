Return-Path: <SRS0=m72a=UF=gmail.com=singh.kuldeep87k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2DDC433EF
	for <soc@archiver.kernel.org>; Sat, 26 Mar 2022 04:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5500FC340F0; Sat, 26 Mar 2022 04:23:50 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AB91CC340EE;
	Sat, 26 Mar 2022 04:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AB91CC340EE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id o6-20020a17090a9f8600b001c6562049d9so10357870pjp.3;
        Fri, 25 Mar 2022 21:23:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2x1QLeSL0TPizJtvpZQMqel8kUAcARC4zTfNPXgREyY=;
        b=dLjXtbRTA1rTY59+y2Oa7WR2SrevLu/VPySkTlUm6i3CXbv1+lNs6hGfkWYSECjsZw
         YNS+jFyrK92XkUTnp7H0tpZAjvGlNWWPpSYgovuqLBGOL6GW0Gx1O1mlXV1z6QxtQUWd
         56BkFPDvSfmIV/0RA+K/5WsGWF5cG8mooC5L31qjtqkljE7Jgm/W2qlzz/Hj3AEwYqj+
         BuCwubtN21l1WQeYL4LjJtR972LqmbCkj1y/ZzOCW9y1WQGxzfWFGHBfubiGrxvzjzF5
         GJ3+qun5h7vHBa3nCrpx1JJOqGMHYnc4Sm41WX+bk8JCLM23tY+9SjczHjcfTwE8EHYT
         CWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2x1QLeSL0TPizJtvpZQMqel8kUAcARC4zTfNPXgREyY=;
        b=gSIRizUY0WBWIWv3QpmU8TGDBguvPIigIxCttZtK5YOfliQzjZ0luG7yfUrNgXw0Yh
         1Y6eq+wIj/M4emetBKT81FMYBdaI3zPSy5TrJW4wq7n07Qb+NYnQWJbp4g2XX0t1qcha
         7KwHMKEy6XQnqIr2ATUlll+Haew5B/mb0lNAPyxIrQaSBhl/I/n88FFbkqAfixpZXRqM
         xMiuu5H8M9O2H91Spatsy65tNmZ5ieA92VmP/nEJsAhdbJaa8DDshI5b6WBrhVVqM6ae
         zC/G32wraNwYPUVeHy+bFJHLp6oBVB+4HFc3tzabM9BLnOEBcdCZvAsksy6/nQ/y4iYR
         oqaQ==
X-Gm-Message-State: AOAM533+cAkQvE4gFt9AqQQiKQWx5HGkD6h7E7uzz0zH+CM38HHnYRCR
	N/BRKxuZGIoba8fdylPu3tw=
X-Google-Smtp-Source: ABdhPJyq/uoDr9lMsytT1OHA2wXEQo0TBJx9ar/j4AfSBHvCl59R1vdwDpkXiL0w95H1bkF094nGuw==
X-Received: by 2002:a17:902:c713:b0:153:f75d:253b with SMTP id p19-20020a170902c71300b00153f75d253bmr15097410plp.99.1648268629122;
        Fri, 25 Mar 2022 21:23:49 -0700 (PDT)
Received: from localhost.localdomain ([122.161.51.18])
        by smtp.gmail.com with ESMTPSA id gd10-20020a17090b0fca00b001c75d6a4b18sm7457544pjb.14.2022.03.25.21.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 21:23:48 -0700 (PDT)
From: Kuldeep Singh <singh.kuldeep87k@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mingkai Hu <Mingkai.Hu@freescale.com>,
	Hou Zhiqiang <B48286@freescale.com>,
	Wenbin Song <Wenbin.Song@freescale.com>,
	Olof Johansson <olof@lixom.net>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: ls1043a: Update i2c dma properties
Date: Sat, 26 Mar 2022 09:53:11 +0530
Message-Id: <20220326042313.97862-4-singh.kuldeep87k@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326042313.97862-1-singh.kuldeep87k@gmail.com>
References: <20220326042313.97862-1-singh.kuldeep87k@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder dmas and dma-names properties for i2c controller node to make it
compliant with bindings.

Fixes: 6d453cd22357 ("arm64: dts: add Freescale LS1043a SoC support")
CC: soc@kernel.org
Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
index 01b01e320411..35d1939e690b 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi
@@ -536,9 +536,9 @@ i2c0: i2c@2180000 {
 			clock-names = "i2c";
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(1)>;
-			dmas = <&edma0 1 39>,
-			       <&edma0 1 38>;
-			dma-names = "tx", "rx";
+			dmas = <&edma0 1 38>,
+			       <&edma0 1 39>;
+			dma-names = "rx", "tx";
 			status = "disabled";
 		};
 
-- 
2.25.1

