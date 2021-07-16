Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6B7AC636CD
	for <soc@archiver.kernel.org>; Fri, 16 Jul 2021 21:25:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 9F8C5613F7; Fri, 16 Jul 2021 21:25:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 12C0E61374;
	Fri, 16 Jul 2021 21:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1626470729;
	bh=BVdU0dsdC+M+NMJR+sQfIqy9DFbL4rCnKiZWc6RcKUc=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NAjU3Y3IMxUjjZys4SpmgckvH8aWBqvjQZfg+mYx0n7GOmqm0d6lYoHqPD7MKqqwe
	 T9pFCjJKu4PmD6bNXKkigdo1cLungkfeKBTBwrS4jngBX5D7bAFvK+61h4OJn3cU9n
	 FSB+2osilqtFDmVXMxg2N3P9ovHBm3qZH60amU/r0/AhU5sbNOz6ZtAs2KLd/heU5R
	 4C5d+AA2hJeQytL1borN8Xyos1WT89sLdUx9r65ik0t0gsqHzV5MX7qIcJpWsCFGkS
	 YVX32oNn1OfZkOjnDdJNj/Kdk9upnD+xFi6RuZ5w4z6dZalOtsg4wDddxGUWbIt3T8
	 8waPG0YDlUEGg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] ARM: dts: versatile: Fix up interrupt controller node names
Date: Fri, 16 Jul 2021 23:24:54 +0200
Message-Id: <162647049998.3478428.9987238633660084140.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210701132118.759454-1-sudeep.holla@arm.com>
References: <20210625235834.830035-1-linus.walleij@linaro.org> <20210701132118.759454-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Jul 2021 14:21:18 +0100, Sudeep Holla wrote:
> Once the new schema interrupt-controller/arm,vic.yaml is added, we get
> the below warnings:
> 
>         arch/arm/boot/dts/versatile-ab.dt.yaml:
>         intc@10140000: $nodename:0: 'intc@10140000' does not match
>         '^interrupt-controller(@[0-9a-f,]+)*$'
> 
> [...]

Applied to arm/fixes, thanks!

[1/1] ARM: dts: versatile: Fix up interrupt controller node names
      commit: 82a1c67554dff610d6be4e1982c425717b3c6a23

       Arnd
