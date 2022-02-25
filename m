Return-Path: <SRS0=d2Xh=TI=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE26CC433F5
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 16:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B1400C340F2; Fri, 25 Feb 2022 16:47:53 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1AE31C340E7;
	Fri, 25 Feb 2022 16:47:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1AE31C340E7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id v2-20020a7bcb42000000b0037b9d960079so2073405wmj.0;
        Fri, 25 Feb 2022 08:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hD6FBWW8TGRI8bjBMq/DwmPzCMaP/5KqoNaN3Rmzc0Y=;
        b=jCmpHJkDeIl4puqOnr5hqJxhlhlNFaWx6qnqfi24+aD3EtRJUE9iWGzKchTfXvq9Qi
         Jw4mPnhkKmrIryrnCgsFyN+94gXB4GtClp5UQ4XL/k7TKPE6715AJfg/QLeNKa3h0ggI
         fBTIAeG25i18M+nufmN++VTYenugmAWgfg98a2LWqCACenzY04H3yI340Bd6DJHmn0U9
         aiACJxEvWi86/lBs+flIiWLNmdMTshRLeb1+vZDnuxXOgQTz+vNdbV2A3mC9CrTB41Sq
         h9y6w4NtUW5tk0woyQmNea0aPpavwSNRUR9xn8OnLSMO4lp4YAfeLETbHO90BTH3N+tc
         Sxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hD6FBWW8TGRI8bjBMq/DwmPzCMaP/5KqoNaN3Rmzc0Y=;
        b=O/xg+jvBtGNqPcmbF8lv301a0fV/xtrwuN3Ah6tMf/GslcCi3pTfTDeuQ9/gomf8Um
         2MqzeHWobmTxU2p9GoFZF3hcBm8f4C2R7XLD/kAgnvtYFpCGVJJnVLm9BSu1eykrAq6A
         mC6IKfbo/1hY/ACrWUvau17oTScYZNFXal4jpy0VxAXhn+HuLr/cP86Hz0XFqfZRjqiB
         v7KAehqSTUUzvPPE4BpQx6mBhcP2+/WJUs449sSAv8uXn2Gu1L5TUifCCasMfpPzHlry
         cy1aomelQ5HURh6BLCxyxSh40JHVkQ4ChusYwKgqJ7wvpFaM5+Pc129ClNIGDESO5Mp5
         BKbw==
X-Gm-Message-State: AOAM530skF+ndzZ2/mAP2Nzw3X1gScvi42VGGpsDXAuN8FgfFEirh9cW
	Nhz6rHg3Gnwq01pmZN2XEi1nwFkDJ4I=
X-Google-Smtp-Source: ABdhPJyq9w7VYOXIV9r07iuX+c4nUNhw0Aeaeu0MikSM9rcLfa/L9+DiMsbIZEu367xMdWs+c0waeA==
X-Received: by 2002:a05:600c:6c5:b0:380:dda2:d562 with SMTP id b5-20020a05600c06c500b00380dda2d562mr3550075wmn.138.1645807670826;
        Fri, 25 Feb 2022 08:47:50 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id f10-20020a05600c154a00b0037bbbc15ca7sm11923928wmg.36.2022.02.25.08.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 08:47:49 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/5] ARM: tegra: Device tree changes for v5.18-rc1
Date: Fri, 25 Feb 2022 17:47:39 +0100
Message-Id: <20220225164741.1064416-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225164741.1064416-1-thierry.reding@gmail.com>
References: <20220225164741.1064416-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.18-arm-dt

for you to fetch changes up to 0092c25b541a5422d7e71892a13c55ee91abc34b:

  ARM: tegra: tamonten: Fix I2C3 pad setting (2022-02-25 14:45:43 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v5.18-rc1

The changes in this set are cleanups and fixes for 32-bit Tegra device
tree files. With these, some json-schema validation errors are fixed.

----------------------------------------------------------------
Dmitry Osipenko (3):
      ARM: tegra: asus-tf101: Enable S/PDIF and HDMI audio
      ARM: tegra: tf700t: Rename DSI node
      ARM: tegra: paz00: Add MMC aliases

Julius Werner (1):
      ARM: tegra: Update jedec,lpddr2 revision-id binding

Oleksij Rempel (1):
      ARM: tegra: Fix ethernet node names

Richard Leitner (1):
      ARM: tegra: tamonten: Fix I2C3 pad setting

Svyatoslav Ryhel (1):
      ARM: tegra: transformer: Drop reg-shift for Tegra HS UART

 arch/arm/boot/dts/tegra20-asus-tf101.dts               | 12 +++++++++++-
 arch/arm/boot/dts/tegra20-colibri.dtsi                 |  2 +-
 arch/arm/boot/dts/tegra20-paz00.dts                    |  6 ++++--
 arch/arm/boot/dts/tegra20-tamonten.dtsi                |  6 +++---
 arch/arm/boot/dts/tegra30-asus-tf700t.dts              |  2 +-
 arch/arm/boot/dts/tegra30-asus-transformer-common.dtsi |  2 ++
 arch/arm/boot/dts/tegra30-colibri.dtsi                 |  2 +-
 arch/arm/boot/dts/tegra30-ouya.dts                     |  2 +-
 arch/arm/boot/dts/tegra30-pegatron-chagall.dts         |  2 ++
 9 files changed, 26 insertions(+), 10 deletions(-)
