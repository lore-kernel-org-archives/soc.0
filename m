Return-Path: <SRS0=NPTw=VM=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACFABC433FE
	for <soc@archiver.kernel.org>; Wed,  4 May 2022 21:09:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9550BC385A8; Wed,  4 May 2022 21:09:54 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E4BD1C385A4;
	Wed,  4 May 2022 21:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E4BD1C385A4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id i1so2566462plg.7;
        Wed, 04 May 2022 14:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s5/eGzZENi6sM20xIiIjer1iFYSKR4VU3WNwyJnQFz8=;
        b=ausnmCgg5d+jHfU370/1RIeyjnxk0VFYYVTcrb2Zxs1yWT6ZgUk6St4u22siE1qD5z
         RrXCWoFF6J8wO5NWQgMuf3ZhLqCuGVZ/KVUrcMTfZNM4DdhRTxOP6GxAiLlqIZJEW4AO
         K71qda8XBavk2tT23HzxKBryIbURMqT2GglTSTKHJoFGXoiFOOLr/EJCrIAwYVGsZa/t
         X3pcskrU9MbSm9IB3MgbAlFgEELFu6h/Cq09x+1FkNhr34eFIQunn1PuGAn4lB+F3MVx
         Pm0jXPXIpqnSf8R9nChGtMu+SAlLgLq2pfjnfAgZqMBc+nwCC5TVGZcLYz01JtriMU/E
         sEzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s5/eGzZENi6sM20xIiIjer1iFYSKR4VU3WNwyJnQFz8=;
        b=KmNG7QE8zyIWBy4yNS56SPOIlQdfXidw0KXUZGl/p2rK9lrvl/ZgTtHdwlB/Y9YfOC
         YstdeOZTleroJFjhc4sp4dgeCV2rrQW+OF2kXS59AWke7SNtku5ATVtqxKfdLPhqTPXP
         dCBtHhPB1TKr4bxzLwyz3B1qnWZW+bhsokT3zmEGgDY46COCz/+KrdJSqcovh05Ru5d9
         a4IKACYGBSe+NEWgSf06p0nYR3q8Wo2oXRw+DA8JJ6WKWx/+yZTCsn6FjiVcbe7l3Kno
         /k+Z53YXKrdq2TboRdIJtZcYfzztLIcuxpiyZ+3skrXCbkW5abQoXORKTM7UWF4X1xil
         9yFw==
X-Gm-Message-State: AOAM5309CpewEVFTsK/JxoTkTzYLJFvB0rWTznGhM0RcI7vHgfPuB5eu
	LkLRwRReCOy4t+uVdrwSvbXPqUoLKoE=
X-Google-Smtp-Source: ABdhPJzFCdclwOx3cGXHJsEc4CMMNgL+kXb2KXXchMv+tsXH6vfEWVqmBEJjNPitrHVk1gNtfjQuLg==
X-Received: by 2002:a17:902:f64d:b0:14f:fb63:f1a with SMTP id m13-20020a170902f64d00b0014ffb630f1amr23952627plg.159.1651698593211;
        Wed, 04 May 2022 14:09:53 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id r11-20020a63204b000000b003aaf27b5ceasm14820457pgm.1.2022.05.04.14.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 14:09:52 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: William Zhang <william.zhang@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 6/6] Broadcom soc changes for 5.19
Date: Wed,  4 May 2022 14:09:42 -0700
Message-Id: <20220504210942.1838248-6-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504210942.1838248-1-f.fainelli@gmail.com>
References: <20220504210942.1838248-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.19/soc

for you to fetch changes up to b32c613b3fda3e1c26119609f1ad6b19178f82f5:

  arm: bcmbca: add arch bcmbca machine entry (2022-04-22 14:18:10 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoC changes for 5.19,
please pull the following:

- Julia fixes a couple of typographic errors in the Brahma-B15 read
  ahead cache driver and in the ARCH_BRCMSTB bare metal SMP bring-up code

- William adds a Kconfig entry for ARCH_BCMBCA which will be used to
  upstream support for Broadcom's broadband SoCs

----------------------------------------------------------------
Julia Lawall (2):
      ARM: mm: fix typos in comments
      ARM: brcmstb: fix typos in comments

William Zhang (1):
      arm: bcmbca: add arch bcmbca machine entry

 arch/arm/mach-bcm/Kconfig           | 12 ++++++++++++
 arch/arm/mach-bcm/platsmp-brcmstb.c |  2 +-
 arch/arm/mm/cache-b15-rac.c         |  2 +-
 3 files changed, 14 insertions(+), 2 deletions(-)
