Return-Path: <SRS0=rxEr=ST=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB85CC433EF
	for <soc@archiver.kernel.org>; Fri,  4 Feb 2022 15:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B67FEC340EF; Fri,  4 Feb 2022 15:41:19 +0000 (UTC)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 92F18C340EB
	for <soc@kernel.org>; Fri,  4 Feb 2022 15:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 92F18C340EB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E09BA3F1F0
	for <soc@kernel.org>; Fri,  4 Feb 2022 15:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1643989276;
	bh=wZglkyjtNPMuirlfKz4+2S7FR+L5T3ePXu8KGwauAX0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=NZe5Yt6Y6ovESa4OWyDTpAV6UA2zD77bXdyIV1NinY7tJy5aEvlvmqVWEodEOESRP
	 EldfTMMgt0+XMPJgncWlCTa5vvTAGjwKmGsmpbej1lBImJj0N39G448tuJF8727dp9
	 7QsXWoigANE+0c6oXfUIZuIO902342mJIZ3zK5EM5ktXz/u7hD87Fc1+gANuL+bHKy
	 hcyC1rJxCa4zcXezgV7q5xOk1ROTnAtAYQiRUSZON5wtcbAf2LggGbwZy9864dBHo8
	 1QLBi9Z8SlhF0wboyeywoDsiAYdbiGLfSjZkNfA+8nZxC9je3KteZQyGxYLwgb8HMF
	 Q7ip9MG49atyQ==
Received: by mail-ed1-f72.google.com with SMTP id c23-20020a056402159700b00406aa42973eso3471738edv.2
        for <soc@kernel.org>; Fri, 04 Feb 2022 07:41:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wZglkyjtNPMuirlfKz4+2S7FR+L5T3ePXu8KGwauAX0=;
        b=rogHpx+F3MRbYHk3RvFg71DCu3bTA9sUuv1Xd7+FST8AAlS+oFjTE9iiuiKd0s7qfi
         DrDHAomAu2yNcr7YT8YEoDoTZ2uaozrzqaYTwFIyuYr7vfSSr/kIV5a9oyf7B7E4azFi
         coN4owL5xCSzw6JBhq5qzkObL7S3Cwlg43ZbvTVC+Oo7eyHSWYQRMcuFNkMG9b1T5RxG
         h+f7rcex3SOusiDU7dcFkrE1X/EYtfPtLIi3t3S0i5Rxg2Qy9pnsyS8VK21PjQClRdZz
         1nrkAQK5l5XxilezzlNL3JiXXOMWsMdEmKJM6U2kj7ouU8rVWKhs9DeBHTG/3Um6ejGt
         Y6dA==
X-Gm-Message-State: AOAM530kGze1dNUXfVq7z3M5fdCj56t3CvYgspZuuOqQOfPe0MukLQOQ
	m+JFMbHm/mAYYd5s606yBHdn+iKGdNnsCt7eN0LveQ0t596zSnpYcT2v90u5yXD4xKaqW4Qvvc4
	fobiyBxmLzug9Iae3/dxWgKA=
X-Received: by 2002:aa7:cb58:: with SMTP id w24mr3572669edt.425.1643989276598;
        Fri, 04 Feb 2022 07:41:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzIHtmwRhhbCAkf12pMJG1LNwuiJTM+g7YJu4r1672xFdn7Pt3ou2gK4nQ5FcODLQfJZP6z3g==
X-Received: by 2002:aa7:cb58:: with SMTP id w24mr3572655edt.425.1643989276429;
        Fri, 04 Feb 2022 07:41:16 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id rn16sm770753ejb.61.2022.02.04.07.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 07:41:15 -0800 (PST)
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
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [GIT PULL 1/2] clk: samsung: Tesla FSD for v5.18
Date: Fri,  4 Feb 2022 16:41:11 +0100
Message-Id: <20220204154112.133723-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd and Olof,

The driver changes for Tesla FSD clock controller. I got ack for these from
Sylwester.

Best regards,
Krzysztof


The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-fsd-5.18

for you to fetch changes up to 0b59bc00a6936e8670b58d4307a2cfba341d40d0:

  clk: samsung: fix missing Tesla FSD dependency on Exynos (2022-02-01 09:14:53 +0100)

----------------------------------------------------------------
Samsung clock controller changes for v5.18

Add support for Tesla FSD SoC clock controller within Samsung Exynos SoC
clock controller drivers.  The Tesla FSD's clock controller is similar
to Samsung Exynos one, so entire driver structure can be re-used.

----------------------------------------------------------------
Alim Akhtar (9):
      dt-bindings: clock: Add bindings definitions for FSD CMU blocks
      dt-bindings: clock: Document FSD CMU bindings
      clk: samsung: fsd: Add initial clock support
      clk: samsung: fsd: Add cmu_peric block clock information
      clk: samsung: fsd: Add cmu_fsys0 clock information
      clk: samsung: fsd: Add cmu_fsys1 clock information
      clk: samsung: fsd: Add cmu_imem block clock information
      clk: samsung: fsd: Add cmu_mfc block clock information
      clk: samsung: fsd: Add cam_csi block clock information

Krzysztof Kozlowski (1):
      clk: samsung: fix missing Tesla FSD dependency on Exynos

 .../devicetree/bindings/clock/tesla,fsd-clock.yaml |  198 +++
 drivers/clk/samsung/Kconfig                        |    9 +
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-fsd.c                      | 1803 ++++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                      |    1 +
 drivers/clk/samsung/clk-pll.h                      |    1 +
 include/dt-bindings/clock/fsd-clk.h                |  150 ++
 7 files changed, 2163 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/tesla,fsd-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-fsd.c
 create mode 100644 include/dt-bindings/clock/fsd-clk.h
