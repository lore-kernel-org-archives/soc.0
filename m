Return-Path: <SRS0=MYJy=JE=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB39DC43462
	for <soc@archiver.kernel.org>; Wed,  7 Apr 2021 11:00:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 67BD8613A7; Wed,  7 Apr 2021 11:00:23 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C6DE61363;
	Wed,  7 Apr 2021 11:00:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C6DE61363
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=matthias.bgg@gmail.com
Received: by mail-pj1-f48.google.com with SMTP id t24so5502997pjw.4;
        Wed, 07 Apr 2021 04:00:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=Mt9KfRdpeYOA5awgbDGEbpZTSey436IhcDpa95JCGAg=;
        b=vf+jW23hbPu165Z6rb8Wd0nORwct8v7KoxypIcLpXXeVQrrvog3xVvxx+gv6wt+DEx
         e/I8WqC5L4yCkp/G31qtKszlE1WrkkqW1E/iuLR5P1TtoILivTLUpb73L04I3BKtgkzE
         9gzKBW3Pi/NGI4r6055h6Cr24Jh7VmcZ1Sr4umLb8DahZNXcBgUEGJ0xBtC4a6i40vCW
         eQhTT680ytDOZ5nZGjW7qmhUKSZDdD77ftU+qutMQygZev8SGjB7LW0SeMpgN9BXevGn
         SZkb/m6i8HkfUYOGo50tibGeZPLusrB9hNbqajaYqhO2J5VmYj8MCVLjclb5THJUR//T
         WKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=Mt9KfRdpeYOA5awgbDGEbpZTSey436IhcDpa95JCGAg=;
        b=Ak+ckMshvmrFpDEPt+EzwkjfBf1vpy7MyAq6hX75wuzXhD0Jv0Ih9/xvL23GqUzURd
         rJeZVfqVe43mQ9OluOqw+iX8TSR5HmvGbnFjBNyrWsDmE+M2NRELvlgSt3C9shN01JiZ
         NgQSBSYRxEVJ2gH8KiUNPeDgc8OkouCnhnD8XvIQb9hhjgdLL39j4hslszZHAflCM+8C
         XHQ+timwBkcJgovGjp/1dg8vEn+COZRV1rFJgVHk1H18KA6lT/Rbg255K52oT4l562Rs
         iWoGej8P4TQDMLFdBJB6F8zCaJC572BajtwdmV8JMgGRpnf2SFgAGzf8f07om1gfTZjA
         DzmA==
X-Gm-Message-State: AOAM533N1ECyQ/OIEYWQmRYwI6xoFAkrJ8/Gefu/QqrC1b1Pjt5n9Br0
	r4cp6W+hzWaOwA6ui7/KhHpZvujjP1Ga+A==
X-Google-Smtp-Source: ABdhPJyRB+ZpALjRHUybazSAfkHVNhkXiRuqBVDgggcXU4NHm1R7LFP+04DDpq2q+i/YyDMGtTM6Ig==
X-Received: by 2002:a17:902:9b8a:b029:e6:17bb:eff0 with SMTP id y10-20020a1709029b8ab02900e617bbeff0mr2550725plp.54.1617793222678;
        Wed, 07 Apr 2021 04:00:22 -0700 (PDT)
Received: from ziggy.stardust ([37.223.140.37])
        by smtp.gmail.com with ESMTPSA id q13sm1817953pjj.17.2021.04.07.04.00.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Apr 2021 04:00:21 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Fabien Parent <fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] soc: mediatek: changes for v5.12 (second round)
Message-ID: <14104322-3a6c-e8eb-cd21-a5343a81aa0f@gmail.com>
Date: Wed, 7 Apr 2021 13:00:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Olof and Arnd,

Here comes the second round of soc drivers patches. Hope I'm not too late.

Please have a look.
Best regards,
Matthias

---
The following changes since commit 60d93f64a851d276b23b7ef68ddc638258485d32:

  soc: mediatek: pm-domains: Add a power domain names for mt8167 (2021-04-01
11:36:04 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/
tags/v5.12-next-soc.2

for you to fetch changes up to 060f7875bd230df1a8f83a988faaee09d693e465:

  soc: mediatek: mmsys: Add support for MT8167 SoC (2021-04-06 12:57:10 +0200)

----------------------------------------------------------------
MT8167:
- add support for mmsys subsystem

----------------------------------------------------------------
Fabien Parent (2):
      dt-bindings: mediatek: mmsys: add mt8167 binding
      soc: mediatek: mmsys: Add support for MT8167 SoC

 .../bindings/arm/mediatek/mediatek,mmsys.txt       |  1 +
 drivers/soc/mediatek/mt8167-mmsys.h                | 35 ++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c                   | 11 +++++++
 3 files changed, 47 insertions(+)
 create mode 100644 drivers/soc/mediatek/mt8167-mmsys.h
