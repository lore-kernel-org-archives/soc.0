Return-Path: <SRS0=a08l=GC=gmail.com=robherring2@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B0EC001DF
	for <soc@archiver.kernel.org>; Fri, 20 Oct 2023 19:50:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7D776C433C7; Fri, 20 Oct 2023 19:50:05 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 36DB9C433C8;
	Fri, 20 Oct 2023 19:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 36DB9C433C8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-1e9d3cc6e7aso843001fac.2;
        Fri, 20 Oct 2023 12:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697831402; x=1698436202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sM5vuZZPtLOe4hJSbBefWkWbsAhOGZLPnuNSBD0x/PI=;
        b=WH567aSBBE7BPJ6zGEQ23sV8AH4k6XThw0R7hTJKNYAcfmdTbpKXA0RUJ5C9BCZcfQ
         EuyKvuaxPld9cHKnNYBXgaouw+oEsp4EXHCCFRWNC6uCN3Y17QaRIHN7AkVnnEXlupum
         BgEmtWYTutcGQVXan5s890JR00OPG0NfZawQALJ/S3KiWrRdnwfMkuRrm/yRSVXZXaFv
         Wps1cNbVz5y16PwOPP3rPkaqo7s3aNXvFOuw1W5AkjBGTauEuZ0szgaJntkSFESmv49p
         mPghF5grsjdHxPMcVIQGMu+HyRg9T1Sagn/6nnN6oy0ZV/XE+bg+0JR2sEalZ5s+sQHD
         fv+Q==
X-Gm-Message-State: AOJu0Ywoa3K/UgK1QFNdTCgppbaxoz2dPHb1cup1Bf6I2p2bbimmpzDz
	0O4Mum85bI+9usSYhsQ/aGBMMC+p8g==
X-Google-Smtp-Source: AGHT+IH7Zz7jeVqsvuY4TO59akjVdECQntAhusPs80kaL+pZG54AZrO5pMUSbkCIxgZXVe1DEpLQyw==
X-Received: by 2002:a05:6870:1311:b0:1d5:a303:5f39 with SMTP id 17-20020a056870131100b001d5a3035f39mr3130325oab.49.1697831402489;
        Fri, 20 Oct 2023 12:50:02 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id eb4-20020a056870a88400b001eace5491c8sm491643oab.18.2023.10.20.12.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 12:50:01 -0700 (PDT)
Received: (nullmailer pid 4183428 invoked by uid 1000);
	Fri, 20 Oct 2023 19:50:00 -0000
From: Rob Herring <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: Pierre Gondois <pierre.gondois@arm.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: Update cache properties for socionext
Date: Fri, 20 Oct 2023 14:49:53 -0500
Message-ID: <20231020194953.4183220-1-robh@kernel.org>
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

