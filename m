Return-Path: <SRS0=WXVb=XQ=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A1CC43334
	for <soc@archiver.kernel.org>; Mon, 11 Jul 2022 16:45:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DB8A9C341C8; Mon, 11 Jul 2022 16:45:07 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 35449C34115;
	Mon, 11 Jul 2022 16:45:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 35449C34115
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id q5so4894011plr.11;
        Mon, 11 Jul 2022 09:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SXv6YjQFEpaJi3GGrEauqiLZ0f+SfPf4Opvr2LfIukg=;
        b=d4cLlMSPRiNHHyHMp3B8n/QTUR1X9z+kuaVNj3WVwt6G+chpDmZ80+KJu3hcdKMCYf
         OKSowgYOpie5pFF5PnOOBRKMTIZzr4nq3F6qSaw85g3DTyT1kL/5aAVx52L0MbdJMZUP
         r6ujdpm5PaaYpp+iOwd/41gyi65zEh3wpC0j+ljOQG/c157mvU+D4gpKifg8waPPHWbo
         wSkxT3yIiRz7yzUhCVQvbXZS525xyuq1Y7xS6mhzX5h7Fx9JfBGeT//KJ+jK/hATS3QR
         IJslx3xJQO6SS4AN86cJYXTmzOk8ot1wensWaJD1PhhlKWJIy+F1q3Rj3K7+ilsOp9CP
         958w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SXv6YjQFEpaJi3GGrEauqiLZ0f+SfPf4Opvr2LfIukg=;
        b=dlwCvsEq/fdrduKtntQKyrScDiuCWp0Ez8CqocXtc4ckHiZm4cQJARYjlEZnGWDoO6
         rnvx1uecZACsCvehE/jKZgc3K/rOM5wIeZPFR1Hc1elR2wKGQIPLVSE6Lj8H1L1x1aQN
         Zur0IMr/3kef2WlKtZT+3XS0e76ItitHgH59VIaD1EhuGqG2zfteiGLCwM5P7gxqT7sG
         HsvLJGx2lAPdq4bGV7Da5yR++V8wXpcS2kmZZOVjO5BpMNkg/mJ7H+wKIkXVIrXbTw2G
         3C/hj4CNWAQeeUgCfW0khqLmDVWfb0rDeQMvGuFg1w596hQdjqpjeFwhP7X0hp50JoKq
         pW7A==
X-Gm-Message-State: AJIora8J1Fi43ijyDTGNYOThaX9tF2jZ6vXlNPqUOR1bJ4w2VpOXfdDy
	NTuk7zZFVSf7thvbSc2SIgchSyA6G2k=
X-Google-Smtp-Source: AGRyM1vkRBsLhrGex5sxRyFBzPiIOuBIq/p+IB6SJGp2gdSGuFncFnLr9Ai+hlVfnw7ZIA63DcDgog==
X-Received: by 2002:a17:903:32c9:b0:16c:462e:60c6 with SMTP id i9-20020a17090332c900b0016c462e60c6mr6862923plr.31.1657557906305;
        Mon, 11 Jul 2022 09:45:06 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id v3-20020aa799c3000000b0052ab9f1fe45sm4961266pfi.120.2022.07.11.09.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 09:45:05 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: William Zhang <william.zhang@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Peter Robinson <pbrobinson@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/7] Broadcom defconfig changes for 5.20
Date: Mon, 11 Jul 2022 09:44:45 -0700
Message-Id: <20220711164451.3542127-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711164451.3542127-1-f.fainelli@gmail.com>
References: <20220711164451.3542127-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.20/defconfig

for you to fetch changes up to a65ee523a9e41d0bf046cf0107e6bbf05d068af2:

  ARM: multi_v7_defconfig: Update configs for BCM63138 (2022-07-08 14:07:16 -0700)

----------------------------------------------------------------
This pull request contains ARM SoCs defconfig changes for 5.20, please
pull the following:

- Peter enables CONFIG_DRM_V3D in order for the Raspberry Pi 4 systems
  to load the proper GPU module driver

- William updates the multi_v7_defconfig to replace the enabling of
  CONFIG_ARCH_BCM_63XX with CONFIG_ARCH_BCMBCA which is how this platform
  is now supported

----------------------------------------------------------------
Peter Robinson (1):
      ARM: configs: Enable DRM_V3D

William Zhang (1):
      ARM: multi_v7_defconfig: Update configs for BCM63138

 arch/arm/configs/bcm2835_defconfig  | 1 +
 arch/arm/configs/multi_v7_defconfig | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)
