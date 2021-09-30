Return-Path: <SRS0=H+38=OU=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D12EC433EF
	for <soc@archiver.kernel.org>; Thu, 30 Sep 2021 02:55:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id EF805617E4; Thu, 30 Sep 2021 02:55:27 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D407C6187F
	for <soc@kernel.org>; Thu, 30 Sep 2021 02:55:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D407C6187F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=linaro.org
Received: by mail-ot1-f54.google.com with SMTP id d12-20020a05683025cc00b0054d8486c6b8so5563663otu.0
        for <soc@kernel.org>; Wed, 29 Sep 2021 19:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JJWG2OEeplITAKWNwOIX3nc4uerEIugG53buzU1RsdY=;
        b=H5k3EYAxITPFMuZqEBLKmqnIhBiwLXm8+Ok+Lhtw2TbFArLgQDpDKjh16JVmYhrNfQ
         LaqEdgWJ6GjeLcpRrFwn0uhTqfd1SM92f1Utj76bZde8vOG58JgfDtS4LPPj2i4LRhzQ
         8Aq6FgozxwddjOhRw82heD78xIa88lPU2OhWO3zUsW7lnSw1fC9VraR7faejoGi7p2Rl
         +FV1ZrXBjhEXugr7QCBOSXr4PnKiF7ieW/3ZM0i7KinkmDtZuBVyIF78Js/P8gxWif2C
         mxDyPveg/7YQ6gN4++tgF/fm3n/jVxgczjU5R/8abqn2skP/xFlQ1mUOEtrRerZTOeJd
         sNEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JJWG2OEeplITAKWNwOIX3nc4uerEIugG53buzU1RsdY=;
        b=L2CsMuMxqFSPALNmgLCI/yt+ejMdwvK96rjGS1YgETcS/C/pPNClR8EOremgT3QQ7T
         wV4abxe5VVd5JNKmkOdApfWiQeW1PjR3XXx6NWcsziW5pisWb9RGFhFa590D+k7Bm/9u
         H3iEVJF99i3/WzOcWt62R9VKcRv8PBkx6eI4ZIPNNmKAx1r9k606yzkr9p8+tRAdKLik
         jBOlV/+Ii7qO9VluIOAZZCpV/1skbmfJT+vv1xVm7tWY1k247yneijGstOn20h+YXhG9
         bf6ePo+cTwbs95YknknDor3SuVOy/V3KwIxLgHuhBRGlBuEaeI2iJ9jzPzpcuCn260g2
         7FLg==
X-Gm-Message-State: AOAM533Tu29l5WH4kmlyZkYPIbSmR2+fNWOpnDKoJOb3tp0z3rzyC5O7
	Mz9Gm/TIwEZFXrKqnhwHvGBVCg==
X-Google-Smtp-Source: ABdhPJxRRRu9Jy4mBGdA2FQ+J3cuyWDSDAy6FAREe8NCBpOsAJk5JDiyzn2C1v00Ta0ixkFlQXM4/Q==
X-Received: by 2002:a9d:4910:: with SMTP id e16mr2935855otf.170.1632970527171;
        Wed, 29 Sep 2021 19:55:27 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id x28sm370202ote.24.2021.09.29.19.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Sep 2021 19:55:26 -0700 (PDT)
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
	David Heidelberg <david@ixit.cz>,
	Marijn Suijten <marijn.suijten@somainline.org>
Subject: [GIT PULL] Qualcomm DTS fixes for v5.15
Date: Wed, 29 Sep 2021 21:55:26 -0500
Message-Id: <20210930025526.1146-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-dts-fixes-for-5.15

for you to fetch changes up to ecf5b34cd5182180ff47ca14ecaca0a90db7fd1d:

  ARM: dts: qcom: apq8064: update Adreno clock names (2021-09-19 23:11:27 -0500)

----------------------------------------------------------------
Qualcomm DTS fixes for v5.15

This corrects the use of depricated chipid and clock names, for which
support was finally dropped from the driver. It also ensures that the
DSI PLL is fed by the correct clock, now that it's being migrated to not
rely on global clock names.

----------------------------------------------------------------
David Heidelberg (2):
      ARM: dts: qcom: apq8064: use compatible which contains chipid
      ARM: dts: qcom: apq8064: update Adreno clock names

Marijn Suijten (1):
      ARM: dts: qcom: apq8064: Use 27MHz PXO clock as DSI PLL reference

 arch/arm/boot/dts/qcom-apq8064.dtsi | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)
