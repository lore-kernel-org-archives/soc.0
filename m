Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6084722332E
	for <soc@lists.linux.dev>; Tue, 30 Sep 2025 12:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759235236; cv=none; b=iViG/ZDaHeQANpTthdKixW0bICNObr8JeNffHx26G2+3oAJaSjqLSR6CWJAV6/bl1wkfwWklmO+BjfG16whRA+Lm7XxAIhBU/7wELQMK9QIXTrVZTwc9J4hVMQyiDSPKOmAQqspw6y23Jy4Q13IGIxLD2x5qrsHaK1yj6dRWZKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759235236; c=relaxed/simple;
	bh=xcQKxCjajP7UXaBmdNa9pWo6TdX2mGwe7xo+sDPnMZM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CH1ggXZXExR/QpYiMZ0O/c1dw9nSlBSqGrEbBfsQMJzK3+w/hNtu5WP+DAFe4frXzbNX4lE3tLIrqf+nRYDCdjaU5p5m/UvbyptYa/pBeQDg3DKisgSxGUVDU+aGBpPM5gMOT1n0kPElyg6aBzWpyVrFXR71QeaE2SebocHTTdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qIdWvgwS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qIdWvgwS"
Received: by smtp.kernel.org (Postfix)
	id E4583C116C6; Tue, 30 Sep 2025 12:27:15 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ECBF2C113D0
	for <soc@kernel.org>; Tue, 30 Sep 2025 12:27:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ECBF2C113D0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-578ecc56235so5351166e87.0
        for <soc@kernel.org>; Tue, 30 Sep 2025 05:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759235233; x=1759840033; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9PifE+9cLSGmXGJxL0dL++rv6yb8nO0jVdJXEqqD3+Y=;
        b=qIdWvgwSYGbUlPU7ohzfYofoPYDGzE66wvIEXm6cUJmt7FV7n/im3sQ5ydNHDgT9wy
         RhE8M2vCHnJHHl+llVf8tr6sYmMz+A5Duh4XaQNA4gxqKUbcs+Pg2SUVzESBA93/6RWh
         opsycXGFTjmIKR6VJaoriuNDfwV3YTWOfqCNyR6HLUrALAowCMYZOchJ0kT3bk5v2TmS
         +GPlvp5p00LcOKiNAIhcF9VKA3LXONg1vf/ItzKrFmwzXrsb8UJWZXRiqocvtZFXtSuv
         uXNcLAPSSPrr7C0kCTGoAbb8PovUtUlQCmaIeGCM9Dho3Plf+RXZ14HaSSimAFA1t+VX
         Xq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759235233; x=1759840033;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9PifE+9cLSGmXGJxL0dL++rv6yb8nO0jVdJXEqqD3+Y=;
        b=ReIzoD2OYU1Ji93NhRRkUz8uRitx8XXVz69WOpZpKHGbFuD4Fde5Oul4WFgMtTVGMW
         +rX+82eSQYOdqp6gtAvUP7DRdAEY/+x4KFlRmQreQS4e7kHIVlOw0kd9fFyVbiM8Qpur
         nzbqzhRHyXvW09I92X2MuB8xpCoxoiAZCxNnxVc3I42TTDCVWOapmqjhlY5oSwaHynUs
         9xGU40UNtWVPUPzuYkwrzcLk1Cuwg4Kc+Gn1YtYrxU5ECbbp9yr2zEsJ8h4JMd/x56DW
         ruFmWG2oE4wOQhver7C29342mGUFYQGOVyaJtJLYCCI95LOMK2QMMyh7e4RHYYa+jKHR
         2S8A==
X-Forwarded-Encrypted: i=1; AJvYcCXD7/ln7ZOCXzPlWS6PJ0kh1f7+7TrVMk8LAQvIw8ADKM56F4sTkRPGhX8M6EHmjt3Tsxw=@kernel.org
X-Gm-Message-State: AOJu0Yxvc9g1GI7uKk6YF42JktZwGTbMuByES+vvRdQrtZxA7tMpeY70
	Q77i8YNCdbPGWeX6s+3UAcJM1zlD4c/OOTwswEmsX/ZSzKeguddq+gw4+ub2oTIW+dpOLmyue26
	+VpnhZXc=
X-Gm-Gg: ASbGncvaBVKxIwFGrF2hI6l0LR918knedJ758qBFJc5hLSZKWwHU2ciwyEEViRkqW2a
	S5TJ5ViucBZW2NTicBo3SsQergJqE81XFO20jbGrsOsqsBJZmPfGVPxAbyWcuMRh6sUNd4TR2i6
	E2GtDSDmyu1kE4uGy22FjMI4BoM/gXscDzW2glpDi/FP4OZAa+J9VAZ9kyWAPAAxo1BS46SY89T
	GA5ujq+3VMDduOR0CaCBxvhVQmkyLK/fLtFet9MkpwEIyQU9M9qDvOtw/1to8fK7QZZpyqNL/he
	QNBwN0G4WP7PsvquKDlp+HwBGMu3r9WlRqilvHXWdReH6YXzlSWZKskwxaaa/6mdvMgWWuqOPik
	mAR8e/GW8wBcfZy62EGR378O45GB2TP4E/FXmZMFz0oak9r0nvwd4bXydAPyOYDHJ/T+ME7rXDa
	e1xBI08Xa68jz9
X-Google-Smtp-Source: AGHT+IERiOd9+z5r+jP1QcnJC76rX1P6/lyRtpeEVgBBVdHsD9dVqsrOGCxd7qgav2HbKXaf1lAR9w==
X-Received: by 2002:a05:6512:3d1d:b0:57a:311:3234 with SMTP id 2adb3069b0e04-582d462e235mr6637707e87.55.1759235232989;
        Tue, 30 Sep 2025 05:27:12 -0700 (PDT)
Received: from Fecusia.lan (c-92-34-217-190.bbcust.telenor.se. [92.34.217.190])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58834e08273sm1416568e87.28.2025.09.30.05.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Sep 2025 05:27:12 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Jihed Chaibi <jihed.chaibi.dev@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] ARM: configs: u8500: Set NFC_SHDLC as built-in
Date: Tue, 30 Sep 2025 14:27:09 +0200
Message-ID: <20250930122709.28987-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>

The CONFIG_NFC_SHDLC=m setting in u8500_defconfig causes a Kconfig
warning because the NFC_SHDLC symbol does not support being built
as a module.

Change the selection from 'm' to 'y' to build the driver in-kernel.

Fixes: 344cad0660ea0 ("ARM: configs: Update U8500 defconfig")
Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
SoC tree folks: please apply this patch directly.
---
 arch/arm/configs/u8500_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index 0f55815eecb3..9c8dc6dd5fe3 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -40,7 +40,7 @@ CONFIG_MAC80211_LEDS=y
 CONFIG_CAIF=y
 CONFIG_NFC=m
 CONFIG_NFC_HCI=m
-CONFIG_NFC_SHDLC=m
+CONFIG_NFC_SHDLC=y
 CONFIG_NFC_PN544_I2C=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
-- 
2.51.0

