Return-Path: <SRS0=E6oP=NH=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE479C4338F
	for <soc@archiver.kernel.org>; Mon, 16 Aug 2021 20:50:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D096D60F39; Mon, 16 Aug 2021 20:50:32 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A889E60F36
	for <soc@kernel.org>; Mon, 16 Aug 2021 20:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A889E60F36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-oi1-f181.google.com with SMTP id u25so28617904oiv.5
        for <soc@kernel.org>; Mon, 16 Aug 2021 13:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kmoyu7jA1eM6PaqAOcqPLI/aOuRdV7qLJPPT17KbiDI=;
        b=q2X7wvK9pcvNaogEd8Ar6JEEEeqLAc7E6w0HPK+t067zJfM+lR5RYCvNa0ufdOm9U7
         lrT7RUoj5+bRra73kvYEhHmdFZJ7NsaQaHiIMG4SyAjhY67XFWowwcAawb/oCc1YlaTe
         0UP4uJvpykvX6JiKfjDlg1SZ4GvUgmCvwme1qvw8TJ2hGGdqDuLgYs3upXZbqXhdoJpt
         XcVDWBsqiQqFhP3L7LJpI+4jOYImeR+1voO9JgefRjio3F4YWty+Ke5j6MLugTZakMuT
         Va2reXB+2++OEZ7mB6WScN7RZyuiGbFID1UkDDvIiQT2YPatmpecleqFYqoWuwfbCjPy
         J6bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kmoyu7jA1eM6PaqAOcqPLI/aOuRdV7qLJPPT17KbiDI=;
        b=sYrTCB9i7GHoxPO0HPHtLxbX6GOzCdPSpmXzV49u9A72UqbdZ8+hWpZzatjGDxxjud
         02dSDPPfzyXvkRvfy0dPPDB4XSviKpWxtTxUEo7DTlqtT0yntHUy94A2XOaUcMLNrBqA
         lAo6A3j3cn68BjlKeIvMmcWby2URCps/tdEzU0lxFTy5rXlhAhOl3Yt4QMLREgfTwAm2
         TL987DuVF8t9/nb5FQbWJQgfc0gOQXu0sfhRzOLFMWQzuB8ZoYqxfdNHgseLiA/9aqgg
         D7g7RdcKqU1xjU4lHM8NipkRgo0E5+ULbo68yrKNZqf6XPJRyXtsdOAcpR043OuIn47M
         t4Iw==
X-Gm-Message-State: AOAM532SGUIUwjXGJhM1UEZnT1JR5NDMZ+l15qmV37mCzzWLU78dNVHW
	sq05WyUh6vxFBlLJ3F/69GrK9A==
X-Google-Smtp-Source: ABdhPJz10oI7Rxo2X6IakrDLahBN9gbmx3EWQdxvFF72jJraf0Rg5G3BCec9uWhOKhrnWsYakPvOFg==
X-Received: by 2002:a05:6808:56:: with SMTP id v22mr570895oic.49.1629147031966;
        Mon, 16 Aug 2021 13:50:31 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id i19sm26244ooe.44.2021.08.16.13.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 13:50:31 -0700 (PDT)
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
	Petr Vorel <petr.vorel@gmail.com>,
	Caleb Connolly <caleb@connolly.tech>,
	Sibi Sankar <sibis@codeaurora.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: [GIT PULL] Qualcomm ARM64 fixes for v5.14
Date: Mon, 16 Aug 2021 15:50:30 -0500
Message-Id: <20210816205030.576348-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-5.14

for you to fetch changes up to d77c95bf9a64d8620662151b2b10efd8221f4bcc:

  arm64: dts: qcom: sdm845-oneplus: fix reserved-mem (2021-08-05 10:36:04 -0500)

----------------------------------------------------------------
Qualcomm ARM64 fixes for v5.14

This fixes three regressions across Angler and Bullhead, introduced by
advancements in the platform definition. It then corrects the powerdown
GPIOs for the speaker amps on C630 and lastly fixes a typo that assigned
CPU7 in SC7280 to the wrong CPUfreq domain.

----------------------------------------------------------------
Caleb Connolly (1):
      arm64: dts: qcom: sdm845-oneplus: fix reserved-mem

Petr Vorel (3):
      arm64: dts: qcom: msm8992-bullhead: Remove PSCI
      arm64: dts: qcom: msm8992-bullhead: Fix cont_splash_mem mapping
      arm64: dts: qcom: msm8994-angler: Disable cont_splash_mem

Sibi Sankar (1):
      arm64: dts: qcom: sc7280: Fixup cpufreq domain info for cpu7

Srinivas Kandagatla (1):
      arm64: dts: qcom: c630: fix correct powerdown pin for WSA881x

 arch/arm64/boot/dts/qcom/msm8992-bullhead-rev-101.dts | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/msm8994-angler-rev-101.dts   |  4 ++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi                  |  2 +-
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi   |  4 ++--
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts  |  4 ++--
 5 files changed, 21 insertions(+), 5 deletions(-)
