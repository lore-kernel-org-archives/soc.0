Return-Path: <SRS0=1iVd=FF=baylibre.com=khilman@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B310C64E7A
	for <soc@archiver.kernel.org>; Tue,  1 Dec 2020 22:34:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CE06920870; Tue,  1 Dec 2020 22:34:06 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 673AB208C3
	for <soc@kernel.org>; Tue,  1 Dec 2020 22:34:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="nNzt78S5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 673AB208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=khilman@baylibre.com
Received: by mail-pg1-f172.google.com with SMTP id g18so2137747pgk.1
        for <soc@kernel.org>; Tue, 01 Dec 2020 14:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version;
        bh=VyzfJ/61zrG7IqqeZutV6Kfadw97Jz4TS784b21IDMU=;
        b=nNzt78S5S48ZE/IcUMAwdahKLVZjBUFIuQCRYrD4KrxZIdtdww6bR2Fkz6BGspJDZw
         6c43QemXoqYl96hnBfF/FkXY16wo46YNiLIS5ilW/Ja13FEwgQWyTFp2ed+ZYG7J4rIN
         dly3YV3utx5BLHrZ/lK6ZNCwUf3capvAr/0SjlJAkWuT3CSHzpJqBuZv/iZtuTc/xcEq
         FsjhcKMaepOVDzYWk1WAPx5B3elWyOqHU4nAzpTruyMn8OiqAhzvlhnrk1kUe6yVP5pv
         369V4IkybhxupTFJOMXY87Y36U2WvE4Buje7fbvGoee+YPPI7YGSFJprGxqQF8snmBgP
         uYmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
        bh=VyzfJ/61zrG7IqqeZutV6Kfadw97Jz4TS784b21IDMU=;
        b=Rl2rsbexFGqaDyFaWY90l+qnm6ioW+Q2S8UlfCamFIVazNToiGglT42gA+RDeJzTZ+
         8eQRI6RSlov0z9AKqtlLkNqsBrv9yRF7INXCDXUwzbKHd8RbWx6W2MAoKCDmB0dNz+L/
         JBkaRxYdoCXttHXw0iPkQcOZYSHueo80FBFcLA8B8eOpLZ8tnuxnghU3EJ1q2+G1wv96
         K4/IrzhujSaeD5Kx5YUFxKvd7KDk/qpVgoMeoUgo5pW8mrCJ+i9Aa7eimoQ1gojNoDQV
         +71V3G0uEzaKz7dpbHIE/T7Rd/ICE71jSkx8i523EoLzpEXNE4z/mCb2vQNEkzihbCHu
         Tn9Q==
X-Gm-Message-State: AOAM530tLB9AZGcgt38Yx/6G+FRcIrhYXPRg64y1+ejvVnyD5faw0hvF
	0d0N2K3N5zoFCYxc2gBClp+WWHOZNIpKoC9U
X-Google-Smtp-Source: ABdhPJxBd1oN35igDNqmACXUehdFdQoZ9jvY2+9kX/+z0H8mYfOJtWiRC0fu6GepFnx4poTHsv477w==
X-Received: by 2002:a63:fc5b:: with SMTP id r27mr4188310pgk.100.1606862044394;
        Tue, 01 Dec 2020 14:34:04 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id h7sm736014pfq.76.2020.12.01.14.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 14:34:03 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: Kconfig.platform: amlogic updates for v5.11
Date: Tue, 01 Dec 2020 14:34:03 -0800
Message-ID: <7hlfehjgv8.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-soc

for you to fetch changes up to ba66a25536dd24b73d36e380c68593e95e4e06a8:

  arm64: meson: ship only the necessary clock controllers (2020-11-09 16:06:11 -0800)

----------------------------------------------------------------
arm64: Kconfig.platform: amlogic updates for v5.11
- ship only the necessary clock controllers

----------------------------------------------------------------
Jerome Brunet (1):
      arm64: meson: ship only the necessary clock controllers

 arch/arm64/Kconfig.platforms | 3 ---
 1 file changed, 3 deletions(-)
