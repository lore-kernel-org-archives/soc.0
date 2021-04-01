Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBCA8C433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 10:23:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A4126606A5; Thu,  1 Apr 2021 10:23:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CF8116105A;
	Thu,  1 Apr 2021 10:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617272619;
	bh=hg5Z+hZF/ZQdItbgNVCF4+4CNZ+OSHAe2KAz3y+XC+M=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=SsBBm0EMUhl9/OGwE2f+DhWY9sBp5EJbcZlQdkeuIwcnPC92B6yZdGXq1ca3o+4Xj
	 Dxskq/LY5xhI7ZtjO4e3Yp29PT8afnzHm8lKlAL8ETg9HvywtNoIK94Idle4efJ51p
	 IsPgryiA4F6QfPBStqpOFOzg4TBYJn7Yf/cYVscMk7a4KtHqVwFNHQ07hhhMbDGkmX
	 j6CCyRIH45PSuUDqDU3CS4ZuRkmK2IfnYVbNaDL7HMrAor5UKoLg8R6XzwsgBfdF3x
	 96yODsR1TOCcHtNI55mD5BfibeDQaMF1huT9K4MfWpzzrOQc7U3hXvHcqBubRg1J2V
	 FHkUbV3b6xsrg==
From: Arnd Bergmann <arnd@kernel.org>
To: Santosh Shilimkar <ssantosh@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jim Quinlan <james.quinlan@broadcom.com>,
	Maxime Ripard <maxime@cerno.tech>,
	soc@kernel.org,
	Robin Murphy <robin.murphy@arm.com>,
	clang-built-linux@googlegroups.com,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH] ARM: keystone: fix integer overflow warning
Date: Thu,  1 Apr 2021 12:23:26 +0200
Message-Id: <161727243810.583633.10194693313914787410.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210323131814.2751750-1-arnd@kernel.org>
References: <20210323131814.2751750-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 23 Mar 2021 14:18:05 +0100, Arnd Bergmann wrote:
> clang warns about an impossible condition when building with 32-bit
> phys_addr_t:
> 
> arch/arm/mach-keystone/keystone.c:79:16: error: result of comparison of constant 51539607551 with expression of type 'phys_addr_t' (aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of-range-compare]
>             mem_end   > KEYSTONE_HIGH_PHYS_END) {
>             ~~~~~~~   ^ ~~~~~~~~~~~~~~~~~~~~~~
> arch/arm/mach-keystone/keystone.c:78:16: error: result of comparison of constant 34359738368 with expression of type 'phys_addr_t' (aka 'unsigned int') is always true [-Werror,-Wtautological-constant-out-of-range-compare]
>         if (mem_start < KEYSTONE_HIGH_PHYS_START ||
>             ~~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied to arm/fixes

[1/1] ARM: keystone: fix integer overflow warning
      commit: 04e18e1cc319f453a6d752d4553bb3f29fde5f76

       Arnd
