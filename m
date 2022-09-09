Return-Path: <SRS0=6vKs=ZM=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F86ECAAA1
	for <soc@archiver.kernel.org>; Fri,  9 Sep 2022 15:08:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5C82EC433C1; Fri,  9 Sep 2022 15:08:58 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6D748C433D7
	for <soc@kernel.org>; Fri,  9 Sep 2022 15:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6D748C433D7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id bt10so3231447lfb.1
        for <soc@kernel.org>; Fri, 09 Sep 2022 08:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=OFl3KVYMwoKCA5gQPOAWcRrgWousLHFPlPzosiKMPAM=;
        b=X5XTx6S2KgWJ+JA+QRFDx0RWr6e+TRPp2Sz7f2lqt58qI0bknyk/ct/kzhYdwWAGOr
         cXki5Cd4jWF9eGcYSfEiP95rItylMlwow/f5sll94gGtKRix65HFNAjOxrv4PfjXd9lx
         NOYPp7ww3TEULP3xu6K+vHFBk8m/Iw6LVULJ44pRObr4sLlxm1GXPJmXKtkXeyrrfVdI
         pymQFmLzGBw1YgOkaiLGC5bd1QQt+Glv+rpI9ESOq2Xxo/Ya5pe8IpNZ5JzLxp/0m5hT
         bOlMiPK5Y3l+BamGwbB95p6AVcgubMlRgx27+WVHxdm3zAwjNwO4kdUxSETXBL/dBduS
         Hmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=OFl3KVYMwoKCA5gQPOAWcRrgWousLHFPlPzosiKMPAM=;
        b=AwDfuTpbydxgZHyCv9E4WZHeEOQu09gXWUEycorzsW0X/RqYy1CPduB/jnoq6cPT1A
         9Q4zUP+VU/zoAryOGzPgeZ4K1YUZbbR6/tuIQVnlHF65zYgvV97kEw1BJBcsKaQumu1Z
         YPF/Rdkv3izEcpoPZZERD6Bem7nO2H8RBiJuivfJhiIEil9uXDkFhOPZxH8QEaDsOfXR
         Z/rpTMDeuzUyExXvwAlb2pS/wYRglDGmLkc3U4e4PbTxuqFaSO5hnQuquDq0uEZSYK/T
         BrisjEz33DlcZBo7NBihkA2E7bIoubon4TGqiCp120lgqEo4G7gYFUcGYDVFAQyfPvcx
         FaFw==
X-Gm-Message-State: ACgBeo0CqJbsOggkYkmIdLR6mSWa9Pdgks7T6pOndI2J5Vzg0wpal3Ef
	BVqKhoslO3ASfk0K+9UV4P025A==
X-Google-Smtp-Source: AA6agR4FN4UZ1MeD4KdaYCws73kSEI+YhbT4w0FFcJ1iRYXsiaN6wwY9/EcHgX9n1reM0ZKfCjRY2Q==
X-Received: by 2002:a05:6512:3daa:b0:494:8270:f6b9 with SMTP id k42-20020a0565123daa00b004948270f6b9mr4718992lfv.486.1662736134564;
        Fri, 09 Sep 2022 08:08:54 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id d26-20020a2e361a000000b0026ab83298d6sm110605lja.77.2022.09.09.08.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 08:08:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] Samsung SoC driver for v6.1
Date: Fri,  9 Sep 2022 17:08:48 +0200
Message-Id: <20220909150849.820523-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.1

for you to fetch changes up to 6212d2d9bbde60171d0c534e5f43932f84a06d5e:

  MAINTAINERS: Drop Bartlomiej Zolnierkiewicz (2022-09-09 16:59:25 +0200)

----------------------------------------------------------------
Samsung SoC drivers changes for v6.1

1. Convert Samsung Exynos G-Scaler bindings to DT schema.
2. Maintainers update (drop Bartlomiej Zolnierkiewicz).

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      dt-bindings: media: samsung,exynos5250-gsc: convert to dtschema
      MAINTAINERS: pwm-fan: Drop Bartlomiej Zolnierkiewicz
      MAINTAINERS: Drop Bartlomiej Zolnierkiewicz

 .../devicetree/bindings/media/exynos5-gsc.txt      |  38 -------
 .../bindings/media/samsung,exynos5250-gsc.yaml     | 109 +++++++++++++++++++++
 MAINTAINERS                                        |  13 +--
 3 files changed, 110 insertions(+), 50 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/exynos5-gsc.txt
 create mode 100644 Documentation/devicetree/bindings/media/samsung,exynos5250-gsc.yaml
