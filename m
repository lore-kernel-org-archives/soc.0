Return-Path: <SRS0=fljr=5Y=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4476C61DA4
	for <soc@archiver.kernel.org>; Fri, 27 Jan 2023 16:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 85B0EC433A1; Fri, 27 Jan 2023 16:37:24 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7B689C4339B;
	Fri, 27 Jan 2023 16:37:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7B689C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id y19so5233343edc.2;
        Fri, 27 Jan 2023 08:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCCAhjEj/wQuIkscpSC6P99O36fA8Kgf9ACNlg6MuGA=;
        b=EMTBGGv7Q3hRuONlL9HHrk7EGXajxLq9bs1/PoyYUUPw2UQdyvSGS54NtpQKojDmOF
         0uhQIBY4cNlymGuDVYADEA3i5QJ4VvidIQXLaT7kjyrjUPfMndPi5K7BHIRWOHOphNPH
         ES8zKIO1jLbWjnlUxAoSskDbNNKbIDxnG9WaaJXDcPm1GC1jYiSi4JcJ6SqbSqMdhAtH
         jSRHgGX4Qd495MVMA931JkcyyT1fo0Ijtxdb/JVXeaSzaUxzHid8/a3/TJuJ2T6uQbmi
         kTlhBWYxkDRNBNiynqbzArOQadshZ9daOlCf7BRvcXR0ae4bKdN4/QbitAjsJHunRVlp
         f6EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCCAhjEj/wQuIkscpSC6P99O36fA8Kgf9ACNlg6MuGA=;
        b=71/GimthOOuerT9dvlvFObVowAswZvAzFzSTdrFusPsz9JrzfbNjkbxpb0dndMk0mX
         8jtTVQVDgL7pCHErzl7VpQsbp4/d6pYenjPENmQnd5nj1RW2n8xeTHTEAZt4ZZ9SAuko
         IdzUJricHvnIXPkOYKoiaG0n0t5eK039y2sJ0aeJZ8hdCLANWXg5Mkgn39uH1UHHH3yV
         TmzPhaHdlTpbHcvQoPJZKLze1wh8FM2DIIiGgQcLALLLmyuIqp3OCeOw/Gku1F/RoiM+
         5J57NgqXCQbbnxSEMWmDePJadLjd9eYJf5dvpxfsMLGbwoygBrn++FIodrNjY+iRjQrP
         9+WQ==
X-Gm-Message-State: AFqh2kpRQmVoiXFewHummop6t4YP6TqVY8LQUQ8t7A1XhbHkzu+yw2PU
	+vuJOtiZeBphNW6EJt9HAI1axtDDNko=
X-Google-Smtp-Source: AMrXdXtboPe9IUAV41X1srXQPhtpVBNYEiYSQenBQ61SkhgYTcUkgmhn2cWHgcFgSkug0W6cejREMQ==
X-Received: by 2002:a05:6402:174d:b0:494:eb9:54c4 with SMTP id v13-20020a056402174d00b004940eb954c4mr36951020edx.19.1674837441457;
        Fri, 27 Jan 2023 08:37:21 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id y8-20020a056402134800b004610899742asm2549100edw.13.2023.01.27.08.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 08:37:21 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/3] ARM: tegra: Device tree changes for v6.3-rc1
Date: Fri, 27 Jan 2023 17:37:18 +0100
Message-Id: <20230127163719.460954-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127163719.460954-1-thierry.reding@gmail.com>
References: <20230127163719.460954-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 1b929c02afd37871d5afb9d498426f83432e71c2:

  Linux 6.2-rc1 (2022-12-25 13:41:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.3-arm-dt

for you to fetch changes up to d1e34a8abfd6c5ac196f278ac2c5633e3e35ee22:

  ARM: tegra: Sort nodes by unit-address, then alphabetically (2023-01-23 12:07:15 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.3-rc1

Just a single patch to properly sort nodes and make the DTS files easier
to read.

----------------------------------------------------------------
Thierry Reding (1):
      ARM: tegra: Sort nodes by unit-address, then alphabetically

 arch/arm/boot/dts/tegra114-asus-tf701t.dts         | 240 +++---
 arch/arm/boot/dts/tegra114-dalmore.dts             |  26 +-
 arch/arm/boot/dts/tegra124-apalis-emc.dtsi         |  14 +-
 arch/arm/boot/dts/tegra124-apalis-eval.dts         |  20 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2-eval.dts    |  20 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi        |  60 +-
 arch/arm/boot/dts/tegra124-apalis.dtsi             |  60 +-
 arch/arm/boot/dts/tegra124-jetson-tk1-emc.dtsi     |  15 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts          |   8 +-
 arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi       |  27 +-
 arch/arm/boot/dts/tegra124-nyan-big.dts            |  22 +-
 arch/arm/boot/dts/tegra124-nyan-blaze-emc.dtsi     |  19 +-
 arch/arm/boot/dts/tegra124-nyan-blaze.dts          |  14 +-
 arch/arm/boot/dts/tegra124-nyan.dtsi               |  71 +-
 arch/arm/boot/dts/tegra124.dtsi                    |  20 +-
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts    | 877 +++++++++++----------
 arch/arm/boot/dts/tegra20-asus-tf101.dts           | 114 +--
 arch/arm/boot/dts/tegra20-colibri-eval-v3.dts      |  38 +-
 arch/arm/boot/dts/tegra20-colibri-iris.dts         |  12 +-
 arch/arm/boot/dts/tegra20-colibri.dtsi             |  60 +-
 arch/arm/boot/dts/tegra20-medcom-wide.dts          |   8 +-
 arch/arm/boot/dts/tegra20-paz00.dts                | 130 +--
 arch/arm/boot/dts/tegra20-seaboard.dts             |  72 +-
 arch/arm/boot/dts/tegra20-tamonten.dtsi            |  58 +-
 arch/arm/boot/dts/tegra20-trimslice.dts            |  20 +-
 arch/arm/boot/dts/tegra20-ventana.dts              |  58 +-
 arch/arm/boot/dts/tegra20.dtsi                     |  70 +-
 arch/arm/boot/dts/tegra30-apalis-eval.dts          |  20 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1-eval.dts     |  20 +-
 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi         |  20 +-
 arch/arm/boot/dts/tegra30-apalis.dtsi              |  20 +-
 arch/arm/boot/dts/tegra30-asus-lvds-display.dtsi   |   2 +
 .../dts/tegra30-asus-nexus7-grouper-common.dtsi    |  82 +-
 .../tegra30-asus-nexus7-grouper-maxim-pmic.dtsi    |  14 +-
 ...tegra30-asus-nexus7-grouper-memory-timings.dtsi |  20 +-
 arch/arm/boot/dts/tegra30-asus-nexus7-grouper.dtsi |  28 +-
 arch/arm/boot/dts/tegra30-asus-nexus7-tilapia.dtsi |  32 +-
 arch/arm/boot/dts/tegra30-asus-tf201.dts           |  34 +-
 arch/arm/boot/dts/tegra30-asus-tf300t.dts          |  24 +-
 arch/arm/boot/dts/tegra30-asus-tf300tg.dts         |  20 +-
 arch/arm/boot/dts/tegra30-asus-tf700t.dts          |  52 +-
 .../boot/dts/tegra30-asus-transformer-common.dtsi  |  54 +-
 arch/arm/boot/dts/tegra30-beaver.dts               |  44 +-
 arch/arm/boot/dts/tegra30-cardhu.dtsi              |  54 +-
 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts      |   2 +-
 arch/arm/boot/dts/tegra30-colibri.dtsi             |  30 +-
 arch/arm/boot/dts/tegra30-ouya.dts                 | 207 +++--
 arch/arm/boot/dts/tegra30-pegatron-chagall.dts     | 130 +--
 arch/arm/boot/dts/tegra30.dtsi                     |  88 +--
 49 files changed, 1580 insertions(+), 1570 deletions(-)
