Return-Path: <SRS0=PV0F=TM=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93BD1C433F5
	for <soc@archiver.kernel.org>; Tue,  1 Mar 2022 03:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 56A52C340F5; Tue,  1 Mar 2022 03:35:29 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8333FC340EE
	for <soc@kernel.org>; Tue,  1 Mar 2022 03:35:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8333FC340EE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f54.google.com with SMTP id l21-20020a056830239500b005afd2a7eaa2so8351483ots.9
        for <soc@kernel.org>; Mon, 28 Feb 2022 19:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6TpT57l7j+VEVWnhi7VBvM0wYYn+eMC3kYTDkfBvy3Y=;
        b=m6/oovAFI2rxU7OYUBCXzeFB+a/w+X2tXEmbsES52kGWzO2PRHd7yPle5WujrazpFB
         AO9uyafF04NjtHyR+i1l0omWXP4mOarEM3dB1jHYkT8zPvATHLGxr1OrEs7jse2eT4AM
         RKkJMpfOPaE5m6g1EM530RVCgEBM3mmGhOKI8kO3EeuPN/LxCzhcLSa5P70h0L5L/snp
         KaZOj4FeWgS2m7e1cYj6QCDKh6SZPtuzX25M5pZqXwfXrThRJUr9SH/dbbLfmgwcBrbY
         jFyfOOFWxZAyixsw+pK4YijAGFIEuRR4NK4o46BII9Lk8Gopt/vhXPKbmQtckVtJMtRq
         M1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6TpT57l7j+VEVWnhi7VBvM0wYYn+eMC3kYTDkfBvy3Y=;
        b=sJuVZZaFepiEpJgn6L9caZUtCw671QE4Uv1S8xOpiB08jf5TOno6d+HfemRdEJmEgW
         7Az7AAgYtP0+HKRVFZeTtY8Uf6RWd3dtp8RjFqUC/u4lFkF5v0obF0cTaPhbmFUZHvag
         Nw3ECHFVAAzMWinumfIfQPIx3cR6QNriz2vCHZYV9mzJbrpamT4nC1rR7eFO2KiNCdtn
         RSypJsVhKZUCWjNRuWwsxeSi1Qf90R6CGU/JXz1sK/WSKad8RK3qcHnQHWIKcx0z9Iid
         V/U3XQUUWyR6nYI372NDYRQ3Uy+6lVbVo7XDAZgPn4zQ5MmBxDNyH2v2+F04nwLCfi+b
         l3xw==
X-Gm-Message-State: AOAM533lT1IDhJBOvF7poqnhwIOe8L4h8OkvIRyFr2nmWwFcyCcrmGa9
	Cv/0gf6sdoKGAEXNJJl7sx6X2g==
X-Google-Smtp-Source: ABdhPJwdnilFD6W4jB2CzREpYQ2+PlfGHjlmFZDbx6RF3p2xwfnDtMwnnOylRst1W4QzurrpKUp5nw==
X-Received: by 2002:a9d:76c6:0:b0:5a1:b25d:1311 with SMTP id p6-20020a9d76c6000000b005a1b25d1311mr11367633otl.297.1646105727580;
        Mon, 28 Feb 2022 19:35:27 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id l4-20020a4a94c4000000b002ea822fbac8sm5753828ooi.21.2022.02.28.19.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 19:35:27 -0800 (PST)
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
	Jonathan Marek <jonathan@marek.ca>,
	Steev Klimaszewski <steev@kali.org>
Subject: [GIT PULL] Qualcomm ARM64 DeviceTree fixes for 5.17
Date: Mon, 28 Feb 2022 21:35:26 -0600
Message-Id: <20220301033526.1801295-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Sorry for the late fixes request. If it's too late, please merge it towards
v5.18.

Thanks,
Bjorn

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-fixes-for-5.17

for you to fetch changes up to 382e3e0eb6a83f1cf73d4dfa3448ade1ed721f22:

  arm64: dts: qcom: c630: disable crypto due to serror (2022-02-14 21:50:11 -0600)

----------------------------------------------------------------
Qualcomm ARM64 DeviceTree fixes for 5.17

This starts off by fixing an issue introduced in a bug fix in the
global clock controller, where the symbol clocks for UFS would
end up picking the wrong parent clock which breaks UFS.

It then makes sure that the reference clock for the USB blocks are
enabled, even with booting without clk_ignore_unused.

It corrects the apps SMMU interrupts defintion by adding a missing
interrupt in the list.

Lastly it disables the Qualcomm crypto hardware (for now) on the Lenovo
Yoga C630, to prevent the cryptomanager tests during boot from crashing
the device.

----------------------------------------------------------------
Bjorn Andersson (1):
      arm64: dts: qcom: sm8350: Correct UFS symbol clocks

Jonathan Marek (2):
      arm64: dts: qcom: sm8450: enable GCC_USB3_0_CLKREF_EN for usb
      arm64: dts: qcom: sm8450: fix apps_smmu interrupts

Steev Klimaszewski (1):
      arm64: dts: qcom: c630: disable crypto due to serror

 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts      |  5 ++++
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 28 ++++++++++++++++++----
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  8 ++++---
 3 files changed, 33 insertions(+), 8 deletions(-)
