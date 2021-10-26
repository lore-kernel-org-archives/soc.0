Return-Path: <SRS0=GGsf=PO=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE784C433EF
	for <soc@archiver.kernel.org>; Tue, 26 Oct 2021 13:49:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 72D2560F90; Tue, 26 Oct 2021 13:49:55 +0000 (UTC)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 513DC60D43
	for <soc@kernel.org>; Tue, 26 Oct 2021 13:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 513DC60D43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-ot1-f50.google.com with SMTP id l10-20020a056830154a00b00552b74d629aso19880406otp.5
        for <soc@kernel.org>; Tue, 26 Oct 2021 06:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PgcgUi0aKzGvNSZ/upN2vDxathxvZMJpdDJTs+D3GFg=;
        b=ilH9IDaXEJChoPlap7VE1xIGKJT0kcBhQv8CLpxuK6nnI5KmOgZOH8vfMubcxAc4vy
         y6p5NmEjcZQOhXrSwuyuL25IP8XOh/rogu4+pdJiTacRwqkNxfNtMK3Dox8IiJYrSnBc
         vfa8YwreJu6Mr2LFioJX61AJjoUwseK3akxaU7CylDvEyH2IJ5hTfQnwMAFzJI5Tuvig
         O0sbm3X90FYZR9JhZN1deD5rZgIMvPqdC1KRCvD0rhSa9VviJH+w79L8HOn6ctQtj0Kw
         eu08NB+CabcApEHrR57Rn3MGOrRmcxmsWKC6hEBfkqyWYQN9pTlcjVVcFzo1vLcSG0PT
         8a1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PgcgUi0aKzGvNSZ/upN2vDxathxvZMJpdDJTs+D3GFg=;
        b=FY0l9RwCwKuwIlugTJ67Xni0TtLIRQjVEH+H1TsHcnBvoVsj+utQB1uVBsj9KtZxCn
         rEIdcVVlVHsDMfLBM0e51AtSYEJE1wmnwdvbRsVkX7Ip+1IVjH9pti3fKiaF6E3i3wyK
         nHX9607Xio3n4AUKVbwL0yQmEbh1DXwhDjq2COuvknl4dQYLIRkeC4PM97oXyODfq6PS
         0RQBSJK5Mx2VnIcT0bnOSlydGOqY4m3hIT5Q5yrCsdOx/ZaMfnqUCNXeGbu2QQW/PJNw
         xMzzixbOuwiKNgCtLg2Wl6Vz0MtONWiPNPL3TM08BN2g4UIViXPCZdVWJEZi8soeY/hX
         bSDA==
X-Gm-Message-State: AOAM530pcooC8Uau9Elox0R/BkKWgeikGnmph72R8cN3PBskkZ8OsSYt
	sHkdbLovaEhTRTJ9/n4DP52Srw==
X-Google-Smtp-Source: ABdhPJx0vq6FZnYNI9ja1HEk+yhqXMevPwQk6aw7o0kPhZ56uvsWFUomcnLFC9klJi5kKxyFnFGRcQ==
X-Received: by 2002:a9d:4b8d:: with SMTP id k13mr18797941otf.103.1635256194482;
        Tue, 26 Oct 2021 06:49:54 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id c17sm4767607ots.35.2021.10.26.06.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 06:49:54 -0700 (PDT)
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
	Maulik Shah <mkshah@codeaurora.org>,
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Subject: [GIT PULL] Qualcomm ARM64 defconfig updates for v5.16
Date: Tue, 26 Oct 2021 08:49:53 -0500
Message-Id: <20211026134953.1204327-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.16

for you to fetch changes up to 2da521272ad3bba2019dd1a610261d99d62401fd:

  arm64: defconfig: Enable Qualcomm LMH driver (2021-10-21 09:41:00 -0500)

----------------------------------------------------------------
Qualcomm ARM64 defconfig updates for v5.16

The major change here is the disabling of the firmware loades user space
fallback, this is done as arm64 is the only platform with this flag
enabled and as a result doesn't play nice with standard distributions.

It then enables the new limits driver, which controls the hardware based
thermal mitigation on a range of Qualcomm platforms. The prima/pronto
WiFi and Bluetooth drivers are enabled to ensure these features works
out of the box, now that the last details in the dts are landed.

The new driver for acquiring sleep stats is enabled to facilitate the
various efforts on getting these platforms into low power mode.

Lastly the base SC7280 drivers needed to simply boot this platform are
enabled.

----------------------------------------------------------------
Bjorn Andersson (3):
      arm64: defconfig: Disable firmware sysfs fallback
      arm64: defconfig: Enable Qualcomm prima/pronto drivers
      arm64: defconfig: Enable Qualcomm LMH driver

Maulik Shah (1):
      arm64: defconfig: Enable Sleep stats driver

Sai Prakash Ranjan (1):
      arm64: defconfig: Enable QTI SC7280 pinctrl, gcc and interconnect

 arch/arm64/configs/defconfig | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)
