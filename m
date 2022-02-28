Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D873C433EF
	for <soc@archiver.kernel.org>; Mon, 28 Feb 2022 15:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id EB8F3C340EE; Mon, 28 Feb 2022 15:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60746C340F0;
	Mon, 28 Feb 2022 15:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646061419;
	bh=GJQoRMKlVjEx8VOum9zq5qGX75FGqQ6gw/NJORmXovY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GFGRP/N8+ZjWZPgAgte8DrYp4O2uWg/bXZXkGyerrLl32XVgJPAGHxqXnsjwzqrz+
	 Y7OKFBF5QsMj4xA253VmiZZmJyrX5gH+0R+FHIeMcU/peLgh/Gj/Fx0Sec6S0lUNOu
	 LO2r/gPHpqmWu0ESWRX6EGm6nrTPS3uUeLUNdm6fbBGZ1AddgsWuvGHgfXrhU+Smt8
	 wNzqnArpAdREzsJSMemtrmy4yRxQ93ma7VJvaBuHDVNCx2vPPVNPkZ2mHfzTaZL8qN
	 91CRZUrS8DHe91dBLGv5HESawL1QinFMMq3jK2N10ZJe8QAfglktCL45Au9nnpT1Qk
	 5lS10h7iieDlw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 2/2] arm64: dts: fsd: tesla for v5.18
Date: Mon, 28 Feb 2022 16:16:33 +0100
Message-Id: <164606116850.3364867.6001925808807066648.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20220204154112.133723-2-krzysztof.kozlowski@canonical.com>
References: <20220204154112.133723-1-krzysztof.kozlowski@canonical.com> <20220204154112.133723-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 4 Feb 2022 16:41:12 +0100, Krzysztof Kozlowski wrote:
> The dedicated branch for Tesla FSD: bindings, DTS plus platform enablement.
> This merges dt-bindings headers from PULL 1/2 (only headers!), so everything
> can be applied cleanly within one set.  There is no mixing of driver code, only
> dt-bindings.
> 
> Best regards,
> Krzysztof
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 9d28fe1becc3596a87c0b8c0e386ebdf68cb759e

       Arnd
