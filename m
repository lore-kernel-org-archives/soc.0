Return-Path: <SRS0=DTuh=WI=semihalf.com=pan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C46DCCA478
	for <soc@archiver.kernel.org>; Wed,  1 Jun 2022 15:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E315C3411C; Wed,  1 Jun 2022 15:47:46 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BBF04C341C6
	for <soc@kernel.org>; Wed,  1 Jun 2022 15:47:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BBF04C341C6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=semihalf.com
Authentication-Results: smtp.kernel.org; spf=none smtp.mailfrom=semihalf.com
Received: by mail-lf1-f53.google.com with SMTP id c19so3441318lfv.5
        for <soc@kernel.org>; Wed, 01 Jun 2022 08:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4Ppw8UVo/qEPgt1AkXxmf7JhE2d9K4tKcX8rTq2VqM0=;
        b=IfDJ6Y/LBiKfML25dHZi4KzD+/YqzPwyzQgsdy7RcT3HdhiSl4RyaHT64fsrU2OR2Y
         DIFOnMYGWYS7CYmjEXgsmd7l6UJSqaDmY5lx/H0zTT0qjuFLG0THmztBb/2iPVhsoni5
         veiEhaXzEtIohcXf31m1Yt67aq1W4MatJMkVihdhVKZbro75VxTkfSP5m9Vsu+6IO96T
         iHRLH70w8Vev+mhIAMhPkJr45VIPXutbrU10nAng5cXVYvoT2cx34HTNreFMQqejf81I
         CgpWUHVaJj4GeAbK4NN2xL9Ixjwyl3j6X5HCpS7Z8+hp8aXYdzv5szQ55ldoLPWE7SPt
         jt8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4Ppw8UVo/qEPgt1AkXxmf7JhE2d9K4tKcX8rTq2VqM0=;
        b=qqWyCIrYzOBajBEabABiwmCjxLs1zhCuwBwdyzZIudBsXVkCU7N7KKPeGWmj9WNOa6
         RWQi7XSIiGM8xu6KfO4cfNUueMT4jZtQTDVpUXf+0j6ls2yyO6tkxjRBCw+fJq1N6jZz
         7c1WwrU2LIho/5dlwhT16A5yDxqKn3ABB7ULpAZowyl7XB4SZ537uVmMCBxQC3rCi4DE
         +yIRtumCEZN+vWBkThAzIQ13lOI7Zvgpf5Sj/H23JtbOXaCR0kPDOJjFzlfjoXE8F7mw
         UhMP2X0t68USUbD+JBBQbPUHyAK2FdVVS0s0O2nD+1/DP43pM+wYWuL2gOF33NvM22hq
         sJ/Q==
X-Gm-Message-State: AOAM53217KE65mWP/gJgK1FfRjZy/iAG2jmu5Mh1vFkm7jOyjOfzGWtK
	P/OlnCiBW4okUtfencsT72PpVkaaEAkPVA==
X-Google-Smtp-Source: ABdhPJynYZi16/O8cBrcIt/J7dx1Ms13LA/nzWfRSH7AoMTjLNzcmzT5zdlPGWmMyk1MP9o2B/deOw==
X-Received: by 2002:a05:6512:3054:b0:478:70d9:845f with SMTP id b20-20020a056512305400b0047870d9845fmr34389294lfb.201.1654098463785;
        Wed, 01 Jun 2022 08:47:43 -0700 (PDT)
Received: from panikiel.wifi.semihalf.net ([83.142.187.86])
        by smtp.gmail.com with ESMTPSA id f10-20020a19380a000000b00478ad871b25sm431219lfa.145.2022.06.01.08.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 08:47:43 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: arnd@arndb.de,
	olof@lixom.net,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	dinguyen@kernel.org,
	amstan@chromium.org,
	upstream@semihalf.com,
	=?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Subject: [PATCH v2 3/5] ARM: dts: socfpga: Add atsha204a node to Mercury+ AA1 dts
Date: Wed,  1 Jun 2022 17:46:45 +0200
Message-Id: <20220601154647.80071-4-pan@semihalf.com>
X-Mailer: git-send-email 2.36.1.255.ge46751e96f-goog
In-Reply-To: <20220601154647.80071-1-pan@semihalf.com>
References: <20220601154647.80071-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add atsha204a node to Mercury+ AA1 dts

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
---
 arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dtsi | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dtsi b/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dtsi
index b0d20101cd00..dd1bfa7e1a78 100644
--- a/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dtsi
+++ b/arch/arm/boot/dts/socfpga_arria10_mercury_aa1.dtsi
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
-
+/*
+ * Copyright 2022 Google LLC
+ */
 #include "socfpga_arria10.dtsi"
 
 / {
@@ -54,6 +56,11 @@ phy3: ethernet-phy@3 {
 };
 
 &i2c1 {
+	atsha204a: crypto@64 {
+		compatible = "atmel,atsha204a";
+		reg = <0x64>;
+	};
+
 	isl12022: isl12022@6f {
 		compatible = "isil,isl12022";
 		reg = <0x6f>;
-- 
2.36.1.255.ge46751e96f-goog

