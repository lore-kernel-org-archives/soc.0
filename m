Return-Path: <SRS0=L2yW=G4=baylibre.com=khilman@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5662C433E6
	for <soc@archiver.kernel.org>; Mon, 25 Jan 2021 18:41:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 949CB206E5; Mon, 25 Jan 2021 18:41:55 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F5A923102
	for <soc@kernel.org>; Mon, 25 Jan 2021 18:41:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F5A923102
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=khilman@baylibre.com
Received: by mail-pl1-f169.google.com with SMTP id t6so8228210plq.1
        for <soc@kernel.org>; Mon, 25 Jan 2021 10:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version;
        bh=jXQ+AgoYTmM98NAgT4daWWv0IbWCc91ZsSBMiFQLqKI=;
        b=MVCYhn84ilk6MJg40H2Gp8mu/pgPnezQNhALB4t19Ann8VM+fQr8i9OgC4AvXkcqra
         UNJ82H3rY17aLMoGfgPKREB8JqkVaDdIsvOd8UnP0b9RHSSoYAuaMXD0QwjYpXBj7thm
         NRKU2bs9htwvMDHxSpY+t1cgI77H0Ge855DUn2E7BOmticZ3OTpHe39J393GMcGlW3aW
         RJBZMcYcEVQU/TkZ6Az+ruYDPrMOU/rVgHNwDc4ORZCbGOMDuemAnnNc9snu8wENCB+o
         OuLr+BgRz5+mmNWodq0nTFNzClHk+h278AFypjRWaUdCUHRH5EJx6DZ1yOcc506hG+2J
         PLeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version;
        bh=jXQ+AgoYTmM98NAgT4daWWv0IbWCc91ZsSBMiFQLqKI=;
        b=eDd1qHDSYVTgcSX8tajZNxtfGgmqooo4oh9G+08Gso5FAlOrKq0Gi7mWQDEcgu5Eo0
         8cXdxnwqyHyiIsnADd68lnLUukWIZyFwOgqlCLi80zbaMLZb8G7NylylKfmVcWQVqfaq
         lt+juf6pBxqLArKO2UTZVZ5CDcq/PVR6ydh/IUCyWERpA5PL7y+ujUZ9CCroivEdJWWk
         lVkUopwel/GAuY2yhnintvWKKmhuuiDBVAnuMkupVzRqbKRAHkIkaGRPs97lfeIpJB2c
         JJKmF5pHW7I7p3yvxvyxMnmSYk4nCbkRirYCZHjcW022rNO+ahfFYOlNyZAy3BT677+g
         PWBg==
X-Gm-Message-State: AOAM530Y2oWiafOMkzW7n02nz/VuBVTuLhCLUUpGr3zo307pCG0j04bv
	cm3VoHHaYPQ1fFmd0vaHVS8r+YJyyhke5KwzMc0=
X-Google-Smtp-Source: ABdhPJwhGgc3h+D1tMSNNF4bVe7+dAcrmANOkFoJj6ztOo4JgNE6rO+rzi4sqKTBf5ECFXjfqQHVxw==
X-Received: by 2002:a17:902:f683:b029:de:18c7:41fa with SMTP id l3-20020a170902f683b02900de18c741famr1776590plg.57.1611600114283;
        Mon, 25 Jan 2021 10:41:54 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net. [71.197.186.152])
        by smtp.gmail.com with ESMTPSA id o14sm18310825pgr.44.2021.01.25.10.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 10:41:53 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: dts: amlogic fixes for v5.11-rc
Date: Mon, 25 Jan 2021 10:41:53 -0800
Message-ID: <7hk0s0x3im.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git tags/amlogic-fixes

for you to fetch changes up to 7386a559caa6414e74578172c2bc4e636d6bd0a0:

  arm64: dts: amlogic: meson-g12: Set FL-adj property value (2021-01-04 08:03:49 -0800)

----------------------------------------------------------------
arm64: dts: amlogic: fixes for v5.11-rc
- meson-g12: Set FL-adj property value

----------------------------------------------------------------
Serge Semin (1):
      arm64: dts: amlogic: meson-g12: Set FL-adj property value

 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
