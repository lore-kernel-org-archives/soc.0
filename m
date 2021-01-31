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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0CE8C433E6
	for <soc@archiver.kernel.org>; Sun, 31 Jan 2021 22:18:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8403364E2A; Sun, 31 Jan 2021 22:18:05 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57A2964E29;
	Sun, 31 Jan 2021 22:18:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57A2964E29
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=f.fainelli@gmail.com
Received: by mail-pl1-f172.google.com with SMTP id b8so8889308plh.12;
        Sun, 31 Jan 2021 14:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GxP5t3b+YNXM1X9AmYS44ePdp54sRc1ZJCt20CWFnoE=;
        b=kbBfhAg0cG5jGnYauCwONevUdexENKt9E+Xfgm1jrzNvnOv7wGGoExQGrKumXzmUi/
         8cHxiISpUa8iK97/dJhQIrWt+URNpm2WYC3Ymq6+JhOEOIT3tQoaK7VtNQ+1Cv2OEnCJ
         NuTDSrbnDX6/oXnQUUZvojmEFpp39AEDtRbucpsO2JFr5UJPPj9557sDzG6EHfD/SmXq
         bxMOefhAsl2tMdiALKpmN2uJ4lwIMM5350Y6ZtS16Qi/IlzV6rhTvRJC4YEJZyVZ7F8m
         diSN3+2t7WvssuoYXmE+xJw5T3Rnlgyw2EDAmuvuJ9I2xFgixWE+jhNFDLE31ZU5oukN
         REBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GxP5t3b+YNXM1X9AmYS44ePdp54sRc1ZJCt20CWFnoE=;
        b=pUvbH4bHjkXHnTRgixCXsNfENMEZwroSlKFH6jbNro6jUYS2x2vkYyJaWv393T3gq+
         lkqANnjSW/Pp1Rzdv4PXfcT4dyRlNvrTHH3phtbHIYVQxIUV7tEEt5/Iw9XL1rIMRlCR
         7Hyp1uUqQRcv6DHK0XDNWtgiS+smO5fsUdv+la9CW7tlpDGak81qJobVZqzgxqJ7wXdT
         VCPYGrpyIkSLGLRl0GgNrQ1tqJIZeSyubU+JyrKhch9iqO9GWSdMn1todMLHz07VYTAo
         vZFVwORD0c33/p1+5iPrjQwE7YxnBZAWb0KMp6ti/EPVtC7KatIrycTEe4gIFCR7eaRu
         S6ew==
X-Gm-Message-State: AOAM531dAWpDsWSd4OHmkcFMIIWkCnP0KV7pFOXFe9SYbfwLSGkzQHwC
	nHyDICHX0wCU5smaAUdeN6MpZY4+qA8=
X-Google-Smtp-Source: ABdhPJxn8w85QngvjJ+dWCBDUkYd9RupcqtYT3BkPVe9TG6OMaOP2QEHyBtjabcqWRsBJaX9p+2XqA==
X-Received: by 2002:a17:902:eccb:b029:de:8483:505d with SMTP id a11-20020a170902eccbb02900de8483505dmr15410879plh.63.1612131484568;
        Sun, 31 Jan 2021 14:18:04 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a4sm15512177pfg.41.2021.01.31.14.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 Jan 2021 14:18:03 -0800 (PST)
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
Subject: [GIT PULL 2/6] Broadcom defconfig-arm64 changes for 5.12
Date: Sun, 31 Jan 2021 14:17:16 -0800
Message-Id: <20210131221721.685974-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210131221721.685974-1-f.fainelli@gmail.com>
References: <20210131221721.685974-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/defconfig-arm64

for you to fetch changes up to 2a9e89e6a694cb01ff19b8ffd6fceb46b824f1a9:

  Merge tag 'tags/bcm2835-defconfig-arm64-next-2021-01-25' into defconfig-arm64/next (2021-01-25 13:14:13 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs defconfig updates for
5.12, please pull the following:

- Nicolas enables the NVMEM reserved memory driver to permit reading the
  Raspberry Pi's bootloader configuration from user-space

----------------------------------------------------------------
Florian Fainelli (1):
      Merge tag 'tags/bcm2835-defconfig-arm64-next-2021-01-25' into defconfig-arm64/next

Nicolas Saenz Julienne (1):
      arm64: defconfig: Enable nvmem's rmem driver

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
