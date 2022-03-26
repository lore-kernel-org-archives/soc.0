Return-Path: <SRS0=m72a=UF=gmail.com=singh.kuldeep87k@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BAFC433EF
	for <soc@archiver.kernel.org>; Sat, 26 Mar 2022 04:23:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 62B6EC340F0; Sat, 26 Mar 2022 04:23:39 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B62CBC340EE
	for <soc@kernel.org>; Sat, 26 Mar 2022 04:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B62CBC340EE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f46.google.com with SMTP id bx24-20020a17090af49800b001c6872a9e4eso10357831pjb.5
        for <soc@kernel.org>; Fri, 25 Mar 2022 21:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ulOaJmtU0f3Hym4G5EnQj0YV6X55io78YUGEVVMz4JE=;
        b=jBbaFJI2M/l5BzrJV3JHQjKp6X1LzoBHLjuaaTa4hZ+9RakfDXSI8szZ/YB4yw/Ovy
         xypyI9UP7DXzeMaWedLVe+2vBR7kg9+NegIKTZNJES/IUUiLOeeSLUWTsp4pCFg4eNKE
         MDVD3XRngIaY5BZZzEG8NuwiQLV18/W+ZEaqQPKnIAxRHnCiwzfJxqrZOlvFkqatEj/j
         RkZpvIePHpFFq6f8asvbBB9GVvYOapMeuU5EeQZF/E4CrfH/joY6Dtq4MiBUUSFso3Cu
         5A7RH3LLLLZM7hA/ijPtlj67zevuCSr7iMGdioCrwXIxImJqqJLJbJyfoK511DtZTD9e
         YNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ulOaJmtU0f3Hym4G5EnQj0YV6X55io78YUGEVVMz4JE=;
        b=aDP12byGI/PefsYDnX1ZQwQZLhP6sXMC+Qt6PrA7bEqKcO5zK+Js6glrXM+UbJDBee
         k+AkBZXM4RdsCnr/dUwLEtSJaQJ2lnvQ3j8IhVzZ98Fb0sSmWeb3V8Bk9WR14oarb3u6
         5MRvHoGvOAhfvlW4K/n9hzfCHY1koZngHmsmAOQLTm4dydkgFk3oK9TjQSR/HeYcm+kQ
         0S9FaMA48kiQb8h3J/3ku084RR1awqw4QpzFI7cU44AQui4nwZxGqrtafGNvzwzBNoQk
         4zThMeHG99jdtRKieDHuf2WZBuM892REn8VPP4RugjreKx7ph2Gv1z/8D7LH5AyrjptR
         A8yw==
X-Gm-Message-State: AOAM530TBjPecU6iUpLST98K7LqIJKVfj3s/fD78s9MIm0OczjkRdhzt
	VwPkKKglCcMj4rstvhschUs=
X-Google-Smtp-Source: ABdhPJyONeebb7fgSiCEMPtB/xgyTFs2zG6tNuj0TO3Ey8zXXE87Pk+w/VF/tfN/AjzPB636kCkX4A==
X-Received: by 2002:a17:902:b612:b0:155:da18:9ce8 with SMTP id b18-20020a170902b61200b00155da189ce8mr5574021pls.8.1648268618076;
        Fri, 25 Mar 2022 21:23:38 -0700 (PDT)
Received: from localhost.localdomain ([122.161.51.18])
        by smtp.gmail.com with ESMTPSA id gd10-20020a17090b0fca00b001c75d6a4b18sm7457544pjb.14.2022.03.25.21.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Mar 2022 21:23:37 -0700 (PDT)
From: Kuldeep Singh <singh.kuldeep87k@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] DT updates for dma-names ordering checks
Date: Sat, 26 Mar 2022 09:53:08 +0530
Message-Id: <20220326042313.97862-1-singh.kuldeep87k@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset attempts to fix DTs possessing dma ordering issues.
The motivation of the series is taken from a discussion done before.
Link: https://lore.kernel.org/linux-devicetree/20220323175920.93155-1-singh.kuldeep87k@gmail.com/

Just a quick summary for new visitors.
There are few DTs which require dma ordering in order to resolve below
'make dtbs_check' issues and this patchset is in direction to fix that.
dma-names:0: 'rx' was expected
dma-names:0: 'tx' was expected

Kuldeep Singh (4):
  ARM: dts: spear13xx: Update SPI dma properties
  ARM: dts: spear1340: Update serial node properties
  arm64: dts: ls1043a: Update i2c dma properties
  arm64: dts: ls1046a: Update i2c node dma properties

 arch/arm/boot/dts/spear1340.dtsi               | 6 +++---
 arch/arm/boot/dts/spear13xx.dtsi               | 6 +++---
 arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 6 +++---
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 6 +++---
 4 files changed, 12 insertions(+), 12 deletions(-)

-- 
2.25.1

