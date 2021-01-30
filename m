Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA71C433DB
	for <soc@archiver.kernel.org>; Sat, 30 Jan 2021 11:34:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 6FC6064E0A; Sat, 30 Jan 2021 11:34:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A52C64DDF;
	Sat, 30 Jan 2021 11:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612006466;
	bh=RFBIYfH0yKEs+Ldd1LKFEhmD8Ytv9lJe9IyXY0RBW8s=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cvsxiMhv7GFYh93UueIhVmKesTcujca7W/Wt6wlOFZ5JG4K4mTr9hqFo0k+c2ZRKa
	 AET0KKVxPetR5cPbu2Xa433hRsJKuRLSY7Zv4w2JmGWlBTZhpa06bI2lwsXb78URHC
	 sfzp/ZWE3km6D3cWAx0cBEUqhRuvJAvLsMEcqLCPinc4xs/9Hrotb3ESQ185r8sesB
	 zyZurPXiMWd7cDCY+wSVrqWrEYoxCT6m+yoPQSh073EbfSk13riJYuaub1vUbX7tX5
	 ovzpWHk6VvYMFPrtGf1Mg3n1oSXgKI1G1SL5gbyIGSzWgRKWNLGzKEBz89ZC6zsa8l
	 MxiDB/+BxN1ng==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	olof@lixom.net,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	yuji2.ishikawa@toshiba.co.jp,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: Visconti: device tree changes for 5.11 / 2nd
Date: Sat, 30 Jan 2021 12:34:11 +0100
Message-Id: <161200641621.2316427.10578020919040604420.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125003357.yd72y4f5vcdnvhnr@toshiba.co.jp>
References: <20210125003357.yd72y4f5vcdnvhnr@toshiba.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 25 Jan 2021 09:33:57 +0900, Nobuhiro Iwamatsu wrote:
> This request includes the WDT / DT patch for the Visconti SoC.
> Please pull for v5.11 kernel cycle.
> 
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: cfd7eed90315dccc79a4ad70724011cc76fdb994

       Arnd
