Return-Path: <SRS0=hErb=ST=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C8BAC433EF
	for <soc@archiver.kernel.org>; Fri,  4 Feb 2022 08:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1B66BC004E1; Fri,  4 Feb 2022 08:30:32 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 80073C340F3
	for <soc@kernel.org>; Fri,  4 Feb 2022 08:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 80073C340F3
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f53.google.com with SMTP id l67-20020a1c2546000000b00353951c3f62so2780463wml.5
        for <soc@kernel.org>; Fri, 04 Feb 2022 00:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:subject:to:cc
         :content-language:organization:content-transfer-encoding;
        bh=n3eiY4UY+ypB+x0APz9a4v6wlKAJG1IUhoWJAuUwkZ8=;
        b=a5jOP3KlT4ruvckUxtmgxMVm57m8VSbnvFBiPb1KUMjLTwLzKRQW0bREWTJpwcAuHU
         aspOIjZTsC+X9RWhCmZFjDwDkBKCdjQQ2u8yLD+ewYOeVFcak96FvAIbtm8qjZsB1SqT
         zXO6VaD5GxcBllVmYKfW7d1k7S6ONC2tyK490KC06w28XWW7psf1GUdKj40IOlq8IzD7
         5BHRgzn20mFRsRCaoL4XmzP8UmaiY3kOJdaV8GiklxrA4oNdL87jTTlN9sRQP3ZyLKas
         n61xkGHHrw2cXJt4zGARy1kLU+cdNo3aXTC9vTU7L7/lt4G1S9ta3HwxwwdzEsTk3tiG
         83jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from
         :subject:to:cc:content-language:organization
         :content-transfer-encoding;
        bh=n3eiY4UY+ypB+x0APz9a4v6wlKAJG1IUhoWJAuUwkZ8=;
        b=52XAvtGZNFCq9tqlysp4geExUWZ7cfanN2gRxaoCSdpLOo65sVCLYneJfw1tVoyHp9
         bAvE7qUdc2PrVgG1KnTIeQ240CWxIL++ITG2g2p3KccjDdvUmb5ZY7tQ7CJgJB4t15Yl
         Q/tWmnBHNvyEU/TD9lRWyzUgFDNar2DQGcI8p7csBlKYrJomrKN3pwYQ9wFDRCb9kM3O
         baLbmglFr7+H6vAW3nHYffUQTrx4Rcm9RxZHvb1A3e9OFyy8gcfVofiFZ+smqiFtFYeS
         qThkl+QZbdFp1XCTAFTpWCfN9LsNJtngqf2bS5iV9wd+y51FvI9JN0g51IIVumxTBIpR
         Peuw==
X-Gm-Message-State: AOAM5315UyRYwtA2NeWFXqtHFKcAqJzm6bpuvE0Q7NfuwXYnw1CW+zDI
	1ThZ2IKy7QjcPvzgmW3u/ejUYKSwB2PzNG0n
X-Google-Smtp-Source: ABdhPJwonSn2Lz6t7fGCm6dJtEjTJNAFwO2Sj1qk2OeVLsQMpF6FKIXNYWwPnLhzkVqhNh2ou5iJQA==
X-Received: by 2002:a7b:c744:: with SMTP id w4mr1276112wmk.113.1643963428449;
        Fri, 04 Feb 2022 00:30:28 -0800 (PST)
Received: from ?IPV6:2001:861:44c0:66c0:3fbe:ff10:110:739? ([2001:861:44c0:66c0:3fbe:ff10:110:739])
        by smtp.gmail.com with ESMTPSA id m64sm960125wmm.31.2022.02.04.00.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Feb 2022 00:30:27 -0800 (PST)
Message-ID: <67888f6a-f4ff-9569-131a-0c7baba6ddaf@baylibre.com>
Date: Fri, 4 Feb 2022 09:30:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] amlogic fixes for v5.17-rc round 2
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US
Organization: Baylibre
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's a couple of ARM64 DT fixes for v5.17-rc1, they fix reserved memory zones
for the whole Amlogic SoC families, some typos for the Odroid & BananaPi board
and a reboot issue on the Odroid-C4.

Neil

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

   Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git v5.17/fixes

for you to fetch changes up to e6b03375132fefddc55cf700418cf794b3884e0c:

   arm64: dts: meson-sm1-odroid: fix boot loop after reboot (2022-02-04 09:20:41 +0100)

----------------------------------------------------------------
Christian Hewitt (3):
       arm64: dts: meson-gx: add ATF BL32 reserved-memory region
       arm64: dts: meson-g12: add ATF BL32 reserved-memory region
       arm64: dts: meson-g12: drop BL32 region from SEI510/SEI610

Dongjin Kim (2):
       arm64: dts: meson-g12b-odroid-n2: fix typo 'dio2133'
       arm64: dts: meson-sm1-bananapi-m5: fix wrong GPIO domain for GPIOE_2

Lutz Koschorreck (2):
       arm64: dts: meson-sm1-odroid: use correct enable-gpio pin for tf-io regulator
       arm64: dts: meson-sm1-odroid: fix boot loop after reboot

  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi     | 6 ++++++
  arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts     | 8 --------
  arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi | 4 ++--
  arch/arm64/boot/dts/amlogic/meson-gx.dtsi             | 6 ++++++
  arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts | 2 +-
  arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi     | 2 +-
  arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts      | 8 --------
  7 files changed, 16 insertions(+), 20 deletions(-)
