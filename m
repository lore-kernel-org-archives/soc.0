Return-Path: <SRS0=1PX/=6G=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637D5C05027
	for <soc@archiver.kernel.org>; Fri, 10 Feb 2023 08:16:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 3031FC433D2; Fri, 10 Feb 2023 08:16:14 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1C40DC4339B
	for <soc@kernel.org>; Fri, 10 Feb 2023 08:16:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1C40DC4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id l21-20020a05600c1d1500b003dfe462b7e4so5230572wms.0
        for <soc@kernel.org>; Fri, 10 Feb 2023 00:16:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jXVLKKw274Y2VymGD4a2gDqwmxd0fauNox/dAl2RlT4=;
        b=uBXVJ+eAbro9Pg5IiV6PWcjseTmEXiJ11vLaY/V4hViugg5EoBABOqnkTaBWjSKP34
         8mlcokTBUVzexA0GtXq7nzZ+R/15vOaF4DRogA0VFqz5XY+wmjbKo48ljur7nJvL6QzP
         wwWXcPVJS24Jy8y/gjtipDPHai7/YqQ0CWt2a6REwEpVHVvtwoJ9QotCIu8rk5BfUFwx
         rrNNWRLTTfmyNH3OfF4kXYwcs2pN4crdEZf2b4o/GqG6efzgxEBRRlwZoLbkElYp6/gi
         jFrp1F1FYP3Z0zrunEpSEsZgN6Tde9VPsdy/zKK8A96ZIVNsnej7sNCo8tLtwy3yCGEu
         z99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jXVLKKw274Y2VymGD4a2gDqwmxd0fauNox/dAl2RlT4=;
        b=3tv0dPHJAFOelb8c+G0enQNdET5Emb0a8Geb/wvoSCaY+zPgpEw1+x4UYf/Rn3eem/
         IdhypAuGGMFQwOOkvajAcTbYQkTbdrM7KJSf2l3JS8SaXp7H6CxK8kUNKtWWLfH7Dcf2
         DCXkIJ13ELX1Kau8EX8CZiI/2YnKvmO1SSOcvv11vKuf2XtK2kgQmTAHatR96SGrHa9l
         ++2NcxeVtoev91jLy6Di6UTG030E+38tLIcwydAcLagBwWC89RXS2K/nx3TItUk4a33A
         6/W5GJ7+LraEVhZ70CdOu1zqmTVmxAjMySwia6fEGJm+Z84AiAqzzT4rFJO64z+m90x7
         0Myg==
X-Gm-Message-State: AO0yUKURm4jJl2lm6Vjf81ffL3n+T9axXkOhjBUno5iFhaVWHbhdGTAW
	c4/Ul17yjKuLgMBogJYfet38DBgYOLvP8a8wOhM=
X-Google-Smtp-Source: AK7set9Z420tN+SeLyquqhUkMIfzLxEqhFzA7TLVEWqOomuzOD/Hg1210hLzD3036el2Gs0QGXvonQ==
X-Received: by 2002:a05:600c:4494:b0:3dc:5a13:c7d1 with SMTP id e20-20020a05600c449400b003dc5a13c7d1mr15201802wmo.16.1676016971467;
        Fri, 10 Feb 2023 00:16:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a65:5553:55cf:3027? ([2a01:e0a:982:cbb0:5a65:5553:55cf:3027])
        by smtp.gmail.com with ESMTPSA id h28-20020a05600c2cbc00b003dc3f3d77e3sm4606832wmc.7.2023.02.10.00.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Feb 2023 00:16:11 -0800 (PST)
Message-ID: <761c2ebc-7c93-8504-35ae-3e84ad216bcf@linaro.org>
Date: Fri, 10 Feb 2023 09:16:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic fixes for v6.2-rc, take2
Reply-To: neil.armstrong@linaro.org
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Linaro Developer Services
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's 3 DT fixes for v6.2-rc1 which fixes IRQ loss and performance issues with
system is loaded by switching the MMC controllers interrupt flags to LEVEL.
A similar change has fixed similar issues with the ethernet controller.

Thanks,
Neil

The following changes since commit c45219cba101f32853d011da2ba46a1b2338dc4c:

   Revert "arm64: dts: meson-sm1-odroid-hc4: disable unused USB PHY0" (2023-01-06 09:02:40 +0100)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-fixes-v6.2-rc-take2

for you to fetch changes up to 66e45351f7d6798751f98001d1fcd572024d87f0:

   arm64: dts: meson-gx: Make mmc host controller interrupts level-sensitive (2023-02-10 09:02:09 +0100)

----------------------------------------------------------------
Amlogic fixes for v6.2-rc, take2:
- Change MMC controllers interrupts flag to level on all families, fixes irq loss & performance issues when cpu loaded

----------------------------------------------------------------
Heiner Kallweit (3):
       arm64: dts: meson-axg: Make mmc host controller interrupts level-sensitive
       arm64: dts: meson-g12-common: Make mmc host controller interrupts level-sensitive
       arm64: dts: meson-gx: Make mmc host controller interrupts level-sensitive

  arch/arm64/boot/dts/amlogic/meson-axg.dtsi        | 4 ++--
  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 +++---
  arch/arm64/boot/dts/amlogic/meson-gx.dtsi         | 6 +++---
  3 files changed, 8 insertions(+), 8 deletions(-)
