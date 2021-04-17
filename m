Return-Path: <SRS0=5mch=JO=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C53FC433B4
	for <soc@archiver.kernel.org>; Sat, 17 Apr 2021 01:11:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 09D71611AC; Sat, 17 Apr 2021 01:11:31 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89F636113D
	for <soc@kernel.org>; Sat, 17 Apr 2021 01:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89F636113D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pg1-f182.google.com with SMTP id 31so4839506pgn.13
        for <soc@kernel.org>; Fri, 16 Apr 2021 18:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oFRDKw0dH3PiLiKz6mJo37/a7HDsMiEOCgW3zJ4ySpQ=;
        b=CI/YrdY4BoPfvyDsXCUQr0YtgGQc6ApLTyncG1WvbL5A5F7lcNkgKzLo81sUCQ4TWt
         s/k26P9BKA9G+gkJPeYNc3rQDO981jPCULKxeAWhle4cSa5LqtlFdg5GkxYx9AZsvXPJ
         xCUG6kNm+KDXKVuJYLG0YfNxTJsS9UjO7skVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oFRDKw0dH3PiLiKz6mJo37/a7HDsMiEOCgW3zJ4ySpQ=;
        b=JZbMUOd7s6bqGboxXDXGNsRmc9DCj5KTdoa5TAnsalo8LuJK/TAGkzoTcSzgBfjKie
         hXIy7ARs0Q3+1oLs+qMCga0Q+UXI7AII9tqsKbs9fWOVV1AHtJAyS15Mkxxhaj+9363D
         nQKV6SXwJzQiuWqtuKoKTZMWSPgBPpgxXxxSF2iEdiQ1q5AUR2UysIY2J8oeiSQkCoDw
         NCQhICr8HvWTqvDWxSuIcD44aKDXU70PxBzv0UBpQLRnW9KDZcenXanH7+86sTuXGli2
         eyvyMEGeMZZXZ2PewwqVq6IUV8O5uAqQOb0mu2iMGVcqncaF/rreGbaji9Oicom6BdJN
         kPEQ==
X-Gm-Message-State: AOAM5301nIdbg7VuPhjZ0oo6sQKPcIey9KS6pIkcC8xeaGnLehiS06E3
	H+gxdMv9nDPa2RaJNFEg+xUcKyX/hsNSuQ==
X-Google-Smtp-Source: ABdhPJxqmXvxD4LBQIPax7OSnpomD/4jNcX4OFrGrMf0MgZTSCaSU8ragurZcjW6leHMWAKc/4BGXA==
X-Received: by 2002:a65:5b85:: with SMTP id i5mr1424835pgr.269.1618621890046;
        Fri, 16 Apr 2021 18:11:30 -0700 (PDT)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id x17sm2181515pjr.0.2021.04.16.18.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Apr 2021 18:11:29 -0700 (PDT)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	olof@lixom.net,
	arnd@kernel.org
Cc: w@1wt.eu,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 0/3] ARM: mstar: Add initial support for M5Stack UnitV2
Date: Sat, 17 Apr 2021 10:10:12 +0900
Message-Id: <20210417011015.2105280-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds basic support for the soon to be released M5Stack
UnitV2 based on the SigmaStar SSD202D.

With the rest of the commits in my tree the SPI NAND, ethernet, USB etc
should work so the UnitV2 should be fully usable with a mainline-ish
kernel.

Hopefully this will encourage someone else to help with cleaning
up and pushing the commits for these SoCs.

Link: https://m5stack-store.myshopify.com/products/unitv2-ai-camera-gc2145

Daniel Palmer (3):
  dt-bindings: vendor-prefixes: Add vendor prefix for M5Stack
  dt-bindings: arm: mstar: Add compatible for M5Stack UnitV2
  ARM: dts: mstar: Add a dts for M5Stack UnitV2

 .../devicetree/bindings/arm/mstar/mstar.yaml  |  1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 ++
 arch/arm/boot/dts/Makefile                    |  1 +
 .../dts/mstar-infinity2m-ssd202d-unitv2.dts   | 25 +++++++++++++++++++
 4 files changed, 29 insertions(+)
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd202d-unitv2.dts

-- 
2.31.0

