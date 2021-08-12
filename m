Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0BEC4338F
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 21:05:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id B109F6103A; Thu, 12 Aug 2021 21:05:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0D8D61038;
	Thu, 12 Aug 2021 21:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628802353;
	bh=ppLfQb+71afaFf0JyXs9NNbvHqbMz0mmZJUsHCLkW0w=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I/l71ytJh318Lpa1fcg2/7kZKugX26pQ6WhGARJVbTExAoDjT4k8us7xKf5456u0e
	 hCFqIqtJqRYfcAGcGt2/fXn72BsNI+G2mTyr/pX8mPHx0jMShRbc04Kr72SQ6tq68/
	 FnAX4qzOIxWphN0BH3IMr5B3pSgbojNWSirsiFp3FeHn/pzztHKoyTgA637JhF3Ll0
	 vFKEJQQFfODS8JB9aaMcFjpWsojC1lJNT7UCAq59TnGm4RZPI+nySsXNNb3K2HXX68
	 Xls7P16yFvGcfAf+9v8NtZnOagyaFTd6kPCLKwVzTh1g27cYekd0BmCFFV5GhzCtN/
	 d2uN55xzEK+bA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	soc@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [GIT PULL 1/2] ARM: dts: samsung: DT for v5.15
Date: Thu, 12 Aug 2021 23:05:36 +0200
Message-Id: <162880206174.1376011.6163720025669210158.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210811085128.30103-1-krzysztof.kozlowski@canonical.com>
References: <20210811085128.30103-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 11 Aug 2021 10:51:27 +0200, Krzysztof Kozlowski wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.15
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 0b72a27e1d5d2dc54d289a147411229fa0ed2084

       Arnd
