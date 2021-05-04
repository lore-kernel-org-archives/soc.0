Return-Path: <SRS0=/KAC=J7=baylibre.com=clabbe@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A364CC433ED
	for <soc@archiver.kernel.org>; Tue,  4 May 2021 19:35:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 61099613D4; Tue,  4 May 2021 19:35:06 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E457613C6
	for <soc@kernel.org>; Tue,  4 May 2021 19:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E457613C6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=clabbe@baylibre.com
Received: by mail-wr1-f53.google.com with SMTP id d4so10638864wru.7
        for <soc@kernel.org>; Tue, 04 May 2021 12:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/wlkno7pRty5OfZRb8J5gIbUcerkat2d/Bw1XsvXcxA=;
        b=cQwuhcRbcCqXF84od/9QObdaYeQP08k05+eaYKRXsWjfB8+uK8p0Rew0weWkCYskXA
         XzJPK2gWVgMfQu81aw7g1F1FHwOtP3iU8hguoWKm1B2zpiIt7kAxrA5UHLZYaBxk9zri
         DUO5XmmmZ1drzcHgZhgOVFXZAXJ3MDqPUrsp2qoatan9C8w8qk81YqOOuNkvGWf8eNtq
         f8gU/gXLdCurvwLOqLHQVU5Z91fWQAaZHsgv67KDPM90OyZBdSQN0QmIGCLoeUHRc5Cz
         HV3I7445/U9WHR8/VUINZHiG8nk0q53HEI+sL4Me54akckuGl2dbb3+ijnefVdPaQ/YF
         hISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/wlkno7pRty5OfZRb8J5gIbUcerkat2d/Bw1XsvXcxA=;
        b=E8A99B08uN8QbDF7GdnzEena4UEjZTDQ4Jo1D6EVlt7M+kIi858ZTW2D6YwG0j47XB
         //UtrXkUd3SRhEVFJnqkUV3hhKlPMrvHRj5YEOKthL9mWU/1iQCQDgq5dmD6s5TQ9DuA
         v9zEF/gze0sKKN+C3YVhAXYjBCUCuQxoG37as89b4ZIqB4wZt4wJdeqWg8H1TXLmptua
         rIXLSzaF71IqjI01OQ+b9WWE+ziHzO1adxU1+0nXtQP5noyf9tvn4SKLpyJYmGKTvkIK
         pCc+ZDX54O0rbObx9/hGzjEaBj+2NAZJ/gyQO2JGhyyw5zQoglNHmvPtxPI8KPOxDOIa
         EUTg==
X-Gm-Message-State: AOAM531g9qB1rgPp5zj1GBJyObWP8t4oE/TqlBd6hHrCd+PNE9bOASgi
	biecUspJA6Mhlo+mCcD9m+Loog==
X-Google-Smtp-Source: ABdhPJyRqQn35aDMtuJzXmdCWQFefsfXBopf6kCEyTozbNmoBqhTRobePV2+CeNp53C7ihebxE0Leg==
X-Received: by 2002:adf:e3c6:: with SMTP id k6mr10179868wrm.236.1620156903866;
        Tue, 04 May 2021 12:35:03 -0700 (PDT)
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id x8sm17072136wru.70.2021.05.04.12.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 May 2021 12:35:03 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de,
	kaloz@openwrt.org,
	khalasa@piap.pl,
	linusw@kernel.org,
	linux@armlinux.org.uk,
	olof@lixom.net,
	robh+dt@kernel.org,
	soc@kernel.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 0/5] ixp4xx: add welltech-epbx100
Date: Tue,  4 May 2021 19:34:52 +0000
Message-Id: <20210504193457.4008384-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The welltech epbx100 is a small IP PBX board.
It ship an Intel IXDPG425 Network Gateway Reference (IXP42X 533MHz) SoC.
Original image ran an old 2.4.31 but upgrading to recent kernel was
easy.
It misses a working network interfaces but its current state is
sufficient to work on my interest, its crypto device.

More information on the board could be found on http://kernel.montjoie.ovh/welltech-epbx100.html

Corentin Labbe (5):
  ARM: ixp4xx_defconfig: add CONFIG_SERIAL_OF_PLATFORM
  ARM: ixp4xx_defconfig: add MTD_PHYSMAP
  dt-bindings: add vendor prefix for welltech
  dt-bindings: arm: intel-ixp4xx: add welltech,epbx100
  ARM: dts: add intel-ixp42x-welltech-epbx100

 .../devicetree/bindings/arm/intel-ixp4xx.yaml |  1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 arch/arm/boot/dts/Makefile                    |  1 +
 .../dts/intel-ixp42x-welltech-epbx100.dts     | 76 +++++++++++++++++++
 arch/arm/configs/ixp4xx_defconfig             |  3 +
 5 files changed, 83 insertions(+)
 create mode 100644 arch/arm/boot/dts/intel-ixp42x-welltech-epbx100.dts

-- 
2.26.3

