Return-Path: <SRS0=WXVb=XQ=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C651C43334
	for <soc@archiver.kernel.org>; Mon, 11 Jul 2022 16:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 722F9C341C8; Mon, 11 Jul 2022 16:45:09 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C3D31C34115;
	Mon, 11 Jul 2022 16:45:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C3D31C34115
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id s27so5171510pga.13;
        Mon, 11 Jul 2022 09:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/JBtXd8kGI0ESySNhjlGFrMdn/PwEjSGqQhmQg9LIiM=;
        b=WPd/18txEJeSdAJETFbH1ztQhUg1FbejJYm81EWzsJdzNLggl0v5+t5JU+SRvPm895
         TcjFhx9kxT2dgBzVjGuWbCmel2Nfuva4wfPr8VDRsVtDhpHSc3GxXdjs7hIYnNvr3uwg
         Y1mfWJWGz/Y3BzcnNoG2A012m38G0MUHErlVVNVuh0DDCXnSgGahZbkbSlDnulDm6UvX
         OzRsjvyUyego4XcngVnjOTAn4NX7y4biJ//NAeRn5TQ7e17EmtqfGcK2n5KsbXFEcV07
         rPSDZ6v4n2ISgFaFADWI3mcDb/mqDAUT65C+abrOSL0TxwTWEaupbqHCbcgqG8bIu4Vk
         w/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/JBtXd8kGI0ESySNhjlGFrMdn/PwEjSGqQhmQg9LIiM=;
        b=sSzNndmMbF/k1c96IOiMOUtdA9cfkTOnnrGp3ESgqOaOfRKKz8OA9NALNKqkzbq2hS
         fIeWH+LAR20YGXktW3KBVA1IxF1SAQD5jyPDt8fq3mZjFXKMTvjB//K2MMKD7E6GZo0v
         pHVZfrEUddBmIxxlMiC0M8w/ObNapzqtIotwzGe4On5nr6kr59UU6QyqIJwqIpCToR7Y
         bXAP6umAjXLp1KymeobxJNeMmVtW387w1kl/a3f+yl7Fe8dnhNvrBwxPE4E1V+2A4E5Q
         ABoZ9BfjB80fz2IkrE1ckhnwfHJvGKVdMMzU03p+LKJDmweU3/R4Oh6Z6dTbF1EOjZGs
         F3/A==
X-Gm-Message-State: AJIora9ScvA0+J2upDTzXlmYZbM7m7ybv9n3k7iDyQ0eXuxK3WcQdJpv
	G9buekn7SUm/IRS73bfyouPcS8h9dgU=
X-Google-Smtp-Source: AGRyM1vgboy/YZyqxTgwXm1yFxvJtGKMQ0ZsZpQ8jpum2CMwF38hbxLh+qMxmvqyeTQ3S83y8oNdvw==
X-Received: by 2002:a63:1d15:0:b0:412:8c83:a366 with SMTP id d21-20020a631d15000000b004128c83a366mr17184811pgd.32.1657557907865;
        Mon, 11 Jul 2022 09:45:07 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id v3-20020aa799c3000000b0052ab9f1fe45sm4961266pfi.120.2022.07.11.09.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 09:45:07 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Peter Robinson <pbrobinson@gmail.com>,
	Stefan Wahren <stefan.wahren@i2se.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	William Zhang <william.zhang@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/7] Broadcom defconfig-arm64 changes for 5.20
Date: Mon, 11 Jul 2022 09:44:46 -0700
Message-Id: <20220711164451.3542127-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220711164451.3542127-1-f.fainelli@gmail.com>
References: <20220711164451.3542127-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.20/defconfig-arm64

for you to fetch changes up to d0ceb08048d3899cb3c3a07470b636e403676127:

  arm64: defconfig: Enable DRM_V3D (2022-06-13 14:10:24 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoCs defconfig changes
for 5.10, please pull the following:

- Nicolas enables CONFIG_DRM_V3D in order for the Raspberry Pi 4 systems
  to load the proper GPU module driver

- William enables the newly introduced CONFIG_ARCH_BCMBCA 64-bit ARM
  counterpart to support the newly added BCA SocS

----------------------------------------------------------------
Nicolas Saenz Julienne (1):
      arm64: defconfig: Enable DRM_V3D

William Zhang (1):
      arm64: defconfig: enable bcmbca soc support

 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)
