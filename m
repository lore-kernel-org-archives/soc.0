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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F9DEC433DB
	for <soc@archiver.kernel.org>; Sun, 31 Jan 2021 22:18:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3293B64E2D; Sun, 31 Jan 2021 22:18:07 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7E6C64E29;
	Sun, 31 Jan 2021 22:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7E6C64E29
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pg1-f171.google.com with SMTP id v19so10702589pgj.12;
        Sun, 31 Jan 2021 14:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/T4k3lHLOO0wbkrdlTk7LJ/Zq3cU4QuNjq3JxsvSkzI=;
        b=vKhTi+vt9kmaVJxEWqdDljyxw1IDyGAWPjig29O4Mtmq5ZW8PoXkvv9XY4dnQvgdg1
         WuAc6h+2PPxjCY1JleSHB22sUVO516wS8ALsjlnwaG5bgmDGO3ji1VVIU7ZW+Zy1rL+k
         mHIU8WosjPPfvY5ya8E8/bmGEuHAHsJ+lB95cMKO8PdH/CDahfX9AxVGccYjpUqTKqFu
         0gfP80iecVHZSTSR/W8ARwB8KG/DQoCw0pZDrU2pSSk+u8CtTXe5kPw4cV5+W6qeb1Mb
         4q3amRIVmjK3Q1cToVaq/lKzn9EnbvMG9gC/NCJoT2EQ8aiojwoy/kog65uNiE+f12qm
         qn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/T4k3lHLOO0wbkrdlTk7LJ/Zq3cU4QuNjq3JxsvSkzI=;
        b=CwO138EZLN/Af/ziqgarJ3Bx9qHW0GryYbuVv5k74L9UafLwDdpbS/O6RVnEZ4bmNR
         C8iCc9eU5YoumS1ibPznR9+LAKTHglzYiV6DOnuMdB0twLEZUgV58i1yhQ+H+yi1liB8
         xAFKB/ZRZ4C5jrO4ME4lW1ve1Z6Ok+TkLfJoirbQt5eAXwrt61Ai/c4BOhtjkld3RzfZ
         VfLwjmeCrArpZHMo7fCXRXVxW5WH29jMoJjSKBXexPIksepKGd7KBCMfKq3s8HTqQunj
         Bxo3G2xRlY2T07u2PVP2eOwdu50pkm5C1RKaw8vTzkMfJwJBWPYDOZNUfPrBnzn3VLkT
         b7lw==
X-Gm-Message-State: AOAM532Z6zskWPRl67d/9o/ILlDfpc6YkQYSJV8djlYaEn1ZA3aUePIf
	EO4YQQufFamynflkciL6dVG5CsjDkk4=
X-Google-Smtp-Source: ABdhPJw7X+KfMsWTD+sT71vXZQHMKegPfX4Vw1H8la5IOlD7h3laKVPBBYkNHxx83qcSRxD/HyYJgA==
X-Received: by 2002:aa7:8b0f:0:b029:1c0:e782:ba29 with SMTP id f15-20020aa78b0f0000b02901c0e782ba29mr13246799pfd.37.1612131486122;
        Sun, 31 Jan 2021 14:18:06 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a4sm15512177pfg.41.2021.01.31.14.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 14:18:05 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Maxime Ripard <maxime@cerno.tech>,
	Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	Tim Gover <tim.gover@raspberrypi.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 3/6] Broadcom devicetree changes for 5.12
Date: Sun, 31 Jan 2021 14:17:17 -0800
Message-Id: <20210131221721.685974-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210131221721.685974-1-f.fainelli@gmail.com>
References: <20210131221721.685974-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/devicetree

for you to fetch changes up to a0610b409fc9f90b4861c021ebe853bfcc310bb3:

  Merge tag 'tags/bcm2835-dt-next-2021-01-28' into devicetree/next (2021-01-28 20:11:44 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree changes
for 5.12, please pull the following:

- Dave adds a proper compatile string for the DSI1 panel on 2711
  (Raspberry Pi 4) to permit adequate driver differentiation

- Nicolas declares reserved memory regions filed by the Rasbperry Pi
  bootloader to indicate the running system configuration

- Maxime declares the BSC (HDMI I2C controller) and CEC interrupt
  controllers

- Stanislav fixes a tab vs. space issue in the BCM21664 DTS

----------------------------------------------------------------
Dave Stevenson (1):
      ARM: dts: bcm2711: Use compatible string for BCM2711 DSI1

Florian Fainelli (2):
      Merge tag 'tags/bcm2835-dt-next-2021-01-25' into devicetree/next
      Merge tag 'tags/bcm2835-dt-next-2021-01-28' into devicetree/next

Maxime Ripard (2):
      ARM: dts: bcm2711: Add the BSC interrupt controller
      ARM: dts: bcm2711: Add the CEC interrupt controller

Nicolas Saenz Julienne (1):
      ARM: dts: bcm2711: Add reserved memory template to hold firmware configuration

Stanislav Jakubek (1):
      ARM: dts: bcm21664: Replace spaces with a tab

 arch/arm/boot/dts/bcm21664.dtsi       |  2 +-
 arch/arm/boot/dts/bcm2711-rpi-4-b.dts | 17 +++++++++++++++++
 arch/arm/boot/dts/bcm2711.dtsi        | 31 +++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 1 deletion(-)
