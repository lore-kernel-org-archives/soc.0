Return-Path: <SRS0=D6Du=J3=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C64EC48BF6
	for <soc@archiver.kernel.org>; Sun, 18 Feb 2024 18:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id ADC35C43399; Sun, 18 Feb 2024 18:21:48 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A9C00C433C7
	for <soc@kernel.org>; Sun, 18 Feb 2024 18:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A9C00C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33d509c5706so66188f8f.2
        for <soc@kernel.org>; Sun, 18 Feb 2024 10:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708280506; x=1708885306; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fJfZGgvEn4sXAQA9xUq6oU/7z2TY2Q42B8jeqcmrPMo=;
        b=yCxbvnXoPFgKwRAf3KPN87Si0jOO/4ypzn7VgE8o2+RLwNsX0tfqYXwEBGZbvk9pfo
         RKpapbIn+/3a31LvwPQRW2MiRxa2T6G795WZARiOG3dsmPnrjSMjjdd9Z+sxXiH6Z3EU
         dtyAiWlqlrwKxj+5dblhGIf02FOgHuMFBAQirn2Qcy7KO6cKpVj5bKF/S/ARgGcBJwvn
         ugNc6yaVRzMSeFy9LUePa3Z8f0XgKT599IT+xJso66pBm+DXUKyuhLMzXXhWOcUn1Y4B
         LeNQdZane7Um//tTXODNflh4+OP3Mg/1BbeEYs3JxWxmknnlOvtNKhlhml1pM+t74AV8
         EC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708280506; x=1708885306;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fJfZGgvEn4sXAQA9xUq6oU/7z2TY2Q42B8jeqcmrPMo=;
        b=pK9Sg0/PPf8bp6dfLUpp1COoQwOBCpIosKxRGOpg0Y6LPih0IoA+fNckeSc7o5yMCx
         ioBOsyPeqDB318x5OhlkhtTK0/b9qbMEzECoALHGr8qfa7OIc+XMjfd0K75/G8hrcFcN
         mN+aOyxTSvwd4MBW/LDPVX7+PwEi5fmkwRiQ2oOEKKQjFwINDlBNn+MwzNYCOPu6qRSN
         UI7ZcpuHCV9q8EZo2F709oUUhPJriMYyiNDQvr2fA4M4kafDh6Zktb5tN3ijCTweheSl
         VfWSEMXb9WzGt8Yiu3Rr/Yw2kGzcyy+qvLuoMNwExiF273DZT8DTACOD4PMVW/DNtdiC
         HxOg==
X-Forwarded-Encrypted: i=1; AJvYcCWHuRtzvJkdGW02qUdJQ+ht1Z7aOJq0z4UmsCue4vpVHogZV2ngQBQLF6ij0UOF7nKDBQ08hi16ghcgYQmrOQ==
X-Gm-Message-State: AOJu0YzosWpog4Lev5YdhxBo5fr437/U/maC52210gXngfXoKrTesEnF
	GuJQhqEteb6evYfxFwHXdaneiVbZz4AWu4s2iiMLh85wWF+3BrCSgZETOb72pxs=
X-Google-Smtp-Source: AGHT+IHWstA3iuzTRuinVksImDMbVN9kjQ+AD7CMW4/fnnmrJ3dPGSb6Kk6Zp/IrLaM7ddA+WGbHeA==
X-Received: by 2002:a5d:50d2:0:b0:33d:5272:6a8f with SMTP id f18-20020a5d50d2000000b0033d52726a8fmr62048wrt.14.1708280505754;
        Sun, 18 Feb 2024 10:21:45 -0800 (PST)
Received: from krzk-bin.. ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id s3-20020a5d4ec3000000b0033ce06c303csm7867116wrv.40.2024.02.18.10.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 10:21:45 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	Arnd Bergmann <arnd@arndb.de>,
	arm@kernel.org,
	soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/4] samsung: drivers for v6.9
Date: Sun, 18 Feb 2024 19:21:38 +0100
Message-Id: <20240218182141.31213-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.9

for you to fetch changes up to 97d4b55111efd72926eb92cbd81c5ad8e6a7b3b1:

  MAINTAINERS: Remove Tomasz from Samsung clock and pinctrl entries (2024-02-07 16:35:26 +0100)

----------------------------------------------------------------
Samsung SoC driver changes for v6.9

1. Add bindings for Google GS101 I2C controller and SYSREG sycon block.
2. Remove Tomasz Figa from Samsung clock and pinctrl maintainer entries.

----------------------------------------------------------------
André Draszik (1):
      dt-bindings: samsung: exynos-sysreg: gs101-peric0/1 require a clock

Tomasz Figa (1):
      MAINTAINERS: Remove Tomasz from Samsung clock and pinctrl entries

Tudor Ambarus (1):
      dt-bindings: i2c: exynos5: add google,gs101-hsi2c compatible

 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml                  | 1 +
 .../devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml          | 2 ++
 MAINTAINERS                                                             | 2 --
 3 files changed, 3 insertions(+), 2 deletions(-)
