Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3081FC433EF
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 12:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1A101C385AD; Thu,  7 Apr 2022 12:42:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F3AC385A7;
	Thu,  7 Apr 2022 12:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649335342;
	bh=qeKPvFtdVR3glmmGiu+QkgCP+/rFmP4V/j98MYjd9ZM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CoBtZCZqqexGkWYzVB6oC0Us4xkip6v/Mvr9nbuWnMf/IH3GlE9PKssLcAeAwhRm1
	 S4cKw0fMaO23fChr/fVSnR975+Eb6Zhyiwe/JwdRzuRfBiUqfSeKH49K5DRQastENk
	 TxsGA7rLlSlQlk3KRWnpULnzvd3KaTJGC2Vv6tOZsQzGacmu+89omrWCygIx5SgyeV
	 l89HDV70AjbbwboVSCRX5kgMKzat+8ppG1k5PlltdQl87AnFS1A39mMKSAOfgPAHRp
	 WGM85VZvmznjxXCMwCAdJE/Gf6eKg90KwbCxW2vQFWnHMb9/2x68KxaYCLRlHr2VF7
	 upEkpyXnshxBw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	arm@kernel.org,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	linux-arm-kernel@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [GIT PULL] ARM: samsung: Fixes for v5.18 (current cycle)
Date: Thu,  7 Apr 2022 14:42:15 +0200
Message-Id: <164933532417.2189563.2554142563906098629.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220407080545.112290-1-krzysztof.kozlowski@linaro.org>
References: <20220407080545.112290-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 7 Apr 2022 10:05:45 +0200, Krzysztof Kozlowski wrote:
> For the v5.18, please.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 02481c7b849d893dcceaa60fe113f3f080fcee62

       Arnd
