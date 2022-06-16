Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86FB1C43334
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 00:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6FB46C3411C; Thu, 16 Jun 2022 00:54:09 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D59FBC341C8
	for <soc@kernel.org>; Thu, 16 Jun 2022 00:54:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D59FBC341C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f48.google.com with SMTP id gc3-20020a17090b310300b001e33092c737so103366pjb.3
        for <soc@kernel.org>; Wed, 15 Jun 2022 17:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hk45y8qg0TijcVloTKD2QUlJ8SLct5jsD0wtYz0wctM=;
        b=C6oW0hpMDZcn14CExLv4Gl/8SKJ8XlS/wy37swXLr0gFyfhh00JAtmpxn9XIezScIg
         bZ5RKmkWlPDd5qAB4UN+dO+jKXMhjcxbcvrhiuXIhlY+aTt0ov9VxYWvXCNsbr9bPhF0
         DcFxOOgAeuHDmOGdVVEkoGGAD4+BXUsxsSDPHjtiG2Zf+2coxw5i+i20fL8kXpKvRkpx
         Xu/KpX4+wGyRj+BsEFi6RfV72MJcSLG6MCBcB4H6tqpTI+YgKxuQ/5v1RzZFXm9kbIDs
         mKrFOdr3gS5ut1qbjAbuqHTKLYx319HiyRq+OQEWvZXJIQCh9qhM2htFiyoOms+190jm
         KRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hk45y8qg0TijcVloTKD2QUlJ8SLct5jsD0wtYz0wctM=;
        b=xfCevMDCq/wSXcy4c9hqsyVVJdtYlJ4BhUI1Ko2wYQPT5Olp67UQwPknq9PDcKn2Q+
         hzKNPXxwxc8bMortIJpAMjKACG5a6hw2iXwubFINGWI8qQVogLuoTaojoR+Va7vT3npe
         JNFbfUeKTWGM7wZaVpzoFro57f28z2EK3y1XtZhvaebe7vY5wcsivB/EVRU8I7iyksvM
         jQqfkb2VKNHCddsnTP3LXZAemGD+yZ2PZe4H9JVjhKYp6Z8ri1x4TlSZcDdsbU60PkW2
         E24eStFtyPJUYeo2igHWd9JY+UdvgaiI+4WqC+YyBClLWNb177SX2JYvFyCEJz2wj+k3
         rs5w==
X-Gm-Message-State: AJIora9SKPcOOXHwNMq7BFHTxuZdq4q+2Qu2GCLIS2YB1xa5qu6E87Dr
	EmnJQItjOcDMz+raakB8DXQWlg==
X-Google-Smtp-Source: AGRyM1uzV0o//aUfQivCFLEjAdGKHVoSc5iQBiDkk6l+YHXXW+rWTjQwUQtXYFVIMTU2pQfdDq0o7w==
X-Received: by 2002:a17:90a:430a:b0:1ea:e7f4:9f59 with SMTP id q10-20020a17090a430a00b001eae7f49f59mr1632797pjg.75.1655340848271;
        Wed, 15 Jun 2022 17:54:08 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902780400b0016760c06b76sm233660pll.194.2022.06.15.17.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:54:08 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Wei Xu <xuwei5@hisilicon.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 10/40] arm64: dts: hisilicon: correct gpio-keys properties
Date: Wed, 15 Jun 2022 17:53:03 -0700
Message-Id: <20220616005333.18491-10-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

gpio-keys children do not use unit addresses.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/hisilicon/hip05-d02.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/hisilicon/hip05-d02.dts b/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
index ad53066ac495..c4eaebbb448f 100644
--- a/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
+++ b/arch/arm64/boot/dts/hisilicon/hip05-d02.dts
@@ -29,8 +29,6 @@ chosen {
 
 	gpio-keys {
 		compatible = "gpio-keys";
-		#address-cells = <1>;
-		#size-cells = <0>;
 
 		pwr-button {
 			label = "Power Button";
-- 
2.34.1

