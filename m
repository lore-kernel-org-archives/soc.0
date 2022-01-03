Return-Path: <SRS0=o92n=RT=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24DE1C433F5
	for <soc@archiver.kernel.org>; Mon,  3 Jan 2022 15:13:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DB91BC36AEF; Mon,  3 Jan 2022 15:13:48 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B5FF2C36AEB
	for <soc@kernel.org>; Mon,  3 Jan 2022 15:13:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B5FF2C36AEB
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f54.google.com with SMTP id s1so70492508wra.6
        for <soc@kernel.org>; Mon, 03 Jan 2022 07:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=89lR+zDjRzcCkSkX1JPsdOu1K3piTipFhOC7dPxe4NU=;
        b=MiNyYMWW3GcSKNgz3fQmmCssLainwBBZHCJ3YU39PhwZwtQfmyuPE91qZLgVF9n70k
         2gsgJSdiHIc+rcKrtq3WNBQTwpzwinlISe7uEZtxzdzQrMZzenlb/ow0IHoiRgtH/Icp
         wjVyZB6m3Fo6EKKUTvZ/bgI330NMBWW+8/+QZnYit4pEh8/Xk1sqfEAHDpsXwrG5+LI9
         7jXbDvBfJpeyoYzbm/soUAk2qmjqtep220a9OlczV7fD2nXQgW2rzVnLrV2O2xiDmWwn
         cqGR8G/i3gbW9XO2AWKttEhP+tlLx96xzznRnKOzv7wlmOc09sshkqjcw+0tx4BukO3N
         TVfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=89lR+zDjRzcCkSkX1JPsdOu1K3piTipFhOC7dPxe4NU=;
        b=rrqNgmD5NHHPF2+K2RHref9HXB4PXQDoirxq5Id4cJzKNIp9nexiDnMTZOa23+/hMa
         J/QQZ3gH8xIIeKpB4AuvH5/WEyb5RdqTuQFYhhiDTc1sUJMMXlH5P/O/khP+f9rlId2O
         g3EQ5sDfe6u1ektZxIBdPsjjyD6j7BJdEV7X73gi3xhjiB9SNbbg4F6JG7DeqhQutUSm
         Zx/y1pEkU6MW3Pe4nzDfpxv9+J7rDf7pw6R/BWnKT5Yr8RXF0taWkSY3S7M/KrsQ7cds
         sJxv5RF21l1CP67ytB0mCS2w43BMSWSK3bl4wsweiMxRW11hi1QDF9U/gIVbfCbMYGA0
         QLwg==
X-Gm-Message-State: AOAM533m9KP1ksw42DTzKSm2LBLEl5xBtjNhOfR2wfsD7AA5feok58Cr
	FfPE9hz5ru2/Cs+l1Y6nCXNe1Q==
X-Google-Smtp-Source: ABdhPJyYYTVZc/KWM1oNKQXkmdI6QONhDN1vhFHfjzjzyoFH47Tp/AQ+SoEvN8MixV+xRd+zij0iuw==
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr39331141wrw.116.1641222825999;
        Mon, 03 Jan 2022 07:13:45 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:7c9d:a967:38e2:5220? ([2001:861:44c0:66c0:7c9d:a967:38e2:5220])
        by smtp.gmail.com with ESMTPSA id d143sm33347662wmd.6.2022.01.03.07.13.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jan 2022 07:13:45 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] amlogic fixes for v5.17-rc
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Organization: Baylibre
Message-ID: <7e40328b-6645-4343-3050-73dcfb2cefcb@baylibre.com>
Date: Mon, 3 Jan 2022 16:13:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

Here's a couple of DT fixes for v5.17-rc1, they fix the UART compatibles of
the ARMv7 Amlogic SoCs and by the way keep earlycon working after [1] has been
applied by greg in the tty branch for 5.17.

I know it's early for 5.17-rc1, but at least it's in the pipe.

I based the changes on your dt-5.17 tag pushed to linus for 5.17-rc1,
if necessary I can rebase on v5.16-rcX.

Neil

[1] https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?h=tty-next&id=ad234e2bac274a43c9fa540bde8cd9f0c627b71f

The following changes since commit 8b0c59c622dc4dab970ec63264fb5b152944ac80:

  Revert "ARM: dts: BCM5301X: define RTL8365MB switch on Asus RT-AC88U" (2021-12-23 00:18:45 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-fixes-v5.17-rc

for you to fetch changes up to 7a31a29b35386b6d6aa622d68acd31739a3a8ac5:

  ARM: dts: meson8b: Fix the UART device-tree schema validation (2022-01-03 15:49:56 +0100)

----------------------------------------------------------------
Amlogic fixes for v5.17-rc
- meson6/meson8/meson8b UART compatible fixup to fix earlycon

----------------------------------------------------------------
Martin Blumenstingl (3):
      ARM: dts: meson: Fix the UART compatible strings
      ARM: dts: meson8: Fix the UART device-tree schema validation
      ARM: dts: meson8b: Fix the UART device-tree schema validation

 arch/arm/boot/dts/meson.dtsi   |  8 ++++----
 arch/arm/boot/dts/meson8.dtsi  | 24 ++++++++++++------------
 arch/arm/boot/dts/meson8b.dtsi | 24 ++++++++++++------------
 3 files changed, 28 insertions(+), 28 deletions(-)
