Return-Path: <SRS0=W1zo=NB=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD9EC4338F
	for <soc@archiver.kernel.org>; Tue, 10 Aug 2021 07:44:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 814026101E; Tue, 10 Aug 2021 07:44:38 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 704FA60F38
	for <soc@kernel.org>; Tue, 10 Aug 2021 07:44:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 704FA60F38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f53.google.com with SMTP id m12so24937823wru.12
        for <soc@kernel.org>; Tue, 10 Aug 2021 00:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=MiCMBWeN2PpiCfpnHSh2SkMrcXWi1PWXVgHWoU9qVss=;
        b=qAHHSc4P4i607lJZ5A0MF2XRZnz6tj9nU8fB96XaHXsJ2npo1mCRoT2BexDAaRnUJO
         TrzZLvs8X0Dknhmw6Mor8bcUQFr8eXkqVosiwzZkaO+FWi/psTOrB97+716tGAUHRvsP
         dzH7PoD3PmCf1oylxYUdGd9opdPSueelQmvxAWZ/zZEa0ql20iKlTrPGcdHMh4VS8KFk
         t+XJEBLMHhKTD98NAlugYzs0Vi8HiSXVBYxGN9pyrNu5EA6IyogYpw4HSz4zICDc7ueB
         JqzFvMmvM9BAiKO0bdp/QJXjO3uEGCHHbfUrJmvBfegawrQEIojdzwaRhV8T7Hr+Fomy
         UmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=MiCMBWeN2PpiCfpnHSh2SkMrcXWi1PWXVgHWoU9qVss=;
        b=dWDgyi1MZ5h5F4BJCBBmQ/ZImfPMBIxtSiZCDD+QBeCCOlLdIdSwXyy1uT/2u6km+A
         mONlJ68Si7DEyuhehYYMjqq+elgypDCflW8o2tfKcNdZtHM4vK7YzQPJspOx2GuoYqxv
         s2+ENcZtYXJmnDvXMDsgQUgVpliv07X1BS7zCZEWMMI10/BeNtktDoPPY0AqGd+U7dWt
         um2IPlwA2HBxqcX1l8xlifZAe6rey4CsZCeOGo44X1gD1YGKvO9vLjgAIMbSSqgJzuIC
         GcyKcc65roFLfj94F35nuJXXY2XYZimgYCIefDNvohMHuLGhN0Yd3lk4Mh9hQukDCtkl
         aSKw==
X-Gm-Message-State: AOAM531oURFIWuIFA/fqfhZ5qTx807Q9Uro9kn4YwwtCLQuOP/2tr/wk
	5muQMuyhskLyMGg08u5558K7nQ==
X-Google-Smtp-Source: ABdhPJy0PWFVjxxJf2WgN7HTFJnPxgaYwi+j07qhXCNjIe84rGnHhSifuXv11STOFdZMoJeKO36iNQ==
X-Received: by 2002:adf:dd47:: with SMTP id u7mr11880838wrm.425.1628581475854;
        Tue, 10 Aug 2021 00:44:35 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:b710:2b6e:27aa:f0a0? ([2001:861:44c0:66c0:b710:2b6e:27aa:f0a0])
        by smtp.gmail.com with ESMTPSA id l41sm716352wms.2.2021.08.10.00.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Aug 2021 00:44:35 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] arm64: dts: amlogic updates for v5.15
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Organization: Baylibre
Message-ID: <032895d9-62b6-6c9e-b04b-9c3d316f27ec@baylibre.com>
Date: Tue, 10 Aug 2021 09:44:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

Here's the ARM64 DT changes for v5.15:
- nanoki-k2: enable bluetooth
- khadas vim & vim2: improve wifi

Neil

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v5.15

for you to fetch changes up to 4b5260032ec691b11a9185f7f38f5761e67fab48:

  arm64: dts: meson: improve gxm-khadas-vim2 wifi (2021-07-26 10:08:16 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT changes for v5.15:
- nanoki-k2: enable bluetooth
- khadas vim & vim2: improve wifi

----------------------------------------------------------------
Artem Lapkin (2):
      arm64: dts: meson: improve gxl-s905x-khadas-vim wifi
      arm64: dts: meson: improve gxm-khadas-vim2 wifi

Chen-Yu Tsai (1):
      arm64: dts: meson-gxbb: nanopi-k2: Enable Bluetooth

 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts       | 13 ++++++++++++-
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts |  2 ++
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts      |  3 ++-
 3 files changed, 16 insertions(+), 2 deletions(-)
