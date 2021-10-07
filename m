Return-Path: <SRS0=BHr2=O3=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98016C433F5
	for <soc@archiver.kernel.org>; Thu,  7 Oct 2021 09:44:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7D879611C1; Thu,  7 Oct 2021 09:44:01 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6480A6113E
	for <soc@kernel.org>; Thu,  7 Oct 2021 09:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6480A6113E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f54.google.com with SMTP id r10so17160113wra.12
        for <soc@kernel.org>; Thu, 07 Oct 2021 02:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=QD+HD8BwN73T8hSH2EBA+YOCVTYU3XnPzy636LmBS7o=;
        b=77LbEWi0vaKzcvkgwF/xS3QtpVUTmzCtksMCJD5VmVOdHu1Jo0ROokYFfSD1hZOlAS
         c800Au2cPgl5dm4KUrwwIVb43QBNFa+2geFuwflK4DnSVK8l/9LB1tdR8IdqPn2mvZxj
         PnBx7+GQtkrIbJBZNeQDrgwK9GgDWlTiT1cW/0f45/34z8iGP5JAaZK5YnYpEETxPV5C
         0HSkn8A8powgFT8SB5yL62hrQPBvm0wP+1p53O8NaoOQgoPTyEecAMtfh4qlyszBlEgx
         aMhvm55OPtGG4R4F2WW5mIOU/RyO60OK39mac3wbZvuaxOWuNFPv1NZcHqpLpesc/qfi
         7fvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=QD+HD8BwN73T8hSH2EBA+YOCVTYU3XnPzy636LmBS7o=;
        b=pheHF5AmHVrZ1mXRA0HNvyA8icqF7Trm4B6zNpbmAcUG8KpYrB3z7ZCzoRg2VQnD2I
         TOvW21Y963ZdO7erj1b7QMXwx22I2FM03hmuwjyk3lqhRtGmh4pK2WHMYP8W/w6/9ofZ
         +zXMZ3eKBskoND5MhOnO6/Si2+KuHTT1jRTO0ssYryyobvVzb+em3I2aC3wrQu90DMtb
         EADvY3rSBcfwMluiG1J4MGq5Dx+Nlmb9jvzuX+Y1Kls0i9mQfDxa2rAaq/CVs609cm0W
         McAUpr/gRyLPv+pRl2wsIJVDtxIAsNvx1p9ouFYLCdKR4R5HEq9uEvpKMzcsFHwkgx6r
         i/0w==
X-Gm-Message-State: AOAM532tVi6rbX9xLTEBDzOaaU6JGkDoqNpd5mmX+77qTGxaiLVeMkZ+
	idmg/Nwg55W5TLOGXfe7cF6uhbsy6yqm9Q==
X-Google-Smtp-Source: ABdhPJxsFjLkZCniD6IRfiQRZ1/fv1t8CsejyLmU0BUJ0vQjW8kY3wWkxuEy5oj48ajwm/byNtbejg==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr4105039wrs.84.1633599838932;
        Thu, 07 Oct 2021 02:43:58 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:4e6:6eee:3312:b574? ([2001:861:44c0:66c0:4e6:6eee:3312:b574])
        by smtp.gmail.com with ESMTPSA id k18sm7414519wrn.81.2021.10.07.02.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 02:43:58 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] soc: amlogic: driver updates for v5.16
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, "arm@kernel.org" <arm@kernel.org>
Cc: linux-amlogic@lists.infradead.org,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Organization: Baylibre
Message-ID: <f8e020d3-29f7-0745-3864-01975edd20f7@baylibre.com>
Date: Thu, 7 Oct 2021 11:43:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

Please find for v5.16 two devm_platform_ioremap_resource() updates and a change adding a new SOC ID used in the new Radxa Zero board.

Neil

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v5.16

for you to fetch changes up to d54dbe9f0ec05935e10d6a38d81e54e2ec8b8a68:

  soc: amlogic: meson-clk-measure: Make use of the helper function devm_platform_ioremap_resource() (2021-09-13 09:43:00 +0200)

----------------------------------------------------------------
Amlogic Drivers updates for v5.16:
- soc: amlogic: meson-gx-socinfo: Add the SOC ID for the S905Y2 used in the Radxa Zero
- soc: amlogic: meson-clk-measure/canvas: Make use of devm_platform_ioremap_resource()

----------------------------------------------------------------
Cai Huoqing (2):
      soc: amlogic: canvas: Make use of the helper function devm_platform_ioremap_resource()
      soc: amlogic: meson-clk-measure: Make use of the helper function devm_platform_ioremap_resource()

Christian Hewitt (1):
      soc: amlogic: meson-gx-socinfo: Add S905Y2 ID for Radxa Zero

 drivers/soc/amlogic/meson-canvas.c      | 4 +---
 drivers/soc/amlogic/meson-clk-measure.c | 4 +---
 drivers/soc/amlogic/meson-gx-socinfo.c  | 1 +
 3 files changed, 3 insertions(+), 6 deletions(-)
