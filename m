Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF31EC433DB
	for <soc@archiver.kernel.org>; Fri, 22 Jan 2021 22:43:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id BF2BF23AAC; Fri, 22 Jan 2021 22:43:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 13FC123AA1;
	Fri, 22 Jan 2021 22:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1611355417;
	bh=aKy7LaMFG+ANnZN2hwJUm432fjidcvV4+l9/BWaHuqU=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oY3cRHhe87GtB5KCDc6FdWuXnwCh+mwcSe0/XQlLNIlgbOks0fGnJBjWo2BMLYcjF
	 MlMy5FKvDTgW9Yz/s+xGFb3ayXKuT2S+oeB7uDdWXXpYt5k6iH5IqmAfB+V2ZSBw+S
	 7M+hXzveZ+2etO4VgmX9PRfCYPQW8sEfU8hHRsDBxn27M3SuZ+Lx3Gf4xzz00xeMkc
	 zJFlYdSDNhoytSeMMtsdQ/k5uBGnW8gWaJuP8xC0/i8q0YR0TTpLyssgHhkRi6mKN4
	 d1W1hu5y8wD+lXmvurQXdKqFADNaICzArpIF2INdgh00aL1sHWcijtztbMZD7EkAgm
	 142JXRWtiujZA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: devicetree@vger.kernel.org,
	soc@kernel.org,
	Daniel Palmer <daniel@0x0f.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	w@1wt.eu,
	olof@lixom.net,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] ARM: mstar: Unify common parts of BreadBee boards into a dtsi
Date: Fri, 22 Jan 2021 23:43:28 +0100
Message-Id: <161135518046.1310202.10096061681770610448.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201224020354.2212037-1-daniel@0x0f.com>
References: <20201224020354.2212037-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 24 Dec 2020 11:03:54 +0900, Daniel Palmer wrote:
> The BreadBee and the BreadBee Crust are the same PCB with a different
> SoC mounted. There are two top level dts to handle this.
> 
> To avoid deduplicating the parts that are more related to the PCB than
> the SoC (i.e. the voltage regs and LEDs) add a common dtsi that can
> be included in both top level dts.

This was missing in my earlier merges, sorry about that.

Now applied to arm/dt for v5.12, thanks!

[1/1] ARM: mstar: Unify common parts of BreadBee boards into a dtsi
      commit: 8367611892442ea788139ea1063308b6e7b6f04f

       Arnd
