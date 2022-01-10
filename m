Return-Path: <SRS0=uEZM=R2=baylibre.com=narmstrong@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AFCC433EF
	for <soc@archiver.kernel.org>; Mon, 10 Jan 2022 09:38:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 92679C36AF2; Mon, 10 Jan 2022 09:38:52 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9DB3CC36AE9
	for <soc@kernel.org>; Mon, 10 Jan 2022 09:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9DB3CC36AE9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wr1-f45.google.com with SMTP id k30so7955301wrd.9
        for <soc@kernel.org>; Mon, 10 Jan 2022 01:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:subject:to:cc:organization:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=2YeFgGQa22EvUJnP5dVOotBttSSfSVW3DW98txNGYvs=;
        b=yBt4J66ihEwWZSB3g9d8wfypAXrZHXBZZgZ92Xyw2PmFATyjDIYEqCggphiilnRiwm
         NqvjlbYmBmC9lZB/E7qFMfgMzH6gSUIe9C0vbSXw3miCUh+m5V2S7TL901FGL+61WPBb
         qY8DRuVFw4Ae/CvM3bokcZTPA0kMVA6wWegcUYE1ExqIyNWqMVxzRNTqF6XPwOQitQDp
         Gx3X70BgoCxbrc6lbaykRwcynQgoLHKxWJO0ztdbqOd3qY0dB6iiVAvYnVT+NWDtKvmW
         WlfK4ewqvmZIH3QVAfL9VjL9wFUtzDChlgfvsMm/F+retUWPIIBwmvBvEGD3NNG7qzYQ
         Tvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=2YeFgGQa22EvUJnP5dVOotBttSSfSVW3DW98txNGYvs=;
        b=RtdSjcATPdgj3B7+ufyY3oRm5OMpXUa7CrQN2yH2/bhvAIht5bzBgPEaGv6ofZww+f
         N8up48EyKkFeY3ZQhFYYJzl3U3rLg/buzqyDHGtk7917iKqFdYPQDCbV6cV7XUSF8Ovs
         Z/LWiX67a+3mpaPLvbgD5nwQ/nzfYBPSDkPpPCMRl+pvpS0I1/5Lw/FEt83uLi8WZBjD
         t02qYvUIP7Md7SGzq1DQL4iuSuz6iiom6ucYgp8t02uHVB7ONvX4keYAQ9nA/VZXtg2i
         RQn1XEKs6Dd5Lyi6tw4xZqES0pzpmkw65GteNbCu/GKoQSmcRZLXTR+khyeGQI31lsRr
         bBpw==
X-Gm-Message-State: AOAM533FJTdGdtel3NzJxU//kXYz+4lJsEbK22HjxEsMUHBJNAMtBQ7i
	Sh5KPQAVvOVhp+hCNl+tqpRgsg==
X-Google-Smtp-Source: ABdhPJyFysIgoti8Q5dwJFHgF/s8l7aYP1rfXoWSMloAz9bwGIlO3l/ATsUFIsQjyE5eUNOuFucQjw==
X-Received: by 2002:a5d:6884:: with SMTP id h4mr56395wru.640.1641807529828;
        Mon, 10 Jan 2022 01:38:49 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:94e5:2e36:6bcc:a9f1? ([2001:861:44c0:66c0:94e5:2e36:6bcc:a9f1])
        by smtp.gmail.com with ESMTPSA id u11sm6422912wmq.2.2022.01.10.01.38.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 01:38:49 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] amlogic fixes for v5.17-rc v2
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Organization: Baylibre
Message-ID: <746a7f25-1c96-9d27-3a08-e86b2af608ef@baylibre.com>
Date: Mon, 10 Jan 2022 10:38:49 +0100
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

Now based on my previous arm DT tag touching these files, sorry for v1.

Neil

[1] https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git/commit/?h=tty-next&id=ad234e2bac274a43c9fa540bde8cd9f0c627b71f

The following changes since commit 72ccc373b064ae3ac0c5b5f2306069b60ca118df:

  ARM: dts: meson8b: ec100: Fix the pwm regulator supply properties (2021-07-26 10:05:36 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-fixes-v5.17-rc-v2

for you to fetch changes up to 3375aa77135f6aeb1107ed839a2050a4118444bc:

  ARM: dts: meson8b: Fix the UART device-tree schema validation (2022-01-10 10:32:51 +0100)

----------------------------------------------------------------
Amlogic fixes for v5.17-rc
- meson6/meson8/meson8b UART compatible fixup to notably fix earlycon

----------------------------------------------------------------
Martin Blumenstingl (3):
      ARM: dts: meson: Fix the UART compatible strings
      ARM: dts: meson8: Fix the UART device-tree schema validation
      ARM: dts: meson8b: Fix the UART device-tree schema validation

 arch/arm/boot/dts/meson.dtsi   |  8 ++++----
 arch/arm/boot/dts/meson8.dtsi  | 24 ++++++++++++------------
 arch/arm/boot/dts/meson8b.dtsi | 24 ++++++++++++------------
 3 files changed, 28 insertions(+), 28 deletions(-)
