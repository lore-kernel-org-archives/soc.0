Return-Path: <SRS0=5Ucw=2E=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB4C0C433F5
	for <soc@archiver.kernel.org>; Mon,  3 Oct 2022 07:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BB2E3C433D7; Mon,  3 Oct 2022 07:39:22 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 423ACC433C1
	for <soc@kernel.org>; Mon,  3 Oct 2022 07:39:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 423ACC433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id o7so8088729lfk.7
        for <soc@kernel.org>; Mon, 03 Oct 2022 00:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=fSpMO7Q7ztMkeSMVfIkdP3tgEsFHMk6ik3iJDreqgKk=;
        b=xsJPA1MYeKwG/NkMGQFDx6CFF+4DZWrdboI6deotot+SkpJtzdCX5g+dqpXMD7lWwH
         HQ2mpHglJ7d/doU0mitPoaRH82+8Wf3Wu4H0HQHBHlq1cIFkkQsZ7SG/tc+68IBWnMIo
         cLOzN3m1ej/ceKYcg8ufIWb84/qDHhAUNn9uCx+mJIZkqP7k315ZVDkvrAqz5hvbE90f
         lPbQtM76/HXzbg3X4Nz4huiHoBXUIetjdjY9ocFgsngSP074QxwU+Sa3PM8kdFy3oN28
         40JRdYRMc9Mw6JVyAxXi1+6GkCKOHxJ8o6GX2vk/OkwNEiWqis+GEUwoqpz8tfGoUgb6
         AJiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=fSpMO7Q7ztMkeSMVfIkdP3tgEsFHMk6ik3iJDreqgKk=;
        b=uOGy9mQi7W5xb9ylCooufDN1N6aGrwsY6CYr0AUOsOmYYPSaafXjPIj23zGkovaogh
         C0wYOvgRJPg+x70XJeSFG+db1V+zDwFbvIq01wXOIf83eBFVV4SysUDCbc6/Xld2BLjW
         K9KaReen9uTdkz9VQuf0UjFEa6smdKBLVfgApYmYRKl5o9O2QkLl7xf/7J7TFBdnkRuE
         t/pR8FJN6zxNn4WyUwfdaOZJlppQrCb4F+gNI77vPMnA8uRN78cdQPNqeU/he4xgfZ6/
         QftlvCqj0Q8Y8rWmmBNw/06yM+n9wiDsdr+eplTNloPaAY+LPD4AAuRStqZhNMjAqxqj
         eTtA==
X-Gm-Message-State: ACrzQf2xUd+PkHQziTU4ez4ldIU/bY3lqdDaCrUXC5in4gSo23BhX5IV
	K1QLYt/LZ1hrEcnwMsLDM9ZKkg==
X-Google-Smtp-Source: AMsMyM7NIQMLyCL91JNcZS0wsarQdgReHoMPkFKv0DwxtJZ8MqlxMbVCPH2TtS9XOneObUd3TPmdQg==
X-Received: by 2002:a05:6512:33c3:b0:4a2:4c1a:a07 with SMTP id d3-20020a05651233c300b004a24c1a0a07mr108251lfg.551.1664782759257;
        Mon, 03 Oct 2022 00:39:19 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g22-20020a056512119600b00499f9aaa9desm1347678lfr.179.2022.10.03.00.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 00:39:18 -0700 (PDT)
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
Subject: [GIT PULL] ARM/arm64: dts: samsung: Late round for v6.1
Date: Mon,  3 Oct 2022 09:39:16 +0200
Message-Id: <20221003073916.12588-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Late pull of fixes for v6.1 for DTS: both ARM and ARM64.  The pull is based on
master (not previous pull).  If it is too late, please consider this for fixes
after v6.1 merge window.

Best regards,
Krzysztof


The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-dt64-6.1-2

for you to fetch changes up to 17fffac44943a619ec76463655b1ed7fccd8bea7:

  ARM: dts: s5pv210: correct double "pins" in pinmux node (2022-09-30 17:14:24 +0200)

----------------------------------------------------------------
Samsung DTS ARM and ARM64 changes for v6.1

Late cleanup and fixes for Samsung DTS:
1. Fix polarity of pins:
   - enable GPIO of NFC chip in Exynos5433 TM2 boards,
   - vbus GPIO of EHCI in Exynos4412 Origen board.
2. Correct name of pin configuration nodes - redundant "pins" in the
   name (no functional impact).

----------------------------------------------------------------
Dmitry Torokhov (2):
      arm64: dts: exynos: fix polarity of "enable" line of NFC chip in TM2
      ARM: dts: exynos: fix polarity of VBUS GPIO of Origen

Krzysztof Kozlowski (1):
      ARM: dts: s5pv210: correct double "pins" in pinmux node

 arch/arm/boot/dts/exynos4412-origen.dts               | 2 +-
 arch/arm/boot/dts/s5pv210-aries.dtsi                  | 4 ++--
 arch/arm/boot/dts/s5pv210-galaxys.dts                 | 2 +-
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
