Return-Path: <SRS0=a08l=GC=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29143C001DF
	for <soc@archiver.kernel.org>; Fri, 20 Oct 2023 19:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E2F55C433C8; Fri, 20 Oct 2023 19:51:49 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 04E2CC433C7;
	Fri, 20 Oct 2023 19:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 04E2CC433C7
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1dd71c0a41fso861619fac.2;
        Fri, 20 Oct 2023 12:51:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697831507; x=1698436307;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K8/ZbVb/9IBC0WHwq8jl1yDqEWiHfKExUA5yi1WK5j4=;
        b=miW6D1AFXGFW7QY7aAmKTPjMkCZh/twk0kZZE7owy3h3iaKekGZZ0ONVTNBUcs1e8p
         DTu0pvBD/242IaEhBQH3QgoI8fksccQ5Eb5ZR0SAhroCWVof4MKhdc0j83pS7g5OKw7y
         6q1Ug1IqHtBQU14oi7XoVnxTjYzfgy4p5QSfUYMq0DOid5dxFo8W8XLBuBolLOhAX5a9
         o1C21juCtDpxQ1lMtvLjfl/ga2yY7I5YzMLZtX2KNil6uajCTOgHofMnxq6JuUwkVh4C
         mykwOb9wBS9bR2lVsJQeakE4taTX2Xaet3rrIp8n6Zbjg3rXmR+KIklCb1tPfhdBB/Gp
         KekQ==
X-Gm-Message-State: AOJu0YzZg1D5LT0iSjwSUppb6fYt9szzjaD+jIA7kw0X/DWkwu31u1lA
	/BKTk2GFCGBCDTmFhEzP/1FnCTFedg==
X-Google-Smtp-Source: AGHT+IFDQtRnNsXely0BT6dTlD9vbK/uYWv6xNMrP4qF2nI/sgu7QAY8ttiA22cFlzAmEMbaUvSsYg==
X-Received: by 2002:a05:6870:5cc9:b0:1e9:9989:33a5 with SMTP id et9-20020a0568705cc900b001e9998933a5mr3353395oab.5.1697831507323;
        Fri, 20 Oct 2023 12:51:47 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m7-20020a056870194700b001cc9bc7b569sm483158oak.27.2023.10.20.12.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 12:51:46 -0700 (PDT)
Received: (nullmailer pid 4185737 invoked by uid 1000);
	Fri, 20 Oct 2023 19:51:45 -0000
From: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: Pierre Gondois <pierre.gondois@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v2] arm64: dts: Update cache properties for socionext
Date: Fri, 20 Oct 2023 14:50:22 -0500
Message-ID: <20231020195022.4183862-2-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pierre Gondois <pierre.gondois@arm.com>

The DeviceTree Specification v0.3 specifies that the cache node
'compatible' and 'cache-level' properties are 'required'. Cf.
s3.8 Multi-level and Shared Cache Nodes
The 'cache-unified' property should be present if one of the
properties for unified cache is present ('cache-size', ...).

Update the Device Trees accordingly.

Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Link: https://lore.kernel.org/r/20221107155825.1644604-21-pierre.gondois@arm.com
Signed-off-by: Rob Herring <robh@kernel.org>
---
I noticed this one fell thru the cracks from the rest of the series.

Arnd, Can you take this directly.

 arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi | 1 +
 arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi | 2 ++
 arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi | 1 +
 3 files changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
index 7bb36b071475..54e58d945fd7 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld11.dtsi
@@ -52,6 +52,7 @@ cpu1: cpu@1 {
 
 		l2: l2-cache {
 			compatible = "cache";
+			cache-level = <2>;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
index 4e2171630272..18390cba2eda 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-ld20.dtsi
@@ -86,10 +86,12 @@ cpu3: cpu@101 {
 
 		a72_l2: l2-cache0 {
 			compatible = "cache";
+			cache-level = <2>;
 		};
 
 		a53_l2: l2-cache1 {
 			compatible = "cache";
+			cache-level = <2>;
 		};
 	};
 
diff --git a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
index 38ccfb46ea42..56e037900818 100644
--- a/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
+++ b/arch/arm64/boot/dts/socionext/uniphier-pxs3.dtsi
@@ -83,6 +83,7 @@ cpu3: cpu@3 {
 
 		l2: l2-cache {
 			compatible = "cache";
+			cache-level = <2>;
 		};
 	};
 
-- 
2.42.0

