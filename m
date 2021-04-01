Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 017C3C433B4
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 10:23:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A09BA610CC; Thu,  1 Apr 2021 10:23:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0283F610CE;
	Thu,  1 Apr 2021 10:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617272622;
	bh=f6Y4RUOop9NZk/eDJnzPqtBnYdgm48u/Z+XD22C3dVg=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sm7za//qiR4Ptpp7Nt5m+rwxHgkqueK/mWOgCT1UltESvOwtQaETXZiGmdQ3QWsSw
	 y9jWv4us9pxYR3RY4tuGxKA+9UCbs01ctxLM10JNOd/9LRZWq8tR8AoV75nMcWjjQ2
	 x2QwImj5Nwe65ioIbzJRKeOLEZ9M3S5DficGaB2MgP0Xu9B56PeBh0XzWKfVsbsGuQ
	 7yyCFTpAP0FycBBf+Ur3ceq6tI33BW5QbvWJ/BJ209a8If2XBSw5+gPNJPalo6MkOX
	 +4MZYoMjTMtLLLoyY7SS+R2ppcAVgCYnoXJK9PaHN2YeJk22LrvVYMpnV2kDvQqj2Y
	 7IlKrIP/ApM6A==
From: Arnd Bergmann <arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Nick Desaulniers <ndesaulniers@google.com>,
	soc@kernel.org,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	clang-built-linux@googlegroups.com,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH] ARM: mvebu: avoid clang -Wtautological-constant warning
Date: Thu,  1 Apr 2021 12:23:27 +0200
Message-Id: <161727243811.583633.7548512731987590816.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210323131952.2835509-1-arnd@kernel.org>
References: <20210323131952.2835509-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 23 Mar 2021 14:19:42 +0100, Arnd Bergmann wrote:
> Clang warns about the comparison when using a 32-bit phys_addr_t:
> 
> drivers/bus/mvebu-mbus.c:621:17: error: result of comparison of constant 4294967296 with expression of type 'phys_addr_t' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>                 if (reg_start >= 0x100000000ULL)
> 
> Add a cast to shut up the warning.

Applied to arm/fixes.

[1/1] ARM: mvebu: avoid clang -Wtautological-constant warning
      commit: da03f523e83350caf2cf12f1169eca129efc445a

       Arnd
