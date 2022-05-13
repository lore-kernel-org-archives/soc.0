Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD30C433F5
	for <soc@archiver.kernel.org>; Fri, 13 May 2022 12:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 26665C34114; Fri, 13 May 2022 12:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3054CC34117;
	Fri, 13 May 2022 12:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652443292;
	bh=sFJ9qprB/Q1GFZqocvu3dFecoswQj+71JegWJVh4XaQ=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l7/lHwyY+tavO/Fs001FHtdSIkZ1gM9KpSI0RkhImzn900b8XyMBVFA+PkpZ1BII2
	 psmWtHV2v/2vHXSw9EfmD7CDFKHQH7EY2s4O90fvczUKLgdGr9zx6ykENya2ktU/LU
	 vJ0he2xjzwduW4rXJKQOn1LwFUCQyrW5yWw+dwsDHhYz9Z+IahJe04WzOR03+CUaa9
	 bbR33r8C08WztLkeaQOqFcj+veJTT+HK932u5rWHrxLKhYcEgaFz1nq12nwML1rker
	 frrzvNdK2vEDhr6VJiQLOXvhOXsrGy/qCocKP29k/c7FH6qy/gkSjt7v7ramxHg7Wp
	 mCoO2GSxLYNdg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-kernel@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [GIT PULL] memory: drivers: tegra for v5.19
Date: Fri, 13 May 2022 14:01:21 +0200
Message-Id: <165244327627.2870002.5743567167078050995.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220509160807.154187-1-krzysztof.kozlowski@linaro.org>
References: <20220509160807.154187-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 9 May 2022 18:08:07 +0200, Krzysztof Kozlowski wrote:
> Topic branch for Tegra specific memory controller drivers.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 6e6962ffe2ea8019877bc1db04b6105a4b3026bb

       Arnd
