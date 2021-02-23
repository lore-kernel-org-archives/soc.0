Return-Path: <SRS0=dVkn=HZ=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0558DC433DB
	for <soc@archiver.kernel.org>; Tue, 23 Feb 2021 06:19:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C111E64E62; Tue, 23 Feb 2021 06:19:14 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29FA764E60
	for <soc@kernel.org>; Tue, 23 Feb 2021 06:19:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29FA764E60
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pg1-f174.google.com with SMTP id l2so1687794pgb.1
        for <soc@kernel.org>; Mon, 22 Feb 2021 22:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5FL/F1gCFmBMP8+RfZ2tPc29BuH7DoO9TPApvWMpXrY=;
        b=sz3vP7AGKlQXyS2RDXmywvZUnQ5EhPaeq8Lu5rtj26+LhGxR0RMTZIe3o5BF05dO7F
         nKjGu3Dcm1sk1k1v9AxCeajyOq1w4y3qbGdQBJDI4VVqV4AHe1DiYMEB8Qmd4XU5kKr8
         V2pK2mJwNswP51/9JYngQraTpenSNLTD32PE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5FL/F1gCFmBMP8+RfZ2tPc29BuH7DoO9TPApvWMpXrY=;
        b=kPZoHU5WwwAwzVVP+nNzjQhG8PJF7/cbGhNcgy60Aodwtlk+5dAKNL1b/1oQeKxbgd
         tO+ORdN9S8A69VCYdFRJITzn17x18NbZiIQYwF+TNJJrMZUcyQ7IOroK0UaNd2ImVtb3
         gpu8T1DVCwab4MF2+ILTc9BiidIUza3QXJWyDoxlroo2bEOlFrLWF+s+4YcPD6hOUV7m
         U2by3xnkGy1bXcnb434YpXEFIylwZa3Bwiy9Tk5zQe3hpMj6EjM9Mm7tM6ofEe5UMfs6
         vHjZEcvcxCgE/iO9/weOdVwavtaOwK3iyOUxqRC3d33bifRLU6YoFXZ6/wpDdxGKTUgH
         Pphw==
X-Gm-Message-State: AOAM532S3SdhWsldpdvUHvvbk7fTino264+hvesphtkQXW697dRV2jsU
	67+COkPJH4ozm2XhWlpwTLVHfw==
X-Google-Smtp-Source: ABdhPJwJaNbUqhV3I7tQ+drfo40Dil/MozZwGwWntn9HWDo9ZR71eAj9kODrgi7GuJUdcXT2cj5HBw==
X-Received: by 2002:a62:7bc5:0:b029:1ed:62d5:31f7 with SMTP id w188-20020a627bc50000b02901ed62d531f7mr968575pfc.24.1614061153493;
        Mon, 22 Feb 2021 22:19:13 -0800 (PST)
Received: from shiro.work (p345188-ipngn200408sizuokaden.shizuoka.ocn.ne.jp. [124.98.97.188])
        by smtp.googlemail.com with ESMTPSA id n10sm20135169pgk.91.2021.02.22.22.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 22:19:13 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	soc@kernel.org,
	sboyd@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	w@1wt.eu,
	Daniel Palmer <daniel@0x0f.com>
Subject: [PATCH 0/8] ARM: mstar: cpupll
Date: Tue, 23 Feb 2021 15:18:22 +0900
Message-Id: <20210223061830.1913700-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.30.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds a scrappy driver for the PLL that generates
the cpu clock on MStar/SigmaStar ARMv7 SoCs.

Unfortunately there isn't much documentation for this thing
so there are few magic values and guesses.

This needs to come after the MPLL DT changes.

Daniel Palmer (8):
  dt-bindings: clk: mstar msc313 cpupll binding description
  clk: mstar: msc313 cpupll clk driver
  ARM: mstar: Add cpupll to base dtsi
  ARM: mstar: Link cpupll to cpu
  ARM: mstar: Link cpupll to second core
  ARM: mstar: Add OPP table for infinity
  ARM: mstar: Add OPP table for infinity3
  ARM: mstar: Add OPP table for mercury5

 .../bindings/clock/mstar,msc313-cpupll.yaml   |  45 ++++
 arch/arm/boot/dts/mstar-infinity.dtsi         |  34 +++
 arch/arm/boot/dts/mstar-infinity2m.dtsi       |   2 +
 arch/arm/boot/dts/mstar-infinity3.dtsi        |  58 +++++
 arch/arm/boot/dts/mstar-mercury5.dtsi         |  36 +++
 arch/arm/boot/dts/mstar-v7.dtsi               |   9 +
 drivers/clk/mstar/Kconfig                     |   7 +
 drivers/clk/mstar/Makefile                    |   1 +
 drivers/clk/mstar/clk-msc313-cpupll.c         | 228 ++++++++++++++++++
 9 files changed, 420 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.yaml
 create mode 100644 drivers/clk/mstar/clk-msc313-cpupll.c

-- 
2.30.0.rc2

