Return-Path: <SRS0=PVSr=RH=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDFBC433F5
	for <soc@archiver.kernel.org>; Wed, 22 Dec 2021 15:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EE499C36AEF; Wed, 22 Dec 2021 15:22:23 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 83134C36AE8
	for <soc@kernel.org>; Wed, 22 Dec 2021 15:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 83134C36AE8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ot1-f54.google.com with SMTP id g79-20020a9d12d5000000b0058f08f31338so3261467otg.2
        for <soc@kernel.org>; Wed, 22 Dec 2021 07:22:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5ZQZCQL2KTVcoTnEoHgUYAElpskjF9jGurihBjq2Nbc=;
        b=qWrTaezWRHnp2Q4FBtcicyQVyIRXpbv8mHJuZ/snNJVa9UKlS05jUvzJ8DzJrEoqPl
         1qExBuU/enm6ryPz0z9RxZf6udKLUEsVmx64FhNcX9ZwTqDlqdKtBQR/fQPSmoRBOZlr
         +6rKiWpe629Vx2dHVDRzTCHirQl2mv3h5+TDhg6Gq616sZkGvwfi4m2MVxKnhno5t8lm
         RkZLmXD9DCJ4jwiNllThVqHsRHf8K0MsPVW7JXoYZ/yJMsmLwg+g60Kq9KpV3PvS+gSV
         BJNaA2Cmh+lIKSuAg7kg1MNM0AavHaoTsEFOlyDo2NBWrpbeNQebLibKh9y7xksmCbyr
         yWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5ZQZCQL2KTVcoTnEoHgUYAElpskjF9jGurihBjq2Nbc=;
        b=FHer/7zCA8CtmrSWYwLe1DpyKc4GPGas2rxP4wzSA8TNxUpwqpNygYWIw0nNlT4zyu
         oaeUtDSp7XCR15p6quezOz2uN7/sS/7tV6Tmk3+x5sIMhTZvGRUGVPAEC991REd3WwHZ
         yDRbwVwBh6jQr4wgNecmI8jPrMUIqbS2v37inMw2MqFh0wxKvVeF1JA7QsL9C97Dk2MB
         utOKUtTncjP8ZSUaOl6yL7Dhtd7sswKHQiTxsi69fe/o0ymijNDuTPoFug4gw4Ki69Yp
         VcEadMdWxJfqboPzGRB5UyBNGBzId0Ypb7v/HnpjzKri3n2xMHWWABr7rvtsvGa4eIIh
         WgUw==
X-Gm-Message-State: AOAM5302KHA0OX1vqQ5EMWtHiYgj249CKbwItKmc3q0tbbNMMjVZ4LtN
	Ro2qp1w5b2c/04fC3F7GJ/5PGQ==
X-Google-Smtp-Source: ABdhPJxq0v4beO0POw4hsb3hCl0lQ8XD44fhrCq1TpIxbL0Q4mkNacAibHXrIuhCxqblQ8niGyA1UQ==
X-Received: by 2002:a9d:6a84:: with SMTP id l4mr2328015otq.216.1640186541634;
        Wed, 22 Dec 2021 07:22:21 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id ay40sm419308oib.1.2021.12.22.07.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 07:22:21 -0800 (PST)
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
	Vinod Koul <vkoul@kernel.org>
Subject: [GIT PULL] Qualcomm ARM64 defconfig updates for v5.17
Date: Wed, 22 Dec 2021 09:22:19 -0600
Message-Id: <20211222152219.3752973-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.17

for you to fetch changes up to 156f91f1c49a5f2ccae8e4b2d882ca3a28e3f26f:

  arm64: defconfig: Add SM8450 icc configs (2021-12-20 23:14:00 -0600)

----------------------------------------------------------------
Qualcomm ARM64 defconfig updates for v5.17

This enables GCC, TLMM pinctrl and the main interconnect provider for
the SM8450 platform.

----------------------------------------------------------------
Vinod Koul (3):
      arm64: defconfig: Add SM8450 GCC config
      arm64: defconfig: Add SM8450 pinctrl config
      arm64: defconfig: Add SM8450 icc configs

 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)
