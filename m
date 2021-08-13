Return-Path: <SRS0=cAun=NE=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8301EC4338F
	for <soc@archiver.kernel.org>; Fri, 13 Aug 2021 14:13:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DDCDF60FBF; Fri, 13 Aug 2021 14:13:03 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B613B60FC4
	for <soc@kernel.org>; Fri, 13 Aug 2021 14:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B613B60FC4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f41.google.com with SMTP id k4so6979700wms.3
        for <soc@kernel.org>; Fri, 13 Aug 2021 07:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=jd2PnuxQ53Mi4klFMZrE2PRRg/Ii7zJi7JDhmX3RAbU=;
        b=IUH7GO8/qkee4KkNOsGKb2/9NXmZMGIWqZZC9vk2ifx9ertS9p5mhAEXFFbUoGO99U
         6l3kOBOy4q+T8syOG3cZ9L5u1TJi24y3yq4bIdxalO4xTpcG7QadQg8l46KJ0K4lqDXM
         ZRYEJ0wszTMLafPpNGIiQPlpv0EzF33H6ryZJlHBidnHqEkKiBsQefvQT5BC4IPBVX40
         E2sNZh99s7ceN+q5vRvnTUmt6CH3gc6gsT8qk7MeFWrV+hO8pGiIzE3CR9UZTh9bMIAF
         NKHPwn7Sp7Fzzydg/Z7SwiUMwSeTYBR+chw2YKxG6pv9vZsgE4KDWdOGXAzFWG0sFhNM
         IRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=jd2PnuxQ53Mi4klFMZrE2PRRg/Ii7zJi7JDhmX3RAbU=;
        b=CIA7uAJ3lf4f3fhmkPO46kpznYlL4SSebOqQfTCyRmpnuhmDZHcO3pnOdBj4VGxUIH
         DbHdLM9ELcEZ3Gim33lf9TFneKEVb/RfKj31rgmpmsNz/jxq167G+iYUUt361nnEEibL
         Zdj/AHcbi9QAnsvJ5FI4S8Ge8njDgPrCQ6XK6ywdWup/RE4ptJ9xk+GaKQvLYU8FF/d8
         5Pk+IYGPnqxLfOd728bZ4wde/YTXDGZQUN0P58Izunhj5NXQ5TvEU1Q+33yc4+qe3qSX
         JTG8dmqVeT/Ga2/YsnyrfVObCR8nsWkjaeU70UOLBPG9poicwjp+zuznYtfZdKeEtQe4
         54Ow==
X-Gm-Message-State: AOAM533Df1aHFb+GwPeV3mwkNRqHldlUJfzPjASDpiXJCmPvXr4N7kbf
	ETLUmUVNUhcn/JaDmOflwPpyqw==
X-Google-Smtp-Source: ABdhPJyW3rK8Kj1V7N9Xm0sorD6ZAt5rlYeqbz7zXybHaZJXijOtk+DEvUc1XI9MFzAs3pMz+Kv1rQ==
X-Received: by 2002:a1c:26c5:: with SMTP id m188mr2956951wmm.19.1628863980959;
        Fri, 13 Aug 2021 07:13:00 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:f772:22f3:b804:55d6? ([2001:861:44c0:66c0:f772:22f3:b804:55d6])
        by smtp.gmail.com with ESMTPSA id r129sm1532540wmr.7.2021.08.13.07.13.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Aug 2021 07:13:00 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] arm64: dts: amlogic updates for v5.15 part 2
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Organization: Baylibre
Message-ID: <47d77095-eee7-bbd9-d3aa-1dabeea3f0b9@baylibre.com>
Date: Fri, 13 Aug 2021 16:12:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

Here's the second set of ARM64 DT changes for v5.15:
- add audio nodes for vega-s95 & nexbox-a1

Neil

The following changes since commit 4b5260032ec691b11a9185f7f38f5761e67fab48:

  arm64: dts: meson: improve gxm-khadas-vim2 wifi (2021-07-26 10:08:16 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git amlogic-arm64-dt-for-v5.15-v2

for you to fetch changes up to c6cf488e3bfdf92427686317d99e0342516753de:

  arm64: dts: meson: add audio playback to vega-s95 dtsi (2021-08-10 09:57:05 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v5.15 part 2:
- add audio to nodes vega-s95
- add audio to nodes nexbox-a1

----------------------------------------------------------------
Christian Hewitt (2):
      arm64: dts: meson: add audio playback to nexbox-a1
      arm64: dts: meson: add audio playback to vega-s95 dtsi

 .../boot/dts/amlogic/meson-gxbb-vega-s95.dtsi      | 61 ++++++++++++++++++++++
 .../arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts | 61 ++++++++++++++++++++++
 2 files changed, 122 insertions(+)
