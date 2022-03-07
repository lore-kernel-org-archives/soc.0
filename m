Return-Path: <SRS0=ZOfN=TS=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FECC433FE
	for <soc@archiver.kernel.org>; Mon,  7 Mar 2022 17:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 7A613C340F4; Mon,  7 Mar 2022 17:36:22 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 946AEC36AE3
	for <soc@kernel.org>; Mon,  7 Mar 2022 17:36:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 946AEC36AE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D94CC3F5F1
	for <soc@kernel.org>; Mon,  7 Mar 2022 17:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1646674579;
	bh=3HG+K+k5QA/B8ff7N43iW1x5z1qS4k2KKhb2cegl518=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=vHTP3IIeNp0CCnFLLGeTicQpH3qwvQ59tlc47kKynVmO/+qI1/QuZQnDKr0xc3ikK
	 wp2mCTD/r5EclH/77ZhrB7gQNroYCQG4GUNcv/N58aeoj9gL/3l20McXeEq/UJBCCl
	 SKYcsGl80L/7vAmNs2KJ7JNc9PVZWPmxP3YIWgGfq5hg1HRmaSfSPQFWEaizlHucpQ
	 tuXalP+EZuiVeotyWf1IoBvRzAOR4NLX9bMiKC/PxE3/+0IgbAFO+ouagnUOFgbSzC
	 bd8xnir0EeSBfM3A4O7r6MVLu+6D8UzPLJi9I+Jr5p3r14xC2TrgUmR7QbEcrmbZw4
	 q1P4t4bfGrqdw==
Received: by mail-ed1-f70.google.com with SMTP id l24-20020a056402231800b00410f19a3103so9053416eda.5
        for <soc@kernel.org>; Mon, 07 Mar 2022 09:36:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3HG+K+k5QA/B8ff7N43iW1x5z1qS4k2KKhb2cegl518=;
        b=IbJkgMzMpbFo4lJcrfskV6d0jWn8t2qRf7HLsHLV+KlGywjtbISUInu8v58k8Gejpw
         XzSp3xPp2xSS6LdyurN15nKUhw9E4vVoZhTbDvPpHqzh9GF2H6EiUcyxbOG9Q1f0V13f
         myD88UuFWr9fURWUfWJj/JuMmoCka249u7itPlM54xdcpn274yeXdepkzTiQMR3PIoPu
         0zkD37NN76pjbA846EvHWMTIoCzRspInCmAJCeagou8X2fsC5pprVTabZpvs4LhOKFLg
         TVFTzmPPhc9hGtmgsEhYVg3E/RFphocllOMbE2vDlShPsZzpULGDGhT7Rdol7a81K0yj
         1UpQ==
X-Gm-Message-State: AOAM533n8CZjbuGYcK3OBk6q0gu7P0xnjoQ7Bfp9sVkMqgVlll9rahsq
	fPTzW3K2aYQsuLNS2fCHLnaXOEOZ4v4CH4aWf1kWaWxeta2ZK6I/8g0tyMQR7OW+7NyPYBVLPJa
	15Nx/6lRyQ3+jaQkEeEqisn8=
X-Received: by 2002:a17:906:585b:b0:6b7:73bc:5395 with SMTP id h27-20020a170906585b00b006b773bc5395mr10109315ejs.519.1646674579334;
        Mon, 07 Mar 2022 09:36:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzKjiixge1fWdZzZQpMZjyr+5Ie33xOV4IY4yStu5Ftd/B2YpKtjTs3nermPtLrgHBcoNxM1w==
X-Received: by 2002:a17:906:585b:b0:6b7:73bc:5395 with SMTP id h27-20020a170906585b00b006b773bc5395mr10109307ejs.519.1646674579149;
        Mon, 07 Mar 2022 09:36:19 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id i6-20020a17090685c600b006daecf0b350sm3284875ejy.75.2022.03.07.09.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 09:36:18 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Chanho Min <chanho.min@lge.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: [GIT PULL] arm64: dts: various cleanup for v5.18
Date: Mon,  7 Mar 2022 18:36:14 +0100
Message-Id: <20220307173614.157884-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd and Olof,

These patches were for very long time on the mailing list, but they were not
picked up. LG maintainer acked the LG part, ARM Juno remains unanswered.

These are considered cleanups, not fixes, although they fix real
dt_bindings_check warnings.

Could you pick them up for v5.18?

Best regards,
Krzysztof


The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/dt64-cleanup-5.18

for you to fetch changes up to ad3c72b0c6b912a0e917ae8010c62cc98012ab1e:

  arm64: dts: lg: align pl330 node name with dtschema (2022-03-02 20:25:14 +0100)

----------------------------------------------------------------
Minor cleanup of ARM64 DTS for v5.18

The DT schema expects DMA controller nodes to follow certain node naming
and having dma-cells property.  Adjust the DTS files to pass DT schema
checks.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      arm64: dts: juno: align pl330 node name with dtschema
      arm64: dts: lg: add dma-cells to pl330 node
      arm64: dts: lg: align pl330 node name with dtschema

 arch/arm64/boot/dts/arm/juno-base.dtsi | 2 +-
 arch/arm64/boot/dts/lg/lg1312.dtsi     | 3 ++-
 arch/arm64/boot/dts/lg/lg1313.dtsi     | 3 ++-
 3 files changed, 5 insertions(+), 3 deletions(-)
