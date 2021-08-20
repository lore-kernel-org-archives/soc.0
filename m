Return-Path: <SRS0=3maP=NL=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2271C4338F
	for <soc@archiver.kernel.org>; Fri, 20 Aug 2021 16:50:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 5E359610CC; Fri, 20 Aug 2021 16:50:14 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 339A060E9B;
	Fri, 20 Aug 2021 16:50:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 339A060E9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id v33-20020a0568300921b0290517cd06302dso15108361ott.13;
        Fri, 20 Aug 2021 09:50:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=tjr8j38/Os90LSyEfVorRWiWmsdEDRT1v3ba1dHBUUE=;
        b=jcq5XXvsFHVIw7BMZtZrergW2GOoOkAfNK9R+Ot6BZ9mU3mek4EaGIBXgzASGnJtjH
         TYlPmTSDl/uP1Z9dmEBQ5NUD0ZZ/C1w1d1riS2u38QoitYEzYpgQolqXKRL58A28y1Yl
         MEu8smnbBDPmUFka/Pcn6bvZLByZiv1f0iW/IMYszcMK7MO1uTC8Wyg99bZfvmsLzB/h
         qFLZNRd1Rf0mx12MpY7jbIi/YKsaECDORPvqmelN9SZZuFZM8t59bdcj+hD7ySCf3vp+
         6L3BlUKaFSLFrSCtt1FWOCpouexey5XDGcpcKsx0qkRaqsqyQtQEDFc18J4ey/Tt8gZ8
         tlvA==
X-Gm-Message-State: AOAM531AcHMZhUdbibkeUZxzwvgqvRIbvrAwMWw5DQ1DRWGBI+AyvqhD
	r6XQsDnGAwLpbsZ1rVvk0Q==
X-Google-Smtp-Source: ABdhPJy5fLcI0xBVDHqTw60PRbNNC2mIVzZQpGLTCC3DLbu/aupFUri+AAM0yDq7nqUEeb2bZZBnGw==
X-Received: by 2002:a05:6808:140c:: with SMTP id w12mr3725698oiv.22.1629478213602;
        Fri, 20 Aug 2021 09:50:13 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.googlemail.com with ESMTPSA id v11sm1601771oto.22.2021.08.20.09.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Aug 2021 09:50:12 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	soc@kernel.org
Subject: [PATCH] kbuild: Enable dtc 'pci_device_reg' warning by default
Date: Fri, 20 Aug 2021 11:50:11 -0500
Message-Id: <20210820165011.3257112-1-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There's only a couple of instances of the 'pci_device_reg' warnings left
and they look legit, so let's enable the warning by default.

Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: soc@kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
These are the 2 remaining warnings:

arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi:464.3-52: Warning (pci_device_reg): /pcie@f8000000/pcie@0,0:reg: PCI reg address is not configuration space
arch/arm/boot/dts/bcm2711-rpi-4-b.dts:220.10-231.4: Warning (pci_device_reg): /scb/pcie@7d500000/pci@1,0: PCI unit address format error, expected "0,0"
---
 scripts/Makefile.lib | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 10950559b223..c57f14ac6f99 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -309,8 +309,7 @@ DTC_FLAGS += -Wno-unit_address_vs_reg \
 	-Wno-alias_paths \
 	-Wno-graph_child_address \
 	-Wno-simple_bus_reg \
-	-Wno-unique_unit_address \
-	-Wno-pci_device_reg
+	-Wno-unique_unit_address
 endif
 
 ifneq ($(findstring 2,$(KBUILD_EXTRA_WARN)),)
-- 
2.30.2

