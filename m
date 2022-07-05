Return-Path: <SRS0=lBHs=XK=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93C0CCA47B
	for <soc@archiver.kernel.org>; Tue,  5 Jul 2022 11:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 993EAC341D0; Tue,  5 Jul 2022 11:45:49 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 02AE2C341C7
	for <soc@kernel.org>; Tue,  5 Jul 2022 11:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 02AE2C341C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id z25so2518500lfr.2
        for <soc@kernel.org>; Tue, 05 Jul 2022 04:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=saFvUNutIkwJIKsbwz8el/rLQChL+0J42iD0Z120Xzc=;
        b=Cim0tg3iFz2KhUJTKw3IyP80HUNfdvp5Agu8fvMVkk1HcwZhott9laYab/fNuaBCGa
         903nQG8cEHoV61S2FQ2hdCw6aLoD4ClzIk3+FOLWZKt6FuySDmVlpjhhVKQO38SMB/2H
         fJduhDoF7T41KrGkj8kbaEOTPlWpiI69h3frLX1MD18LbaTZ129W1ymX5aVSyWa4OtI2
         IhhES0TJq23BuA9ipFDUTCcZddCU6oF5SHPIsXsv/MaYTouo64/JwVKGiGG9k4FA0hrj
         b643syRu+XZjy/ilRtfXetpxM/pKbvMLoCmLolYDI4v54wbwXUn1x2/848H6XbPwdxzT
         7W8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=saFvUNutIkwJIKsbwz8el/rLQChL+0J42iD0Z120Xzc=;
        b=D+tYjTIkpmZ0b2AO9rTguupr0AmYbQR66x3fb6cwg0dXtVDFON6hrqYxOYey1pZMbl
         oXa/8V0gc6OLCvXNo4f/zIrL90itKa2RlDzAqFWNx8iPfnTu2zvKOpPP6+Yq0gJjHqd4
         7zlAOSQLzj1ExlxwQDNbyIUc0MoSRZbjSe8usT4kxS0nliVsqKa1bmv/29XuAdArGM5b
         xOV2f+dfRylyPhep82TQbKHyeUL9a2KxedvZCes+Lk+2w3EPJFGW+dZpRh0/p3ZjoxZq
         MXJhPSPq11XamSy/efT0LCpW7cB9UYGdoDcqunaOzZ3LjoO+K9qhkZCGLAoS2kpfcOAd
         +kng==
X-Gm-Message-State: AJIora/rXtXjh2GEFf47WNqA3yAEhJB2C6ktVT1FhSe11fig6JJ043BH
	zQumsiyUWjTwGEREHZPlz4FT3w==
X-Google-Smtp-Source: AGRyM1tuXKUJiOGHda53Ozd2LS6VSQPa3uTR2aZkiqj9hvpwiZLHrKaLXbCvgJN5f2K1LhTPfr9Dhg==
X-Received: by 2002:ac2:4a63:0:b0:47f:9e6d:603b with SMTP id q3-20020ac24a63000000b0047f9e6d603bmr21856388lfp.404.1657021547120;
        Tue, 05 Jul 2022 04:45:47 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id a12-20020a056512374c00b0048137a6486bsm3543694lfs.228.2022.07.05.04.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 04:45:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: olof@lixom.net,
	krzysztof.kozlowski@linaro.org,
	arm@kernel.org,
	andrew@aj.id.au,
	soc@kernel.org,
	joel@jms.id.au,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH v3 37/40] ARM: dts: aspeed: correct gpio-keys properties
Date: Tue,  5 Jul 2022 13:45:43 +0200
Message-Id: <165702154046.92998.13819034081421883351.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220616005333.18491-37-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org> <20220616005333.18491-37-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 15 Jun 2022 17:53:30 -0700, Krzysztof Kozlowski wrote:
> gpio-keys children do not use unit addresses.
> 
> 

Applied, thanks!

[37/40] ARM: dts: aspeed: correct gpio-keys properties
        https://git.kernel.org/krzk/linux/c/bafd5bb5ea496c8fc443e6b9de70af840bec0b9c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
