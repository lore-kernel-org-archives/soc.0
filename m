Return-Path: <SRS0=dBqm=FF=0x0f.com=daniel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7522C64E90
	for <soc@archiver.kernel.org>; Tue,  1 Dec 2020 13:43:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6B57E207FF; Tue,  1 Dec 2020 13:43:39 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 775802080A
	for <soc@kernel.org>; Tue,  1 Dec 2020 13:43:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="K8H5ts0U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 775802080A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=daniel@0x0f.com
Received: by mail-pg1-f194.google.com with SMTP id t3so1206521pgi.11
        for <soc@kernel.org>; Tue, 01 Dec 2020 05:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IkSu8cOxrJeXk2IOxGlsju6Rx6kE3VnLWo/bGlavpVg=;
        b=K8H5ts0UpSYaUeP2AKhudXY27BXqCNe5Ycflq09qZZOmIlMYps+H7RCe9xYhL7hEZm
         fxBEdLxy/mo/3htJ5iSO7JM2b9T3a+rLm85Ev1aMFKAqQVLaDXTASo/qoCBlLz0EI7mg
         5c1Hsj9jXgKyiVGh+7thXN7fE3+Y97Y3NriAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IkSu8cOxrJeXk2IOxGlsju6Rx6kE3VnLWo/bGlavpVg=;
        b=n6llZ/1+ikahlgJgmS1feqcIDcb5krhn9XJmBt0ILXwzRTzmu+JGvpjOtG3ceDOQaw
         C1LIfRYUWq7mapHD84EbzNGxK1oYfIpBtQwcm+/NLsKnVvIV9A3m2w7MITk4nGaktP6f
         Ut5So1vBvofbMUEVSp1FBEbiJfWubNS2mD7IN3edTBU/wLbvAVfAfUneVeXYXw6AkU8g
         86P/HeSdBekUbLtinYF1LWS1xUngEWxY+19iQ+oPSpPX7FR/WcvTp5SqUBECa71X7sjn
         DMB9WjuFz/CA90LJloRcrLkyk8Ehg96SKABt//BOkCmcM8bQfbvXzBZe74jRJ+P0t0Ee
         QtHg==
X-Gm-Message-State: AOAM530eWnQAMpXXax8yXh+kvFKnhD/kX0DW/deOZNBqHpzs6CWxaAyG
	3A0orJcIr4B9N+Ye7E3j1jklug==
X-Google-Smtp-Source: ABdhPJztNDi0pOH7QULtZg4/rCPDCHM4rfyzQeOdWfYLRZdaSFqJboQ1cxTX73Et8D1R9mAVdLkcgA==
X-Received: by 2002:a62:445:0:b029:19c:162b:bbef with SMTP id 66-20020a6204450000b029019c162bbbefmr1288016pfe.40.1606830217495;
        Tue, 01 Dec 2020 05:43:37 -0800 (PST)
Received: from shiro.work (p1268123-ipngn200803sizuokaden.shizuoka.ocn.ne.jp. [118.13.124.123])
        by smtp.googlemail.com with ESMTPSA id g14sm2839248pji.32.2020.12.01.05.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 05:43:36 -0800 (PST)
From: Daniel Palmer <daniel@0x0f.com>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	olof@lixom.net,
	arnd@arndb.de,
	robh@kernel.org,
	w@1wt.eu,
	daniel@0x0f.com
Subject: [PATCH v2 00/10] ARM: mstar: Add basic support for i2m and SMP
Date: Tue,  1 Dec 2020 22:43:20 +0900
Message-Id: <20201201134330.3037007-1-daniel@0x0f.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry for spamming this. I wanted to fix the DT parts
before anyone spent time looking at the DT related commits
in v1.

This series adds basic support for the infinity2m series
of chips. For now the SigmaStar SSD202D which is a dual
Cortex A7 in a QFN128 package.

These chips share most of the same hardware with the
currently supported infinity, infinity3 and mercury5
chips.

Changes since v1:

- Based on Arnd's feedback[0] there is now "mstar,smpctrl" as the 
  most generic compatible string for the smp control registers 
  and a more specific "sstar,ssd201" (yes sstar is right, this is
  a SigmaStar chip) string that is good for the SSD201 and SSD202D
  chips.

- Small code clean ups: remove initialiser for smpctrl, remove unneeded
  #ifdef CONFIG_SMP, make the smp_operations struct static and const.

0 - https://lore.kernel.org/linux-arm-kernel/CAK8P3a2MC5m4PdmXnwjGw_oZinKU93LP+eYQ8qaCmH4EesH0Bw@mail.gmail.com/

Daniel Palmer (10):
  dt-bindings: mstar: Add binding details for mstar,smpctrl
  dt-bindings: vendor-prefixes: Add honestar vendor prefix
  dt-bindings: mstar: Add Honestar SSD201_HT_V2 to mstar boards
  ARM: mstar: Add infinity2m support
  ARM: mstar: Add common dtsi for SSD201/SSD202D
  ARM: mstar: Add chip level dtsi for SSD202D
  ARM: mstar: Add dts for Honestar ssd201htv2
  ARM: mstar: Add smp ctrl registers to infinity2m dtsi
  ARM: mstar: Wire up smpctrl for SSD201/SSD202D
  ARM: mstar: SMP support

 .../bindings/arm/mstar/mstar,smpctrl.yaml     | 40 +++++++++++++++
 .../devicetree/bindings/arm/mstar/mstar.yaml  |  6 +++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 arch/arm/boot/dts/Makefile                    |  1 +
 .../mstar-infinity2m-ssd202d-ssd201htv2.dts   | 25 ++++++++++
 .../boot/dts/mstar-infinity2m-ssd202d.dtsi    | 14 ++++++
 .../boot/dts/mstar-infinity2m-ssd20xd.dtsi    | 12 +++++
 arch/arm/boot/dts/mstar-infinity2m.dtsi       | 22 +++++++++
 arch/arm/boot/dts/mstar-v7.dtsi               |  2 +-
 arch/arm/mach-mstar/mstarv7.c                 | 49 +++++++++++++++++++
 10 files changed, 172 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mstar/mstar,smpctrl.yaml
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd202d-ssd201htv2.dts
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd202d.dtsi
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m-ssd20xd.dtsi
 create mode 100644 arch/arm/boot/dts/mstar-infinity2m.dtsi

-- 
2.29.2

