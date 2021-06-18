Return-Path: <SRS0=rHyZ=LM=baylibre.com=clabbe@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C113C48BE8
	for <soc@archiver.kernel.org>; Fri, 18 Jun 2021 20:55:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2F773613C2; Fri, 18 Jun 2021 20:55:43 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0B5E60E09
	for <soc@kernel.org>; Fri, 18 Jun 2021 20:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F0B5E60E09
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=clabbe@baylibre.com
Received: by mail-wr1-f44.google.com with SMTP id i94so12102710wri.4
        for <soc@kernel.org>; Fri, 18 Jun 2021 13:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qLy32YRyoZ5czfNPvX937n5z68mS5Dt/8atvgtKFvwQ=;
        b=o/CxikdrQRF61Z372ZRwM8wBTTiCxbifjXJIC3UGwCkgtcL13kW7xV0v/vTJs2Sr3F
         vlPtDKAg8kJYDqOmDjgxNdAFaCR04GmBfkXNUhPrev9TOHVMZeL2+Wfov/QhfOVKLFOG
         jegTkNUcslewWDomJoVX0T5ZLe11r3JNKcolewJTcbOv3wd/6iWA2vA/rjaZhwb41Szx
         DioqP02R44mK7ygcc3qEswJDNyUigoT/UOHVudcQEn0rfOEvffu5wczNPas/qR+79Svl
         BmP/XDKP2/FnlaZ7ShvOX9ZXNhkXWdEbRYqVl2JDUslwtDVdmgSvGyWu1DVzK3CtcCat
         P4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qLy32YRyoZ5czfNPvX937n5z68mS5Dt/8atvgtKFvwQ=;
        b=m7MKw4GBRGzIUyKYPj0HQiDCmIsf8JfHuGSQW28eZX5J+HyhxdZHZI933dPw+mkDh+
         7pHGCrv+z7Qma6IRrXoAzgY3CDuaVSbKaj4IcK4N+hmwfgdxKN3t6QEMwztiG9wcqhBL
         sQm5zZ01TJNILBCJTmpftPIEMeAhSCytRW09IsTZkEWNiFJ1hs4N3RavFiJvSiZXcJHm
         jrE+Yw8ARIVmtPxFusD9hURzivLVERY/KcJaA49BUSbp2SIBLWqUJAUzYMcbz3hK15mQ
         3qtclKK1l+vdKRhpb4Z+GvvTEfipf+HjmNEDJ2PX06y1Zj6tTmSYEde1qLgNH7FPhCDs
         kryQ==
X-Gm-Message-State: AOAM531Sz4bQh9uGGsZ6NTArO1TLgqD1tH17ynvhqWuyxMsJPzaP++TG
	SxboddvNJLnN7FwKnRqxzG2Vuw==
X-Google-Smtp-Source: ABdhPJwvWUKDVSAk9UEA2yUXUvp1Q8PkiE4s34baCHlp7pzILntItWvnWGhPX6sz0+OyVzlYwdJe+g==
X-Received: by 2002:adf:ee52:: with SMTP id w18mr14828957wro.37.1624049740671;
        Fri, 18 Jun 2021 13:55:40 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id j12sm9745476wrt.69.2021.06.18.13.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 13:55:40 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	linus.walleij@linaro.org,
	olof@lixom.net,
	robh+dt@kernel.org,
	soc@kernel.org,
	ulli.kroll@googlemail.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2 0/5] ARM: gemini: add two more board
Date: Fri, 18 Jun 2021 20:55:28 +0000
Message-Id: <20210618205533.1527384-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have two boards with a SL3516 SoC. Both are NAS box.

Changes since v1:
- ssi1328 use now redboot-fis partitions
- added pinctrl as asked by Linus Walleij

Corentin Labbe (5):
  ARM: dts: gemini: add labels for USB, IDE, flash and ethernet
  dt-bindings: add vendor prefix for edimax
  dt-bindings: add vendor prefix for ssi
  ARM: gemini: add device tree for edimax NS2502
  ARM: gemini: add device tree for ssi1328

 .../devicetree/bindings/vendor-prefixes.yaml  |   4 +
 arch/arm/boot/dts/Makefile                    |   2 +
 arch/arm/boot/dts/gemini-ns2502.dts           | 148 ++++++++++++++++++
 arch/arm/boot/dts/gemini-ssi1328.dts          | 138 ++++++++++++++++
 arch/arm/boot/dts/gemini.dtsi                 |  12 +-
 5 files changed, 298 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/boot/dts/gemini-ns2502.dts
 create mode 100644 arch/arm/boot/dts/gemini-ssi1328.dts

-- 
2.31.1

