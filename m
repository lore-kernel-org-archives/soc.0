Return-Path: <SRS0=np67=PO=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15ED8C433EF
	for <soc@archiver.kernel.org>; Tue, 26 Oct 2021 09:47:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EA67960FC2; Tue, 26 Oct 2021 09:47:22 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E417610FC
	for <soc@kernel.org>; Tue, 26 Oct 2021 09:47:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E417610FC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4E11E3F17E
	for <soc@kernel.org>; Tue, 26 Oct 2021 09:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1635241641;
	bh=OvY8h6gQ2XLx4TLJDVhHrNnjSYAKrKTXm/TLCkBAtZY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=KTprAypIExzln9ildE4UK7oQ6VgN8QpGM6aGryhxEy9z0a76ShasozZOFRbpQZkIx
	 0HK9wVZjHeXwh8+uljhyOBEYPn4fLC0BrQFFjs2SBzA5tYK1LnD/pDxfxdTnZCbrxU
	 SO+G21dQSPK1OZ7qMM9cgEQMoG1ugbWmUR4FPOEwzUsodu9RubTvlqvh0KHmwwWzWm
	 n2BHRmm3YsARhjDz03/0RMY3YTeNBv9ns20NL88zZcrdp/QJqrnch1+oYlWczycALV
	 g/zBgudJGbRCDMu2BsQp7/uUuAkNczxsJsEntrgCe/4TVWd+jE3hkvjXX44/J0rkue
	 XoWcOdEOLwTOg==
Received: by mail-lj1-f199.google.com with SMTP id y17-20020a2e95d1000000b00210c3d67c45so1525026ljh.7
        for <soc@kernel.org>; Tue, 26 Oct 2021 02:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OvY8h6gQ2XLx4TLJDVhHrNnjSYAKrKTXm/TLCkBAtZY=;
        b=yH5fErHMaykCvx+uB/SVhjc3sN0RUUmzMygHriOcKpxkdVhnNNEKbZFzqhVyLdGZsd
         nJy6z+LZ0/tAh8C9vBi6u0gwxLg02TW9T+d3BGA4uNXIv0/XJZc5f2ayrMG3Outc1XWN
         C0YQYEcKgOp4srkiCYw8/1+pNgLohZ/7fizUOos1etsWJTdyn3xia5I/eTnOp8PvAyMA
         5syAetBp6eAEu8VAki8IZoep3pi+E6u8Yt+IWxS0CQU1sGAnDGoUkAF2UpqblJKHc4X7
         hb5Qt5p+n0iCf42U1itUhy2y0mqu2lHbAoQ4Qptpdfc7RaBlQ9aZD2nqCucmYWeOyJVe
         iVAA==
X-Gm-Message-State: AOAM53017HTgfHFU3J6nVmXzvRiwzrZBi5eX+YoGA8rKcydKCxHtFwOI
	OjXRaCavefhxoyoZIMFzHQdRkXbTHLMKGwmzhKMx+II6d8h0/Unnf+A0Yugj6zqwmleVtDt1wqs
	vWaYx4NsMEwyOsB8xqeoaPSc=
X-Received: by 2002:a05:6512:15a9:: with SMTP id bp41mr10418008lfb.552.1635241637423;
        Tue, 26 Oct 2021 02:47:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyW5YMz5Q07ZGmdN2Jxfc2u5ScIopNPNG6mpx68Wmg7E4kYJBAnPU+zL0heH2Y7f+IctqKkog==
X-Received: by 2002:a05:6512:15a9:: with SMTP id bp41mr10417987lfb.552.1635241637269;
        Tue, 26 Oct 2021 02:47:17 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id v17sm113794lfo.167.2021.10.26.02.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 02:47:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] ARM: samsung: s3c for v5.16
Date: Tue, 26 Oct 2021 11:47:09 +0200
Message-Id: <20211026094709.75692-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211026094709.75692-1-krzysztof.kozlowski@canonical.com>
References: <20211026094709.75692-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.16

for you to fetch changes up to aa519471715ce73034ffaa52fc85681de31c1acf:

  ARM: s3c: Use strscpy to replace strlcpy (2021-09-20 10:13:47 +0200)

----------------------------------------------------------------
Samsung mach/soc changes for v5.16

A minor fix for theoretical issue when handling IRQ setup code errors in
S3C24xx and a cleanup for S3C64xx.

----------------------------------------------------------------
Jackie Liu (1):
      ARM: s3c: irq-s3c24xx: Fix return value check for s3c24xx_init_intc()

Jason Wang (1):
      ARM: s3c: Use strscpy to replace strlcpy

 arch/arm/mach-s3c/irq-s3c24xx.c   | 22 ++++++++++++++++++----
 arch/arm/mach-s3c/mach-mini6410.c |  2 +-
 2 files changed, 19 insertions(+), 5 deletions(-)
