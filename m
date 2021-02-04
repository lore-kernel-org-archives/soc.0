Return-Path: <SRS0=wwgT=HG=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83484C433DB
	for <soc@archiver.kernel.org>; Thu,  4 Feb 2021 05:19:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 22D7864F58; Thu,  4 Feb 2021 05:19:59 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C872864F47
	for <soc@kernel.org>; Thu,  4 Feb 2021 05:19:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C872864F47
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=bjorn.andersson@linaro.org
Received: by mail-oi1-f180.google.com with SMTP id k142so2524643oib.7
        for <soc@kernel.org>; Wed, 03 Feb 2021 21:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kJzCjy0nMms07nuaWu9NrrP4hmPYEqwniCQtXa1rukQ=;
        b=KQ2AhCWW56C5JV7cqUzGBtT+Jp2isIlTZStXIUFAhpb088QKrxZ241ncAwPABWuv1f
         j/HuikFvkj90ccJsW5w7cFva4BuCyUYrC/WcIsel6hzAtAo2NqjhldrxEKKTjMxAmq5Z
         zg/BA9QxcJ9tTw2ttPIHTBw4FHWaDagFoMZ2Hi3viO633+rzFz7xb9jcs9f39hYL+Bqb
         Ms724vHHecjzGL+D5ucmMkK1A35F6OC5DGzepiTOVicblOOn3mJa0YfHMdHhAulUjCna
         zSqfY/aX6rACUGnhFbax4GGbkXmOf1+fwbEAq3Lx3fWHcdPGAJGlqf3oYMWE3ICFX5cY
         HqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kJzCjy0nMms07nuaWu9NrrP4hmPYEqwniCQtXa1rukQ=;
        b=PWmcf5oq09S73Bh14PTJoZ2PIkgH0Z4wRo9YyVpg2ub3VlF4rYF15fQXqDdxIthXHQ
         Xctc1bQxvRT2av7bPMTYKIgy1OlAoM7DHKljBItMgak5AQQQyDQvnKUMWGz0jNkAInz3
         4t/9hETOu3Xy3cC+b6R4t/jf2ie7F1mETB0KMWwadG81fk5YZr69mv7NKp+J0T0N+MPC
         C5OZzIgQZoy87TaeWU4vcU4kVKP3Zxi6oPKl6zZBSNdi0U8Nn1vrLDXetjWv3MtpFE11
         0qCh+O9NP2Xl1Aik7tSucRbkSo7wQmKsqLffzj+PZtArEg3qFiQPF7tGdDnub0HyMKsl
         SWdg==
X-Gm-Message-State: AOAM532Oy+y4I+LTuQldZEp14X9hxXGMdu+EoNS+qT3JBPenMI7FTRP1
	c1gLZwpRWh2t/nT9+nFzsR9MZg==
X-Google-Smtp-Source: ABdhPJzrkdaH7GRTiA5I5fleV+9Wgd1JQvQZ/aAfIsJO7Hji0lsIOEzjo1HSu7B6SES+76GMosBXTg==
X-Received: by 2002:a05:6808:6d2:: with SMTP id m18mr3064386oih.32.1612415997898;
        Wed, 03 Feb 2021 21:19:57 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id l3sm945276ooa.12.2021.02.03.21.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 21:19:57 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andy Gross <agross@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@baylibre.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [GIT PULL] Qualcomm ARM64 defconfig updates for 5.12
Date: Wed,  3 Feb 2021 23:19:56 -0600
Message-Id: <20210204051956.388355-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.12

for you to fetch changes up to e6c88b8e434f1a856b330a7c07e4ed338e41a92e:

  arm64: defconfig: Enable Qualcomm SM8250 audio config (2021-01-15 10:20:00 -0600)

----------------------------------------------------------------
Qualcomm ARM64 defconfig updates for 5.12

This enables HID multitouch and TMPFS Posix ACL, for off-the-shelf
distro support on the Snapdragon laptops. It also enables display
clocks, audio configs and the LT9611UXC HDMI bridge for used on the
SM8250 and specifically RB5 board.

----------------------------------------------------------------
Bjorn Andersson (2):
      arm64: defconfig: Enable HID multitouch
      arm64: defconfig: Enable TMPFS Posix ACL

Dmitry Baryshkov (3):
      arm64: defconfig: enable display clock controller on sm8250
      arm64: defconfig: enable Lontium LT9611UXC bridge driver
      arm64: defconfig: Enable Qualcomm SM8250 audio config

 arch/arm64/configs/defconfig | 9 +++++++++
 1 file changed, 9 insertions(+)
