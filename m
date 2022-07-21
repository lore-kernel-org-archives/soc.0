Return-Path: <SRS0=i+5e=X2=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB43C433EF
	for <soc@archiver.kernel.org>; Thu, 21 Jul 2022 07:24:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 18D82C341CB; Thu, 21 Jul 2022 07:24:21 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 40EEDC3411E
	for <soc@kernel.org>; Thu, 21 Jul 2022 07:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 40EEDC3411E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id y11so1413321lfs.6
        for <soc@kernel.org>; Thu, 21 Jul 2022 00:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g/Erh9ECa1GmGYKcDR9QQf3X/C7BJEjXlaj9Ex/mhqI=;
        b=mo1ucbP9dUaLOghZSffc4yuhJfHR2Ge78KgH0AbJTkk34XaWUZbF2qlV3mg/kAuQA5
         qoYqi26TkqBxJC21aE6Cb/Kvc0bKI+rw+gMH38CuUGX5FULs/HGd9F9N7vWjiygozLKd
         VtlZ5mgLRdXxh/nitoa5MNcFP5ymFcOlB+//JJkoNsbONCVVSPUUy2d5TMA5TIHUS+IH
         64Gi3QzlsOvk9x1sSwNrryOrCqt4AgDbLwiQJ/ohkSXFCIbLNtGnV94S+X3QoEXtPF3+
         TGqoEaicZ8E/HJ4UkqzkldBbAcFyWbUOBbczTR+2LnvXEbhV30TLH/rulo/rv1IbGelo
         Ro4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g/Erh9ECa1GmGYKcDR9QQf3X/C7BJEjXlaj9Ex/mhqI=;
        b=hjDte2JNsg3a7ibMLDaCwtJpvNWE6X0yGlIiZOJXVR3yHV3tlcls5kjzkbdhwZSgGX
         1kYPaRko6O7Fdua7szLgSs+nVtSY/T7n2OrwtAhDyD236yQ7nkzwog+oxGuVns7Pnxwe
         jrAT74ELOZS/ptCTKK0LXa5j4inBXQ4u9i8fh1DeuPG7vqaVNMBt3/TPbS2m2avtibtB
         qH67+jIxmLukP9zLG80JPrGuO5jjc8sGEicb3c6V/iPC7lHlRnnf0Hq/AZOAN+g/gzC8
         ClLDbnEtHckEmieQ9QfQmp4tQMSmj3xTCUxm8jbAVy8lBUDQRuUjSfWuQ1zrIF+f6/mL
         cQQA==
X-Gm-Message-State: AJIora/RYLgI4B655GhlZXp4Wb+OEarJXato/zhZ0HdL//OdF6cUIxHi
	1JfJZPpyO04RB/cUnjzG9wWiSw==
X-Google-Smtp-Source: AGRyM1t9vXNUOHcavuxV31KizmszNRMPwXlxzOTvLE9zBeHRAgaSArMq/Fyk80oELTM42L+J1Ey11w==
X-Received: by 2002:ac2:54a1:0:b0:48a:6908:1d54 with SMTP id w1-20020ac254a1000000b0048a69081d54mr1212982lfk.295.1658388258209;
        Thu, 21 Jul 2022 00:24:18 -0700 (PDT)
Received: from krzk-bin.. (89-162-31-138.fiber.signal.no. [89.162.31.138])
        by smtp.gmail.com with ESMTPSA id i8-20020a2ea368000000b0025dd6dd482fsm293007ljn.96.2022.07.21.00.24.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 00:24:17 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@aj.id.au>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] ARM: dt-bindings: aspeed for v5.20
Date: Thu, 21 Jul 2022 09:24:15 +0200
Message-Id: <20220721072415.11424-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Arnd and Olof,

My two patches documenting existing Aspeed board compatibles were waiting for
some time, so a month ago I decided to pick them up and include in the
linux-next, so other developers - like David - can base their work on these.
Unfortunately the responsibility for the patches was not cleared as I was
waiting for some replies Joel and Andrew, so I also did not push them out to
you. And then rc7 appeared and it is quite late now. That's my mistake, I
should sort it out earlier.

But anyway these were for a month in linux-next and other work [1] will need it.

Can you grab them last minute? If not, could you queue it for v5.21?

[1] https://lore.kernel.org/all/20220720085230.3801945-3-quan@os.amperecomputing.com/

Best regards,
Krzysztof



The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt-bindings-aspeed-5.20

for you to fetch changes up to 12f158808510b7810bda1fadd3e88ddc9e768db4:

  dt-bindings: arm: aspeed: add Aspeed Evaluation boards (2022-07-21 09:11:19 +0200)

----------------------------------------------------------------
Devicetree bindings for Aspeed boards

1. Document the compatibles of existing Aspeed-based boards.
2. Add jabil,rbp-bmc compatible.

----------------------------------------------------------------
David Wang (1):
      dt-bindings: arm: aspeed: document board compatibles

Krzysztof Kozlowski (2):
      dt-bindings: arm: aspeed: document board compatibles
      dt-bindings: arm: aspeed: add Aspeed Evaluation boards

 .../devicetree/bindings/arm/aspeed/aspeed.yaml     | 87 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 88 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/aspeed/aspeed.yaml
