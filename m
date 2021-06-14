Return-Path: <SRS0=iMD+=LI=linaro.org=bjorn.andersson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 793B5C2B9F4
	for <soc@archiver.kernel.org>; Mon, 14 Jun 2021 22:37:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3791761350; Mon, 14 Jun 2021 22:37:06 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F418C611CE
	for <soc@kernel.org>; Mon, 14 Jun 2021 22:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F418C611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=bjorn.andersson@linaro.org
Received: by mail-oi1-f170.google.com with SMTP id t140so16084139oih.0
        for <soc@kernel.org>; Mon, 14 Jun 2021 15:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JEBptkwCOSVfqSHvIaKYeUu9NwMWSszSeUKl6IYxkPM=;
        b=LQ0+FxKPU0GcCXj8z0HjP7PW/fNiyf2DvV8s64WqkYvHbFUHvAN7abHeuT6tmfkP0e
         4xCh13e5gHGeoOpIBnFUtq96OTuF1VDYCk9mvNWyBbbXpcHnIL1bb/RjHc7FaH48JWQm
         fFcJDg/INY1a/hQA6LFmrkNEHJKq+QOWxHvRo7KkAGaA3hl4B760RcbtG04oNmX7zqZC
         Gcyk939ZWkVh97aB78OfOl+Jby0PyMb/w7HUK/aOZSFaOZNfn4LOWE6yuai6zA6buPLk
         qAoDcshn0upGJv/AcfXikXz5x4jOuJk004XPW4FZHE8JBSyEF2EruVNFS5uGJHybIb+s
         KOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JEBptkwCOSVfqSHvIaKYeUu9NwMWSszSeUKl6IYxkPM=;
        b=HwdueXNhSfnsjkTyb8FSAe7NqUVqFHDDPdRL6EPQQCusuaPzDnORJ794A32UhNNAtk
         kQSTpPYxwcQiJt5zMRDJGb+EbzinuMJ1ym8UUL3CKW1+NYoMjLK0aVy83e5BGJGxfjHK
         JGQxTQQur5XaOQk53FJ5XJTAPGUYVNpzGz/V7yJGbZ+kc/GXU3dOKpEkE/uRfT0fvhx3
         3XKySEIJ9XFQQOUZDu/A8R60zndMc/hvJr+i6chpPhANKQgNbhnTfpSCWHjBbsiLM/oE
         yx14WV6FfF8Ujgy7oZMIdEOV5+VVpypKwQyoNfm+FyvRtNdpUWcOoroqm4g2gGl1+Nza
         AfTA==
X-Gm-Message-State: AOAM531aY0FUijnFQBaclzvEgNeqSa8Th0bzFI2E9PsYQ0YEDz0pCVaJ
	6auulqy1wxzsc9LYFDqGgaOG4w==
X-Google-Smtp-Source: ABdhPJz9Ktvi6oY5qYq5IW9gi6GvArkQevPsTAWmPetaIOT4p2i6UwhCiFjxw1uJhcbUg/oa0SuUxg==
X-Received: by 2002:a54:411a:: with SMTP id l26mr11985680oic.65.1623710225296;
        Mon, 14 Jun 2021 15:37:05 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id b26sm3670710otq.43.2021.06.14.15.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 15:37:04 -0700 (PDT)
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
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [GIT PULL] Qualcomm ARM64 defconfig udpates for v5.14
Date: Mon, 14 Jun 2021 17:37:04 -0500
Message-Id: <20210614223704.393042-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-5.14

for you to fetch changes up to e9cd414c1136aa31d34acc04c175bfaca4662f89:

  arm64: defconfig: add drivers needed for DragonBoard410c (2021-06-14 16:59:27 -0500)

----------------------------------------------------------------
Qualcomm ARM64 defconfig udpates for v5.14

This enables VADC, audio codecs and Venus (video decoder) found on
MSM8916 among others and the SM8350 interconnect provider driver.

----------------------------------------------------------------
Marek Szyprowski (1):
      arm64: defconfig: add drivers needed for DragonBoard410c

Vinod Koul (1):
      arm64: defconfig: qcom: enable interconnect for SM8350

 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)
