Return-Path: <SRS0=ZBDT=S3=linaro.org=linus.walleij@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B6DC433F5
	for <soc@archiver.kernel.org>; Sat, 12 Feb 2022 21:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 84E77C340F0; Sat, 12 Feb 2022 21:16:18 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E2853C340EB
	for <soc@kernel.org>; Sat, 12 Feb 2022 21:16:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E2853C340EB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id y129so35098275ybe.7
        for <soc@kernel.org>; Sat, 12 Feb 2022 13:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=f3KeVesP2vd363zfEtsmU3da/A6upDmTpbUOwmM5geM=;
        b=LAeg+ZFVUpX6TtUy6frcBVIeEM5Q/7BIfFNgk+AKxsT5LFk7QDoJbbomL2D4kOjtX9
         sEnHebxOuHtKt+1gFrXxigv39HO0p/E/Eqxv8BJJOaZKi/+dr9FcHbTqKx0PfIrOyI8N
         A50YWUCCHs9EPk4DG6d24ifF6fQFRGoDx5IZ5vpnhOlXRWWknwIbsR0Ti0YpTZ4eY/WM
         gxW7m1UhOgj9HKCgAaEQyJpCsJqzuz7lthUCfoKEk0ZA+xi+BesvHmrWcRG0nqKj0m68
         TI1OUesejOmoKC09DOv3dgqDgtE33PUhcI8Mj37FMFfR6K/oMvWUSdim9tW/ZTYKtWiG
         w5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=f3KeVesP2vd363zfEtsmU3da/A6upDmTpbUOwmM5geM=;
        b=glsWs4raJKnavjeJMMxAIvjpNeAOR5u2Xg3IDO5gOB3FwuJZIKoHTwxZ7RK6a80lFl
         OaDYJDB4wsAWAxYQbqOk2uoOsxqRRObaO5dC5r10C/gnYdAGxd6rzsLUO4iHH4YLLTga
         kKRMchDevVM+x3pLBwgjswZAXcrjAbcaYk5Lb6vGgXY7JAXnvzwM2aCCJL4xseopcJGW
         lguTp97CthWBuQiTJMEMpplU8v9heQEQSbEKPzNncHi3QJHhR3rod71ciFjBRgoK/e6H
         2gQSEXGaQSx6HeCoPQy5yy4hgc3suaUDNZQjRqrO7xrR1ddN4zxZBLsnKM8ahmyS9fYv
         1hoA==
X-Gm-Message-State: AOAM533MxahWhd6cwzmh30y414bK2jcv7SazyViOdCFNg9OkQku2H2Y0
	9ZbquyrAK51Xmok36T6vRZrr/fwDT3uxcMEHfYHv3IozsmJytWJX
X-Google-Smtp-Source: ABdhPJyTHg80BPHvYYcYrRZ/ckU9k8OlWuIYGa3uy+2XcYdfm6Zq8fEm2fBYZx/kC1fADOWskKKnnCI+MCc4HnrnB8k=
X-Received: by 2002:a81:b624:: with SMTP id u36mr8161075ywh.437.1644700576767;
 Sat, 12 Feb 2022 13:16:16 -0800 (PST)
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 12 Feb 2022 22:16:05 +0100
Message-ID: <CACRpkdaMk+XECwhXJYeiF8SMU6cQsj_dk8gGMoPE3zAURAPqTw@mail.gmail.com>
Subject: [GIT PULL] IXP4xx DTS changes for v5.18
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Corentin Labbe <clabbe@baylibre.com>, Imre Kaloz <kaloz@openwrt.org>, 
	Krzysztof Halasa <khalasa@piap.pl>
Content-Type: text/plain; charset="UTF-8"

Hi SoC folks,

these are some IXP4xx DTS updates. One of them to extend the
syscon size is important to the cleanup series (submitted separately).
The rest is business as usual.

Please pull it in to an appropriate DTS branch.

Yours,
Linus Walleij

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
tags/ixp4xx-dts-v5.18

for you to fetch changes up to 8d3ca344bb6aefd8dbf554db18b18611e01d3ab6:

  ARM: dts: Drop serial 1 alias on GW7001 (2022-02-12 21:54:00 +0100)

----------------------------------------------------------------
IXP4xx patches for the v5.18 kernel cycle:

- Fix up the WG302 to support the v1 version (also tested)
- Fix up the syscon size
- Drop the alias for UART1 in GW7001

----------------------------------------------------------------
Linus Walleij (3):
      ARM: dts: ixp4xx: Fix up the Netgear WG302 device tree
      ARM: dts: ixp42x: Expand syscon register range
      ARM: dts: Drop serial 1 alias on GW7001

 arch/arm/boot/dts/Makefile                         |  2 +-
 arch/arm/boot/dts/intel-ixp42x-gateway-7001.dts    |  3 +--
 ...g302v2.dts => intel-ixp42x-netgear-wg302v1.dts} | 29 +++++++++++-----------
 arch/arm/boot/dts/intel-ixp42x.dtsi                |  2 +-
 4 files changed, 17 insertions(+), 19 deletions(-)
 rename arch/arm/boot/dts/{intel-ixp42x-netgear-wg302v2.dts =>
intel-ixp42x-netgear-wg302v1.dts} (77%)
