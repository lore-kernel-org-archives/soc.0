Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2941C433F5
	for <soc@archiver.kernel.org>; Wed, 15 Dec 2021 09:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CD9ABC34606; Wed, 15 Dec 2021 09:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A437BC34605;
	Wed, 15 Dec 2021 09:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639561943;
	bh=Cbr39zEd6gS4eYrAtweqR55i+TW8z6qPfNltkG8eUvE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t1KBs1aKd+1LtfkktU4ks2CBKJ5t9GKpJ+JHBaStsB0hrwIDQB5PeUENgXvruDwfh
	 8xmu8GJegPDxElc46iakmZNvGDV+F09U3uCkQxELNLkPf3U+R8u7Kq19C2EIEg+9Oi
	 3BDCx4FMqWcx1SK+hZONuuQGXHn5y09b6D9RlDAXKHKE4k/XhRY53UTy4oMB8xivE2
	 bywAmFrgFcX5GZNOdqKY3tSv7YW0KnMVPvFqzKA7jBNFwYPrCYmLDI1LA2m2D6MLOn
	 cS7jieyAfJb5tbuG8VbSEsf+ge5LV6WCFEBc6cI9wYH85WSEkXgGKoWnOqdrHeLfBl
	 FhixSHfoUHhQQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [GIT PULL] memory: renesas drivers for v5.17
Date: Wed, 15 Dec 2021 10:52:19 +0100
Message-Id: <163956193535.1228119.8827834668914996607.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211213105618.5686-1-krzysztof.kozlowski@canonical.com>
References: <20211213105618.5686-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 13 Dec 2021 11:56:18 +0100, Krzysztof Kozlowski wrote:
> Topic branch with Renesas related memory controller driver changes.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: e8f7875680aeddb717248e0467bd533243d326ef

       Arnd
