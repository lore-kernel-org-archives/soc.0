Return-Path: <SRS0=1uXd=VR=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3F20C433EF
	for <soc@archiver.kernel.org>; Mon,  9 May 2022 15:23:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 75EA4C385B4; Mon,  9 May 2022 15:23:15 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B8AA7C385AE
	for <soc@kernel.org>; Mon,  9 May 2022 15:23:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B8AA7C385AE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f172.google.com with SMTP id j12so10587397oie.1
        for <soc@kernel.org>; Mon, 09 May 2022 08:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=REojqMTypU3/iERzyVKWOawFG50CjfHR0afcTjLuxM0=;
        b=jBb0jbM39pGn+Md7Husess5D5OKzKj906uv1BI0sHPD3y1nCOhro/8dNlnoF3xdp++
         UHfXxeee2gQWOgvK0avSEj1PYUXdwbYI4ZDqyjex5T1gh/3PL2lP2xwlusoFMMo6hQnY
         g/wSdypa+lJm9Q66Ucb8TYyVfKURJJyxI3J+o6L7PV4lP8CaNSQG+L7oujmCf/AwFFex
         zfKtS5rDV5X/E2eAYi5jhIDENhFV3MBU6s9ENGTDcData07T+NfZwdnfTOT9PdX1SWkd
         c7gJi46erOrrpoLBaKsUOZTzWAh2sI3UgzcdVPFmveenYnPD8ynaNxPNA1xJcQQTwVOJ
         1Q7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=REojqMTypU3/iERzyVKWOawFG50CjfHR0afcTjLuxM0=;
        b=1SV0u7lJ2nY1mjBdFCp8ywWCBPCFHyj5m5QlizUJDqNdcA//1CSKkzkWKzJYx+1lVI
         wYh12PVlp1M8+nQp6LLmjJvDO6JBO9jrq39ncviuTqbxLiqRet6L6uDamC4l6nX+C+UO
         mu+TjeVtGAjNbfNrm7dtLl0Sy/f8m/M2HJW4B2uyUyAgda03mJ8Xp/Uevx4XCl5Hy5pO
         Gg71k0IV6mU0K4SifgR+ZoFnGamRk5sRGP9KPd9YUtgsN0yqfBSghzorHHvUnvTUiK7m
         /ii+czLSTX65WVNGJmlyZHVILvy4qT4lMV+K/FQu2E++VeQbyvNpUycKzqGAN+qn4+56
         RvGw==
X-Gm-Message-State: AOAM533Rf2cKJzWX/ATFUaEQsKpiM/h0oLrJvpR5+hRsaOPGcqf8pIfi
	MQ2H/q6ahCfGfiUkq5GSvcl7Tw==
X-Google-Smtp-Source: ABdhPJzNbJWnvjVt0Sxu1YmytFAB5FhsVfRm9P5Jy8Zc0DzeRDBagQM0LpnOtBrg0cuX5F9QRHY2nA==
X-Received: by 2002:a05:6808:192a:b0:326:a728:f8a3 with SMTP id bf42-20020a056808192a00b00326a728f8a3mr5731967oib.153.1652109793810;
        Mon, 09 May 2022 08:23:13 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k18-20020a056870d39200b000e932746d33sm4372902oag.28.2022.05.09.08.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 08:23:13 -0700 (PDT)
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
Subject: [GIT PULL] Qualcomm ARM64 DT fixes for v5.18
Date: Mon,  9 May 2022 10:23:10 -0500
Message-Id: <20220509152310.306179-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-5.18

for you to fetch changes up to 18019eb62efb68c9b365acca9c4fcb2e0d459487:

  arm64: dts: qcom: sm8250: don't enable rx/tx macro by default (2022-04-11 21:40:57 -0500)

----------------------------------------------------------------
Qualcomm ARM64 DT fixes for v5.18

This disables the two Soundwire controllers as well as rx and tx macros
by default on the SM8250 platform to avoid crashes on devices where
these aren't available.

----------------------------------------------------------------
Dmitry Baryshkov (1):
      arm64: dts: qcom: sm8250: don't enable rx/tx macro by default

 arch/arm64/boot/dts/qcom/sm8250-mtp.dts | 12 ++++++++++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi    |  4 ++++
 2 files changed, 16 insertions(+)
