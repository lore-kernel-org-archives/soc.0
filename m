Return-Path: <SRS0=SKgf=JG=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987F4C433B4
	for <soc@archiver.kernel.org>; Fri,  9 Apr 2021 16:24:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6FCD2611BE; Fri,  9 Apr 2021 16:24:01 +0000 (UTC)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CC3D61186
	for <soc@kernel.org>; Fri,  9 Apr 2021 16:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CC3D61186
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=bjorn.andersson@linaro.org
Received: by mail-ot1-f51.google.com with SMTP id g8-20020a9d6c480000b02901b65ca2432cso6226980otq.3
        for <soc@kernel.org>; Fri, 09 Apr 2021 09:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ByB151TUOSTf2AoksdIDlwnxayEzo8uelQVntltKUxI=;
        b=hZgYtwqOtVrF1pzF5T7/4V/VIp2inE0KuoTdLnWgd4iRf/mGWlTnb1O+/de+6KxLs/
         3j8V6Zs8GGDzqDieeP04oA3ok9P5T3Hg2iPyDezkPUSe7BdkpvHjp1gIJSi7w1jn/qb0
         T1tUwRVkTlgOAcv6fnY3PeDxKJLskGg/8a0iQ6Fzdb3cTDuVhs+a/yNNhLxuIQk+jfcH
         oZpgIYZGHFCHK71fWTxNSuLo7aASY0zJ8P3/8FcgdP/QeAqiZ4fWeyfhko+cEM1rdrcd
         x1GgAmtBrNH3r/AsQPGmpw1krdptjojrNWSCvnuSI8sGcplmyHVSsNPtoLtAHdGv5uKu
         fBwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ByB151TUOSTf2AoksdIDlwnxayEzo8uelQVntltKUxI=;
        b=qrEs1/J16+1njQcS+2xQGl9Jqupu0V9fy1riG5ig5O95zRv4aPBlESBx6adt4FvKnY
         vbsK0pdf0JxrHgwa4gPnmdtc/lvv4nPQ0T4uy2zFdHBBzf3jL2dpyY3PvgZNXpyjsuf+
         iPHI7L0MhDqAY/rwH2KGngFZ2vnwUOYlwJjgB/G4i1QSZ6uYZts4VHzmKZjQxuq2GEvq
         A9zmi2JD9eOnbe2pYZY0RtaZUiHBDRCz55niuKSUC53s+Bl33VYofr8OQDxypQrCKyfZ
         78thGBhAV5hWVEebeSfZxlFIPO2Zd89p86UKO5pnuTn5BZA1iDDGrCroeKXM9TYnJ4Ik
         5p8g==
X-Gm-Message-State: AOAM5300qy3oswGFKjU6kFPwdnnah0dd7e2opxoGsVmURx9yZiebPetM
	8ZeA/cwTiZCcFQmeXTshdde4Og==
X-Google-Smtp-Source: ABdhPJzQGYVHkW5E8c3uvfg8c4PpdRxpEzWwlO+LYuXEFyNGtD4lDGhOJhYs7GqhzECZsUTCwZivIA==
X-Received: by 2002:a9d:550f:: with SMTP id l15mr1059901oth.11.1617985440571;
        Fri, 09 Apr 2021 09:24:00 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id g21sm715196oti.19.2021.04.09.09.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 09:24:00 -0700 (PDT)
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
	Alexey Minnekhanov <alexeymin@postmarketos.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Luca Weiss <luca@z3ntu.xyz>
Subject: [GIT PULL] Qualcomm dts updates for v5.13
Date: Fri,  9 Apr 2021 11:23:59 -0500
Message-Id: <20210409162359.776076-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-for-5.13

for you to fetch changes up to 885aae6860fae1eed38f5cc1ac09a40e4896a38c:

  ARM: dts: qcom: msm8974-klte: Add bluetooth support (2021-04-06 11:53:16 -0500)

----------------------------------------------------------------
Qualcomm dts updates for v5.13

This adds Bluetooth support on the Samsung Galaxy S5, corrects the mount
matrix for the IMU on Nexus 5 and corrects the fuel gauge irq trigger
for the two devices.

----------------------------------------------------------------
Alexey Minnekhanov (2):
      ARM: dts: qcom: msm8974: add blsp2_uart8
      ARM: dts: qcom: msm8974-klte: Add bluetooth support

Krzysztof Kozlowski (2):
      ARM: dts: qcom: msm8974-lge-nexus5: correct fuel gauge interrupt trigger level
      ARM: dts: qcom: msm8974-samsung-klte: correct fuel gauge interrupt trigger level

Luca Weiss (1):
      ARM: dts: qcom: msm8974-hammerhead: add mount matrix for IMU

 .../dts/qcom-msm8974-lge-nexus5-hammerhead.dts     |  6 ++-
 arch/arm/boot/dts/qcom-msm8974-samsung-klte.dts    | 52 +++++++++++++++++++++-
 arch/arm/boot/dts/qcom-msm8974.dtsi                |  9 ++++
 3 files changed, 65 insertions(+), 2 deletions(-)
