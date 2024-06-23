Return-Path: <SRS0=/6xr=NZ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A32FC2BD05
	for <soc@archiver.kernel.org>; Sun, 23 Jun 2024 12:22:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 33FFFC4AF0E; Sun, 23 Jun 2024 12:22:39 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 26EA8C4AF0A
	for <soc@kernel.org>; Sun, 23 Jun 2024 12:22:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 26EA8C4AF0A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-424720e73e1so27979455e9.1
        for <soc@kernel.org>; Sun, 23 Jun 2024 05:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719145356; x=1719750156; darn=kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mhAh+jvGCqAD93XQACw6Y1mGR3kGi5n7lZXBozkXoCw=;
        b=kDg5L7+W0FxF4aWhN1P+5Brp7OD9pxUuugN+o4GtUhcQsjD8vxjMUrU98hO/2TcKlk
         ygoZZGSLhNS0T29tf8kPYzjbPKG3rSkYPBREWzdCqfr15mcC5gzB/28AjHTkLA05BdSP
         xsBHhhZRyvTi3nMsGBkt5FKyhQTgSKKP+NzsmByJx28Smbd7eXAtWVkjUCjIyCvUVFDN
         KPObesQAz4jp+3wVjSflLqfyfn7FUunn5aqXUdtdXLxzSugicI7Cb7n689gGSM7e7OTn
         6hp4r4lLjRCznP9HZuFq2bRaHLdXThzN94+JcEZrO4Rkxl2pn308T0X3Bp9Cf+Pb/Qg2
         qn0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719145356; x=1719750156;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mhAh+jvGCqAD93XQACw6Y1mGR3kGi5n7lZXBozkXoCw=;
        b=LtmmS3F4E3vFSY0n5C7RH/C5sDfsaK56I1IOks/+OsnUs8Ib/if3lu17lmZZ7tM8kb
         SE4yNOPYtACrNiqO3mbzpZ56GpDBMF+0bKxJzWFnIpYEPulSTxKNSS6lpgWp/iAyAd/r
         F/kbbwwmKTbcCeqNFybTRQp+WWin/O8PhmeAx+/FZ2gPp50RlGFRkB20iXbznQdfkd9t
         skV1d/7WT/xGUuBwkLPOvSWn32sdMb4V3mw5yDgOgxU9IaO9OaMC91IawFNrrpWVbELy
         iWHKyBz/NaxnExGIdLRq2EVGL4IleTGdLXn1VuqBWfQ5mhn1ojVO/qXxckBiSnhwcm8K
         /7fA==
X-Forwarded-Encrypted: i=1; AJvYcCX2GRmP4O2yPuUDwHDlHM9fTdXiyEQTfhlb3jZKPgJ8gRuxIa5lf7VotHeKjY6DYIWB14fEYTIq8QvAawFKNw==
X-Gm-Message-State: AOJu0YwUCtZlJkTNJSCklyGnH7K1Kjd7v8+uZ3lXN0YwEh1a9+o6rB9w
	uQPOsjUxuPf2GQIqmzoRXx/Oo27JQ8VPaA84Of1hsmQ4nzTmsYAs16yo9JJ2E93Lp/HuPYsfoHx
	C
X-Google-Smtp-Source: AGHT+IH9P7vvvq+k1dMT2QWLUAqW8tu5zQt3wDV0Jg7WyRsocyvjDdZyVe/Xx8B2afoTTWYf/Rt8yA==
X-Received: by 2002:a05:600c:458f:b0:424:8d36:4a45 with SMTP id 5b1f17b1804b1-4248d364bc1mr13903465e9.2.1719145356377;
        Sun, 23 Jun 2024 05:22:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0be841sm136955455e9.20.2024.06.23.05.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 05:22:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, arm@kernel.org, soc@kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Daniel Tang <dt.tangr@gmail.com>, Andrew Davis <afd@ti.com>
In-Reply-To: <20240612141740.8470-1-krzysztof.kozlowski@linaro.org>
References: <20240612141740.8470-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: ARM: nspire: add Krzysztof Kozlowski as
 maintainer
Message-Id: <171914535504.46985.10566250151315469912.b4-ty@linaro.org>
Date: Sun, 23 Jun 2024 14:22:35 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 12 Jun 2024 16:17:40 +0200, Krzysztof Kozlowski wrote:
> Apparently there was never a maintainers entry for the ARM Texas
> Instruments Nspire SoC, thus patches end up nowhere.  Add such entry,
> because even if platform is orphaned and on its way out of the kernel,
> it is nice to take patches if someone sends something.
> 
> I do not plan to actively support/maintain Nspire platform but I can
> take odd fixes now and then.
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: ARM: nspire: add Krzysztof Kozlowski as maintainer
      https://git.kernel.org/krzk/linux-dt/c/997148228410f8e2fda78b848ae16fdc525158e9

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

