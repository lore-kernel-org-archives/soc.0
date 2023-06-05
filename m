Return-Path: <SRS0=QcdD=BZ=gmail.com=ychuang570808@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8936C7EE2C
	for <soc@archiver.kernel.org>; Mon,  5 Jun 2023 04:08:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B803FC433A4; Mon,  5 Jun 2023 04:08:04 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AD1BDC433EF;
	Mon,  5 Jun 2023 04:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AD1BDC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-652328c18d5so1794554b3a.1;
        Sun, 04 Jun 2023 21:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685938083; x=1688530083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzBlnANu1AM5Fjx46MEeCrq3qasOfTTbM5uM0GEAlY0=;
        b=IZy1HL2XKLngjDI2mxhpx5ridDWNCnu232bl8Iu9EHvRrAXCzwC6RotioeGoMNDThZ
         Rq71z3zRNUJ7rpMICnJ1z6rpwKwW/m+Akd09c3EfyfhwinVTwgg3SR7Y3rLNQiqng7t/
         oUTZ0f1UUjUplkL4gnVYRb0/swN8L7OShCszWb2nJK6LXTYcQcmlfLvcnGUYGp9SuZD9
         cOilEwupHixBdR3+tcYzOJztv9IjGQmIQKwf/esE7OlREey+RGQultPxwKecubUmqQQk
         88uSVQsRyIqJ/ZSpfr/M6RH0YvUiJVQ8BiGOkf6yE/x1xObPEcttYIv1fRM/QpbjEgCU
         CfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685938083; x=1688530083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OzBlnANu1AM5Fjx46MEeCrq3qasOfTTbM5uM0GEAlY0=;
        b=BEMQV1Ns9T6vuLKIsSzrS1xl+/KsoCrpLmbtyUOcSi83hTBOsXinMc2+HFLWjsWt9t
         YZdj23QCBG/WhvvCDD5f7Hp14Jr55Qs9gTosYmH1dBu3V0PX+mXkplwIWOAWtlYELKGW
         YNObmjqD8ceAfIgtppDL02MMSz+ibdI9W6alD3jyeyq2eu+/bkGkFVoYH8Xgxvo40pXp
         E7ptf7gBSk0t91GYNKCCNlpr9L2u7vIpzdabZqSPw4/3K0t3tk+ql49kX5x/kRwrmTov
         U/yuP5tSQPrIkiIBTO7l7byr1M1LZlTPbUHz4JPq+Q7k0rNQMfG1A9Jt5OPdO7i7DMxE
         mcnQ==
X-Gm-Message-State: AC+VfDybxtMi9RqHhNBblKEzIVbzVDpF7VND3xkOPwqcTy02+T3nHknE
	dI9EzTSALN+vEYLA2N3mgw2T3fWom+8=
X-Google-Smtp-Source: ACHHUZ6lnNT3qIiWuTmhO0qL7zE/FmPm5o7P/1UwRjxNu2RZvKyWjy7zfJECsOyrNmXOuMi4FrM51Q==
X-Received: by 2002:a05:6a21:33a0:b0:111:92ef:314e with SMTP id yy32-20020a056a2133a000b0011192ef314emr1400147pzb.35.1685938082661;
        Sun, 04 Jun 2023 21:08:02 -0700 (PDT)
Received: from a28aa0606c51.. (60-250-192-107.hinet-ip.hinet.net. [60.250.192.107])
        by smtp.gmail.com with ESMTPSA id b4-20020a170903228400b001b21bcea439sm206164plh.170.2023.06.04.21.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 21:08:02 -0700 (PDT)
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
Subject: [PATCH v13 02/10] arm64: defconfig: Add support for Nuvoton MA35 family SoCs
Date: Mon,  5 Jun 2023 04:07:41 +0000
Message-Id: <20230605040749.67964-3-ychuang570808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230605040749.67964-1-ychuang570808@gmail.com>
References: <20230605040749.67964-1-ychuang570808@gmail.com>
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

