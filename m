Return-Path: <SRS0=sRvu=KM=baylibre.com=clabbe@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 598E2C433ED
	for <soc@archiver.kernel.org>; Mon, 17 May 2021 19:32:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 32E1E61352; Mon, 17 May 2021 19:32:19 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47DFF6128E
	for <soc@kernel.org>; Mon, 17 May 2021 19:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47DFF6128E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=clabbe@baylibre.com
Received: by mail-wm1-f49.google.com with SMTP id b7so3579173wmh.5
        for <soc@kernel.org>; Mon, 17 May 2021 12:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o1MWPbCmhKRlzL0yQboMxEH1Vw5Cn+akoWVJYorN7PI=;
        b=gMdukzhdloaqM5m8ubf2QsTgloFt0oz4um3ZEfJnC6cRrLb4WDhRkOO8MNcXJ94tzK
         OsESwrpQ+vzWnStApEaLzk1FMuLyLEIdf/9Z90xd3FZNVj06J2RkE1n9bxgY6fe/8Ncq
         oMgmF2/Lb4Ef9gxGuRWxbug+9XbrOFu3dztlMNhzuKM4goSO9cB79LOp8yCHrch6G5z1
         HWJ0aecZ9uoZonwBT8M6tSqtz9Xl2UXBHAhYliIpdVymj8MLW0MqFmKaLA5Z/2EOyLDb
         5P2DbcnKIVCSr2++Fcqi4xE4GWwqr7q4xAfJua5M+zhShrrYAB1xyMBmX/O5KdCAXWia
         kKvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o1MWPbCmhKRlzL0yQboMxEH1Vw5Cn+akoWVJYorN7PI=;
        b=QxXLfHSt/CazRQ32k1q/6E9hNq86VbpXZEGO8XILchsDc3x30hE6y4C+ML0j8reSl2
         tWAWneGlVicLQ7ipAva44y9cZpZAR4gZGOJG+rvdoVCka4/BOatKKNLzP81P7VJM5FWv
         P7OgkVCfSKck6js0WILScN0LMnRtyVsWad0KEjBackBVed9Uej20JlYDVdEekzh5qqdA
         4aviWy0LMWbb/ZKJ8jrqSxPZ04pP/0pNfTnKm2hAMe9uTjLVlsbG75f89QFJ3ObP+QXv
         z0JHLDvfyk/mXFuNhacD8Wmz0xHrYyVFALOCa2eJGo9i1WXvFQ7aHewk1IvsP1a0ycsY
         t1Mg==
X-Gm-Message-State: AOAM530F3NT6i1fdhUcFebYl+/WKR86Q+VPn4A90XEv/2ZonJca8WCvR
	AOSykznXMbfajvQ2a7O+9va7lg==
X-Google-Smtp-Source: ABdhPJwsv8iDnA2SN4nduILJwkjwb9WmpT/ZkNYhNGWcTPOkmyY9kui9eXiLhc780cUiLjBIdSA3DQ==
X-Received: by 2002:a1c:1f84:: with SMTP id f126mr617294wmf.189.1621279936942;
        Mon, 17 May 2021 12:32:16 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id e10sm18928907wrw.20.2021.05.17.12.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 12:32:16 -0700 (PDT)
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
Subject: [PATCH 0/5] ARM: gemini: add two more board
Date: Mon, 17 May 2021 19:32:00 +0000
Message-Id: <20210517193205.691147-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have two boards with a SL3516 SoC. Both are NAS box.

Corentin Labbe (5):
  ARM: dts: gemini: add labels for USB, IDE, flash and ethernet
  dt-bindings: add vendor prefix for edimax
  dt-bindings: add vendor prefix for ssi
  ARM: gemini: add device tree for edimax NS2502
  ARM: gemini: add device tree for ssi1328

 .../devicetree/bindings/vendor-prefixes.yaml  |   4 +
 arch/arm/boot/dts/Makefile                    |   2 +
 arch/arm/boot/dts/gemini-ns2502.dts           | 141 +++++++++++++++
 arch/arm/boot/dts/gemini-ssi1328.dts          | 162 ++++++++++++++++++
 arch/arm/boot/dts/gemini.dtsi                 |  12 +-
 5 files changed, 315 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm/boot/dts/gemini-ns2502.dts
 create mode 100644 arch/arm/boot/dts/gemini-ssi1328.dts

-- 
2.26.3

