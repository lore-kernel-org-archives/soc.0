Return-Path: <SRS0=ykaY=H7=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61505C433E0
	for <soc@archiver.kernel.org>; Mon,  1 Mar 2021 12:36:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1A7DB64EBD; Mon,  1 Mar 2021 12:36:17 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88A0D64E5C
	for <soc@kernel.org>; Mon,  1 Mar 2021 12:36:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88A0D64E5C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pj1-f50.google.com with SMTP id s23so11734461pji.1
        for <soc@kernel.org>; Mon, 01 Mar 2021 04:36:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aHKl2ifjfFue0mX7AlhZwlZkgYLL6KuO5Evur3d7teY=;
        b=rtiZd5gC6kPJr3YwWqhGX23hoyV/0rnI1ney+wD2Qfu/xruPUrh6WhKRWaGTO/EvDQ
         5BRqCCUgOxplOvmZA3aERlUOS5SYSL/fiTG/Oav2IUtdohRqUMg91wQruJkyRdu4Sge0
         pZ8vDbJjDZfLJ8rRP46CyoGEH5Zhdn+cy6arY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aHKl2ifjfFue0mX7AlhZwlZkgYLL6KuO5Evur3d7teY=;
        b=WG6MfrsrSbtuzzMzQhND/hmxLDSaRUyPvPOkRnFT1c6Dx6BJSktBqJLC2fClneetKY
         t9NgGzXaZraZDLlt/MvoidEKgv7+GBl8pkz/taCWADOGCajhimhX3N93d6mbx9Hg/W3c
         PjMiJWkQRHElwNK/HqYhYI9Z4+MrqOFn5xjoQ+FkVgCSLh2Zx6P99SQe1/PppQL7qf3i
         t6iPF9jfMJoMZXoIvWEXTjDqYH8pRBe7evL6sxKFqbytWB+Cex3VuPIa7grx8W9hGbCZ
         1ti/pGUa1TJmYMLOmFSg4iol0G4HXQRW11+kH4LC+PtY/lIqa1unMDafCTf2lBNAL798
         xEvQ==
X-Gm-Message-State: AOAM532goIJ2ZUoD6fgFD9ZqPpcg7R8bjHSlVhuVDpJQcbZ9RYyNT+ZX
	5GghPcQi4sJhaAtkBu/HDRK+5pQbNCX95w==
X-Google-Smtp-Source: ABdhPJxOr/a6RlVgTyLEJ1PiMM+lPrd84tutb8D9p3gWD2fgAKluwDJh3vEg5M+cXvXJHFimSWH0wQ==
X-Received: by 2002:a17:90a:13:: with SMTP id 19mr17624768pja.116.1614602175901;
        Mon, 01 Mar 2021 04:36:15 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id 8sm18130928pfp.171.2021.03.01.04.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Mar 2021 04:36:15 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: arnd@kernel.org,
	olof@lixom.net,
	w@1wt.eu,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 0/3] ARM: mstar: MPLL mop up
Date: Mon,  1 Mar 2021 21:35:39 +0900
Message-Id: <20210301123542.2800643-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is just 3 small patches that got left behind
when the MPLL driver was merged.

Link: https://lore.kernel.org/linux-arm-kernel/20210211052206.2955988-1-daniel@0x0f.com/

Daniel Palmer (3):
  ARM: mstar: Select MSTAR_MSC313_MPLL
  ARM: mstar: Add the external clocks to the base dsti
  ARM: mstar: Add mpll to base dtsi

 arch/arm/boot/dts/mstar-v7.dtsi | 23 +++++++++++++++++++++++
 arch/arm/mach-mstar/Kconfig     |  1 +
 2 files changed, 24 insertions(+)

-- 
2.30.1

