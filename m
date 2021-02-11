Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECD7C433E0
	for <soc@archiver.kernel.org>; Thu, 11 Feb 2021 15:04:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id D58C564EEB; Thu, 11 Feb 2021 15:04:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2B86D64EF2;
	Thu, 11 Feb 2021 15:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1613055870;
	bh=pmdjBKNJSsKY1j7IbCMcNKQl56g5BR2fFy0ONv3b0Fo=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qFOM49bK78dgQiRWsHLE5DQvV1bd1meTG08dWzpN3zWC6TchOIiddzNTx0Sd4BI3v
	 fCwTFWWA7fmEgm8z50FczvOKpTi232i04j2BhAjQu7t5ndXCylkrMZ9VdPKaoWBRtD
	 7X+cHYvvI5woQq+0g+Gtj0dFU583n9jIQV0KzaN9Gy/tzJDu29/WjdApAg7esOXy9+
	 QBeDREJ4O6O0V8mpT9vPeO8uwP94EPBn95GOkRVjIk0Tv7IUwCDL5gwdQBoQa8Vnnw
	 LV4s7fdX2IhpHbvAmDK+U6ExhFE6JiE8vsLt+jSXyKKuDdaGATL8iVdjSASMg5IC1b
	 Wmqj8DeqCb5Mg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	olof@lixom.net,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: Arnd Bergmann <arnd@arndb.de>,
	yuji2.ishikawa@toshiba.co.jp,
	linus.walleij@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	bgolaszewski@baylibre.com
Subject: Re: [GIT PULL] ARM: Visconti: device tree changes for 5.12
Date: Thu, 11 Feb 2021 16:04:22 +0100
Message-Id: <161305573916.259289.1286171955086418832.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210173210.nnytfyrkkj6ylrtb@toshiba.co.jp>
References: <20210210173210.nnytfyrkkj6ylrtb@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 11 Feb 2021 02:32:10 +0900, Nobuhiro Iwamatsu wrote:
> This request includes the GPIO DT patch for the Visconti SoC.
> Please pull for v5.12 kernel cycle.
> 
> The following changes since commit 4fd18fc38757217c746aa063ba9e4729814dc737:
> 
>   arm64: dts: visconti: Add watchdog support for TMPV7708 SoC (2021-01-25 09:20:47 +0900)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: a36c9ff6a2df17295e0050dc9a9d5abff4b21dd7

I see that the pull request is not a signed tag, please remember to
add a tag description and signature next time.

As the changes in here are all trivial, I pulled them anyway for
5.12.

       Arnd
