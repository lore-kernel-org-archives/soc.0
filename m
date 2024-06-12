Return-Path: <SRS0=tuuZ=NO=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09366C27C53
	for <soc@archiver.kernel.org>; Wed, 12 Jun 2024 14:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C3430C4AF48; Wed, 12 Jun 2024 14:17:48 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 970CBC4AF1C
	for <soc@kernel.org>; Wed, 12 Jun 2024 14:17:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 970CBC4AF1C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a6f1c4800easo441669066b.3
        for <soc@kernel.org>; Wed, 12 Jun 2024 07:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718201865; x=1718806665; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ra/aultLLqSMqirFger1rlz2sqaFfvVtkgbMOB08yYg=;
        b=f8HglW/cLBQUnMIzwLNp/5Hcth9BVRNuoDoWyBFOgx+CpJ9UFC8B7yQr5gSc5pCN5e
         LNxdCr6UaTug7MHhW5mg8K+WuOxxxiNSXvDMvzF9W2/5GgaV1GxfAtLGfc6ZCuRe0/5u
         /R2+YRKvP+U0pOa4A5xbiI194bXPKl+5+vN5S/fxAwW+22qU5BZKSAUwu5/sgNqttCDJ
         KOSuzprofwjRIe+ZZKKKWPvwcrSMX/SMwRLTqa0LtUcnQPH8qQYu76F9z7UcYSuh5KaO
         eKyIBT9o9b1I27PBA9MKZlu4pTvkbV0V9AuijCHE2xXfHz/LRWtPpqz1tNdgif+VOcJu
         VhDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718201865; x=1718806665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ra/aultLLqSMqirFger1rlz2sqaFfvVtkgbMOB08yYg=;
        b=I/HoNdsSK067X0dMKrCew8ISrFy/8CilTeIBOAqAL6RX6Dkl38MtoOZxDZGPvaunxr
         0CeUMmcQCKQGBtC0bhm645V3m5OCeg/1eqzrcOp3+WAUazOgLCiYcHnZDVGfpEZDkHr3
         d5jrJWprtjpUTNQnw42gQZhdtGyswjRPiMk/eeHad8eg9QIS/s6BQL/mAZvin6pwcAV9
         2vD/1ITPHTqsMLJynmR5rtc2pvQcqc/xJGGheITcz7VSxo+la1FXcreNV2JTJ4ZLRH19
         IT+UOccLtrhVNz3RPXMSYfFSPxGqtn5kfjm3HY7qa/xyshKBcI6b3DzM9KZ8i1fmlWFl
         kSGA==
X-Forwarded-Encrypted: i=1; AJvYcCUebIzaIhD4vFItbYiErjUVTeBnLbBzT+2LG7OE97svfZrOAFrJvgdVLJgtklC/eygDpEQxSPtPoRLuTYjLYw==
X-Gm-Message-State: AOJu0YwmPqHZHI0mqCUEGlHLZos04F4lN97LY8/MNFH3oIpi0dskKjaj
	Ksk6DC3hrtSTTdzytgQsTG0qxReXYLmLYKU3MCjSgERcnmaiTZDT8oPzO++73G4=
X-Google-Smtp-Source: AGHT+IE9mBpInZsubvG3jOv3n1DIXRtg2c6jpbSypFQqfzQG15LBL3RZwuI1ajhdr9B0yz1D9TroLw==
X-Received: by 2002:a17:906:12d6:b0:a6f:1378:1325 with SMTP id a640c23a62f3a-a6f47d1e38amr128483566b.9.1718201864711;
        Wed, 12 Jun 2024 07:17:44 -0700 (PDT)
Received: from krzk-bin.. ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f11e88ccbsm517639466b.133.2024.06.12.07.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 07:17:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Daniel Tang <dt.tangr@gmail.com>,
	Andrew Davis <afd@ti.com>
Subject: [PATCH] MAINTAINERS: ARM: nspire: add Krzysztof Kozlowski as maintainer
Date: Wed, 12 Jun 2024 16:17:40 +0200
Message-ID: <20240612141740.8470-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Apparently there was never a maintainers entry for the ARM Texas
Instruments Nspire SoC, thus patches end up nowhere.  Add such entry,
because even if platform is orphaned and on its way out of the kernel,
it is nice to take patches if someone sends something.

I do not plan to actively support/maintain Nspire platform but I can
take odd fixes now and then.

Cc: Daniel Tang <dt.tangr@gmail.com>
Cc: Andrew Davis <afd@ti.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 647233a62f50..4b262cb060b7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3048,6 +3048,15 @@ F:	Documentation/devicetree/bindings/hwinfo/ti,k3-socinfo.yaml
 F:	arch/arm64/boot/dts/ti/Makefile
 F:	arch/arm64/boot/dts/ti/k3-*
 
+ARM/TEXAS INSTRUMENTS NSPIRE ARCHITECTURE
+M:	Krzysztof Kozlowski <krzk@kernel.org>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Odd Fixes
+F:	Documentation/devicetree/bindings/*/*/ti,nspire*
+F:	Documentation/devicetree/bindings/*/ti,nspire*
+F:	Documentation/devicetree/bindings/arm/ti/nspire.yaml
+F:	arch/arm/boot/dts/nspire/
+
 ARM/TOSHIBA VISCONTI ARCHITECTURE
 M:	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
2.43.0

