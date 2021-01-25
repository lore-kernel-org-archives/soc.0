Return-Path: <SRS0=87Mx=G4=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 366BDC433E0
	for <soc@archiver.kernel.org>; Mon, 25 Jan 2021 23:20:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 0F370229EF; Mon, 25 Jan 2021 23:20:42 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEDB1227BF
	for <soc@kernel.org>; Mon, 25 Jan 2021 23:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEDB1227BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=bjorn.andersson@linaro.org
Received: by mail-oi1-f177.google.com with SMTP id k25so2513966oik.13
        for <soc@kernel.org>; Mon, 25 Jan 2021 15:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o4y3TSxNQdi+jql86zSjoCm2QszJJK7xRnAAsAbT1tw=;
        b=rmFEPXugDo5gY7Rv2TY34qw6TFNSw6s0EgRcXS5pB9t7vCMTKSfWbozn5F2qgyhAlD
         tfJCfjOeTxnH3lgOn8I7qAmOibraSltZ8WrpC2At80Qe71tJ9J6gK+DUnVrX9CxyRwY6
         372/rzPh48hqu32zTCotwoxBFjtr+ZC3+0ADWqcERz8ZEwX4c9wDdcJv4ieuQrq+YSjf
         fInTO94rVzxVSAPzdtgEgpRUGtImHj8/fs/riPjgvhdiGgn3QNQPI3i4iehttzd57nXF
         AGOt/iwUkMChhnszrrd8aN2qA9djp6g3WD4Scq6XtUHbTpRgDAUuAPQb2oAw8ooRv0s0
         N9DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o4y3TSxNQdi+jql86zSjoCm2QszJJK7xRnAAsAbT1tw=;
        b=Coh1QdAlHZrM+BlytZoE4srkeTmkiv8vKMAToZCo2nBk5+05b65St8wm4BeLH6obFa
         KqyVshf1NG7SZm51V2f9REBaAxBQDkqHaE3ZvnEzvP9wSNhURyhmPFxdNjjCflBKooZ2
         RhlMBTD9RnPG8FBaW/PBhDQAr8fxhhPKvutBC9dWJHM5zVtIvsVr1zPPamItjitKBZvY
         F2M2oamnZsRobFgEhc5LJ03Hb4TK5WhFG5Q3jF+Lk+HzAOk8plqT8dBfI87ZL46tYMiL
         CuXtL7ORx7qNq7sZJpyRd89hUh+fS9XBqyznbWBR5ZO5WIS4CmKLnw99sLaS4NY+x4cj
         8Yzg==
X-Gm-Message-State: AOAM533jWP9PdcYsl0BzWN2GWDyOMpxbqc8f0Occ95GvfNUGnemcFjQC
	rStel7DmjuNNUYI+vhDDulJ4dw==
X-Google-Smtp-Source: ABdhPJxnC2Q8HaMXHJaw7jk0dINvH8qTCMJCZD6BUXqe03VmXL/q+lfxtulZyZJZaRtH5kUn8Au8ng==
X-Received: by 2002:aca:49d0:: with SMTP id w199mr1614981oia.61.1611616840830;
        Mon, 25 Jan 2021 15:20:40 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x141sm1807046oia.3.2021.01.25.15.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jan 2021 15:20:40 -0800 (PST)
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
	Shawn Guo <shawn.guo@linaro.org>
Subject: [GIT PULL] Qualcomm ARM64 fixes for 5.11
Date: Mon, 25 Jan 2021 17:20:39 -0600
Message-Id: <20210125232039.642565-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-5.11

for you to fetch changes up to 93f2a11580a9732c1d90f9e01a7e9facc825658f:

  arm64: dts: qcom: sdm845: Reserve LPASS clocks in gcc (2021-01-13 00:20:13 -0600)

----------------------------------------------------------------
Qualcomm ARM64 fixes for 5.11

This fixes a regression in Lenovo Yoga C630, where the touchpad in some
units stopped working, by re-enabling the "tsc2" device.

It also marks the LPASS related clocks as protected to allow DB845c and
the Lenovo Yoga C630 to boot even if CONFIG_SDM_LPASSCC_845 is enabled.

----------------------------------------------------------------
Bjorn Andersson (1):
      arm64: dts: qcom: sdm845: Reserve LPASS clocks in gcc

Shawn Guo (1):
      arm64: dts: qcom: c630: keep both touchpad devices enabled

 arch/arm64/boot/dts/qcom/sdm845-db845c.dts           |  4 +++-
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 14 +++++---------
 2 files changed, 8 insertions(+), 10 deletions(-)
