Return-Path: <SRS0=gQRC=IG=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E698C433E0
	for <soc@archiver.kernel.org>; Mon,  8 Mar 2021 17:09:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1415665244; Mon,  8 Mar 2021 17:09:59 +0000 (UTC)
Received: from youngberry.canonical.com (youngberry.canonical.com [91.189.89.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBC0565237
	for <soc@kernel.org>; Mon,  8 Mar 2021 17:09:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBC0565237
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzysztof.kozlowski@canonical.com
Received: from mail-wr1-f70.google.com ([209.85.221.70])
	by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.86_2)
	(envelope-from <krzysztof.kozlowski@canonical.com>)
	id 1lJJOH-0003IV-7w
	for soc@kernel.org; Mon, 08 Mar 2021 17:09:57 +0000
Received: by mail-wr1-f70.google.com with SMTP id m23so111659wrh.7
        for <soc@kernel.org>; Mon, 08 Mar 2021 09:09:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=C9i/YWiyyb5PdwLe3ZFYzqCtKS3WIBfWL6NqlaTWQyU=;
        b=RlMVKoIF1pGJafoM/2VSwdIe7UfyykYF9WoV4cLl1lEShlRcH95u2pcP078QJ0haHj
         CJ3srs5JZ3qzslMX3v0cy93wJ04Dr/zkYpZUUcoN9O5Mrr4KiKsPyJxNhqbXgT7hDxlL
         a96mOc07LDw4+YJWFxjyOujITjO+g/N3nnQ8nINWx3kfdqP29C5bFGzAE24htycrHz4u
         mkznZIuqQ5sIMTCD9qs6HAM0Aw8G5A3Subhdpl+2KotVJRhCathoilLwGV/RoqUn/Sr/
         cDBGW4zGQtayAXZ9maQzp+xhRyNWEueTA5JHubY4ucLU6EHzZuRoQaPs63AyxJpuuTIW
         n2kg==
X-Gm-Message-State: AOAM530DUCIuEv4zK5O6BLceC+Kcb6IrA8s6pJECFQfOmU0ggIRAWuCw
	+692I8szk7zZJN2msMKxffqJIKOtF8LaES/zhtZ1vS8sKbtOWuaiQgQtGnS/jMw5UorzdvnmBVB
	eXndpSOFWoyNa8rC7uWzVKmY=
X-Received: by 2002:a05:600c:1550:: with SMTP id f16mr22923213wmg.97.1615223396993;
        Mon, 08 Mar 2021 09:09:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWzaztVdULD9g4Zbto/QrUTn46X9bgseHYTyzXeTjQCkYwdkvR7xsi1fOdNe3rkKa5+Za85A==
X-Received: by 2002:a05:600c:1550:: with SMTP id f16mr22923197wmg.97.1615223396876;
        Mon, 08 Mar 2021 09:09:56 -0800 (PST)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id c11sm19568762wrs.28.2021.03.08.09.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 09:09:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: "Paul J. Murphy" <paul.j.murphy@intel.com>,
	Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
	Rob Herring <robh+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RESEND 2nd PATCH 02/10] arm64: dts: intel: socfpga: override clocks by label
Date: Mon,  8 Mar 2021 18:09:37 +0100
Message-Id: <20210308170945.161468-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308170945.161468-1-krzysztof.kozlowski@canonical.com>
References: <20210308170945.161468-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Krzysztof Kozlowski <krzk@kernel.org>

Using full paths to extend or override a device tree node is error
prone.  If there was a typo error, a new node will be created instead of
extending the existing node.  This will lead to run-time errors that
could be hard to detect.

A mistyped label on the other hand, will cause a dtc compile error
(during build time).

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts   | 12 ++++--------
 .../boot/dts/intel/socfpga_agilex_socdk_nand.dts     | 12 ++++--------
 arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts      | 12 ++++--------
 3 files changed, 12 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
index a7a83f29f00b..f14a89ca8784 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk.dts
@@ -41,14 +41,6 @@ memory {
 		/* We expect the bootloader to fill in the reg */
 		reg = <0 0 0 0>;
 	};
-
-	soc {
-		clocks {
-			osc1 {
-				clock-frequency = <25000000>;
-			};
-		};
-	};
 };
 
 &gpio1 {
@@ -92,6 +84,10 @@ &mmc {
 	bus-width = <4>;
 };
 
+&osc1 {
+	clock-frequency = <25000000>;
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts
index 979aa59a6bd0..58a827a5e83f 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex_socdk_nand.dts
@@ -41,14 +41,6 @@ memory {
 		/* We expect the bootloader to fill in the reg */
 		reg = <0 0 0 0>;
 	};
-
-	soc {
-		clocks {
-			osc1 {
-				clock-frequency = <25000000>;
-			};
-		};
-	};
 };
 
 &gpio1 {
@@ -121,6 +113,10 @@ partition@4280000 {
 	};
 };
 
+&osc1 {
+	clock-frequency = <25000000>;
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts
index 5f56e2697fee..01f1307ce4ac 100644
--- a/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_n5x_socdk.dts
@@ -23,14 +23,6 @@ memory {
 		/* We expect the bootloader to fill in the reg */
 		reg = <0 0 0 0>;
 	};
-
-	soc {
-		clocks {
-			osc1 {
-				clock-frequency = <25000000>;
-			};
-		};
-	};
 };
 
 &clkmgr {
@@ -44,6 +36,10 @@ &mmc {
 	bus-width = <4>;
 };
 
+&osc1 {
+	clock-frequency = <25000000>;
+};
+
 &uart0 {
 	status = "okay";
 };
-- 
2.25.1

