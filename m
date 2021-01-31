Return-Path: <SRS0=OvMt=HC=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B78C433E6
	for <soc@archiver.kernel.org>; Sun, 31 Jan 2021 22:18:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A370D64E2E; Sun, 31 Jan 2021 22:18:08 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A15264E29;
	Sun, 31 Jan 2021 22:18:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A15264E29
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pf1-f173.google.com with SMTP id w18so10298984pfu.9;
        Sun, 31 Jan 2021 14:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iyBcxz1AdCnAU2zDHjpyBeoUWMJV2JNVfPF+J8J9nbs=;
        b=sMjYBWQ+SHyOHtaUUhZM8uoEBphLBxTMJCneGzh7XLBx9+g5hsmXM/W8tPQRKrCmaU
         hEVsWBhb7AkFMVf0RRY8iUOozLdeSuhjvr8xuC71vImP3OarhZKWIuXcnktdLn/WERWR
         Azy7st10Lt5adps9OURI5mwjNzF3Mwd6SMeWfaa5TWGCNUk4/Ykmm2xgmvN1fnTmXQzI
         hI+QMBN62K8v8uT++rmwVwCt703cC4DgqY9xRKJagW6m6ZFwEHj5aqyaPiyok3qxJ8Mm
         G6H3OfzRhX4nzQovKBiaZMuiVdCapGM1BIoBy9gG9oXhZHm8V67MldP2CxZmoQoDVJgE
         ggnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iyBcxz1AdCnAU2zDHjpyBeoUWMJV2JNVfPF+J8J9nbs=;
        b=Nn6Z8mXVQrLWo4883fIfkX1eSjKq24ZBSwF1WK/iQC4K+fufnWF2+/crpCqtDTmoiI
         XzU/K7aKWy/KVJdJ7Z7AOCQlzBYFERIAqGL7yCW2EgEeAkr2pGxYaWvdNgi8LKc9S832
         1H2N0sUTDQmhXEIO20b+YIyxaGtMY6EFNuoPx2u02OZ7P7hqG9IKlGuq108Q0/Cen2J+
         gvLJmzbgX/m9VFMCV63BuFBLQUqn+8g8C59f1UXKKumFGt0EqBfkuiRSirTuesYJCl4G
         pm2vXGbJBe33H2eJVH2CO0GkK5Rx/0/NUtJ7vQSMhhPP6/iODJzoZykIyQBeXg1AkrOr
         l/PA==
X-Gm-Message-State: AOAM531L2px/eFeEmsu/bC/5tVkP6F5U6bGD+DfdJSClQW4SFbeAgcr4
	UsO0mwUN1Rx3xfmId9JfmwRE3qSCx0I=
X-Google-Smtp-Source: ABdhPJyHDVMURxHBhEzSVrY2Yyb4BwtBvMYt7WlcytcBnBNSspJv5KAxC3OEd/HXdX9NO2tA3+/okw==
X-Received: by 2002:aa7:93a2:0:b029:1bf:23a3:a945 with SMTP id x2-20020aa793a20000b02901bf23a3a945mr13481777pff.70.1612131487631;
        Sun, 31 Jan 2021 14:18:07 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a4sm15512177pfg.41.2021.01.31.14.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 14:18:06 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Scott Branden <scott.branden@broadcom.com>,
	Ray Jui <ray.jui@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Rob Herring <robh@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 4/6] Broadcom devicetree-arm64 changes for 5.12
Date: Sun, 31 Jan 2021 14:17:18 -0800
Message-Id: <20210131221721.685974-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210131221721.685974-1-f.fainelli@gmail.com>
References: <20210131221721.685974-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/devicetree-arm64

for you to fetch changes up to fe119977677e7dd3ddb4ab52678b46b804148eb5:

  arm64: dts: broadcom: Remove SATA from Stingray (2021-01-26 16:26:33 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs Device Tree changes
for 5.12 please pull the following:

- Rafal continues to add support for the 4906/4908 SoC family and adds
  a Device Tree for the Netgear R8000P router (4906-based), describes
  the NAND controller of the 4908 more appropriately (based on the older
  63138 DSL SoC), describes the 4908 PCIe reset controller, internal
  Ethernet switch (Starfighter 2 switch) and finally the Power
  Management Bus (PMB)

- Scott removes all of the SATA-related Device Tree nodes since SATA
  is unused on the Stingray product line

----------------------------------------------------------------
Rafał Miłecki (6):
      dt-bindings: arm: bcm: document Netgear R8000P binding
      arm64: dts: broadcom: bcm4908: add BCM4906 Netgear R8000P DTS files
      arm64: dts: broadcom: bcm4908: use proper NAND binding
      arm64: dts: broadcom: bcm4908: describe PCIe reset controller
      arm64: dts: broadcom: bcm4908: describe internal switch
      arm64: dts: broadcom: bcm4908: describe PMB block

Scott Branden (1):
      arm64: dts: broadcom: Remove SATA from Stingray

 .../devicetree/bindings/arm/bcm/brcm,bcm4908.yaml  |   2 +
 arch/arm64/boot/dts/broadcom/bcm4908/Makefile      |   1 +
 .../broadcom/bcm4908/bcm4906-netgear-r8000p.dts    |  52 ++++
 arch/arm64/boot/dts/broadcom/bcm4908/bcm4906.dtsi  |  18 ++
 .../broadcom/bcm4908/bcm4908-asus-gt-ac5300.dts    |  51 ++++
 arch/arm64/boot/dts/broadcom/bcm4908/bcm4908.dtsi  | 117 ++++++++-
 .../boot/dts/broadcom/stingray/bcm958742-base.dtsi |  64 -----
 .../boot/dts/broadcom/stingray/stingray-sata.dtsi  | 278 ---------------------
 .../arm64/boot/dts/broadcom/stingray/stingray.dtsi |   7 -
 9 files changed, 239 insertions(+), 351 deletions(-)
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm4908/bcm4906-netgear-r8000p.dts
 create mode 100644 arch/arm64/boot/dts/broadcom/bcm4908/bcm4906.dtsi
 delete mode 100644 arch/arm64/boot/dts/broadcom/stingray/stingray-sata.dtsi
