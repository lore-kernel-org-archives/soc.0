Return-Path: <SRS0=nkI+=ZT=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC168ECAAD8
	for <soc@archiver.kernel.org>; Fri, 16 Sep 2022 10:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C068AC433B5; Fri, 16 Sep 2022 10:20:13 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DBB0FC433C1;
	Fri, 16 Sep 2022 10:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DBB0FC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 29so30805695edv.2;
        Fri, 16 Sep 2022 03:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=5K/jTI7fjuDW4G/VqPOVZ9ue0kSth/V/PzuxFr/qC+g=;
        b=S/JMXXmH9Zy6To5nOJq6ZR0ij3lS+NVTUJHgFx8rxpgsJacw+FJwEadgrLfb+JZ3a0
         qhjwPba5hJ+8TRI3Xt8vOM+3dAg5rjNys6UeND+ot+F5hpgvJhCmLiPido+IsEdiEcdQ
         OHYhqReTuFavRANuj5Phwt7Pxl7zRHNpREsldyW0r6J3vjIsWM20DbJKnJ3CTw82iWab
         ZqR8q1PGl/9umXYyo5J/GWac0jA6IU5TPjWAGK9n0Ez0kE+caBGKQ6QbEvVFIr7/bP/+
         kJLrgHB9XKzymQ5wIueIXjEUbsbzpMgUf7VY6bZTJ7GFoRbrdcFSA2KmiuoTnjdtEpCq
         EZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=5K/jTI7fjuDW4G/VqPOVZ9ue0kSth/V/PzuxFr/qC+g=;
        b=rOCgAy66KHGodaEtfvUsUwMBuwukQZ+Zp57Ozjmy6cQMfemm1G4xYxcGq7pXz+UFi8
         xK/xEVL7+MaTWVBqHXizXuVMoOUmcJnR0SW66P7G7W7OkAxXwgjwLJXgkJcEKwk5If/A
         tTZX3H0tW8w7AL5gzD8+ZNf9Bqg+moHScH3KDSbVHkaVeicQqt/O62pZsHFaD/N7Ogqk
         PjVjw1eiTjNNKRe/beUNkh4k0Z2K6Cb0tYC0196i8BOlW8DwsToYbbIMPhWFiYZrUASk
         wmCfcdgqTc+80BxYftyajfCy2rv2lUwdc52iENo3BPXM/CZ2QQknG4MKJIDpwOj+NDzA
         66XA==
X-Gm-Message-State: ACrzQf1FRwL008KQyqTtQu2gkHu5fkac2eHu0bNZEZN3IZPW6H/PlVDj
	d9MFTxOi2X7Kxi6yaumbW/wXT4RXz9A=
X-Google-Smtp-Source: AMsMyM75Nl7uONh5kfRDrG/I0m+0hj63axO4VVaXJFU3ADb+1LWIXuXeElQImsAj0uP8Ea48HWS8bg==
X-Received: by 2002:a05:6402:448b:b0:43b:5ec6:8863 with SMTP id er11-20020a056402448b00b0043b5ec68863mr3296514edb.377.1663323610676;
        Fri, 16 Sep 2022 03:20:10 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id s1-20020a05640217c100b0044ec76521a1sm13230860edy.55.2022.09.16.03.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 03:20:09 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] arm64: tegra: Default configuration changes for v6.1-rc1
Date: Fri, 16 Sep 2022 12:19:57 +0200
Message-Id: <20220916101957.1635854-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220916101957.1635854-1-thierry.reding@gmail.com>
References: <20220916101957.1635854-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.1-arm64-defconfig

for you to fetch changes up to 747c39f0ebfaee9cf699dd3c35ac6462db847667:

  arm64: defconfig: Make TEGRA186_GPC_DMA built-in (2022-09-15 15:51:47 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration changes for v6.1-rc1

Enables the new MGBE driver, as well as the existing SPI and QSPI
drivers on 64-bit ARM. The GPC DMA driver is now also built into the
kernel by default to avoid needless probe deferrals that would slow
down the boot process significantly.

----------------------------------------------------------------
Akhil R (1):
      arm64: defconfig: Make TEGRA186_GPC_DMA built-in

Bhadram Varka (1):
      arm64: defconfig: Enable Tegra MGBE driver

Krishna Yarlagadda (1):
      arm64: tegra: Enable Tegra SPI & QSPI in deconfig

 arch/arm64/configs/defconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)
