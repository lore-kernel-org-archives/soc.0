Return-Path: <SRS0=3SUr=6R=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA2FDC61DA3
	for <soc@archiver.kernel.org>; Tue, 21 Feb 2023 09:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 859F0C433D2; Tue, 21 Feb 2023 09:53:45 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BBD5DC4339C
	for <soc@kernel.org>; Tue, 21 Feb 2023 09:53:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BBD5DC4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f52.google.com with SMTP id ck15so15961506edb.0
        for <soc@kernel.org>; Tue, 21 Feb 2023 01:53:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nLkpu34r64N6jTLmLzho5Nqw5btLUj/JsxhXvl09Gow=;
        b=iIs+osXHST4BSB1VRkciVNfR2QxsLxB22NvNRR4LCA89NAJaCCbT7PMh5Rg0aLNEn1
         YpOeN5hELT024Q6stpE44PP6NIZBhxTgdYiXAju7e0aXYV7l7kBontbTlG4t5Zc7RGFt
         jlZ9E/qLjHaVTHvoY7DorKkAN9TZzpLQZqaEykmmj9yMpz77nQpjm+PL9FTLOwlPavA7
         JBCDAIdSbvc6rGx4AfCEpTHpv1NztVp/gT9XXj5R3KpjXoSOJtbfsdYCLiJtfXu/mh80
         oa6HeP0G6XMIbJmxfrm7JZUsL7xYXs/OpVHjxI5C9h9YUSEZcfeR3714bflhRJZYfKm0
         1dpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLkpu34r64N6jTLmLzho5Nqw5btLUj/JsxhXvl09Gow=;
        b=E4E3V2Jg/51hV7Ot93eGzyZOeOMBKEPcwVTgO5iPE/0FEG431WsvLajQxCo61aH+Kz
         9xUqbXctESWv4+Fh6lqDnddPDi0pxjeHT3FYWDaIQmGd0HYOFLo7eN5USOpx6D8WaPYa
         xtA1kdBIPeSXd//f//JEEdLauxXWBmbP0H3PeEw0X/bFgrczkG7ozK4jOGJLbP/SGjcJ
         w0YNrtJvSWEJ1peXzwFPxuTlh6irKBZzTtZUzv0390+BfPtVRhjCSgaO6FFZTliAeX7k
         iVgKCQ3NyLtVB4Dk8As28MDHZxRnfgrXlxfeT7Ubmcr/il1dRDTV5T/wA+9Z/NCBQ54d
         stdg==
X-Gm-Message-State: AO0yUKXB+TSKq9WJ1sWVcrpdiPwNRTRdIQduoDqKS404x5ZONsUqcCLN
	Dr8gufl7S8OPy5lEFhhUGYsVEA==
X-Google-Smtp-Source: AK7set/xuAnKadPghcifDKVyD2HY7jmzCcqJBp4Wcvun7a7JGIOi97uDS7Yos61WL+UHeRgVTRUciw==
X-Received: by 2002:a17:906:518:b0:8b1:3554:25 with SMTP id j24-20020a170906051800b008b135540025mr11134918eja.61.1676973221885;
        Tue, 21 Feb 2023 01:53:41 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906328a00b008b147e4204dsm6912388ejw.32.2023.02.21.01.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 01:53:41 -0800 (PST)
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
Subject: [GIT PULL] fixes: ARM: dts: samsung: Fixes for v6.3
Date: Tue, 21 Feb 2023 10:53:37 +0100
Message-Id: <20230221095337.9453-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Fixes for ciritical issue broken around v6.1-rc1.  Actually the issue (DTS
mistake) existed before, but in v6.1-rc1 it started to be visible and affect
thermal zones.

Best regards,
Krzysztof


The following changes since commit ceaa837f96adb69c0df0397937cd74991d5d821a:

  Linux 6.2-rc8 (2023-02-12 14:10:17 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-fixes-6.3

for you to fetch changes up to a3583e92d188ec6c58c7f603ac5e72dd8a11c21a:

  ARM: dts: exynos: correct TMU phandle in Odroid XU3 family (2023-02-17 10:27:28 +0100)

----------------------------------------------------------------
Fixes for Samsung DTS ARM for v6.3

Thermal framework commit 3fd6d6e2b4e8 ("thermal/of: Rework the thermal
device tree initialization") merged in v6.1-rc1, exposed
misconfiguration of Exynos Thermal Monitoring Unit (TMU) thermal-sensors
property in DTS.  This misconfiguration in DTS was working fine before
that Thermal commit, but now all thermal zones fail to register except
the first one (CPU).  This can lead to missing cooling of a board and
eventually either emergency shutdown or damaged board.

----------------------------------------------------------------
Krzysztof Kozlowski (6):
      ARM: dts: exynos: correct TMU phandle in Exynos4
      ARM: dts: exynos: correct TMU phandle in Exynos4210
      ARM: dts: exynos: correct TMU phandle in Exynos5250
      ARM: dts: exynos: correct TMU phandle in Odroid XU
      ARM: dts: exynos: correct TMU phandle in Odroid HC1
      ARM: dts: exynos: correct TMU phandle in Odroid XU3 family

 arch/arm/boot/dts/exynos4-cpu-thermal.dtsi         |  2 +-
 arch/arm/boot/dts/exynos4210.dtsi                  |  1 -
 arch/arm/boot/dts/exynos5250.dtsi                  |  2 +-
 arch/arm/boot/dts/exynos5410-odroidxu.dts          |  1 -
 arch/arm/boot/dts/exynos5422-odroidhc1.dts         | 10 +++++-----
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 10 +++++-----
 6 files changed, 12 insertions(+), 14 deletions(-)
