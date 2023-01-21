Return-Path: <SRS0=smpC=5S=gmail.com=markuss.broks@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED50C54EAA
	for <soc@archiver.kernel.org>; Sat, 21 Jan 2023 20:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 33F4CC4339B; Sat, 21 Jan 2023 20:17:03 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4ED84C433D2;
	Sat, 21 Jan 2023 20:17:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4ED84C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id u19so21763012ejm.8;
        Sat, 21 Jan 2023 12:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DVSO49G+90zNDzrj6MAr5GjdLJ2Rrum8smiQJoUXN+E=;
        b=iejkVLTzMekISSw7CuLQ4ejyCGyo3rzrEO/81IsoLg9rNEnI6pWKM7s4ws93O7rGEB
         92N1S3ak2gbjYCrf/Lm8C76cDgePs6mtbqELstgxYAhz9NDmSTy2x//JB05Hx/8dbEos
         7uEfMg5RFZo27PQf7ytsB2zfbrkG/X7XnjlUB34lhlFybPEkWSx6hHsVaVUm7riZ7qDz
         bmqQN2NsoZSSRIcmsqx3gI8LMHCxozMYubQ1h5WUIuIpKlzd36OqhuRNxB1eYs6Q/aGa
         L5UXTP5bOEUWiLlZKabKMMGBK5Ha3/m/6GccEWiBPB7j7T4yyXjnx4fIBKHcT2sYgCng
         XQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DVSO49G+90zNDzrj6MAr5GjdLJ2Rrum8smiQJoUXN+E=;
        b=AXNH0nIqMQ2flWG/m11OfQpIGA+cSflmH2z+f6/R1MEVXrx9o99uYoYcaoWCVrHDv0
         R3uaJdWr6te1cKC4PaXBT9jIfyXWS6uGzefkt2wRw87bIyIvda0llp2KUmfvvowKU+Ur
         S/8Mm8thfl82ff4r0o2gfD/sOEyx6M8c5mez7EZp8F/hllAo49XOVx/m4Pv4vgYJnKnA
         21dA71X1Fd6D+TaoBq2PuF8xobFns0H3Ynf6OV+umQZMGp5CMFF2DNGKy1dzIiTN3NQa
         H/cz1+VNLxwVHOZk8wP/JH8DsyLB2Q6W3Yf+J4PsRQXZoATgoQqixSa6/IKReZUvMy/p
         jxSA==
X-Gm-Message-State: AFqh2krFsKQbxL4mU40jNhq3gFZOstJNGuS6XjGzykXnPUHxa7WjEGR1
	Qr8JNOkSbP3bxCYysJ8MYd8=
X-Google-Smtp-Source: AMrXdXvsw4VtD76/xrwX5+TzLQDVpMWA1ZIvWyAa1Z/4uArg0b19K+cHV2txsCX07YXiBPZ+e1dr3Q==
X-Received: by 2002:a17:906:25db:b0:877:6a03:9ad1 with SMTP id n27-20020a17090625db00b008776a039ad1mr11055618ejb.7.1674332220452;
        Sat, 21 Jan 2023 12:17:00 -0800 (PST)
Received: from localhost.localdomain ([194.39.226.133])
        by smtp.gmail.com with ESMTPSA id g8-20020aa7d1c8000000b0049e1f167956sm8278427edp.9.2023.01.21.12.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 12:16:59 -0800 (PST)
From: Markuss Broks <markuss.broks@gmail.com>
To: linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Markuss Broks <markuss.broks@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v2 0/3] Correct inaccuracies in Exynos5420 and Exynos5800 device trees
Date: Sat, 21 Jan 2023 22:16:47 +0200
Message-Id: <20230121201650.46560-1-markuss.broks@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the proper compatibles for the DSI host controller and MIPI
video phy, as the current ones are not compatible with the hardware.

While this fixes the kernel panic while trying to use DSI, I was still
unsuccessful to consistently produce image that isn't noise on S6E3FA2
panel of Samsung Galaxy S5. It seems to only work sometimes.

Cc: Mark Brown <broonie@kernel.org>

v1 -> v2:
- squash patch 1 and patch 3, making it one patch for adding the label and
  changing the compatible
- use better subject prefixes

Markuss Broks (2):
  arm: dts: exynos5420: Use Exynos5420 compatible for the MIPI video phy
  arm: dts: exynos5800: Use Exynos5422 compatible for the DSI controller

 arch/arm/boot/dts/exynos5420.dtsi | 4 ++--
 arch/arm/boot/dts/exynos5800.dtsi | 4 ++++
 2 files changed, 6 insertions(+), 2 deletions(-)

-- 
2.39.0

