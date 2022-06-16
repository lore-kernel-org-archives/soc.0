Return-Path: <SRS0=sX7s=WX=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC34BCCA47C
	for <soc@archiver.kernel.org>; Thu, 16 Jun 2022 20:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 95D54C341CE; Thu, 16 Jun 2022 20:47:51 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 080B9C3411C
	for <soc@kernel.org>; Thu, 16 Jun 2022 20:47:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 080B9C3411C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f54.google.com with SMTP id k5-20020a17090a404500b001e8875e6242so2474932pjg.5
        for <soc@kernel.org>; Thu, 16 Jun 2022 13:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jI0v63PBSGVPSt124UnIjURLvc+gaR0TObdq7eiVWUQ=;
        b=ZeHwvzJ3q/+3ZBap4PfvfSYmv0TjYLJ13/xlILzoRDeXv1x+oS5eFc3ef1W6sY/fOK
         mztPfzyE1XE93Ka52txZigN/zei82xiC5l+pka6/QZZYSTnswTZjvCNvihwa7wuSk3Pf
         T2N9hRm+ytTenTirUFX/pu2ds5XTwcJNr3s4o1E5BrC1R2ety87d1DMrKc1WEkiss7Dl
         4PF1uQ+mvXHIwp/m3VQ7GctOwl53N6xB6+CBOa9hnday5xZfwEgUFft3gdRgy5/mFQOl
         VglJzyRtFWQSdku9fenw5OnDqipUE6wTCh2wrgnS2S8uJXVSNpnNn+0/R3nSpwsD70I1
         mDNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jI0v63PBSGVPSt124UnIjURLvc+gaR0TObdq7eiVWUQ=;
        b=M8mwMG7Gu/1I2dN5gsZDwei+/g+6qFZGet6EKTDNKtRHb7feVJEyH/8ravr6CPpIAg
         yinHUrDiP+Dl2PpkLxm2eyzYC+y6zF7dIqWOUyHMbGTBTiVH0Vbsx0rvd8vVUN7QpVmB
         /5B4MrclrQQ4sLYyJzv2NrfW69HcROYxGFKU48GEikqHw0ZXJqAOGKFcfzkO9/iN8tIF
         uITmnByehhJBIpkgFAgGBWLZvXRwWtKGMaxHk+EMzl/JWz80I+P5nbkNUbIecr7j5Nie
         588ahEMwGVJ6CIsC+oW2BCLRkGim1NJkWwCQCRHSbKz9lnVUbivGb9hRMWpmHhZ32+gL
         6nBA==
X-Gm-Message-State: AJIora/85IE41GUYtpuBm7QNpIHT5Ww21j3lnvLb0dN7T6CI7lqxAbWz
	L7Q0I5Hy54KNmlXgBjVfsvD5WA==
X-Google-Smtp-Source: AGRyM1tLu4S2H7Em3VeAOe96ffd6xE/n3L6NO+z9sW4bz8zWB9QHkvDIDzzoaEzCkDpExTkfWpM+Ug==
X-Received: by 2002:a17:902:c946:b0:163:ed13:7ab1 with SMTP id i6-20020a170902c94600b00163ed137ab1mr6088277pla.36.1655412470502;
        Thu, 16 Jun 2022 13:47:50 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id 203-20020a6218d4000000b0051ba0ee30cbsm2165453pfy.128.2022.06.16.13.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jun 2022 13:47:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Brijesh Singh <brijeshkumar.singh@amd.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Rob Herring <robh+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 2/5] arm64: dts: amd: adjust whitespace around '='
Date: Thu, 16 Jun 2022 13:47:10 -0700
Message-Id: <165541242280.9040.1717314737231352745.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526204606.833054-2-krzysztof.kozlowski@linaro.org>
References: <20220526204606.833054-1-krzysztof.kozlowski@linaro.org> <20220526204606.833054-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 26 May 2022 22:46:03 +0200, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> 

Applied, thanks!

[2/5] arm64: dts: amd: adjust whitespace around '='
      https://git.kernel.org/krzk/linux/c/dec1c62e91ba268ab2a6e339d4d7a59287d5eba1

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
