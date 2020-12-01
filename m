Return-Path: <SRS0=1iVd=FF=baylibre.com=khilman@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69AECC64E7A
	for <soc@archiver.kernel.org>; Tue,  1 Dec 2020 22:34:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3337B20671; Tue,  1 Dec 2020 22:34:59 +0000 (UTC)
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60D75208C3
	for <soc@kernel.org>; Tue,  1 Dec 2020 22:34:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ZST6Fw4y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60D75208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=khilman@baylibre.com
Received: by mail-pf1-f196.google.com with SMTP id w6so2142723pfu.1
        for <soc@kernel.org>; Tue, 01 Dec 2020 14:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version;
        bh=aGQqxI7BSHJYya4XZgJoIopRrzfmqvdzORIcT9D0uPQ=;
        b=ZST6Fw4ysrrh9mw5IRrjK15bszqvlR0tzsmBb7hi7rvvThDqNFgndnCuWuX9E2Hxlg
         Tb3WINyOJ8l1oqtyVPhgA94aIWGaDcQLGCwtFZHuRBpvVVWYUuaJTTI4HfN9YqkD6yxr
         zSHmUUceg663ZShP2FdKq2wpwIfwjoq+vNqT70QVUaRlaBJ6HxBP7VFgsOpfBb9Iw6JO
         RFlnjl24Ul4HC/LJPVzvwP/SriL3+/u3GTlyeIgsDUdZ+KUQEi/R3/F/n2FjTXZyJ7CE
         TZyjzjyNcnxR0oKLt6XmnjRBkPa+Bi0RH0UvrBrlSabLDejiqN7qh+oOopiDKqqhxKQw
         xtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
        bh=aGQqxI7BSHJYya4XZgJoIopRrzfmqvdzORIcT9D0uPQ=;
        b=c4KMKxUHwySmd1ghzGHq0FhatAv2P+pJQhBxlappdcRIJJEjK48JTxjLnKb0MKC7Qf
         LSseyx0K8b2J7O+piXsDDLGVXMnDI2IlxW75CLkf0+23CANMKiq68mfjpTuviV4jvT6z
         gc+1/9+2dDGIEeT69o0oor3f6he490vnp/6P/Qe7UbM4gEPNfNV8RkNgZ5qWQpLTgJgQ
         ftOH/nCFttPUo67Ldxbf1cOT60G2PaNWdiCZ/2aid4uUIfW/Q01zDDlv8DO3MB2+mAsV
         XK9ZBgjiIYOtSUrCwu7EQbRpUo+yqNH4lXEX1pNHMr3nLp4hdQEuQgfycdlRcg7iqHEp
         LZ+g==
X-Gm-Message-State: AOAM531otlRmVPJlGcdjObAED0dU6wbB6XJmYG4h1oqP3uSK2FWAHMVU
	RkxglhKodeCCngneX3n2vsLH/ykH2D03PDAK
X-Google-Smtp-Source: ABdhPJx2hvwzYerdcMG1+5d3dqSYH69vQm2/X3cj/bSxjESiCDASFmXpEinxjRhcHAb5PM05fycLwQ==
X-Received: by 2002:aa7:982b:0:b029:197:cb05:a315 with SMTP id q11-20020aa7982b0000b0290197cb05a315mr4533763pfl.33.1606862097360;
        Tue, 01 Dec 2020 14:34:57 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id q4sm587150pgl.14.2020.12.01.14.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 14:34:56 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc: amlogic: driver updates for v5.11
Date: Tue, 01 Dec 2020 14:34:56 -0800
Message-ID: <7him9ljgtr.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-drivers

for you to fetch changes up to 1116e43e7e4be7c7d76578ffac1d3a73f4ebcafe:

  soc: amlogic: replace devm_reset_control_array_get() (2020-11-30 16:23:11 -0800)

----------------------------------------------------------------
soc: amlogic: driver updates for v5.11
- enable building as modules
- reset API updates

----------------------------------------------------------------
Kevin Hilman (3):
      soc: amlogic: socinfo: build for specific arch
      soc: meson: enable building drivers as modules
      firmware: meson-sm: enable build as module

Yejune Deng (1):
      soc: amlogic: replace devm_reset_control_array_get()

Yu Kuai (1):
      soc: amlogic: canvas: add missing put_device() call in meson_canvas_get()

 drivers/firmware/meson/Kconfig          |  5 +++--
 drivers/firmware/meson/meson_sm.c       |  1 +
 drivers/soc/amlogic/Kconfig             | 12 ++++++------
 drivers/soc/amlogic/meson-canvas.c      |  4 +++-
 drivers/soc/amlogic/meson-clk-measure.c |  5 ++++-
 drivers/soc/amlogic/meson-ee-pwrc.c     |  8 +++++---
 drivers/soc/amlogic/meson-gx-pwrc-vpu.c |  7 +++++--
 drivers/soc/amlogic/meson-secure-pwrc.c |  5 ++++-
 8 files changed, 31 insertions(+), 16 deletions(-)
