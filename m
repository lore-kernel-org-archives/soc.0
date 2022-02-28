Return-Path: <SRS0=BPsZ=TL=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456ACC433F5
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 09:00:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2D1FDC340E7; Mon, 28 Feb 2022 09:00:30 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4B9CBC340F2
	for <soc@kernel.org>; Mon, 28 Feb 2022 09:00:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4B9CBC340F2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f50.google.com with SMTP id d28so14250660wra.4
        for <soc@kernel.org>; Mon, 28 Feb 2022 01:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:subject:to:cc
         :content-language:organization:content-transfer-encoding;
        bh=H8bizYJqwkzoCHttqot6/S0biAEi5EvteUjQXBDh6Lg=;
        b=a1wRgWkit2Hgi/TlfA+U8FW05MLaahdsaAVn3imJj7U3TfbN9ZWpzAN6+/pbiyClHk
         vsodzq2rThRbmEy1dv7jM8B3WQ+/4xLRiBr5GdHmYrsMBjknFjw3q+K+w4HGWIaGNzbD
         1mqQSk6VWkyTVwwWYy4EPgytB92cWIlCTSGkk678OOON/Gq8npro52MZqqTcE1EAEeRC
         tq18sI6I/+WMDTxBg6hV4qymxaJO2aq8WH6IPQJFdBZLMfaWqgfWugbst8AQ8e+ZoPMH
         kwNonhQTeumxck42lKfP4Ha5eOJ9zKWrk/wFxxwaIHHDFVB+bcmb9XCcrFJRdfUpCaiX
         nDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:content-language:organization
         :content-transfer-encoding;
        bh=H8bizYJqwkzoCHttqot6/S0biAEi5EvteUjQXBDh6Lg=;
        b=CY74g+YGmodUyj2/RIma5J2VzHkrmkpJj2yNvALGGdW9n9DLGuoVaAss8P76w008c8
         JYKgs/j726uVEs8csoqgk2Wlo6LP/mKCalp3ibfSfaJZrqM9gd2blBQWLsrHM/iUERXL
         jDqW0XshaA2sKnzMdLg6Pwp2YUWdsi5SZMJS698yTRLyoyyGZneqAIzYvPB5hDEW+tW8
         f9jZiHHGjhZ7OcLC/7b5y38m44fNKnSc1k7zPfr54AI5ffJM3XeHKcM1g7C1Iza5aQsA
         gHYUattUNB7JTw2uYCUepkB5Y6Fc/qcWKf4o2Eh5IkRuGB0V9YNLq62I1Xj+jbj8eE7v
         F5kw==
X-Gm-Message-State: AOAM530vXaZ/aGVbXrd+r+uYd54ECZ8zEXb37+98x3LermoEMyz8NDgA
	pRKkaRWjZTYIHK/nfLUva/1kc4OtgjJzfUw9
X-Google-Smtp-Source: ABdhPJwU8NEjIMff5919wlS+clhon3+HVP5ZyPM44A0GhFvTUZVS7uEb34T1bi70ESGYlMPWwb2S9g==
X-Received: by 2002:a05:6000:1565:b0:1ea:6673:c0b5 with SMTP id 5-20020a056000156500b001ea6673c0b5mr14629400wrz.469.1646038825203;
        Mon, 28 Feb 2022 01:00:25 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:6431:1dc7:b58f:6282? ([2001:861:44c0:66c0:6431:1dc7:b58f:6282])
        by smtp.gmail.com with ESMTPSA id l2-20020a05600c1d0200b0037cdeb03977sm11700549wms.18.2022.02.28.01.00.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 01:00:24 -0800 (PST)
Message-ID: <530fd72c-e28a-4d5e-cb8d-8b3fbc1df89a@baylibre.com>
Date: Mon, 28 Feb 2022 10:00:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PULL] oxnas DT for 5.18
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-oxnas@groups.io, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Baylibre
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Please pull this single change enabling ethernet on the OX810SE based board.

Neil

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/narmstrong/linux-oxnas.git tags/oxnas-arm-soc-dt-for-5.18

for you to fetch changes up to b88ffa66d530ba01ec64b1f5eeb74f8b8ce61d7f:

   ARM: dts: ox810se: Add Ethernet support (2022-01-25 18:03:04 +0100)

----------------------------------------------------------------
- Add Ethernet node for OX810SE base board

----------------------------------------------------------------
Neil Armstrong (1):
       ARM: dts: ox810se: Add Ethernet support

  arch/arm/boot/dts/ox810se-wd-mbwe.dts |  4 ++++
  arch/arm/boot/dts/ox810se.dtsi        | 18 ++++++++++++++++++
  2 files changed, 22 insertions(+)
