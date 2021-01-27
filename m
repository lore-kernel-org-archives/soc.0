Return-Path: <SRS0=OhkM=G6=baylibre.com=khilman@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A07BEC433DB
	for <soc@archiver.kernel.org>; Wed, 27 Jan 2021 18:17:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 66AB564DAB; Wed, 27 Jan 2021 18:17:33 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C44C64DA9
	for <soc@kernel.org>; Wed, 27 Jan 2021 18:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C44C64DA9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=khilman@baylibre.com
Received: by mail-wr1-f54.google.com with SMTP id 6so2914493wri.3
        for <soc@kernel.org>; Wed, 27 Jan 2021 10:17:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version;
        bh=1oeGqh4Jrc94bfT+wFZwebaOgOsWZ3ivDgAIGGVunNM=;
        b=tlpEpfncF8mm3OaZ0/rdNUCvL05RxWQu8Yhctk4X9w0Pkf7M6/8oSqqmSPRSOJKYtU
         rijgrrhMHiH6XHwEt2bI+T48OxqgiTLn5KfBPFRmZL7K3l2GMVGfLzsNFQRHDh9xtmma
         t72o6IimVpuTUI3ft1dYul/vtUsBf9OH3a3r448EKwNwFkVWlxlDXbamNnijQZgNyzBd
         JsiS8piEd+SjhM0FiWTPOG7R30qOFAYENHyB1kbKd/AO5nXaYwgGQaLNN/CS4dEZ3fSB
         FE+xB9MOtvb4k1u14wzF7ricBJWYVNwOD4hBgutrHPrgB7XLE7hHycQT6HhcjedscbbL
         /YDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
        bh=1oeGqh4Jrc94bfT+wFZwebaOgOsWZ3ivDgAIGGVunNM=;
        b=PvSQF9mcuGrQotSpaCKY6qw/44P2aNqabh00jjKEhVvlRBNyU1SgjzAIE9ULJ9PH5p
         7v8is26HXkmb6m4wcac/yfaoE3QHAJJP6m3JGB912K5jrQM1D+ghKporExQdNvFY/RWb
         7Hx8eYFtAHoLsgNGU3IEVD4MFoXuZU3irMdclZm83vx4D1wY6afzOKETa25pIzXaw/y2
         ghKbuav71mTQ5UElQ10RyZoVtGWV9RegmTOO+Yy5Ah+RWy8JV+1I5LQ5cGbJ9Xm4nLd6
         lekjM1ENe090cH/+JrH+n6TGO9+IDxV3ZaR5QGjDgwgGGPeymnWLnDPV3VH0Wq1JzzN6
         JqxA==
X-Gm-Message-State: AOAM532HqylR3sGz6Rr//deBY4ReFuAsvWMY3Gf2yEZ0PA0f08orqF+F
	GQWn0dRElXnbR/PqOlHCqCpzs57xsNCrjJ1dZ+M=
X-Google-Smtp-Source: ABdhPJyWER0YZAkUDZj791YwNslilcokXiTQNNsCISEi95mcteENqItETLxcJ3yyUvOTjJiAS10QNw==
X-Received: by 2002:adf:f303:: with SMTP id i3mr12341050wro.60.1611771450328;
        Wed, 27 Jan 2021 10:17:30 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id r16sm3950631wrx.36.2021.01.27.10.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 10:17:29 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: dts: amlogic fixes for v5.11-rc (round 3)
Date: Wed, 27 Jan 2021 10:17:27 -0800
Message-ID: <7hk0ryi6rs.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain

Arnd, Olof,

Sorry for all the one-off fixes this round, but here's one more fix for
v5.11-rc.

Kevin



The following changes since commit 19f6fe976a61f9afc289b062b7ef67f99b72e7b9:

  Revert "arm64: dts: amlogic: add missing ethernet reset ID" (2021-01-26 08:02:35 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-fixes-3

for you to fetch changes up to daf12bee07b9e2f38216f58aca7ac4e4e66a7146:

  arm64: dts: meson: switch TFLASH_VDD_EN pin to open drain on Odroid-C4 (2021-01-27 10:08:23 -0800)

----------------------------------------------------------------
arm64: dts: amlogic fixes for v5.11-rc (round 3)
- fix reboot issue on odroid C4

----------------------------------------------------------------
Marek Szyprowski (1):
      arm64: dts: meson: switch TFLASH_VDD_EN pin to open drain on Odroid-C4

 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
