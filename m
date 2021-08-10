Return-Path: <SRS0=W1zo=NB=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 102E0C4338F
	for <soc@archiver.kernel.org>; Tue, 10 Aug 2021 07:47:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DDF2860F38; Tue, 10 Aug 2021 07:47:02 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C616060F11
	for <soc@kernel.org>; Tue, 10 Aug 2021 07:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C616060F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f48.google.com with SMTP id k5-20020a05600c1c85b02902e699a4d20cso1837589wms.2
        for <soc@kernel.org>; Tue, 10 Aug 2021 00:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=mMY+3Iw1nj2b/Q2aQd0QfbkRs3LIlo0VEMp/wdTkYzU=;
        b=pvrqck9031GYc3X4FKtmz1S/7ouU25CXmmkNYTp/10PZtEv7fXVhr8osGzcNzQ9Xdk
         ixAkmwi/Yhf6ek1yDZerRhIIg7LWOPd64FYa1I7RedVnMqUII6O51cSxQPEz5BfJGB54
         LpoUbUQwmJg0VM/I4OQMCvHrub2nSNWlwzAlGwTvlMgEcsPvFtLbZGj2Qm1BwChntMDB
         9uF2EPJ2Mh3C1AKaggb887mPqfySUGlyx3W+5TcBYJNAs81gx5kJAqQbBxUcbzQ18Csy
         2TnwbBzaBTWUBkeQHz0YUwXYtISIuTo4qAvbndLt3hF7PTp/eNauA1I44szElRZf4NLE
         yIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=mMY+3Iw1nj2b/Q2aQd0QfbkRs3LIlo0VEMp/wdTkYzU=;
        b=LWAgG2UE+uaBo52bOpmgR+trt7gQNElv9D6xlDEd+kEbaRAo5+DDp9a2+vkpRROtz0
         iTz2VUYoXbpXKKpw+cZ9/XIv9eDlVrs56iMyX/GssNeTalBHsRltwJrdBieBPd8uMfpB
         vWeSNq8/AHVkTXea1EM5smyloq0EgeQrKBUpTQKsnWGhmlemYE7FpF9VPzS92seUuDrZ
         QtjyiVX29IwU0Vt77O7iLSajX3pB1rWkCuADLRVgmM0P++3Sf3MgyeERIkea+KDVrd/e
         31cy80QtNMWDc30/nmdOQf8KYG8g8a/O/8ZTXDe+7afrcruowduLC6zNPdkJhTpzIeqT
         bYlA==
X-Gm-Message-State: AOAM532gmFNPu3llLdQg/eRof6Y8fOqzyEgwIqDXTvxOA8UaAXRtzO0+
	DibsZ206Q6qITaNEugglrfUszA==
X-Google-Smtp-Source: ABdhPJy0HewnFwg113y3r+Z6/CQfDLmOhTwWK/xP9EydI6agD5CNikOQNmrIwf8Hs2XiVdOi/+9mKw==
X-Received: by 2002:a05:600c:3656:: with SMTP id y22mr3072890wmq.58.1628581620128;
        Tue, 10 Aug 2021 00:47:00 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:b710:2b6e:27aa:f0a0? ([2001:861:44c0:66c0:b710:2b6e:27aa:f0a0])
        by smtp.gmail.com with ESMTPSA id r129sm19816813wmr.7.2021.08.10.00.46.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 00:46:59 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] ARM: multi_v7_defconfig: amlogic updates for v5.15
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Organization: Baylibre
Message-ID: <8e2b5139-86e6-0da3-75c4-d8df66448d51@baylibre.com>
Date: Tue, 10 Aug 2021 09:46:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

Here's a single multi_v7_defconfig change for v5.15 to enable CONFIG_MMC_MESON_MX_SDHC controller used on meson8/8b

Neil

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-configs-for-v5.15

for you to fetch changes up to c8cec81305463d042d51af946b6b273d8367626e:

  ARM: multi_v7_defconfig: Enable CONFIG_MMC_MESON_MX_SDHC (2021-07-26 09:59:09 +0200)

----------------------------------------------------------------
Amlogic ARM configs change for v5.15:
- Enable CONFIG_MMC_MESON_MX_SDHC controller used on meson8/8b

----------------------------------------------------------------
Anand Moon (1):
      ARM: multi_v7_defconfig: Enable CONFIG_MMC_MESON_MX_SDHC

 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)
