Return-Path: <SRS0=d2Xh=TI=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2ACC433FE
	for <soc@archiver.kernel.org>; Fri, 25 Feb 2022 16:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 48A89C340E7; Fri, 25 Feb 2022 16:47:59 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B4D33C340F0;
	Fri, 25 Feb 2022 16:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B4D33C340F0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id v2-20020a7bcb42000000b0037b9d960079so2073534wmj.0;
        Fri, 25 Feb 2022 08:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uduFXioM9Jvok6vQql7ATzaeIk0YlwdJ3rm+JrUutIk=;
        b=CUeh2x2ibtoEGB9+JkPliPBiG6KCjSIFu1b+hIzdFO9VFPzrvLuDUKe7/u5Ht9lhE/
         qvhKVQU4UshisQGY/v5oJPMl6yAS1X5SOi4znZkBv2lPRFE1AaUah5pvoyGEQdpGomrW
         RsDUxH1NJC/n8t8QACqTig3Jykm7SNdyVGHI0x+fbHAM8LigFJJquF4jIRcpiuKLyxbi
         6DAZInV8DWpDTafxQ29lacP8ECcG+k6pumGaQ7oidEoy0vbIBOKaUU4cg+4WUjMEQHMP
         cDmMdcGEfNJukgNrXp7OuZ4XmQZXA95dsvdFMQKroyWZsZmg1l34Blr2hgqjVrimzJew
         kXQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uduFXioM9Jvok6vQql7ATzaeIk0YlwdJ3rm+JrUutIk=;
        b=TUufzxoNT8ClDmuaJb1RWqAFaH8WzYUj7q7jTQtfn2LtKcDzJ70F0oJN7W0rTXV1Rc
         Gntfaa6wPBqIwGkUmit5fwCnv6SsBpDJQIAuPnEuP2GzUQNsZpvkffcRRany43Ko4pnU
         5zdrAFvTzjyeHQpwQKg/qQap6wCXiiJSbsVp75E94bQTMR37v+SI7GIkcNE5qvzbOgEh
         mVuTLV/pF9JpHnIAwhIA+z8BgL7QuCPpH2y6eUYvB8sUMgvmMw1Rky77ww4X3MOjFDcS
         boFmXdZcho9AeZ168ZaLLsrmB+Gn4sabzSwzdWduYazWikYJNVXzhgnWvnEqd2sD+yrI
         YGSg==
X-Gm-Message-State: AOAM530XZIbApE8Bv2qCC2V5fVfCmIiAN2o5xgBXMwhxMnuuke2YIzoT
	6JeL2bt4DO+Nib6blxiW8HE5dRbctnw=
X-Google-Smtp-Source: ABdhPJxHHk4kBdDLIrF4rNAB7zvJbnqmqDjyf9p+H8aYiM81qW7zaw5UNfvr72envSUT/YbmN6glOg==
X-Received: by 2002:a05:600c:3c8b:b0:37f:1546:40c9 with SMTP id bg11-20020a05600c3c8b00b0037f154640c9mr3501308wmb.161.1645807676564;
        Fri, 25 Feb 2022 08:47:56 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a8-20020a056000100800b001e30ef6f9basm3905853wrx.18.2022.02.25.08.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 08:47:55 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/5] arm64: tegra: Default configuration updates for v5.18-rc1
Date: Fri, 25 Feb 2022 17:47:41 +0100
Message-Id: <20220225164741.1064416-5-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.18-arm64-defconfig

for you to fetch changes up to 753b2280e154aad4522d20a3fbd04fa1736a809e:

  arm64: defconfig: tegra: Enable GPCDMA (2022-02-16 16:32:10 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration updates for v5.18-rc1

Enables the GPCDMA driver that was recently introduced for Tegra186 and
later generation Tegra SoCs.

----------------------------------------------------------------
Akhil R (1):
      arm64: defconfig: tegra: Enable GPCDMA

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
