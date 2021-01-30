Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 098F4C433DB
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 11:31:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id DC80A64E0F; Sat, 30 Jan 2021 11:31:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 878BF64E0A;
	Sat, 30 Jan 2021 11:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612006267;
	bh=L8bTIvuS1euv231F8JRvQ/VwgAk835JUMJiRXZ+u9gE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iNeC/sdpLhajhVtSqfwRFcsIY7YtLCzbaTfVp3wK4IBGld7lHAnkIJm6+b3eFXcZo
	 3sJyWeuudAQNMb/SiVcydci3B/qbUzZQc2/1eYu7s74i/piSxKnQMzF+CtKaSR9okm
	 g/DJhMcsk8FytQLs5sZoociOzElI9OefELqdZguP/fjJLHrBZYF3Li/uaPp6v7o0Mn
	 hkFztWcytPIVy9Cb1O61dnrROtz+Y1id0oj7hnspaKy7oJpYDgZO/o4VZxIJuXyngL
	 dSKWscXSDOk/BeHKnq2bvKlkj5PW0IrOC+oKI4ccgLFwFP8h+z4+1BuyEdu+mJuf40
	 OaFrCoQ0D2/Ow==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Kevin Hilman <khilman@baylibre.com>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] arm64: dts: amlogic fixes for v5.11-rc (round 2)
Date: Sat, 30 Jan 2021 12:30:51 +0100
Message-Id: <161200623030.2192465.7465169805022530361.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <7ho8hai7e6.fsf@baylibre.com>
References: <7ho8hai7e6.fsf@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 27 Jan 2021 10:04:01 -0800, Kevin Hilman wrote:
> Arnd, Olof,
> 
> We found one more regression in networking on amlogic SoCs needing a
> fix.  Please pull for v5.11.
> 
> Thanks,
> 
> Kevin
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: daf12bee07b9e2f38216f58aca7ac4e4e66a7146

       Arnd
