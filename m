Return-Path: <SRS0=XNjI=ZS=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B6DEECAAD8
	for <soc@archiver.kernel.org>; Thu, 15 Sep 2022 02:30:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D0028C433D6; Thu, 15 Sep 2022 02:30:54 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 07B36C433D7;
	Thu, 15 Sep 2022 02:30:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 07B36C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id ay9so1903299qtb.0;
        Wed, 14 Sep 2022 19:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=xZQjWYuwXQ+AOMe/TTuVFwZvUPmsS7/jFivIQkrE1OQ=;
        b=gvUgGzdqZI7JYEjRfxTgSH/LAEYZlGq0JuGmcLNYLkHN2O3pn/DhxsIWtRgWtc/t7s
         XOScRE5x892rQT3caarANn8/yOupanG6ZZDXS1DiqHLq8tZ3z+kUekorevs1jz4PqcJ+
         ERcqKRPYaT1oUvZDkg5R42HAuA39n13mlLAl6Qta4Ryj28xqHSGpEWHWW9Zr8NE0hO9o
         YqGEJUT54SmuQzKwz8u5Clj0axw1Pi6BgQ5L8nsKjEXoD34pq/tlhy1qADM+5Nvu65VJ
         LRRJGyWhW6tqHwOzSInz/hLVk8zgCro/l0SCMVGdAe2btj6Ql8dBTbc5ZaH6jWzC7Q+h
         xUIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=xZQjWYuwXQ+AOMe/TTuVFwZvUPmsS7/jFivIQkrE1OQ=;
        b=a0iJp32E2VA019VaaSg5zfFJHkaDaEeNY2wjUBmdfUB7psaS+EWfXtTymfFSPxYC5k
         ozPLCtg1yYOAaUPfY+cL24aa3DP3zdOfA1T+LqOisCtxIaGrlh78sP/1Jzz9JPHP/chF
         52GZ8SPu8oOyK3wGj3kwFc0r67jnfwjmnk6/Wiw+Qfm6zuGHte8z88RjFIQSZKIqIHDc
         8kQeYKt/dUWXk5SaQ2nymo7yCmYfu8PO6zwrmecjRNBWKJjgvt9RrvGvgWSqEvFX8YqE
         jA7uj+ZVrhbqIy+CmAxyJRVcZ8pyrWoYmgzsOjgSx17Z6Cd1gwlPA7DQEdLQOvA+Tl/k
         rcDA==
X-Gm-Message-State: ACgBeo2PmiBANt8V7f1FUJHOLc5FHCLcY2+8ex5RJO0D6Upmjol65uk6
	8S60vJFN8wyr0SyuTJU9W+8QTk+NOZ8=
X-Google-Smtp-Source: AA6agR60XN+mp1WbGNrvSqTtBh8wC6NwUMaAOIEnlUNWGZSAs2se3KLDJ9Zu3gKo7ftpXMlFpeb9BA==
X-Received: by 2002:a05:622a:1820:b0:35b:d0d4:13b9 with SMTP id t32-20020a05622a182000b0035bd0d413b9mr10883601qtc.236.1663209052422;
        Wed, 14 Sep 2022 19:30:52 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id u16-20020a05620a0c5000b006bbe7ded98csm3062982qki.112.2022.09.14.19.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 19:30:51 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Florian Fainelli <f.fainelli@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	olof@lixom.net,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 3/5] Broadcom devicetree-arm64 changes for 6.1
Date: Wed, 14 Sep 2022 19:30:42 -0700
Message-Id: <20220915023044.2350782-3-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220915023044.2350782-1-f.fainelli@gmail.com>
References: <20220915023044.2350782-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.1/devicetree-arm64

for you to fetch changes up to 3bcae3396e986b4ab97a69e8de517e32f9691a4b:

  arm64: dts: broadcom: bcm4908: add Asus GT-AC5300 LEDs (2022-08-15 09:35:41 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM64-based SoC changes for 6.1,
please pull the following:

- Rafal adds the BCM4908 LED controller node and describes all 32 LED
pins, he also adds support for the Asus GC-AC5300 LEDs

----------------------------------------------------------------
Rafał Miłecki (3):
      arm64: dts: broadcom: bcm4908: add remaining LED pins
      arm64: dts: broadcom: bcm4908: add LEDs controller block
      arm64: dts: broadcom: bcm4908: add Asus GT-AC5300 LEDs

 .../broadcom/bcm4908/bcm4908-asus-gt-ac5300.dts    | 48 +++++++++++++
 arch/arm64/boot/dts/broadcom/bcm4908/bcm4908.dtsi  | 83 ++++++++++++++++++++++
 2 files changed, 131 insertions(+)
