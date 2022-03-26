Return-Path: <SRS0=m72a=UF=gmail.com=singh.kuldeep87k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E201CC433EF
	for <soc@archiver.kernel.org>; Sat, 26 Mar 2022 04:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CB68EC340F3; Sat, 26 Mar 2022 04:23:54 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3AE74C340F0;
	Sat, 26 Mar 2022 04:23:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3AE74C340F0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id q19so7992637pgm.6;
        Fri, 25 Mar 2022 21:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=no5zVlNN2+nYdfxfk03szGsm0djF7V5HA+HKzA4dT0k=;
        b=mi6tnMMcp/sODd4TZHeEDcdtKlKjpFiDoQvBfp2oFR3eE8TbuI6UQchXI7GyAzJ1gT
         MZp78KNwIelQo4fw9TP/qWe/NxZDAJEgf6PQc3PIRaWw9SvWfWL5gni7uBOax7oBpwzW
         tzDPiWD0qxmCFEQkIo7kEZEEvEXB69t7n2J+CKyZlJQ1bNSBLbOiqCm2SlKvcJ236Ds3
         ScM2rFDv+lYDMb2mcKofp1eAjdzmiG20TkMfIVcxD8jjAtPArjmV5/qn0miaO7O4xHC0
         ekN0dqnQrfe7t9BYOX3GkrzwP9IhgrKFv2sYnV/egb6QLh+R89EWgRfzQXwTFzHHPcKm
         HSig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=no5zVlNN2+nYdfxfk03szGsm0djF7V5HA+HKzA4dT0k=;
        b=a21weSD0jfQdXIkRXpS/Dc2Z90alfzvh6A3U4mTwgAFYxyKIELHI5Q5eMZTn0NoEeA
         It3wPL4YGmgL8zs3G+N0rBRjD7d2zyxNzZpDJXDg23neqDssVh/FPpWEHmWbTZDJG41A
         GjzT8ILAvOFTw/SH3Who2DQwv2rZOfSsWVW0vI4e5DJO6JZm2l5b3s6e+lzaD1fpOnuJ
         9xqTyzeSlrGi/7TakG9tjWEK8z6YMgT9LWc+4hAGlusoNRXZoMIicFYD937oe5iKM30i
         VMr35zb78w59VyryJKTyBES0fH+NoS+gGNtKe73/ITf9ItsHKxIkhn/38i7WQiqvTGym
         gHmw==
X-Gm-Message-State: AOAM5309sTjyP72x2/EYunqNxA3tTkVgWTiOUCcIYBhoDKt64/XEZAja
	W0F4jBmlq4GVi77zzaazfvM=
X-Google-Smtp-Source: ABdhPJwS8X8wIe3tqpoHerYo9sSMvdEjMD9ikw2WKJc60CtUqYOapfdW3W7jym3Am2N/VjgpKu1DeQ==
X-Received: by 2002:a05:6a00:10cb:b0:4f7:942:6a22 with SMTP id d11-20020a056a0010cb00b004f709426a22mr13581398pfu.84.1648268633767;
        Fri, 25 Mar 2022 21:23:53 -0700 (PDT)
Received: from localhost.localdomain ([122.161.51.18])
        by smtp.gmail.com with ESMTPSA id gd10-20020a17090b0fca00b001c75d6a4b18sm7457544pjb.14.2022.03.25.21.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 21:23:53 -0700 (PDT)
From: Kuldeep Singh <singh.kuldeep87k@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Gong Qianyu <Qianyu.Gong@nxp.com>,
	Chenhui Zhao <chenhui.zhao@nxp.com>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Mihai Bantea <mihai.bantea@nxp.com>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mingkai Hu <Mingkai.Hu@nxp.com>,
	"Horia Geant?" <horia.geanta@nxp.com>
Subject: [PATCH 4/4] arm64: dts: ls1046a: Update i2c node dma properties
Date: Sat, 26 Mar 2022 09:53:12 +0530
Message-Id: <20220326042313.97862-5-singh.kuldeep87k@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326042313.97862-1-singh.kuldeep87k@gmail.com>
References: <20220326042313.97862-1-singh.kuldeep87k@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder dmas and dma-names properties for i2c controller node to make it
compliant with bindings.

Fixes: 8126d88162a5 ("arm64: dts: add QorIQ LS1046A SoC support")
CC: soc@kernel.org
Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
---
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 687fea6d8afa..4e7bd04d9798 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -499,9 +499,9 @@ i2c0: i2c@2180000 {
 			interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clockgen QORIQ_CLK_PLATFORM_PLL
 					    QORIQ_CLK_PLL_DIV(2)>;
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

