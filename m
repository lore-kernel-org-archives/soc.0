Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2828C2D0E4
	for <soc@archiver.kernel.org>; Tue, 24 Nov 2020 11:01:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7D66A2076B; Tue, 24 Nov 2020 11:01:55 +0000 (UTC)
Received: from threadripper.lan (HSI-KBW-46-223-126-90.hsi.kabel-badenwuerttemberg.de [46.223.126.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id A81D92076E;
	Tue, 24 Nov 2020 11:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606215715;
	bh=rcPwwNyOgnoFK0hn92mtxvr7+2z4fh+XCF5CV9YDXqU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=A1HJE3h7Pc2ltNpTtPZ6L8FRqTwwXe280m0aHj4EEES8GGX8Z636xZyQRGtL0JkUw
	 HY5HQtLYCKw0jDzVtGHGOWDUbjRAWomQFKBfCvcO9G45jtLKCS8q/ZszwEONi/5w7t
	 Sv3YZ33wgNfX5lf3/SomXM+HExGGerzgW6KEHqWo=
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	soc@kernel.org,
	Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/2] samsung: Drivers for v5.11
Date: Tue, 24 Nov 2020 12:01:49 +0100
Message-Id: <160621564539.128147.2478803979700391709.b4-ty@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201113162211.10020-1-krzk@kernel.org>
References: <20201113162211.10020-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Nov 2020 17:22:10 +0100, Krzysztof Kozlowski wrote:
> Two early pull requests to flush my queue. I will have definitely some more
> pulls later.
> 
> Best regards,
> Krzysztof
> 
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 4ce4be5d28deeeb6aa3f724c3fcb3c1627e40f10

       Arnd
