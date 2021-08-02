Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66931C4338F
	for <soc@archiver.kernel.org>; Mon,  2 Aug 2021 13:32:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3987360F6D; Mon,  2 Aug 2021 13:32:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1691160FC1;
	Mon,  2 Aug 2021 13:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1627911169;
	bh=puYbUFN+ELiAKsMSCu8aPcfizFvxmdzFc6W44/WcFss=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vLGeUcacjmPVd9Jym1rch+TkjU4x91B0RRSTdk4KGDy3lyfdsRv5fTlnhOVwlPGpI
	 GwGL0Y9/aYJztYaf48BAmNshSz7K280mK5Oym6aSLqKdx0ssG/ApceKj3U3akS0d6F
	 6TcaC1x/Pga2cLX1tQvgK9b6FFkebuR/m9M1GQbmCu24aDmKWFAwZHxt9t3QuHIOaS
	 UtmLF3VDoqAPMV+Aj4eNr5J/D8HxB06z5FS0PmV6wgP3pljvGy5XRx4MIfWHSzCKDj
	 V+Cb8ahbrX+qGIiHUigv3/99QCArmz2Ozaf81Pxyl8OoYWlu1DP58iyZ1hoqql47Fs
	 dDqSH0bTLRzlg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>,
	Alexandre TORGUE <alexandre.torgue@foss.st.com>,
	Olof Johansson <olof@lixom.net>,
	arm-soc <arm@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	Marek Vasut <marex@denx.de>,
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>
Subject: Re: [GIT PULL] STM32 DT fixes for v5.14 #1
Date: Mon,  2 Aug 2021 15:32:37 +0200
Message-Id: <162791113541.1139989.12661940653007966330.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <c0b6031b-2de7-2ef8-71b2-a0af8f475932@foss.st.com>
References: <c0b6031b-2de7-2ef8-71b2-a0af8f475932@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 30 Jul 2021 15:58:54 +0200, Alexandre TORGUE wrote:
> Please consider this first round of STM32 DT fixes for v5.14. It
> concerns DHCOM/DHCOR fixes.
> 
> Thanks
> Alex
> 
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: b07bf042e678f5eac856052d332869423e365af0

       Arnd
