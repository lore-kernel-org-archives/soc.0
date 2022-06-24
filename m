Return-Path: <SRS0=MFSJ=W7=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 742A0C43334
	for <soc@archiver.kernel.org>; Fri, 24 Jun 2022 08:07:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5B126C34114; Fri, 24 Jun 2022 08:07:55 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 58B8EC341C8
	for <soc@kernel.org>; Fri, 24 Jun 2022 08:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 58B8EC341C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id mf9so3214141ejb.0
        for <soc@kernel.org>; Fri, 24 Jun 2022 01:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X1v3jnVlP/mkMDeaBNnd4ZrW67KDgsY+NuxPosiszbo=;
        b=PG3saZzZvFqQS5YG62Jct39n09PPGFpKK4rg8yhHjZlcr58Eb688Atv5oZA8CrbMIa
         /uNLGTz1xQJYwfTfpXgQMuFWKvYwGFHQSp8/MJGYoEVhKSVTI9IrNBojSDMfI3k8wv30
         ShanHh/VUfLmncyLyecPV/uI+z65arfIS5YypW+GQMCS4uFw4w7T18Ypfx7gTzsXCF17
         wr+VH50DiCC5A+7GeXI5btP7X3TV0n+kNgZnPSbLnfPkDCQeKKbqljDLnJNCNQRZ7ulD
         rn/s65Qxdp3o87EM0q3tc1ALdI4eqEKku7fruZS4gcbXKm344QOUoaXjreRkJ8U/whjR
         tcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X1v3jnVlP/mkMDeaBNnd4ZrW67KDgsY+NuxPosiszbo=;
        b=C6ZNPhPschU/SJ0DlNoK0Rj3KR70GcR4NeBj5K/ZwmApEAnrQlOXdvm6CS+shw+o/6
         tqjELVmSqyWGLm+uUr39HFHx1np2RkwfDLh8gTyhj8WulA/CaRqydMmPAkO7zax+3ags
         nNXKNIEKcrJc5t0LfobLxKR5Eeb23Nq4HDDGRJHDByLSdJpM+i9VXkiFiD71hRl8hqDJ
         UyyDhnNBjwPHhVs1KGsI6McJsi0EQUH+aO7QVuG+i5LIByyoJep6aFLZMf17p7yXQdqe
         KW+TP2HT+Mo8B+n4eWnqaFm7T3XwKpeSb074BtiLaC9Y8YIu77K/nQRtXCx3mA6X7l9n
         YLWw==
X-Gm-Message-State: AJIora8piEKXS3n91W1twSjk4jDHBwcx1CJPpMSbOfHSmeg1LY7zWTmJ
	iuQgjCz6HwDqVQth8+ga7x2CZQ==
X-Google-Smtp-Source: AGRyM1s63JpgKSSIp1pY2f2HsukfHxKxAzSpCfc9LDVmJdRLcfncSWs7ufV7VmZYc5bKtYzYSCBE7g==
X-Received: by 2002:a17:907:1c0b:b0:711:cc52:2920 with SMTP id nc11-20020a1709071c0b00b00711cc522920mr12372748ejc.301.1656058071669;
        Fri, 24 Jun 2022 01:07:51 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id j15-20020aa7ca4f000000b0043559d9e8b9sm1363573edt.53.2022.06.24.01.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 01:07:51 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/3] ARM: samsung: mach for v5.20
Date: Fri, 24 Jun 2022 10:07:46 +0200
Message-Id: <20220624080746.31947-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220624080746.31947-1-krzysztof.kozlowski@linaro.org>
References: <20220624080746.31947-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit f2906aa863381afb0015a9eb7fefad885d4e5a56:

  Linux 5.19-rc1 (2022-06-05 17:18:54 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.20

for you to fetch changes up to d1065293010a010261f0b1478daff40d5a3dc241:

  ARM: s3c: Kconfig.s3c64xx: Fix indentation (2022-06-09 16:10:09 +0200)

----------------------------------------------------------------
Samsung mach/soc changes for v5.20

1. Use preferred strscpy() over strlcpy().
2. Kconfig indentation cleanup.

----------------------------------------------------------------
Juerg Haefliger (3):
      ARM: s3c: Kconfig: Fix indentation
      ARM: s3c: Kconfig.s3c24xx: Fix indentation and replace some tabs
      ARM: s3c: Kconfig.s3c64xx: Fix indentation

XueBing Chen (1):
      ARM: s3c: Use strscpy to replace strlcpy

 arch/arm/mach-s3c/Kconfig         | 14 +++++++-------
 arch/arm/mach-s3c/Kconfig.s3c24xx | 26 ++++++++++++--------------
 arch/arm/mach-s3c/Kconfig.s3c64xx | 16 ++++++++--------
 arch/arm/mach-s3c/mach-mini2440.c |  2 +-
 4 files changed, 28 insertions(+), 30 deletions(-)
