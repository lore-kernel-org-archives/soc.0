Return-Path: <SRS0=25J4=VV=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1D8C433F5
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 11:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A5DDBC34115; Fri, 13 May 2022 11:19:20 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E4930C34100;
	Fri, 13 May 2022 11:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E4930C34100
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id q23so11013123wra.1;
        Fri, 13 May 2022 04:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc:from
         :subject:content-transfer-encoding;
        bh=8rkt3oYxVOR/PWPQlQJjtJ68ePt0dnMvHHHA7QmnJP4=;
        b=orP/HtIj9hqoy7n5j6hIM1bz9YTqi2yl7naaEdwfueFMCQlBsETdbQVKuPL51+kqMF
         21JJXE5Z3cAyHgL92d4cqzwsd9z4DMAefagEZYm2CMnxXTKKsz4uVnZns64ajAJ1vsk2
         ZO5JNFK01HbZWPJbo9OZBu8+nloSi22HCuN8sZS11+tv7WpvuLuaooHvJFc3+K2IByiZ
         secO3eILRL+QxfHEmsz6wNtR+lnjKmumCdvUMEah4jr3YDv3SoNH63mKpLtYoXdVzNF+
         cHQFid+JeVQzsKQnnEq1x/kIE8xQ17I4H/3lC3wig86omlBMnyUhfEy6j7NdyQXwm1k7
         4BXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:from:subject:content-transfer-encoding;
        bh=8rkt3oYxVOR/PWPQlQJjtJ68ePt0dnMvHHHA7QmnJP4=;
        b=OIW5hOWxuogaiRQdbA+Y9Y0x9GBUfEzBBoCGNOXvpMXWdDVQCyN7MRD1uY44aM9qgh
         9afaXtKQy/fvqlRfeRLDjddMdCsd/C5+EFYRNbAejpfPdfxjPFggCH2jsqDkhfKbVkba
         ZTedtBmhFJcgZ0xoKzl0LjpUDHbPS1bqwSSLB6/x1VnWK50ShJxC5s8yZtLteCHXgOJy
         iDCgKfpMapssWAGmu3dHlZ3MKzwEb5GOsHWciqi03x4MI541poY7IfFG22fwi09AdBbR
         DJbvT4O2xRVg6S2DiOEZm96NaDSiJay1oMNomo6gukSM2sXekD15zFfH+N9hR/32NW+q
         DSkg==
X-Gm-Message-State: AOAM533p2fHyKsX8bINC9N7rBpz6WWqydp8BWC0GWwYuUi3TPa2FRxw/
	T5TaYHxG+uQsk5pcabJbaR+Hoqaoho920g==
X-Google-Smtp-Source: ABdhPJyexHP8kaHyufl+k+uLIpA7VyOfrzsHWz7cX5SucO2kdgYMe8edDObAbBWleF2jJW9Wx3OemQ==
X-Received: by 2002:a5d:6d0a:0:b0:20c:b640:45b8 with SMTP id e10-20020a5d6d0a000000b0020cb64045b8mr3487935wrq.708.1652440758031;
        Fri, 13 May 2022 04:19:18 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id b9-20020adfc749000000b0020c6a524fd5sm2218972wrh.99.2022.05.13.04.19.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 04:19:17 -0700 (PDT)
Message-ID: <3a6e5606-7b89-2ad8-7b45-21d3a4e9e706@gmail.com>
Date: Fri, 13 May 2022 13:19:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Chuanhong Guo <gch981213@gmail.com>,
 Fabien Parent <fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] Mediatek defconfig updates for v5.19
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Arnd and Olof,

Please have a look on the below defconfig updates for v5.19. Apologies for the 
late pull request but I got sick and needed my time to recover.

Regards,
Matthias

---

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v5.18-next-defconfig

for you to fetch changes up to d66aea197d534e23d4989eb72fca9c0c114b97c9:

   arm: mediatek: select arch timer for mt7629 (2022-04-22 17:12:05 +0200)

----------------------------------------------------------------
- Enable essential PMIC and regulatro drivers for MT8195.
- Enable Arm arch timer for MT7629.

----------------------------------------------------------------
Chuanhong Guo (1):
       arm: mediatek: select arch timer for mt7629

Fabien Parent (2):
       arm64: defconfig: enable MT6359 regulator driver
       arm64: defconfig: enable some mt6360 PMIC drivers

  arch/arm/mach-mediatek/Kconfig | 1 +
  arch/arm64/configs/defconfig   | 4 ++++
  2 files changed, 5 insertions(+)
