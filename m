Return-Path: <SRS0=JHH0=AH=linaro.org=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D879C77B73
	for <soc@archiver.kernel.org>; Sun, 16 Apr 2023 18:06:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1E360C433EF; Sun, 16 Apr 2023 18:06:25 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1D98DC4339C
	for <soc@kernel.org>; Sun, 16 Apr 2023 18:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1D98DC4339C
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f53.google.com with SMTP id fy21so15558496ejb.9
        for <soc@kernel.org>; Sun, 16 Apr 2023 11:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681668380; x=1684260380;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zx4HOdq1glymmchauCaLCgaY7UhtC2caCXREOqnLcnE=;
        b=ddakFiPtPqcA6nXNg9qB79RhsTIQJkU2ZRVv3zqRn9m4GLf8VHwtPzmMb/HkqKx3TO
         QgtiFm9x04J54FEgP5o0dZC70R4QnPpum/vVl0or2d4pelkja8AIamHrNbqjP9V3Io59
         iDuQeYhw1d93IPJv5i+ZVKhpEu741aUYqv0AfrZUPXCD6Z6V1OfQa6rWRQcbyHM3I1CH
         QOj2GzhEXqk71OyChXdSPodkye+GFJSL6S1AEczvmNdgi8MpD8csdOPQ2YD2e3Vz+sG8
         x4sxuXBzS9H+50F62r+FTY7DPNuRD7OcS0ZksVCYZiv+ufVWN7x+CboTSbrmUbQvup1a
         dMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681668380; x=1684260380;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zx4HOdq1glymmchauCaLCgaY7UhtC2caCXREOqnLcnE=;
        b=lSFsVl1zhWcrbtVqWjj8doTQl1mIi/YYy6IErAxbtsorYpkLhEOer7V69DKca76el+
         bmOM5DVhJciH18IDqIPPYILMea2jgQeeUYZytTkUrDhk14nqpUXqurXuczGlSnTca7V3
         jwl15q+CPxI1tGtWWe4q8O7vtcwF2UnR5d41/g+HW24R8SgHA9VCESAVNPyVoJkKr8xL
         L7FfqXVeZbV7mG7Yi0bXzTM/tM1L4VJz2jZI2HCjDkq7N06YzHl+c7uOa5oQSmbsKOEJ
         LH1TbBmbDWajfqQ5anKDvyG9UzMrHkH22ZKakWpM7v07l1RKnxKHl89I0GORo5H6tgQ/
         resQ==
X-Gm-Message-State: AAQBX9fHzIzxoUEizN5LwF7/f1q/2wk4UhTk3Kcb7KPJw2u0th7Kelmd
	MMlwKew+AlOiQFqse3tt0axG3Q==
X-Google-Smtp-Source: AKy350as9Ry/0XZTLgutgv5F71m3xIEIuueZ6CB5ap8/e/hdGHn/MB6do5KVKLt/AnCFrHGfPkHrUQ==
X-Received: by 2002:a17:907:a424:b0:94f:6218:191f with SMTP id sg36-20020a170907a42400b0094f6218191fmr1809248ejc.52.1681668380277;
        Sun, 16 Apr 2023 11:06:20 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f9e3:1d38:66a7:ae92? ([2a02:810d:15c0:828:f9e3:1d38:66a7:ae92])
        by smtp.gmail.com with ESMTPSA id f21-20020a170906739500b0094f7c1b6a94sm191773ejl.11.2023.04.16.11.06.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 11:06:19 -0700 (PDT)
Message-ID: <cedc7ebd-9852-9cef-7020-abfeb873b0a6@linaro.org>
Date: Sun, 16 Apr 2023 20:06:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 08/12] Revert "phy: Remove SOC_EXYNOS4212 dep. from
 PHY_EXYNOS4X12_USB"
Content-Language: en-US
To: Artur Weber <aweber.kernel@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Kukjin Kim <kgene@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-media@vger.kernel.org, linux-phy@lists.infradead.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20230416133422.1949-1-aweber.kernel@gmail.com>
 <20230416133422.1949-9-aweber.kernel@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230416133422.1949-9-aweber.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16/04/2023 15:34, Artur Weber wrote:
> The platform was originally dropped in commit bca9085e0ae9 ("ARM:
> dts: exynos: remove Exynos4212 support (dead code)"), as there were
> no boards using it.
> 
> We will be adding a device that uses it, so add it back.
> 
> This reverts commit fee7e1d50c6e6da1d99035181ba5a5c88f5bb526.

As in all other commits, do not reference the DTS but the commit which
removed this part you are reverting.

Best regards,
Krzysztof

