Return-Path: <SRS0=vNIe=RF=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB662C433F5
	for <soc@archiver.kernel.org>; Mon, 20 Dec 2021 16:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8C148C36AE2; Mon, 20 Dec 2021 16:50:12 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9C333C36AE8
	for <soc@kernel.org>; Mon, 20 Dec 2021 16:50:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9C333C36AE8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 110203F1A9
	for <soc@kernel.org>; Mon, 20 Dec 2021 16:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1640019010;
	bh=68468VFMqA34xN4uCVed2chkdwzfvBRVkSLi1lQZCoM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=IMnZzu35xFOQacEW0sDZjnjJsuQpBvDBg2uc5Cjpr2UhHj8DAWO/G3sSrt+ALS9nN
	 JqHeCMZSfDdDwFQcH28Kf4NpOVbFtW+350fCNNLks4rXiuPG3xFZeLtzcMDpeaJk1R
	 evBW0faH7JUph7AJCyAGrzjeiic1BYRATaje2OZz0wb9whDLjlPne0CQUoSEV55LIC
	 o6wEB7Fem3PZTxF2XRUQgzfoFWvnEVrEs5oaGX1kszUFD04v6ymepCnn5mZZ6R+zG4
	 ph6u6/1Xw8Bsya0lvsAjSVXLeK1hAh+MNeHs/r2r1n4qFhVmVmOWv9Wv44nCLyhulz
	 Na3O5xnSgg/iQ==
Received: by mail-lf1-f69.google.com with SMTP id b4-20020a056512304400b00425cf422539so1674401lfb.2
        for <soc@kernel.org>; Mon, 20 Dec 2021 08:50:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=68468VFMqA34xN4uCVed2chkdwzfvBRVkSLi1lQZCoM=;
        b=ZhVPXy7D9KHoF4fdwm5Sv1IRFmVSH52mE4qBUcSkC7EnH8HPif275YFPOBNHs9iU2Y
         En65mWXTyD4wkQpn9c2URLmNrhlE8tpsTUjSphiH19n56rkWcyW0RvfEh3smLMdDIUvb
         +WJ/zfFBk3p4DeVBAXfLiDsrbT46rNgKr1s9G23E2J0qGpHEXXWhZUyxSzjOaoMPJKSk
         p/ygS2IY3dzCFHe/TqfoR2Qf7Cagq/x5kWrDg2n5wisjSGvcateF2S8aq7ZZopQ1PhcD
         /P+UpZmXd9b64ySEepl2xohAozuKhmTwdAh+6LkDmuzZt2Q5BCEzR0KS6eIpYACn3Ues
         lp0g==
X-Gm-Message-State: AOAM533qNwfC7LzZurzJ6ip/52dviErRG9Pi+IcgRK/9HmznjlYs+Ijk
	unjRN0FF9M4eLipmM9ilVEn0RTkCpGFSqngRGQ0KsMkWXs8sjyyv0qcF9RgddDDo2zubi1x7puG
	rOhgbukD5FLd0jvH+0C0BRVY=
X-Received: by 2002:a05:6512:114a:: with SMTP id m10mr16493440lfg.54.1640019009465;
        Mon, 20 Dec 2021 08:50:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwMTuR7kl0lz1gyI7tTGwM3yaCK26OX0fh0m3K/eu93O2yx8zbRW3oaRa1jh7oao8ITWsoj6w==
X-Received: by 2002:a05:6512:114a:: with SMTP id m10mr16493423lfg.54.1640019009283;
        Mon, 20 Dec 2021 08:50:09 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id y8sm237152lfe.108.2021.12.20.08.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 08:50:08 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>
Cc: Sam Protsenko <semen.protsenko@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [RESEND PATCH 5/6] arm64: defconfig: Enable Samsung I2C driver
Date: Mon, 20 Dec 2021 17:50:03 +0100
Message-Id: <20211220165004.17005-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sam Protsenko <semen.protsenko@linaro.org>

i2c-s3c2410 driver is needed for some arm64 Exynos SoCs, e.g. Exynos850.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Link: https://lore.kernel.org/r/20211121150558.21801-1-semen.protsenko@linaro.org
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f2e2b9bdd702..0da6a944d5cd 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -461,6 +461,7 @@ CONFIG_I2C_QCOM_GENI=m
 CONFIG_I2C_QUP=y
 CONFIG_I2C_RIIC=y
 CONFIG_I2C_RK3X=y
+CONFIG_I2C_S3C2410=y
 CONFIG_I2C_SH_MOBILE=y
 CONFIG_I2C_TEGRA=y
 CONFIG_I2C_UNIPHIER_F=y
-- 
2.32.0

