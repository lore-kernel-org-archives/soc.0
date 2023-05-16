Return-Path: <SRS0=KA1m=BF=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C74C77B7F
	for <soc@archiver.kernel.org>; Tue, 16 May 2023 07:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 371B8C433D2; Tue, 16 May 2023 07:52:33 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 14A2FC433EF;
	Tue, 16 May 2023 07:52:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 14A2FC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1ab13da70a3so133835805ad.1;
        Tue, 16 May 2023 00:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684223551; x=1686815551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzBlnANu1AM5Fjx46MEeCrq3qasOfTTbM5uM0GEAlY0=;
        b=oVtgasVRbUJeGz+K1WDy2wHuDROJfpBH+qhdm6EEOegU3yWrtCzxHgRqZremSH1KZY
         QiKhgZpibIbi2TleyqkCuki5n45vnuWgIwnmMCv9ocCNSf5GTOoX4s4YVRq9DhIQVf9u
         fpxFpVjblCvpzcbaJOMjFrjjbnYZe20EGHP17C/L2nOx/3DnYo2IOiAzLrN1y8q0rCWJ
         osNd9GUWtNHrdrJGQByAz2s+MBro7kx/knQeVUkBAXT0sxqZcM5fR1pPTasAjxJgUM99
         VoMbaijEA1IOaDQimunxFJnuC7jQouvTT6tvvTBO8U0SLmAk46HLfAQbwI0/7S7W6vAi
         rvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684223551; x=1686815551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OzBlnANu1AM5Fjx46MEeCrq3qasOfTTbM5uM0GEAlY0=;
        b=aW3kIYrlYVxceNtX9fRtw3yjI/Mqwqt66tpbpj/sKPOpExoif+/zSxsB0zxVaQGM5U
         78IejpOgzaAgyP3aX8Qbvw6io5DqdC61hdx38avM+Yo96QRMhNJ+z/zTexXqqqBgV4Pp
         UXlkz5fiY2W9jQ/VEFPTF/i30PQlxHqZBePutGjfaCQZUJ/3JYsva8eujWZ/rFtYWqg9
         3HM8xRxMU9bsQbR8ZL5BvKGUayysekAW5UZs8Rxp8jv1ij7ygn3FPN776kpQ67EuUFCT
         cZL/oVkg3tWaOgh61Ao2tSA/qW24v/nXfrLRsdMer+J/Yjz8ISt5jvnd+3vDxixJDq+q
         JIWQ==
X-Gm-Message-State: AC+VfDxNmHCLNTCeYDqqbd8bpq3EHuUJ4Wwf5WEW6NzylySXsGpr3J0M
	ON6nY72RdyXI6FjkOQVm9mksNw3/NlUqog==
X-Google-Smtp-Source: ACHHUZ7Lv0UpK6d/VE+isEPetzkBwIS6Nqh4y64bdHDkuMglGO7vO6iMw9OulfLstIPE3VliSGF/hg==
X-Received: by 2002:a17:902:f682:b0:1a6:db0a:8005 with SMTP id l2-20020a170902f68200b001a6db0a8005mr45001096plg.68.1684223551293;
        Tue, 16 May 2023 00:52:31 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id n18-20020a170903111200b001ab061e352bsm4793043plh.195.2023.05.16.00.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 00:52:30 -0700 (PDT)
From: Jacky Huang <ychuang570808@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	lee@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	tmaimon77@gmail.com,
	catalin.marinas@arm.com,
	will@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	arnd@arndb.de,
	soc@kernel.org,
	schung@nuvoton.com,
	mjchen@nuvoton.com,
	Jacky Huang <ychuang3@nuvoton.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v11 02/10] arm64: defconfig: Add support for Nuvoton MA35 family SoCs
Date: Tue, 16 May 2023 07:52:09 +0000
Message-Id: <20230516075217.205401-3-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230516075217.205401-1-ychuang570808@gmail.com>
References: <20230516075217.205401-1-ychuang570808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacky Huang <ychuang3@nuvoton.com>

This adds support for the Nuvoton MA35 family SoCs which
are based on the Cortex-A35 Armv8-A 64-bit architecture.

Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a24609e14d50..0ee572753f1a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -52,6 +52,7 @@ CONFIG_ARCH_NXP=y
 CONFIG_ARCH_LAYERSCAPE=y
 CONFIG_ARCH_MXC=y
 CONFIG_ARCH_S32=y
+CONFIG_ARCH_MA35=y
 CONFIG_ARCH_NPCM=y
 CONFIG_ARCH_QCOM=y
 CONFIG_ARCH_RENESAS=y
-- 
2.34.1

