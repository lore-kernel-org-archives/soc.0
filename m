Return-Path: <SRS0=l/su=55=gmail.com=matthias.bgg@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B1D0C38142
	for <soc@archiver.kernel.org>; Wed,  1 Feb 2023 18:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0AE38C4339C; Wed,  1 Feb 2023 18:02:06 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 13CA1C433D2;
	Wed,  1 Feb 2023 18:02:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 13CA1C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id j29-20020a05600c1c1d00b003dc52fed235so2125254wms.1;
        Wed, 01 Feb 2023 10:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1LE9PG/hhPQk5M1gnAFbkkY8T9eT40lvBxGMoA1nOE=;
        b=fEJDwWatmPFF+U+opPCgFsR/JCUXXU6USgbFJm42DGpZxxA0p+x/rHuQen5xkw2uPv
         PXa2vYdLEMcOC5vJQ5pIyVDICnmqiEyksiQre/k6UO7IxtI6WobVbpsSBCiiEefKQRml
         649c09YH4n/6kUsPZYUJiT7TJA1fIdTtNEpv+kgQzYRiZSf3NJn4L7wAp/kIR6qeHSWh
         +i7IMyFzxa5Gb5WlL4BcZG7gGQItbwtb/6/0szI/dnJGd5Ao7Imu41l+80QRAJ7LXn98
         PiaoXNwtHBNleixQkZH3/2jBd9T/bO1E86fEM956xPV7kg4odmJMJ80RcV/a70N1Lg8m
         JNvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K1LE9PG/hhPQk5M1gnAFbkkY8T9eT40lvBxGMoA1nOE=;
        b=4UmG5YTd3UNEe1vaRkTOSF49iuL9+S8UirLSsyzDDDtEgiiKmErZtK5pwFVXWR7yRH
         IUTzcFqRW4ka2yfBgWQlhfiOTWE5rdntBNPdSwWDi2tG2VCV4LCdYK2zD8DMxh1UzExp
         kE9YpIFVzkK8wcX5q8QiXBBtiZPUsaPkTFgsbiTVdEgnCDSns/mIsitQkxY4wuAMHaxm
         2zUD1cVyFcQjF627OvtO9w31hVdyL3I9yG0m+aQ0HaE2vGWt+XmZQtQPz8Hfhm/oUJYR
         AL2YGIDj1VwDjAYIPJWMK1K9biluoZYasJCZCMvSNN2nrIIDn3WOLYTGIAvTO3JvZUrN
         NAGw==
X-Gm-Message-State: AO0yUKWnqwqNm6pRAqwR/LiDQx3g5ULSabMvOWU8upkJOZN02jKOScb6
	W3wxTGNe+6uTtZnH2vv+gopjS/frbvQ=
X-Google-Smtp-Source: AK7set88hK46T6dU+hxrih4qMea7PEYKdcF1yO/BlDXzndkkA+tqsjdhEZqMYIl53qI7CspfGOXO1g==
X-Received: by 2002:a05:600c:3505:b0:3dc:2137:d67d with SMTP id h5-20020a05600c350500b003dc2137d67dmr2998250wmq.16.1675274523293;
        Wed, 01 Feb 2023 10:02:03 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id p17-20020a056000019100b002bddaea7a0bsm17689163wrx.57.2023.02.01.10.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 10:01:57 -0800 (PST)
Message-ID: <2330b914-8a8e-8bf3-e98e-88d713c5224d@gmail.com>
Date: Wed, 1 Feb 2023 19:01:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] defconfig: mediatek updates for v6.3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Arnd and Olof,

Please have a look at above commits for the defconfig. It basically enables 
drivers needed to boot MT8192 based boards. That's very useful for kernel-ci 
where Collabora and Nicolas has put quite some effort into.

Regards,
Matthias

---
The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/ 
tags/v6.2-next-defconfig

for you to fetch changes up to 09ea26f1bf31c381faf4504774326755d8c47108:

   arm64: defconfig: Enable DMA_RESTRICTED_POOL (2023-01-31 12:28:10 +0100)

----------------------------------------------------------------
Enable config options needed to boot mt8192 based Chromebooks

----------------------------------------------------------------
Nícolas F. R. A. Prado (2):
       arm64: defconfig: Enable missing configs for mt8192-asurada
       arm64: defconfig: Enable DMA_RESTRICTED_POOL

  arch/arm64/configs/defconfig | 25 +++++++++++++++++++++++++
  1 file changed, 25 insertions(+)
