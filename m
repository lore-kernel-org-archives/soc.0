Return-Path: <SRS0=1uss=JD=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A300C47DDF
	for <soc@archiver.kernel.org>; Thu, 25 Jan 2024 08:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 38C49C43390; Thu, 25 Jan 2024 08:24:07 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AB977C43394
	for <soc@kernel.org>; Thu, 25 Jan 2024 08:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AB977C43394
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a318ccfe412so14292366b.1
        for <soc@kernel.org>; Thu, 25 Jan 2024 00:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706171044; x=1706775844; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kwJ5DAWSzWd1enombEwhf2I3bPyYvotqW45eCtT+UME=;
        b=PpzG4wY+yBD8TvJZ4Q1EKqgNplRylmo7sRgzMkKV+h/qw0d6yU8F2pM06anaL3zUfy
         8jhxzfYGTL0A3iTPDmoZ01uhblD/INZwt1M4TIt3no8fnONJgGdU2y3LMkTxpaGdAGzT
         lalnAzXFrOi9Gq/TTvUTMS4Op6jv2S1TpiDddUOI08poiyL0P0lKdxiFDyIIkaHMREtp
         0061/7W/i1S1z2fhc+kVMi9KyxSkC4DdniEspze0CyqK4VF10vAy84peHLhrJE4QXjxo
         xV82hpfISfGI48kLPVR9+L2vWhtrP14VbH6yg/x6A3WuN3PSGm8h9mQfJWiY/CRY0GU/
         UuKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706171044; x=1706775844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwJ5DAWSzWd1enombEwhf2I3bPyYvotqW45eCtT+UME=;
        b=Dn5O2oPrh5WcT+CLVRMVV/VcOyz+9cbUj2XWDRX55JptiEk0Be8UtbFpJL/dTO3Onc
         SJzdF7BG4lDeVTUTfneKu+XyAV6oSDn2uaAb6SXAImLltnVcX6Qnf3id10vXGbD+v6Ce
         RbkCuSRhWUb9sXiITL9U6YAXIpEZ/Ip/dSmdKC7l91lUzQMfNlwWOllIca6LHuxcRP1+
         F1cc4zEf+1JMTQKgaMVIMHzCSk0d6KcyInws6WjsoLl+bxfiCXro+PlZazx52wzPH3k0
         B4Ug++5TAH60/eoq4w6UuiF2LnIgqgaf01sCzXFVOtUbBIe5D902ApEvN5GZOefsbEsi
         lShg==
X-Gm-Message-State: AOJu0YyeguaeJvNzf1b43hduqZusscDNM8qOVnViOmzl+O5KR0L1AHKW
	qPN9/w8Ey/kGpe5y2ouTbufv7XbP183q1PeA3jC/7SA+PdOluYrDg3pPnkdx+ns=
X-Google-Smtp-Source: AGHT+IEIBlIqDA3FZk5B1PobloccIaBb+mLGySw+C06q20ik4ThKDL78mUfxQl4BIJdzbpDgei1JoA==
X-Received: by 2002:a17:906:5789:b0:a30:7293:e872 with SMTP id k9-20020a170906578900b00a307293e872mr298188ejq.106.1706171043780;
        Thu, 25 Jan 2024 00:24:03 -0800 (PST)
Received: from krzk-bin.. ([178.197.215.66])
        by smtp.gmail.com with ESMTPSA id c26-20020a170906529a00b00a2f181266f6sm761456ejm.148.2024.01.25.00.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 00:24:03 -0800 (PST)
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
Subject: [GIT PULL fixes] ARM: samsung: dts: fixes for v6.8
Date: Thu, 25 Jan 2024 09:24:00 +0100
Message-Id: <20240125082400.163935-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-fixes-6.8

for you to fetch changes up to eab4f56d3e75dad697acf8dc2c8be3c341d6c63e:

  ARM: dts: exynos4212-tab3: add samsung,invert-vclk flag to fimd (2024-01-22 11:51:14 +0100)

----------------------------------------------------------------
Samsung fixes for v6.8

1. Google GS101: Correct the input clock names to CMU MISC clock
   controller to match received review.  The review was initially missed
   and CMU MISC clock controller bindings, driver and DTS was merged
   into v6.8-rc1 with different names.  Nothing was released so far, so
   the bindings and driver can be still corrected to match review.

2. Samsung Galaxy Tab3: Fix display by using correct vclk polarity in
   display node.

----------------------------------------------------------------
Artur Weber (1):
      ARM: dts: exynos4212-tab3: add samsung,invert-vclk flag to fimd

Tudor Ambarus (1):
      arm64: dts: exynos: gs101: comply with the new cmu_misc clock names

 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi | 1 +
 arch/arm64/boot/dts/exynos/google/gs101.dtsi   | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)
