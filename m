Return-Path: <SRS0=/6xr=NZ=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D29C27C4F
	for <soc@archiver.kernel.org>; Sun, 23 Jun 2024 12:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9B902C4AF07; Sun, 23 Jun 2024 12:22:40 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BBC9BC2BD10
	for <soc@kernel.org>; Sun, 23 Jun 2024 12:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BBC9BC2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42138eadf64so29279815e9.3
        for <soc@kernel.org>; Sun, 23 Jun 2024 05:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719145357; x=1719750157; darn=kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lEyt1clUvQ1PslgHqEefPU/EF6DS0rMvBZKOKD27pAk=;
        b=LUsZw4cN3Z9iuXS5NC6gNLi4I+TrMAcdO8AkKmXDSpgpnuFX3FqEwZ168Y7mV54gCe
         KRnUIwoq0xOnoJv9jdjH7QTqekPLCxp4cND4QenbW1riKQmL5gGXVNsnIvCAeTtHm6cl
         XMfzZqusds86a/9zu6QPycccZYDv2W8x0LYyXCBtiNPQ3FbIvBAinEwDkokQeZKCcAW5
         aMwf1nUTYRg0AuqffJD7gzQhaY1xWRRn0uN0FTJracDFzD346VhPP7uf1nJxe5cXwxl0
         evHHiTfsEJciCQ3astreP4DTs7GYQwF/r2L9+VB+Q70/GE5KmAqwO08u6gkIAQhL1R4w
         wCmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719145357; x=1719750157;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lEyt1clUvQ1PslgHqEefPU/EF6DS0rMvBZKOKD27pAk=;
        b=BGT3faI4ri6kJSwHx7UGQyka94c3cacxeCCHHQvDM0geMtZub5O0jmpbknc4V8PoAm
         YNLpTV/wwAU/YUw2ZDzLIOHJUr49vQuq99XyqR3/3MJMF68q93JaISrO1ldD/nZQVZnv
         ZAFjoQ/r86gLv6ZH6y11IZan3kEhdHXmU4l0kpktJHn5Q71OXO0xeRYbVs0htKkj0dmM
         VO2We+Ohxnz1MWe3/jx86y1wDxapsMn9tTUlx6nrTxyTuCmi9DzwALPyzZ9mZVwWCVUj
         SevHmxuso6dKD5VxIDqBacncKBLUXHI7D7bKxNjZ9yQR40wvQfIK7iNVY8QHhx2Zdkeh
         OnTA==
X-Forwarded-Encrypted: i=1; AJvYcCWxeXlly46xGwXjgecPc5j7KLc1AMWpFacWaqNcOiOaIqtzxWkvOvbYjkuvcwwBgGytzTcEy3ErdQg0LnXpfQ==
X-Gm-Message-State: AOJu0Yxk1p0YiHXLjN2D9UJ6pxE8tvlcwmFvkjYYaPI4khV74nv8zCYg
	+h81nbKOMag/XDmGpITy4Ln6Vnehv82FXmVZz/8ePedhHqn8kGoMxf7d3oJCJq/M+beS6nYJ7vH
	V
X-Google-Smtp-Source: AGHT+IEMZCFOhYXky3s3TDx8dy5hM9Fnpch+Lj8XEfUD5u6tCF3MRMkE/dJ5+tVAvUSDRCUQdjLCtg==
X-Received: by 2002:a05:600c:450d:b0:421:7198:3d76 with SMTP id 5b1f17b1804b1-4248cc58b99mr12799485e9.28.1719145357746;
        Sun, 23 Jun 2024 05:22:37 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0be841sm136955455e9.20.2024.06.23.05.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 05:22:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, arm@kernel.org, soc@kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Oleksij Rempel <linux@rempel-privat.de>
In-Reply-To: <20240612141018.7348-1-krzysztof.kozlowski@linaro.org>
References: <20240612141018.7348-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: ARM: alphascale: add Krzysztof Kozlowski
 as maintainer
Message-Id: <171914535659.46985.7068409299945759255.b4-ty@linaro.org>
Date: Sun, 23 Jun 2024 14:22:36 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Wed, 12 Jun 2024 16:10:18 +0200, Krzysztof Kozlowski wrote:
> Apparently there was never a maintainers entry for the ARM Alphascale
> ASM9260 SoC, thus patches end up nowhere.  Add such entry, because even
> if platform is orphaned and on its way out of the kernel, it is nice to
> take patches if someone sends something.
> 
> I do not plan to actively support/maintain ARM Alphascale but I can take
> odd fixes now and then.
> 
> [...]

Applied, thanks!

[1/1] MAINTAINERS: ARM: alphascale: add Krzysztof Kozlowski as maintainer
      https://git.kernel.org/krzk/linux-dt/c/3974eeb925657091884a2a44f8b71ab56befdce7

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

