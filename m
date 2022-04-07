Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68964C433EF
	for <soc@archiver.kernel.org>; Thu,  7 Apr 2022 12:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4854EC385A7; Thu,  7 Apr 2022 12:42:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7676EC385A4;
	Thu,  7 Apr 2022 12:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649335344;
	bh=26IrVvGkZCFmiRo7YFORqM9fXlgQUvYhK5fl4tUJq28=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iCj12DFKnlnxy17JAFdRqO5OF7nKcC4Uoi1PsIZiJAJWs/CgWOV1zjKLi5HVg1amG
	 ORu5HjLUfCFe2TSy0lxNXkyulDoi0wQVza33GjaNcibKjqS4++KBGdDg6KWJtYMHa/
	 ulaKMl6wknScBx5ap4anJLOQrCN9DEX29b2nNSfvf/ipAnBmfFe4/3hOMiMEPuLYjX
	 oXlQy2NdvoxklVM0gdIlugNt+QVSzaeM9oNappV9Auqfo04IZaHRKbDyptt60XBuNE
	 EAL33N3knooDZi5K3WgXf8OVQD5lLWJzgeS9NYIkrsbO0DJWQzVS5w2kyCZeVGmbVZ
	 eFmLoDbj3AEXg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	arm@kernel.org,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL] memory: Fixes for v5.18 (current cycle)
Date: Thu,  7 Apr 2022 14:42:16 +0200
Message-Id: <164933532419.2189563.5826663417623059896.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220407081448.113208-1-krzysztof.kozlowski@linaro.org>
References: <20220407081448.113208-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 7 Apr 2022 10:14:48 +0200, Krzysztof Kozlowski wrote:
> Fixes for v5.18, please. One is recently introduced, others were already
> existing.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 44e4a2c75676eda875bf5da20709bfae62af9a99

       Arnd
