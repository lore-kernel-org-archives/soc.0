Return-Path: <SRS0=xdQ+=XR=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960C3C433EF
	for <soc@archiver.kernel.org>; Tue, 12 Jul 2022 03:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 57DF3C341CE; Tue, 12 Jul 2022 03:18:15 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 82A10C341C8
	for <soc@kernel.org>; Tue, 12 Jul 2022 03:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 82A10C341C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f177.google.com with SMTP id w83so9053811oiw.1
        for <soc@kernel.org>; Mon, 11 Jul 2022 20:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=32e9w7H/YZWGbr9gX3MxrH+QEmq87aGcQE2gV4/SJnk=;
        b=IP2JpeJ4y5Hz3arOc8BXbzqMWOhDhhY9QolRaN1SCjFIxa9oveysbISh8EJtOU+HiV
         v0NJHxgzkS+m1P3oMXpsWkY/k/gZOx0tTcETUHfKLo4xFLcp66kiWW8o8f5sw5UdchgQ
         mu4bvvld/rtmiByau1n27UbbVK+bwR0WvG5qrfREh/9OgVWi3cXUjy7BiqF0A27xhDQG
         QOlGByS6WgJTn+hGanrHTlAWKdUDsd1auRjAfUoJTiqq32okpm3ZnRYMsBHwK08LSxXO
         TLPWDhYO+pVojLXo+Jbm4CW5EyyH2YZ/6PH6J3Cc5Eg6s6wgtcrKf0zBPkNRR2L+itG3
         yijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=32e9w7H/YZWGbr9gX3MxrH+QEmq87aGcQE2gV4/SJnk=;
        b=DBA+fPL4UF5dTXUbyIlx3ryZccUMMQKh/3lc0jmDqEjDu7d5JKWrQHz1NZR5uL1DQ7
         qA9fqh/cKdVfgTuLlJ802gGq7SqF8IOnqzhCMz+xEFElezzAk5zmA8tFqB9Nyaj4cyqo
         JVA6NvN/bmTnq4ucNtcJLDPMD1nY/CjW31SDoY+cqFdTkVxwntkGXJjhICQeXU1qWKFF
         rI60kb4HLiC8DakbVRk12uJpKb16Oy0y0NCNLkkWfW044ge64YGq9cso8p+Ij1BA0x42
         P5ffOhEaX5cGJcP022GYJMdrQIBgLR4G0qoHvvz2dWJLEj2K0YyNmVfM02Mhdt9zLrGa
         NVGQ==
X-Gm-Message-State: AJIora8aT5Om9xUntQU+FUjL5Q+lIkPW5BOGXk14zgi/vUUM2yw+nR3Q
	2jpYPP5/CRPS1m8QXsnOjR1Vog==
X-Google-Smtp-Source: AGRyM1tx652Yw/r/fiijIIbJzi2YD3iutE2V9+Lz2qF8Axy228G+uuKPPm/66rRKjOA2Jf/YfKZ5sw==
X-Received: by 2002:a54:4e8d:0:b0:325:988d:afaf with SMTP id c13-20020a544e8d000000b00325988dafafmr825016oiy.135.1657595893397;
        Mon, 11 Jul 2022 20:18:13 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id c128-20020aca3586000000b00338869042fdsm3517878oia.32.2022.07.11.20.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Jul 2022 20:18:12 -0700 (PDT)
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
	Vinod Koul <vkoul@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL] Qualcomm ARM64 defconfig updates for v5.20
Date: Mon, 11 Jul 2022 22:18:12 -0500
Message-Id: <20220712031812.1275182-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.20

for you to fetch changes up to 76f11e77f919397f31198354cd0e0bd8e76f8748:

  arm64: defconfig: enable Qualcomm Bandwidth Monitor (2022-07-06 15:58:13 -0500)

----------------------------------------------------------------
Qualcomm ARM64 defconfig updates for v5.20

This enables the drivers for the Light Pulse Generator and Bandwidth
Monitor hardware, found in a wide variety of Qualcomm PMICs and SoCs.

It enables interconnect providers for MSM8996, QCS404 and SC7180 and it
enables the USB PHYs for the QCS404 platform.

----------------------------------------------------------------
Dmitry Baryshkov (1):
      arm64: defconfig: enable Qualcomm LPG leds driver

Krzysztof Kozlowski (1):
      arm64: defconfig: enable Qualcomm Bandwidth Monitor

Vinod Koul (2):
      arm64: defconfig: Enable qcom ss & hs usb phy
      arm64: defconfig: Enable qcom interconnect drivers

 arch/arm64/configs/defconfig | 8 ++++++++
 1 file changed, 8 insertions(+)
