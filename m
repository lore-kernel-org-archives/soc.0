Return-Path: <SRS0=PV0F=TM=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2662EC433EF
	for <soc@archiver.kernel.org>; Tue,  1 Mar 2022 04:10:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D9498C340F1; Tue,  1 Mar 2022 04:10:39 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 61366C340F0
	for <soc@kernel.org>; Tue,  1 Mar 2022 04:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 61366C340F0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oi1-f180.google.com with SMTP id k2so15250189oia.2
        for <soc@kernel.org>; Mon, 28 Feb 2022 20:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oFxxNgl/Sl3OIeyhMM5RFMZPxpbryf6azJ9AgfVgySQ=;
        b=Zj8VLqfHVDHSZ0LvJkj5NdAYCmGMHwVddqkmtu4uImc62pjQ/wMI1Eopk/cA9lA9h+
         Qy11Ib1MVrgvPzYcZN4zhUVHB+hKnUcMq0nVRr6W9LWIAgtmaKrqhntqPuMnVmskIUAN
         aZhnc00x+24+2ni+ElfGju1mVd8sYW9Wyvn7C9qGgY1P7dubG8GwvPdZzaAr6CO+wppi
         HG4jtyjzVfywlhp0mQSU+JuCJMbgPXmnR65FInGn3Mu06dIc2Iz5lKDyAB1ABYBQVEJW
         g5W1M3cEEB1Eds913ZdDwsXMaWVr6VAIrMbQBKOrmsQzw7QwC3DHuaD4t3AoVwNQWZF2
         4hEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=oFxxNgl/Sl3OIeyhMM5RFMZPxpbryf6azJ9AgfVgySQ=;
        b=T/N3hWZTMYekbddLkrgfqa021K0Ft+IHojDWYTeVDO12/LUbd8OuwFQe+qAqdQdB5H
         ez+vsgmrUC7CrlRQ9uN38Y8GDQlTod5avJLK0nhuH0phKpZknzz4knRV4GWWO3VdtFIi
         Orf9+yZELy/7gcHsGxNqyaKoJXrGRYMmHqT4kCsE9hJkRasMlNPMdHuM6m+x0jcFbjiN
         RxOupQjs+zI8FA6F5abJgXX3hb1lVyq2IP0l2szEVmUnnCS5J5LDiUP3dLf3ZynkcDjX
         YcRAnCTcR027Yrz4kmMnIqU7MxEnmrqZgREDLtEa4XnJinisGEiCRcSs5HjA9v4BQtDk
         YYtg==
X-Gm-Message-State: AOAM530nUY/mtJHXpyEgsOfz4sBT2yI9VEcXhbnqPAKQM8KHHTSuk1A8
	mcIGefL6ch/v78ZSBvdOJX1lTg==
X-Google-Smtp-Source: ABdhPJwdMBx/zpfoOxDDDNLMWaLcE4eNerej7Lxy/jpQzWl+IXhF2PcdB/6g0RLLp9JmVaKYDnTCUQ==
X-Received: by 2002:a05:6808:230a:b0:2d5:281f:9d23 with SMTP id bn10-20020a056808230a00b002d5281f9d23mr11728612oib.4.1646107837461;
        Mon, 28 Feb 2022 20:10:37 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id x3-20020a056808144300b002d4dedfc1ebsm7505272oiv.20.2022.02.28.20.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 20:10:37 -0800 (PST)
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
	Stephan Gerhold <stephan@gerhold.net>
Subject: [GIT PULL] Qualcomm defconfig updates for v5.18
Date: Mon, 28 Feb 2022 22:10:36 -0600
Message-Id: <20220301041036.1804008-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-defconfig-for-5.18

for you to fetch changes up to 7495af9308354b37a3557518d0d04f4cdb2a7837:

  ARM: multi_v7_defconfig: Enable drivers for DragonBoard 410c (2021-12-13 16:52:05 -0600)

----------------------------------------------------------------
Qualcomm defconfig updates for v5.18

The Qualcomm Snapdragon 8916 devices come in both 32- or 64-bit form,
and even though the typical case so far has been to 64-bit, it's
possible to run the Dragonboard 410c in either mode.

Enable the relevant drivers in multi_v7_defconfig to enable this, and
other Snapdragon 8916 devices to run the 32-bit kernel.

----------------------------------------------------------------
Stephan Gerhold (1):
      ARM: multi_v7_defconfig: Enable drivers for DragonBoard 410c

 arch/arm/configs/multi_v7_defconfig | 57 +++++++++++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 2 deletions(-)
