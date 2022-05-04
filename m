Return-Path: <SRS0=NPTw=VM=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616F1C433EF
	for <soc@archiver.kernel.org>; Wed,  4 May 2022 21:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1149DC385A4; Wed,  4 May 2022 21:09:48 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 632CBC385A5;
	Wed,  4 May 2022 21:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 632CBC385A5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d17so2602937plg.0;
        Wed, 04 May 2022 14:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uJfeiXwSNE7V54odsox7T56XEijaYm//sfiuHeo1Y7M=;
        b=UqsXiMIerl8dAxJzUed2vt5DHfg1Wj3sK6bIETMUd6ytb8ldSHEkW2MHgmqlhzjcw5
         qGEGh+n3ZQTYJ9/rxTUjvPPzrcpZ/QAbitA2eI9IzT+s9ayaZG5tddUdwn7i4nLGCZVE
         gX1bABHk8dPj2nT+yyHQ61r+/ozAr3Zrdqur/urdMzyfBS+ClkBHgDZ5vFHVyyMTeWvA
         KB0ptOVTMjRXEtcOq5RaA3dJ0GAsGvJU48r7U6n/pMkyjzc5Nbm5G+Qr/ZkzJ/ts1oAR
         Lh/L6oSmDRyoULQgFiFh/R6G324Nn8NtufaqeogrNHrmRGdUcNEHzwN6uzR8dZ5c2v+U
         WfOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uJfeiXwSNE7V54odsox7T56XEijaYm//sfiuHeo1Y7M=;
        b=XuvTIzHDoXZr8kMs4ldz5aXGtc0fhvznSF47jSuJ/lkUYIVss8dXPH3zSHtifA1fOY
         VxTRXdmF1R5QpLgYjaePYuVs1oiZDGTlM7T05ixuwM53QF4tIfTBWIY7VnCPrFjxEJha
         f3Z4av56GqJmb3E+bLOQR6p50U62J9gDGn5gTxiQ4G398YANCu84MtrFgIe9KePa2cWD
         R09inkGqTfPUl+UX5tJiJZD/ENi+3bB2zBH0ZbeYKvtibN6OHX+Ud1I8nn8kdwg5+ycK
         aTPZSw4R2CuCec9jYAPfGD0DFAm83W1TVoHRQWOoWhyK8N61L3s33BF0dF3+fUT1xhL7
         7QrQ==
X-Gm-Message-State: AOAM530/6+ksEQvvzw9EdFJneJjMSb77PkeuiZFIsTWV7XAzJugWNypE
	+UiK+15c69MSZTjozGFqJ8NeEx1of3o=
X-Google-Smtp-Source: ABdhPJxKoZnD95HD/bwhSuFyvlVp4IzihGfV0ndOOoCaeX2IvbCxp1cGWmlAGIpp5T6rmYR6K4k7RQ==
X-Received: by 2002:a17:903:2341:b0:15e:c7c4:2bb9 with SMTP id c1-20020a170903234100b0015ec7c42bb9mr4752211plh.108.1651698586697;
        Wed, 04 May 2022 14:09:46 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id r11-20020a63204b000000b003aaf27b5ceasm14820457pgm.1.2022.05.04.14.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 14:09:46 -0700 (PDT)
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
Subject: [GIT PULL 1/6] Broadcom defconfig changes for 5.19
Date: Wed,  4 May 2022 14:09:37 -0700
Message-Id: <20220504210942.1838248-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.19/defconfig

for you to fetch changes up to 1f61e9aa2e6f97c26d84c66628c2c85bb5e5a56a:

  ARM: multi_v7_defconfig: enable CONFIG_ARCH_BCMBCA in armv7 defconfig (2022-04-22 14:20:24 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoC changes to the
multi_v7_defconfig file, please pull the following:

- William enables the Broadcom BCA SoC Kconfig option to get build
  coverage for this newly added SoC

----------------------------------------------------------------
William Zhang (1):
      ARM: multi_v7_defconfig: enable CONFIG_ARCH_BCMBCA in armv7 defconfig

 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)
