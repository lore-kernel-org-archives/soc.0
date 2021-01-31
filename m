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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3667AC433E0
	for <soc@archiver.kernel.org>; Sun, 31 Jan 2021 22:18:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 07A9A64E2B; Sun, 31 Jan 2021 22:18:04 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D193164E29;
	Sun, 31 Jan 2021 22:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D193164E29
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pg1-f179.google.com with SMTP id t25so10733749pga.2;
        Sun, 31 Jan 2021 14:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fQGpI2fGIe+9Ixx9I1K4oeU/85aYZYkAc9VcUwZmTLg=;
        b=EWoBsooeLkdolIjfjlbXqlEzi2ltwS3dWuvw7XIZG7VmzQ2VWcnUufT7FWuKMHxt/2
         ALjs5Aez683LQhbO4EnnrMWWa/mUYHlntGP7xkSo5qbqf7IUnAnMeuAwzu1YYZsgadlV
         Dw+5M7O3wBRzDj8sb/m44FEsWyeAX1XZwt1CtAQOI3K6XOCr7vWokA1FP/d/ORIbKi9t
         0Gr1f6hPIdClTHdfjQHhbbyMgEFYXNoXuNnuw3tZoUoHxGm7OSHcL4JunPXeqCMV5983
         37N3Wr0sO20C8q4X3DPfsOFMpCl8+4Bir5ioEj/u/jei1dEGCbLB+ieRSnwpe98oDwB8
         xooQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fQGpI2fGIe+9Ixx9I1K4oeU/85aYZYkAc9VcUwZmTLg=;
        b=DpzbiJOitoH/qS+CiQ8gjBuj0aBjWsVJmd0haoxSqb/HxUGMqANLTdJnqh6K9m7Elc
         E8axSa3908x75bZDcKszlflRQ77y6ZhWwAuAqqXPpwtgYoghcIYDCZFcgOE31w4/R6DW
         0f594zIl19X1wnuniCBzX0T91QpHRuMz1yEJMq1vD50AT0fzo/td/iuu4zalaoSnKaBx
         srXvhe4k/TbU5eRpNI5tsrg5e4CpYrmizP87ngYpE1k+IDa82YJayevh5VrosXwYPMqW
         YmCCvnI/dRpFDW1p2cREJv27kbqSXvdHuk2tnYwthbNxkejYh5Tc598BGH1gldi5BK/g
         7rPw==
X-Gm-Message-State: AOAM531WlY2ySHTs4qHuJQQ1YbPdpTBSy26M+RDYYfjAIHdyctBBEdpD
	Pw8eZRgwcWMx0DBl0EcUKJFgFItpoQA=
X-Google-Smtp-Source: ABdhPJzoeY1liWXItaCx8TheKxc7VnWGONysx3YFbj9epgMLJpjwYeAZNrtfMmqXXETAGQoqu0AG+A==
X-Received: by 2002:a63:2306:: with SMTP id j6mr11107451pgj.187.1612131483014;
        Sun, 31 Jan 2021 14:18:03 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a4sm15512177pfg.41.2021.01.31.14.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 14:18:02 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/6] Broadcom defconfig changes for 5.12
Date: Sun, 31 Jan 2021 14:17:15 -0800
Message-Id: <20210131221721.685974-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/defconfig

for you to fetch changes up to d88b6b834872d51d76a951f89c761e7b12717962:

  Merge tag 'tags/bcm2835-defconfig-next-2021-01-25' into defconfig/next (2021-01-25 13:13:44 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs defconfig updates for
5.12, please pull the following:

- Nicolas enables the NVMEM reserved memory driver to permit reading the
  Raspberry Pi's bootloader configuration from user-space

----------------------------------------------------------------
Florian Fainelli (1):
      Merge tag 'tags/bcm2835-defconfig-next-2021-01-25' into defconfig/next

Nicolas Saenz Julienne (1):
      ARM: multi_v7_defconfig: Enable nvmem's rmem driver

 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)
