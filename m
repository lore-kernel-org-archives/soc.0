Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B66C5C433DB
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 11:31:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 93B4064E0C; Sat, 30 Jan 2021 11:31:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E36864E0B;
	Sat, 30 Jan 2021 11:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612006269;
	bh=UV50urgspytuY9CWXJcNPcTe0lVc6bHC5gQXoZf8BFs=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nohkj68WzyVWhZIq6nNV0516VeGHJBqexhz9R30JMyLBIeQg/JfGplEkphHu7SBKR
	 TD9YHNk/L/bS7fg3PY5J6CzrnkFARDaVwS3OtVxioCSKSk10mvui8z9zWnnk+Gdpy6
	 pIH3MxYcEJPIg14PdTm9Wt5hPG9bJn/o14yfNnIbWziNXxONMb2U9gsne/3JzXBbGq
	 ztth37/iSJEZcbX8owGa/i16xnGRuHk8nac9d8i6wPmUh/PklJR6RqNEUIVqDsZMT4
	 6HPgI8MT1I0o5LeMWw0kv9yPO+8ySClJsS7s36vm2ZdCUn+q04t25nEvH4H7IitE82
	 x+2d1CBZcXT5w==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Kevin Hilman <khilman@baylibre.com>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] arm64: dts: amlogic fixes for v5.11-rc (round 3)
Date: Sat, 30 Jan 2021 12:30:52 +0100
Message-Id: <161200623045.2192465.17705478393646031339.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <7hk0ryi6rs.fsf@baylibre.com>
References: <7hk0ryi6rs.fsf@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 27 Jan 2021 10:17:27 -0800, Kevin Hilman wrote:
> Arnd, Olof,
> 
> Sorry for all the one-off fixes this round, but here's one more fix for
> v5.11-rc.
> 
> Kevin
> 
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: e2fc2de8e1aacef4c76f7a4b8c6162874d3e2801

       Arnd
