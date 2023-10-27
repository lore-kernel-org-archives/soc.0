Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EF7C25B47
	for <soc@archiver.kernel.org>; Fri, 27 Oct 2023 08:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C1EFBC433CA; Fri, 27 Oct 2023 08:43:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E77C433C7;
	Fri, 27 Oct 2023 08:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698396212;
	bh=JSB6PcetfP/4yS0m575apiVELNKRhdiJVFt3llmLSBE=;
	h=Date:From:List-Id:To:Subject:References:In-Reply-To:From;
	b=RuSDqXq5ibucvImFzaPxHJp1IzoDfUoW9Rf6oE0IiTk6mX/oGRCWuIFWaFH9pYpXb
	 HiZoiGtQqYV3T37IBSTkdsRkcvfHr07CpSdlYUv9D1QcDhUo+V7CRDN8JhY7kb2N9F
	 SSyaGdGi12rSTjw+FIEBgbU/CKmk3QEjfpcZVMGJwKikcanodYV53HSJqWxL5djHik
	 Qy6HTIE86Yaeci7ijEny+Wt7Qaqfe286oEc+PtWlf4qLvae4MCPjKWFsCA3VjxY1sl
	 mFMsk4rig0lGr8A0RZwY3CMXFvVm+uKFxqNctwzckPBF80DcFCfpRnflugthtPwvIa
	 +mPZTew6B086A==
Date: Fri, 27 Oct 2023 10:43:27 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 1/7] dt-bindings: arm: add cznic,turris-omnia-mcu
 binding
Message-ID: <20231027084327.oounietdk2slkc2m@kandell>
References: <20231026161803.16750-1-kabel@kernel.org>
 <20231026161803.16750-2-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026161803.16750-2-kabel@kernel.org>

Forgot that Krzysztof already gave R-b for this patch:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
