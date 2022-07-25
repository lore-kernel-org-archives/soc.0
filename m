Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E7AC43334
	for <soc@archiver.kernel.org>; Mon, 25 Jul 2022 15:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 0C579C36AE3; Mon, 25 Jul 2022 15:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81DE0C385A9;
	Mon, 25 Jul 2022 15:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658763886;
	bh=pmzBUMLaNnqCU9wrwuE7gawWJstg+/fp8AWiGh36eco=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=onYMtfNbQsftS6L74WN2YA3E++iDNN3CfjAN4DVuMVgD1m63jC7UtEGgBKdJjsQBv
	 vBqxlhAckoLt7n/INcmG9SArG646PKMTUK9QyBoDtmKCD3+dCL7wWsoa+fvtt93IJ/
	 IoCrtmeBejyLON8YxeOfJt34Xuw5btmtCrxWD31Ar49MfJ8ppoCSRgLVcuLjWKjOLV
	 L/iJVxJeM89kU/mC2XDPElGAMvKpI6V572Dx5DhTCZLT4dJdm5/fXc1rynis6s+PU4
	 dSDCAa4crr03smkyWukCElOmSKH3ZwMRzVA+aHe56S0Yp0Pc/gN8oOjFKCoT35gelY
	 q7UnFEfzEN3bw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Olof Johansson <olof@lixom.net>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Andrew Jeffery <andrew@aj.id.au>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joel Stanley <joel@jms.id.au>,
	Rob Herring <robh@kernel.org>
Subject: Re: [GIT PULL] ARM: dt-bindings: aspeed for v5.20
Date: Mon, 25 Jul 2022 17:44:18 +0200
Message-Id: <165876383778.2817697.6741554510026165530.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220721072415.11424-1-krzysztof.kozlowski@linaro.org>
References: <20220721072415.11424-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 21 Jul 2022 09:24:15 +0200, Krzysztof Kozlowski wrote:
> My two patches documenting existing Aspeed board compatibles were waiting for
> some time, so a month ago I decided to pick them up and include in the
> linux-next, so other developers - like David - can base their work on these.
> Unfortunately the responsibility for the patches was not cleared as I was
> waiting for some replies Joel and Andrew, so I also did not push them out to
> you. And then rc7 appeared and it is quite late now. That's my mistake, I
> should sort it out earlier.
> 
> [...]

Merged into for-next, thanks!

merge commit: d44108d84411c1b8011953fcc1bfffb734b3c752

       Arnd
