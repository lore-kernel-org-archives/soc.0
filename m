Return-Path: <vkoul@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2949CC77B7F
	for <soc@archiver.kernel.org>; Tue, 16 May 2023 14:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E0475C433A1; Tue, 16 May 2023 14:09:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E11C433D2;
	Tue, 16 May 2023 14:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684246179;
	bh=0RSHeuFCD2oceb9abj/1/8VS0htG2UkEmX0KLrYlQGA=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=WgLNzi4CU+Iq84e2g5cZY6+HiU6CyPB94Oz3EvRBXv4tOH/3oxGe1j8azfWR9Zn47
	 Uk6rLEKIpr0aJe0BBSPYMjpjckPvIEqrxFYnrW3XRdHGkxskbUpxK/AHdGPAew1H7r
	 CT486piuqu85p/iVrPXTrruMDSPwjpjWQ9tJMHCNJuhgO8MEtojLhilZf0XeffFUos
	 2kOzWmuFUlHm/QiZcS1YCk5VrlyfRjqDsb+psp0fR5hYuD9AIBx0YyyeU4yekab4IZ
	 JfEuWrJgtCfmLtChATdNRn3kN8d+ouGK9E1TAF8hhqfauDa2ixDArvPFNLaJZTQbz1
	 MyIgTv2rUQrBw==
Date: Tue, 16 May 2023 19:39:36 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Artur Weber <aweber.kernel@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>, soc@kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Kukjin Kim <kgene@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
	linux-phy@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v3 08/13] Revert "phy: Remove SOC_EXYNOS4212 dep. from
 PHY_EXYNOS4X12_USB"
Message-ID: <ZGOOoGIlbqlmo/2Q@matsya>
References: <20230501195525.6268-1-aweber.kernel@gmail.com>
 <20230501195525.6268-9-aweber.kernel@gmail.com>
 <193f3489-4937-6d4a-2466-a67d335ac37c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <193f3489-4937-6d4a-2466-a67d335ac37c@linaro.org>

On 09-05-23, 19:42, Krzysztof Kozlowski wrote:
> On 01/05/2023 21:55, Artur Weber wrote:
> > Support for the Exynos4212 SoC was originally dropped as there were
> > no boards using it. We will be adding a device that uses it, so add
> > it back.
> > 
> > This reverts commit fee7e1d50c6e6da1d99035181ba5a5c88f5bb526.
> 
> Subject:
> phy: Revert "phy: Remove SOC_EXYNOS4212 dep. from PHY_EXYNOS4X12_USB"

Right a revert patch is patch which shall follow the sematics
> 
> I assume this will go via phy tree. If not, let me know.

Applied after fixing the title

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> 
> Best regards,
> Krzysztof

-- 
~Vinod
