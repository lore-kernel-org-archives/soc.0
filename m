Return-Path: <SRS0=opHc=W7=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 427AAC433EF
	for <soc@archiver.kernel.org>; Fri, 24 Jun 2022 07:05:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EF39FC341C6; Fri, 24 Jun 2022 07:05:26 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B6AF5C34114
	for <soc@kernel.org>; Fri, 24 Jun 2022 07:05:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B6AF5C34114
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id s185so1606071pgs.3
        for <soc@kernel.org>; Fri, 24 Jun 2022 00:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ROM/yxgzcSW9KOn0TYbO6CFrTcagcwRAswNr4WYqNqA=;
        b=U8Q8vjGIpqGjVCS45rzVRo0PgmA1EecYT9jVwDKshpfB88I3F3sFDipeavchvfVAmz
         wWgIYBztih7cv4PoJ+5YoSJLzoSDCaJ6gmQ1l0hSZe812tZLb2UUF6D/1cE/a4PT/Ft6
         V0wGp7lLTZAOESFE3mvj4AW5w5tbHXvxtQhzRaET1d8ohACDYhMC0Oqun5Ge70TugHek
         jFv2PNY1nQ+bod5Ofky7mPAoxWCMrJFF5QOafNLQhgGmB8j25sjNRj70td81cw5V3TbR
         hNSx/R8+gwr04K6iixC3uxDbI5tJHM90OsOYC3HtDSil1uTKqIEyJiyT/SuxNxU8jvF5
         gkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=ROM/yxgzcSW9KOn0TYbO6CFrTcagcwRAswNr4WYqNqA=;
        b=QQaHzjtr3qrrzGFr/bSkzRfBnFgrjbNBmqrg3nvHpAGUgM+xG6uhWbYWvHe1Me2SVs
         B1cGTA1yhm7OFc+5Odo8DgoFtAcMxw6ydCe4LWN1/XQY7y1pql9mourc0Z/oZgoAF8Vh
         7a34lNaRilZFJDdENtiXGaE796t4gxlEWZR/9WxOoo8plD9/b5oPLdxRhUY9EFq5DaLS
         Zwo3OT1r3cNRvQ1KJh7JhwYjHC68uw68WdMUv2K+fyR4qhR4/82yaEA9b4PXrnfGnSR3
         16S3HKLqSeVk595PuejsGukrF3wfwkYaKUHa+E4hzQn9eUC5+9pJZNEc++J48IXoKxEk
         hGqw==
X-Gm-Message-State: AJIora+2El78GzSTgiryF1fkqCtsp0EVV2zv6b++aiFk0q+hB1dpFmrO
	FAbVyzGCTvDlVh9qR8dhm2TF6zSg3+g=
X-Google-Smtp-Source: AGRyM1uFSbdtq9pNRnUlwhc/T+Bud6bYrLWL8R1GNlyki9Xeod/+YiHt7XNZl4gSuBxplF5ipic84A==
X-Received: by 2002:a63:5304:0:b0:3fb:92eb:8e90 with SMTP id h4-20020a635304000000b003fb92eb8e90mr10820131pgb.36.1656054324316;
        Fri, 24 Jun 2022 00:05:24 -0700 (PDT)
Received: from voyager.lan ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id s1-20020a170902988100b0016a4a57a25asm984178plp.152.2022.06.24.00.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 00:05:23 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Subject: [PATCH] ARM: dts: aspeed: nuvia: rename vendor nuvia to qcom
Date: Fri, 24 Jun 2022 16:35:11 +0930
Message-Id: <20220624070511.4070659-1-joel@jms.id.au>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>

Nuvia has been acquired by Qualcomm and the vendor name 'nuvia' will
not be used anymore so rename aspeed-bmc-nuvia-dc-scm.dts to
aspeed-bmc-qcom-dc-scm-v1.dts and change 'nuvia' to 'qcom' as its vendor
name in the file.

Fixes: 7b46aa7c008d ("ARM: dts: aspeed: Add Nuvia DC-SCM BMC")
Signed-off-by: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Link: https://lore.kernel.org/r/20220523175640.60155-1-quic_jaehyoo@quicinc.com
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Hi soc maintainers, Please apply this as a fix for v5.19. There's a
desire to change this before it's in a released kernel.

 arch/arm/boot/dts/Makefile                                    | 2 +-
 ...eed-bmc-nuvia-dc-scm.dts => aspeed-bmc-qcom-dc-scm-v1.dts} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename arch/arm/boot/dts/{aspeed-bmc-nuvia-dc-scm.dts => aspeed-bmc-qcom-dc-scm-v1.dts} (97%)

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index e63cd6ed0faa..6afb7c8102d3 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -1546,7 +1546,6 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-lenovo-hr630.dtb \
 	aspeed-bmc-lenovo-hr855xg2.dtb \
 	aspeed-bmc-microsoft-olympus.dtb \
-	aspeed-bmc-nuvia-dc-scm.dtb \
 	aspeed-bmc-opp-lanyang.dtb \
 	aspeed-bmc-opp-mihawk.dtb \
 	aspeed-bmc-opp-mowgli.dtb \
@@ -1559,6 +1558,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
 	aspeed-bmc-opp-witherspoon.dtb \
 	aspeed-bmc-opp-zaius.dtb \
 	aspeed-bmc-portwell-neptune.dtb \
+	aspeed-bmc-qcom-dc-scm-v1.dtb \
 	aspeed-bmc-quanta-q71l.dtb \
 	aspeed-bmc-quanta-s6q.dtb \
 	aspeed-bmc-supermicro-x11spi.dtb \
diff --git a/arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts b/arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts
similarity index 97%
rename from arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts
rename to arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts
index f4a97cfb0f23..259ef3f54c5c 100644
--- a/arch/arm/boot/dts/aspeed-bmc-nuvia-dc-scm.dts
+++ b/arch/arm/boot/dts/aspeed-bmc-qcom-dc-scm-v1.dts
@@ -6,8 +6,8 @@
 #include "aspeed-g6.dtsi"
 
 / {
-	model = "Nuvia DC-SCM BMC";
-	compatible = "nuvia,dc-scm-bmc", "aspeed,ast2600";
+	model = "Qualcomm DC-SCM V1 BMC";
+	compatible = "qcom,dc-scm-v1-bmc", "aspeed,ast2600";
 
 	aliases {
 		serial4 = &uart5;
-- 
2.35.1

