Return-Path: <SRS0=hN7X=XU=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE28CCA47F
	for <soc@archiver.kernel.org>; Fri, 15 Jul 2022 22:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 168EDC3411E; Fri, 15 Jul 2022 22:18:02 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7355CC34115;
	Fri, 15 Jul 2022 22:18:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7355CC34115
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id v4-20020a17090abb8400b001ef966652a3so12746829pjr.4;
        Fri, 15 Jul 2022 15:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sYVD0U8L29FSG78XrHyO7py0Hhi/xe0/UHeY51xZel8=;
        b=SeL0NNnM1O5htxNc1elIdzmOBdTu+tTLBcZQBPIC+7WGCgn3m7TZaoCXXGgH2rpSQd
         /vnQP3fvLlwuO2JEdSGonOJ42meae9Q2tf4qdUtKe4CcIqiYcE2dPqhiLf3+5PtMU9Uz
         8gqxC8cw/mUCHjuxQLBdwVR8Tnc8Gx1AjGIo3XKuXdm6BpltgxWBXQuMz9rfUZT0h+kL
         xAr+yrvrYtAfHzn/DIlAQcDjb0NvGZ1HK+0dovJGK1DFIqVJODArZMWDyhrRQgyjVvPG
         ZFL4jSjZJUDjcU65KiB47O5AHzv8LoDuBPRJAjq5zgXWBDwOzAYzV9Dx/RRtTrcfWRp5
         cxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sYVD0U8L29FSG78XrHyO7py0Hhi/xe0/UHeY51xZel8=;
        b=BYATx4ODiIvF+VRuHSY5lWqz0/e2hARlGztZpDai/g7SJDMftqEU3q5bs24AsEdebs
         n+xUm/xRxIdSG3/frKt3pv+wZXWY+Zl20tsiX8m3j9tdB1uxd2Ahg0myZui60/GIlIig
         GlZnj52fkT2Kionko9m3aYYllSnkgPgOH10Ud5FXH+SIV1faFaCEGgq9OH4HmEUQWwAP
         1KDSORbkhk+/XsLFF8FEz6OAeOPTVyouJTNjYhUaPYumVCuErIfxUqhxStC2OQ4F3aSf
         oXtDzBZW+na3I1tHlp562HUpDPVA21Y2tYE4PxGS7KwryoVI80ttydmDy7uwWOiXL5n3
         iLMw==
X-Gm-Message-State: AJIora8gixDKr6dsavPBE9x9+GYfpD23la9SQ2kV3zTob/+Q4UdaT9Wr
	SK6m4LJxFOdb0D/+NlXel4u/4Qdyqas=
X-Google-Smtp-Source: AGRyM1u771y7Pztb+tIDOn1jLdBHhmPV0CS06MDHZTZAhyKQjV8lNU+UootZ1BanFYRdKJUR2k119w==
X-Received: by 2002:a17:90a:2b4a:b0:1ef:3e28:fbc8 with SMTP id y10-20020a17090a2b4a00b001ef3e28fbc8mr17881896pjc.54.1657923480553;
        Fri, 15 Jul 2022 15:18:00 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id w63-20020a623042000000b0052ab8646500sm4391123pfw.56.2022.07.15.15.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 15:18:00 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Florian Fainelli <f.fainelli@gmail.com>,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org
Subject: [GIT PULL 3/3] Broadcom soc changes for 5.20 part 2
Date: Fri, 15 Jul 2022 15:16:42 -0700
Message-Id: <20220715221642.297536-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220715221642.297536-1-f.fainelli@gmail.com>
References: <20220715221642.297536-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit fa0ef5a086a05306fc5322bbda73459725eda923:

  ARM: debug: bcmbca: Replace ARCH_BCM_63XX with ARCH_BCMBCA (2022-07-08 14:08:51 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.20/soc-part2

for you to fetch changes up to 9e0c41d4a72ffc42cc82cb58adac8f351694c811:

  ARM: bcmbca: Include full family name in Kconfig (2022-07-15 15:00:30 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Kconfig updates for
5.20, second part, please pull the following:

- Rafal spells out what the BCA acronym means

- Florian removes the forced thermal subsystem selection done by
  ARCH_BCM_NSP

----------------------------------------------------------------
Florian Fainelli (1):
      ARM: bcm: NSP: Removed forced thermal selection

Rafał Miłecki (1):
      ARM: bcmbca: Include full family name in Kconfig

 arch/arm/mach-bcm/Kconfig | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
