Return-Path: <SRS0=m72a=UF=gmail.com=singh.kuldeep87k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18247C433EF
	for <soc@archiver.kernel.org>; Sat, 26 Mar 2022 04:23:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id F337FC340F0; Sat, 26 Mar 2022 04:23:45 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 605FAC340EE;
	Sat, 26 Mar 2022 04:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 605FAC340EE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id p8so8154860pfh.8;
        Fri, 25 Mar 2022 21:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y3lKwUZ3g3mmZbBW6jWldu/ZLBfDQ2HUmQZ0fDeopes=;
        b=FaasoctGiouHOE0MA/LUKa748CgeOP2TlJM6wXIvSsASql9CAlx4+CamguYHXQK7hk
         /RJrOqO9LXkT76eVNE7zo+VK/VKAW8n41Igm+WzHOQf/F5vPTokBaBWTV7Darc6J2e5P
         Igx2bsJ4YrnqhQYF7i9W/ljzOQrqv73f0dTUAmg/o9g/8R2PDY+y7oeaOfo1bmOAERyO
         r06fvbfoUlHlvBVvS3hS6we0VvT9UYS4f8ZEqlMUwkutSPNz/12XKnVtGZE8LwkLrIfK
         NjIQeLZyATOj8hb4jVFjhyvTRPLvJCxqSiMd8ZqZKwa3ihwee7MmQYQwhRYYaYRy/GHx
         LvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y3lKwUZ3g3mmZbBW6jWldu/ZLBfDQ2HUmQZ0fDeopes=;
        b=mZCKPHIy3NqaN21kgeaB/kt0PenlPBZLUPglgUQc87kQ3tuJwXlZNzU3eFNmrj58IR
         eRFqZLpenanElJPQkoDouZEkd6C/xrYjWEPJyg9NS6e7CphHwhDTMqtA61woOeCopzWH
         r8IHr9HqvzVxhpxuOyFtn8nii7vvn7CtAyqGJeda6zFGX+pm1Aox7poROXG+vFIcYHwe
         qOE3nJ5W7OTrfxGToHlTGyCL3IGUoFeQooiWL5eiPSk+XtFWZTZtx3FngWeiSaoKcVvi
         X5iTL++0sIg5+kmPAfApSxrgacCcMJ2mW0Pgtfe2vWbn3H2leNjjDHZco6UfygUN3pVN
         ACDA==
X-Gm-Message-State: AOAM530Z2f46BfDrqTIFpU4n/PcQ9uritxgLWO6ojjup1HkUjuVfHiVd
	IKFE0vu7wuScIwk83GuH70s=
X-Google-Smtp-Source: ABdhPJzIcDTFErfbXl6zCRYc7bTn9Iqx+4ylY1p9ch27jmCBgv6Aw6vwfVal2J2KHK34DwOPBkaRsg==
X-Received: by 2002:a65:6093:0:b0:373:9c75:19ec with SMTP id t19-20020a656093000000b003739c7519ecmr2211430pgu.539.1648268624930;
        Fri, 25 Mar 2022 21:23:44 -0700 (PDT)
Received: from localhost.localdomain ([122.161.51.18])
        by smtp.gmail.com with ESMTPSA id gd10-20020a17090b0fca00b001c75d6a4b18sm7457544pjb.14.2022.03.25.21.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 21:23:44 -0700 (PDT)
From: Kuldeep Singh <singh.kuldeep87k@gmail.com>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] ARM: dts: spear1340: Update serial node properties
Date: Sat, 26 Mar 2022 09:53:10 +0530
Message-Id: <20220326042313.97862-3-singh.kuldeep87k@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326042313.97862-1-singh.kuldeep87k@gmail.com>
References: <20220326042313.97862-1-singh.kuldeep87k@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder dma and dma-names property for serial node to make it compliant
with bindings.

Fixes: 6e8887f60f60 ("ARM: SPEAr13xx: Pass generic DW DMAC platform data from DT")
Signed-off-by: Kuldeep Singh <singh.kuldeep87k@gmail.com>
---
 arch/arm/boot/dts/spear1340.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/spear1340.dtsi b/arch/arm/boot/dts/spear1340.dtsi
index 827e887afbda..13e1bdb3ddbf 100644
--- a/arch/arm/boot/dts/spear1340.dtsi
+++ b/arch/arm/boot/dts/spear1340.dtsi
@@ -134,9 +134,9 @@ serial@b4100000 {
 				reg = <0xb4100000 0x1000>;
 				interrupts = <0 105 0x4>;
 				status = "disabled";
-				dmas = <&dwdma0 12 0 1>,
-					<&dwdma0 13 1 0>;
-				dma-names = "tx", "rx";
+				dmas = <&dwdma0 13 0 1>,
+					<&dwdma0 12 1 0>;
+				dma-names = "rx", "tx";
 			};
 
 			thermal@e07008c4 {
-- 
2.25.1

