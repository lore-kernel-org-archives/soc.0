Return-Path: <SRS0=ug29=ZB=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6790ECAAD4
	for <soc@archiver.kernel.org>; Mon, 29 Aug 2022 22:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 79A03C433D7; Mon, 29 Aug 2022 22:51:10 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 75556C433C1;
	Mon, 29 Aug 2022 22:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 75556C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id d1so7490871qvs.0;
        Mon, 29 Aug 2022 15:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=5VrQ6eEFIZFuIkBPLp5WeFXbk8BLjXbWF2VgVW55FPA=;
        b=N8XuKZx1g/W1DnC6K65YZlBLvFq6PKlA24Tqr8AhMvMvzDsMws7sHe5ZExurPUEOTw
         FMNSk2FOHJgQzOJYv61mUv0X2HZiCnQLynH4GU/8FPoa9Kw3xIO7rgfAMjj7gTkbQMV7
         vVN0o8Alw9FiEdZMRQHqMFKbHmn8Rdn/+RsDDXtHI0mOWrmEAZxhg9Aizb2c7GAh6UPa
         ncJkmDonc80Id8upxsWOh33+dY79bdxHxWcKqJ+mipz7N30HMtPGsUGLdh2Jc4Y9dNXG
         Pfm4Xlhu0FiyxHeKuTWo+N7/R9Lq+ashl4g5vTOjwaBFcnH07zxWqQ0NHva47wxcwUHK
         IypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=5VrQ6eEFIZFuIkBPLp5WeFXbk8BLjXbWF2VgVW55FPA=;
        b=pbyrvAUyCKmQc/jfrdzQPk6QYdeV+BeKN2XjyPtNoKBzruDOp0s++S+c+EYvTaI+8h
         zP5qjxM/BNujAaKUjybOFxmWyMN2C9L8ynIgPVIn0cbGL7+9be5U6Vze6JiFyE2QNaXA
         jQrLN4trrNMthxqEm17SD+vHWWh3ESVfi/KpeAOISRx+DpK9FulEIhBi2yeV7GY2+umU
         +Jud7qw0B0yXwPdq4TUZRDSugLHfsprLPFGV8Ry55Z8Z7FdFgy5XiP1sTahL+24JivVl
         vgu43+hsCecCGPGAt89s5yRlpITRYz7LuZXZBKfDMbanwHHUmxgKlv13nXwMyDuW3G6e
         1nvQ==
X-Gm-Message-State: ACgBeo0XcioQykfiFp6gO7dkowvd8f7w5akL1icKI+5P55Jjxw1AREJ7
	VWJ/Ky4ZVfeT0LRoHn10AnWdH8J4xjo=
X-Google-Smtp-Source: AA6agR7eHR+C6UzSBZi2bQD9t5o3/euJ4zyKz1d+UglDmEsDfPcV39N8ukzq31vt5NSe6InlGmr65g==
X-Received: by 2002:a05:6214:194d:b0:498:f509:1072 with SMTP id q13-20020a056214194d00b00498f5091072mr11388464qvk.0.1661813467925;
        Mon, 29 Aug 2022 15:51:07 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id j6-20020a05620a288600b006b9593e2f68sm4961102qkp.4.2022.08.29.15.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 15:51:07 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: William Zhang <william.zhang@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/2] Broadcom devicetree fixes for 6.0
Date: Mon, 29 Aug 2022 15:51:02 -0700
Message-Id: <20220829225103.753223-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.0/devicetree

for you to fetch changes up to f75fccbdc84fd9066e42c394c870bb6a3af57adc:

  ARM: dts: bcmbca: bcm6878: cosmetic change (2022-08-15 09:35:56 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree fixes for
6.0, please pull the following:

- William fixes a number of the recently submitted DTS files for 63178,
6846, 6878 to have correct PSCI node propertie as well as correct timer
CPU masks

----------------------------------------------------------------
William Zhang (9):
      ARM: dts: bcmbca: bcm63178: fix timer node cpu mask flag
      ARM: dts: bcmbca: bcm63178: clean up psci node
      ARM: dts: bcmbca: bcm63178: fix interrupt controller node
      ARM: dts: bcmbca: bcm63178: cosmetic change
      ARM: dts: bcmbca: bcm6846: fix timer node cpu mask flag
      ARM: dts: bcmbca: bcm6846: clean up psci node
      ARM: dts: bcmbca: bcm6846: fix interrupt controller node
      ARM: dts: bcmbca: bcm6878: fix timer node cpu mask flag
      ARM: dts: bcmbca: bcm6878: cosmetic change

 arch/arm/boot/dts/bcm63178.dtsi | 20 +++++++++++---------
 arch/arm/boot/dts/bcm6846.dtsi  | 18 +++++++++---------
 arch/arm/boot/dts/bcm6878.dtsi  |  9 +++++----
 3 files changed, 25 insertions(+), 22 deletions(-)
