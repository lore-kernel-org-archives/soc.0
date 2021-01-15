Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44586C433E0
	for <soc@archiver.kernel.org>; Fri, 15 Jan 2021 17:24:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 2CD7C2343B; Fri, 15 Jan 2021 17:24:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CCA3D23382;
	Fri, 15 Jan 2021 17:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1610731485;
	bh=n2hBOFeDu37LHCmefgAJ85SO0w5t39jbH+HguNvqYYw=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JRIPnRBMOqJKCTQRhCz1KFVq5M0AIRVT12v2LHuUuV2pTkm49nHvwzRqrsVSdu1KH
	 bLJgSRtJa5SOPW3y2IOnpodJMl0o2qilZFKRtr1XPPKystbhqlE/oLwDn/tBvv+LgY
	 u6wXrCikv+USHWr2w2SE89zZsmwCSO6MlQo18N+p61dLY/E4anUkoc/ahGLURFvUIb
	 2ahnudtJ0cp9fUE88rDo+r/FNGsqbLtJYlXb4HmXuL4jnvPtalROPlHjT2IC0YuLch
	 VTz93M9Jzi6Rpq4HU8G7gPVRt6aLRWaZjj2ZT8j0kmLPdHOHWxObNFgt1XelhIneMa
	 2/vBTGaiN0YMA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Daniel Palmer <daniel@0x0f.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: vendor-prefixes: Fix misordering introduced by honestar prefix
Date: Fri, 15 Jan 2021 18:24:36 +0100
Message-Id: <161073140457.707311.6221640071925135025.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201212012253.373074-1-daniel@0x0f.com>
References: <20201212012253.373074-1-daniel@0x0f.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 12 Dec 2020 10:22:53 +0900, Daniel Palmer wrote:
> The prefix for honestar should come before honeywell.

Applied to arm/dt, thanks!

[1/1] dt-bindings: vendor-prefixes: Fix misordering introduced by honestar prefix
      commit: f791f1a498fbef783e7711db9f597de7d85b661a

       Arnd
