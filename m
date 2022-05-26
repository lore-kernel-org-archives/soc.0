Return-Path: <SRS0=d1J0=WC=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B50FBC4332F
	for <soc@archiver.kernel.org>; Thu, 26 May 2022 20:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0C39C34119; Thu, 26 May 2022 20:46:14 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D530DC3411A
	for <soc@kernel.org>; Thu, 26 May 2022 20:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D530DC3411A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id q15so3138666edb.11
        for <soc@kernel.org>; Thu, 26 May 2022 13:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rnybARV3PwUYIGMqQC+Cnp8reh2zKysuGjn0nOXwzUs=;
        b=LihLiejBgtb1JWrkSoCEc7iO3MJvpnBkTVV4nodP5KXPCg3pChJQvYNBPvc7Zfdnkm
         5kMTPWtUsCDj6IVl3U0gws1lE0+lb+/Apc3ac6Rg8tciBGgMw/SJWQY9WK5XmoPjtOIC
         WKvC8XMPKlRJRz7omcLDaiX46xme99b17SQW58lrsZC7eUWctqT6NuWadl7BbPnbzGzB
         Hw1U9Dxdqcs/YkrMU8sbqf5W9ta5hF7u5FkxU+fj/+t6RQ5YZTel8kRpGSd00Y6eQuzV
         7DAk7sS9eCLb2BjOMJhOf94mnqQCv9qFabFmxvYP6SA+QFavLJqGVROURE1iI/7W0Q/Z
         TvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rnybARV3PwUYIGMqQC+Cnp8reh2zKysuGjn0nOXwzUs=;
        b=DcF0OGUt3HxsoGccrf7nKJz5knpJ46TXzL1wZGxDTtH+/PoVdzLcpPiaRgs130vqOD
         Zu44TRYngSmxldwZTPwB0AvWzJQNXxQp5JoOlJZvHX3ZXZB86dm6xZd7y/n10lYKf/Ac
         M7m+LN32AQhw3iKEGHBCUI67ZHyv0NrbcgFkTh6JB5uU/jV+vtHBfjEld/jJrFHMS2IV
         wMoNP4ePwsCr+BUJOUqrxNQI1rp4qLYKVs05POPljbQYgIuWyYhP/VKYjdGTqciz1IiV
         rOpaMjetxPL4v6EQi2txDsWQYrPDfOMlxUjH6CCb53kS+jMTDAhOR8s22AG8N/6PAjju
         NgTA==
X-Gm-Message-State: AOAM531lP9ptnIpejF36QQCdBnRY8dqY4QT0CyHAuTAP4RCAsgNmGyRB
	YRQZHwtWK+KUcu397gQKWDqVlw==
X-Google-Smtp-Source: ABdhPJxhrSUNdF75HeB2S4wTXDWWHMko2Vvbdd8PFPVfzHBp9hwcw7GOu6CQNFmU1ukyWR8Rvsn6EQ==
X-Received: by 2002:a05:6402:524e:b0:42b:5902:1f26 with SMTP id t14-20020a056402524e00b0042b59021f26mr26047973edd.153.1653597972244;
        Thu, 26 May 2022 13:46:12 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gc21-20020a1709072b1500b006ff16f48e2asm813254ejc.76.2022.05.26.13.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:46:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Brijesh Singh <brijeshkumar.singh@amd.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/5] arm64: dts: amd: adjust whitespace around '='
Date: Thu, 26 May 2022 22:46:03 +0200
Message-Id: <20220526204606.833054-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526204606.833054-1-krzysztof.kozlowski@linaro.org>
References: <20220526204606.833054-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix whitespace coding style: use single space instead of tabs or
multiple spaces around '=' sign in property assignment.  No functional
changes (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Output compared with dtx_diff and fdtdump.
---
 arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts | 4 ++--
 arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
index c290d1ce2b03..02bff65e5fd6 100644
--- a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
+++ b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b0.dts
@@ -20,8 +20,8 @@ chosen {
 	};
 
 	psci {
-		compatible   = "arm,psci-0.2";
-		method       = "smc";
+		compatible = "arm,psci-0.2";
+		method = "smc";
 	};
 };
 
diff --git a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
index e0926f6bb7c3..07dab1f1e3c8 100644
--- a/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
+++ b/arch/arm64/boot/dts/amd/amd-overdrive-rev-b1.dts
@@ -20,8 +20,8 @@ chosen {
 	};
 
 	psci {
-		compatible   = "arm,psci-0.2";
-		method       = "smc";
+		compatible = "arm,psci-0.2";
+		method = "smc";
 	};
 };
 
-- 
2.34.1

