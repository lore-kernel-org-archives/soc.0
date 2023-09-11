Return-Path: <SRS0=uUAA=E3=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FDCEE7FF4
	for <soc@archiver.kernel.org>; Mon, 11 Sep 2023 11:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DD821C433CA; Mon, 11 Sep 2023 11:39:36 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 99DAFC43391
	for <soc@kernel.org>; Mon, 11 Sep 2023 11:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 99DAFC43391
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-52c4d3ff424so5685905a12.0
        for <soc@kernel.org>; Mon, 11 Sep 2023 04:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694432373; x=1695037173; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CNTfpAlLwJmILsM2ML8AYXqOfMhJFlBtfc+NKYRir1U=;
        b=hQM5Z3AMsjpsGEbc/wUogPWN0Qz2J2ZZs7Hx5qwAqNqkGHfE2ccs8HftDV+GgSqH1d
         oPHxtrebLPTd4u8sY0BI06Z8wRImCPUWkKyWWceXksIqroBDlbMcUMx01I6mRhy2SC3O
         AQ8XRJzdre8Bkpq2ij10/3RNWhzBA51zFIosuzTgWlETbdlUqmJIiJH1DExLLc58/dYj
         IV5jjRAi/RMSFV0sXP4OPmVlWFAvlFH97/5lIn+BQX4POTQm/phaVJ39f+Qzq6GVW/Ad
         JvPJiI52LMotO51dz3rshIHS8TmIDj2xe0I7eNDBakZ8AbB+F2suyRA5em+rgKTqx+4c
         fvow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694432373; x=1695037173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CNTfpAlLwJmILsM2ML8AYXqOfMhJFlBtfc+NKYRir1U=;
        b=hs2jGAOFshu4w4D0IHLHHv1ixJKe0EDIJEAsrI3/L83SivGNk3FXfZ9/E/OhKeGFEf
         axrz/hhRLVHYAb8WKSyqtaqM51VpPyU9GOXFCwec3hynJhHC9XJD2ciTLY4czwGw96+c
         jdADFI6F5bB2dru48lykTFosEXJjdUO3J9LYxMVGvBL1fas27U0HjSzeP3YrISKOfnMR
         +EPP8rSEMFWrx1Ua7eB4fUtLZOC8gTEi6T1TAuzZ2EDA03sZlLyUv03a7wGf0nanu7bx
         9mWim7kLWzSu6tz5IHaA7RSEIANEaVBNggHhkfM7eh/Mq0snF9HFfuj0ZrJGhYndWtpx
         J1xQ==
X-Gm-Message-State: AOJu0Yyyrc/E/Yyz864AfU804L9KmTPuZocooA5mPsXt5qDxwUBck8eu
	pQcQ7lco1lq967dIH0IJ1q4MZw==
X-Google-Smtp-Source: AGHT+IHwEnPhO+VHQG0S+VrfAHaLii+tG8XXkAqNaOPbo0YVPvNOqmH3dpTLzyBvYyQwoxAyv+FnFA==
X-Received: by 2002:a05:6402:1254:b0:522:3ef1:b10 with SMTP id l20-20020a056402125400b005223ef10b10mr7390345edw.6.1694432373037;
        Mon, 11 Sep 2023 04:39:33 -0700 (PDT)
Received: from krzk-bin.. ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id g15-20020a056402180f00b00523b1335618sm4431003edy.97.2023.09.11.04.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 04:39:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arm@kernel.org,
	soc@kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: defconfig: enable syscon-poweroff driver
Date: Mon, 11 Sep 2023 13:39:24 +0200
Message-Id: <169443234708.34398.6225536362107834291.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230901115732.45854-1-krzysztof.kozlowski@linaro.org>
References: <20230901115732.45854-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 01 Sep 2023 13:57:32 +0200, Krzysztof Kozlowski wrote:
> Enable the generic syscon-poweroff driver used on all Exynos ARM64 SoCs
> (e.g. Exynos5433) and few APM SoCs.
> 
> 

Applied, thanks!

[1/1] arm64: defconfig: enable syscon-poweroff driver
      https://git.kernel.org/krzk/linux/c/471eed5ad217fc8e83089e708d5cf5a1d0b205f7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
