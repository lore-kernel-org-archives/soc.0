Return-Path: <SRS0=4jlH=UV=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A1AC433EF
	for <soc@archiver.kernel.org>; Mon, 11 Apr 2022 16:18:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4C215C385A9; Mon, 11 Apr 2022 16:18:46 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DD3BCC385A4
	for <soc@kernel.org>; Mon, 11 Apr 2022 16:18:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DD3BCC385A4
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f51.google.com with SMTP id 123-20020a1c1981000000b0038b3616a71aso10375210wmz.4
        for <soc@kernel.org>; Mon, 11 Apr 2022 09:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:from:to:cc:subject
         :content-language:organization:content-transfer-encoding;
        bh=KZq1JNDvgY016qnbiQ72f4znC/LoDLkQblMhqS61dJ0=;
        b=f+HXwO+yMXwMWGYaAvM/xqbwSkOsNxbwuphhjrnjROFRsPNUBGgwR2tVnnFNjOAwgA
         QOVFahZy1ywrG+D19J+Ncs+gLhmktS2F9DDNUjRuIMWZTNR3ostTu86vk1MEAJAhKSrl
         bLxeT1NGFEi9T3aY1vFgP+rGLf/sZ1lbAh2HHvvH+FUpbdMXplbJ5AG0vNyx7PJuLW0v
         GtjwxXLvBrsi8m/h81h6BCan3fyX+SWdtq+j/ciKreefGfNBaZQBfvzyPIOq0ZKpUjVN
         JbXJcOp5OGp9e7Bw9oA9j52aBqmAq7OLHfp8XEXBMW2niHdZkUNdnGcskqu1fzDxu6o5
         Bc0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:from:to
         :cc:subject:content-language:organization:content-transfer-encoding;
        bh=KZq1JNDvgY016qnbiQ72f4znC/LoDLkQblMhqS61dJ0=;
        b=rn3jJL/yalS5OU69IupK2VS9GxuQNH0j03ZSowSHw3BEr2a7teSJKHui3ITlTjCDwd
         dCKAljgi36zuULjmt71eGHT4VpJjdauqEdyJNubo+VjiPJg7BZMk1UFxwNLcyalXvmCX
         Ca/0mS1HPdcmy4yDMiRuTvIpg66aOkfK8H/TurLbp4KlQsFdHxC/DWAnHyMP+s5iOCK/
         V3WnuA3uukCT2ZCa1emLyVIDD0CMAwfkYe1CS7JviopAUrlLnQqEsvPZCOdhZjVkbmQ7
         5WQbWR3mpU4MSsCZZqE+QYc1jcap/xLlpJRgPqElwyaMuRyMLfLw3RgXNUI7HXnMRbIm
         qi/A==
X-Gm-Message-State: AOAM53291GO5r10RGUzrGb7v+/8YZgpPVQRy+KRvsAlNOKIo+3UJ48SD
	1gIC0UxsWVeQph2JCIeeTZ9f0ZzG8A5uzWke
X-Google-Smtp-Source: ABdhPJyZnh7jZqpnPva4AxZxoSafP/Ev3VW0bBx4kbSLfbsVVZShVO9R+ezV+gt54W5hf1nWwV/4Yw==
X-Received: by 2002:a7b:cb84:0:b0:382:a9b9:2339 with SMTP id m4-20020a7bcb84000000b00382a9b92339mr30483518wmi.91.1649693922908;
        Mon, 11 Apr 2022 09:18:42 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:d1:e096:d183:1bc5? ([2001:861:44c0:66c0:d1:e096:d183:1bc5])
        by smtp.gmail.com with ESMTPSA id n15-20020a5d6b8f000000b00207ab69284csm1119381wrx.23.2022.04.11.09.18.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Apr 2022 09:18:42 -0700 (PDT)
Message-ID: <1132bd6e-cd29-6e58-1fae-38e074545b25@baylibre.com>
Date: Mon, 11 Apr 2022 18:18:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
From: Neil Armstrong <narmstrong@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] amlogic fixes for v5.18-rc
Content-Language: en-US
Organization: Baylibre
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Here's a couple of DT fixes for v5.18-rc1, first removing the unstable lower OPPs
for the G12B & SM1 in order to increase stability over time, then fixing the S4
cpu compatible and finally fixing the GPIO Line Names for the BananaPi M5 board.

Neil


The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

   Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git v5.18/fixes

for you to fetch changes up to 962dd65e575dde950ef0844568edc37cfb39f302:

   arm64: dts: meson-sm1-bananapi-m5: fix wrong GPIO pin labeling for CON1 (2022-04-11 17:53:38 +0200)

----------------------------------------------------------------
Christian Hewitt (2):
       arm64: dts: meson: remove CPU opps below 1GHz for G12B boards
       arm64: dts: meson: remove CPU opps below 1GHz for SM1 boards

Guillaume Giraudon (1):
       arm64: dts: meson-sm1-bananapi-m5: fix wrong GPIO pin labeling for CON1

Xianwei Zhao (1):
       arm64: dts: remove cpu compatible "arm,armv8" for s4

  arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi  | 40 ----------------------
  arch/arm64/boot/dts/amlogic/meson-g12b-s922x.dtsi  | 40 ----------------------
  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          |  8 ++---
  .../boot/dts/amlogic/meson-sm1-bananapi-m5.dts     |  1 +
  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi         | 20 -----------
  5 files changed, 5 insertions(+), 104 deletions(-)
