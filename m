Return-Path: <SRS0=7l46=JQ=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 428A0C433B4
	for <soc@archiver.kernel.org>; Mon, 19 Apr 2021 15:16:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 1CF9B61007; Mon, 19 Apr 2021 15:16:40 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE3336113C
	for <soc@kernel.org>; Mon, 19 Apr 2021 15:16:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE3336113C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=bjorn.andersson@linaro.org
Received: by mail-ot1-f47.google.com with SMTP id f75-20020a9d03d10000b0290280def9ab76so27772889otf.12
        for <soc@kernel.org>; Mon, 19 Apr 2021 08:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hUYb55vbsiGQBbuSQ1a5tSdTpqWWWh8+qc/85QHpA1M=;
        b=qK8ZVxyb1cccHQVc9o2z+qY7KHg0bcdEBOIfJh6IVdSgxKOiEU2kqIyTjdbE5SB1+g
         1lmzUiWqAD3t614GUtXyLoNnpXfPD8BJo1xAlvh77ialpsIJkzEzFw37QDaU6DsqWgd2
         pG2HExBwN1RO1ehEAw3gywro8qPl5gcr+MWNE/SVjdE7rAxBCnFmRbDvUBWuAusr4YXE
         LggGQ49k9/jtUmkItfjr8qmRyjEpuQ/dFZLUcmY9QpqlWr53SYki+JPgsxich089VHP8
         OgGupZnKFT/mxZ24myOUFqiUa8nRC4ulH3IbimiRnzNZKYc7HKNqwHCOweH395hJqDAA
         jR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hUYb55vbsiGQBbuSQ1a5tSdTpqWWWh8+qc/85QHpA1M=;
        b=gHNaV4L/3vAtZuLY4NFkod3jCMx2k3Fy4nv/GuRNglbzc46yzuGUJ874VeBL3rRaWc
         PibHVOFUMs8A45cXArWJgQiiQRYLJHMUUQZA6jGixw4nMqppHc5r6Tsak52Vea+y27+t
         oQqcaRt9zQOWzkDwbzQlFEbI71Mf7dTxlkIc+0hBbJw4j603U+PQixryp8jvfiLdIGXZ
         +i3bI8TqYQBZlB3MVFoV8nzOlaVnWN00OHffpYNASkPjlD10fCcEELcEfXweeWMOgHH+
         0nS1jQFRlB64m3ayXzmVWzHH8GybLkhMphvAwt2H5dcTrqinj7yM9mJAmx1FzlRlei9b
         fQLQ==
X-Gm-Message-State: AOAM532zLFqZelHi8NtgNfh6NJsMoYIlfwQunJGen/gw3QoEEnHBNKc+
	3VIHaw7p05RFdeTYF5JA4NZezQ==
X-Google-Smtp-Source: ABdhPJzuOipDCJfrbVe//1UzrkYBYdbiB7EsZv1E5ZmnOoKZR56/O11HaIo0Z7WFKLdEhXGyJhGeMA==
X-Received: by 2002:a9d:5a10:: with SMTP id v16mr15145401oth.187.1618845398855;
        Mon, 19 Apr 2021 08:16:38 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u18sm3008660oor.15.2021.04.19.08.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Apr 2021 08:16:38 -0700 (PDT)
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
	Douglas Anderson <dianders@chromium.org>,
	V Sujith Kumar Reddy <vsujithk@codeaurora.org>
Subject: [GIT PULL] Even more Qualcomm ARM64 updates for v5.13
Date: Mon, 19 Apr 2021 10:16:37 -0500
Message-Id: <20210419151637.861409-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 7178d4cc0702bfe6a7e0f21e37d6e3dfe8e40f11:

  arm64: dts: qcom: update usb qmp phy clock-cells property (2021-04-08 10:23:25 -0500)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-5.13-3

for you to fetch changes up to 1b86cc7330895b11df0a7dc15fbbbef60be9f7bb:

  arm64: dts: qcom: sc7180: Update iommu property for simultaneous playback (2021-04-19 10:13:30 -0500)

----------------------------------------------------------------
Even more Qualcomm ARM64 updates for v5.13

This contains three audio related fixes for the sc7180 Trogdor devices.

----------------------------------------------------------------
Douglas Anderson (2):
      arm64: dts: qcom: sc7180: coachz: Add "dmic_clk_en"
      arm64: dts: qcom: sc7180: pompom: Add "dmic_clk_en" + sound model

V Sujith Kumar Reddy (1):
      arm64: dts: qcom: sc7180: Update iommu property for simultaneous playback

 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts | 13 -------------
 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz.dtsi   | 16 ++++++++++++++++
 arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom.dtsi   |  7 +++++++
 arch/arm64/boot/dts/qcom/sc7180.dtsi                  |  3 ++-
 4 files changed, 25 insertions(+), 14 deletions(-)
