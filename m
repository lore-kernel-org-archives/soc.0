Return-Path: <SRS0=3UeS=53=linaro.org=neil.armstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA7FC54EAA
	for <soc@archiver.kernel.org>; Mon, 30 Jan 2023 13:32:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 393A2C4339B; Mon, 30 Jan 2023 13:32:14 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 07F7DC433EF
	for <soc@kernel.org>; Mon, 30 Jan 2023 13:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 07F7DC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id hn2-20020a05600ca38200b003dc5cb96d46so1063919wmb.4
        for <soc@kernel.org>; Mon, 30 Jan 2023 05:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZVWhEHW43oX7sQlEDJILjX50KrBGQjN10LWiSk9a9KM=;
        b=hcDAnf/bYrG7Y4ETa1rysHlNhAk+wXhmO3AjLEiCzvLtdOZPkZwqBiHEBxE4mTBpgT
         eQxrp0c1Prqh4q+0TX0anwXtPWIi+zq+GObdAKBC909ecFou2bbRZLbRdSKKinfuvzB6
         AosqyTVDzbmX6wAkhXxCOi0Q6JijdGD42w3NEF68j0wDlljJxZKHbafi6K/dtJfCbGu9
         BcajvTCh/+gqvZPgUmVvZakr0Gfk+/6d73j4y/FeEtZL0CxCfTLjeMpNOY7RVyiWEwMq
         uejwAOzeyAmcbpYe2bMl2/NOTz5KIcuYa8vrMpbo0Sv9rAu2p5Q9tswHerWbBXy6VVXP
         v+PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:organization:content-language:cc:to
         :reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVWhEHW43oX7sQlEDJILjX50KrBGQjN10LWiSk9a9KM=;
        b=sreHb9PIsCYHM7bKCyjXAtnI7wMSp8kdZrjTay+3EwRpq5dRXW7g2gSaMoJDVamaCn
         sxAvAmmliR0DhIcAJoemYbechASNCsHhK4FVI+a6v14gmdqM3nFwtRpTbzZiEK7THJWR
         M6pi6EzuhxHxSXFAfJP4zUXSjFqy8n0JzjtIScclxuDw6eGAcGZMZODRrezHY3c9MH9h
         cNsYAeOXFYRb+FLK3ceLrRm+VPA+PIJdmM7PdVYw1DjqMuQpUlTBBY3qFVnisC/PnjDR
         u12fpcc0V8z84uOHm6ID7p9oqvWavK7oCjoL5p5xpRXb6Ldg2BgFUw0tmrI3yZcTwWzx
         gfuw==
X-Gm-Message-State: AO0yUKV4KFnZ2EX6yj87M6H54gYHbDekKSAGNOOGCD2F45h/4WV4nG1V
	xCQSYbOPb62zCHZYkXerQYFiYgE3YNYerkqhw+8=
X-Google-Smtp-Source: AK7set9tSbrckqaVPuQ5e8am5m9vCiJFcQFPO2FvqFOYoVSvrbsMfhhjKE58/oStukfSyN3utQCBQQ==
X-Received: by 2002:a7b:c8d0:0:b0:3dc:4811:acdc with SMTP id f16-20020a7bc8d0000000b003dc4811acdcmr8261473wml.12.1675085531286;
        Mon, 30 Jan 2023 05:32:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5f17:219:cb05:7cd? ([2a01:e0a:982:cbb0:5f17:219:cb05:7cd])
        by smtp.gmail.com with ESMTPSA id o2-20020a05600c510200b003db16770bc5sm4776923wms.6.2023.01.30.05.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 05:32:10 -0800 (PST)
Message-ID: <ec9552d8-96df-a677-ab94-9723f5c30f1c@linaro.org>
Date: Mon, 30 Jan 2023 14:32:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic Drivers updates for v6.3
Reply-To: neil.armstrong@linaro.org
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Linaro Developer Services
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's an Amlogic Drivers change for v6.3, with:
- add NNA power domain for A311D SoC
- convert meson_sm.txt to dt-schema
- mark amlogic,meson-gx-pwrc bindings as deprecated
- fix meson_sm by using NULL instead of 0

The NNA reset & NNA power domain bindings were added to an immutable branch
and merged in this driver PR and the ARM64 DR PR to satisfy build-time
dependencies.

Neil

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

   Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.3

for you to fetch changes up to fcdc53aceed413dce3ef1d0166a8e9348d5a9c94:

   firmware: meson_sm: stop using 0 as NULL pointer (2023-01-10 15:21:13 +0100)

----------------------------------------------------------------
Amlogic Drivers changes for v6.3:
- Merge of immutable bindings branch with Reset & power domain binding
- Addition of NNA power domain for A311D SoC
- meson_sm.txt  conversionto dt-schema
- mark amlogic,meson-gx-pwrc bindings as deprecated
- fix of meson_sm driver by using NULL instead of 0

----------------------------------------------------------------
Miles Chen (1):
       firmware: meson_sm: stop using 0 as NULL pointer

Neil Armstrong (3):
       Merge branch 'v6.3/bindings' of https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux into HEAD
       dt-bindings: firmware: convert meson_sm.txt to dt-schema
       dt-bindings: power: amlogic,meson-gx-pwrc: mark bindings as deprecated

Tomeu Vizoso (3):
       dt-bindings: reset: meson-g12a: Add missing NNA reset
       dt-bindings: power: Add G12A NNA power domain
       soc: amlogic: meson-pwrc: Add NNA power domain for A311D

  .../bindings/firmware/amlogic,meson-gxbb-sm.yaml   | 39 ++++++++++++++++++++++
  .../bindings/firmware/meson/meson_sm.txt           | 15 ---------
  .../bindings/power/amlogic,meson-gx-pwrc.txt       |  4 +--
  drivers/firmware/meson/meson_sm.c                  |  2 +-
  drivers/soc/amlogic/meson-ee-pwrc.c                | 17 ++++++++++
  include/dt-bindings/power/meson-g12a-power.h       |  1 +
  .../dt-bindings/reset/amlogic,meson-g12a-reset.h   |  4 ++-
  7 files changed, 63 insertions(+), 19 deletions(-)
  create mode 100644 Documentation/devicetree/bindings/firmware/amlogic,meson-gxbb-sm.yaml
  delete mode 100644 Documentation/devicetree/bindings/firmware/meson/meson_sm.txt
