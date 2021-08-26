Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02498C432BE
	for <soc@archiver.kernel.org>; Thu, 26 Aug 2021 09:36:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id CBF7E60698; Thu, 26 Aug 2021 09:36:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C30206054F;
	Thu, 26 Aug 2021 09:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1629970585;
	bh=/anp/v4PIufZBo/VHyZlLRvt3ogNCpj8ceJOJz5SN/g=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X7Z6X1dnJ1oL29CSrJ9/njg3UO62XnHiU4yFLwgGqZ3pJwhgPrGB/DVPmvaAMMVsi
	 2ou0g4vyC/rtphCSN+YAUCxc+t05aTZTJCJlNprnBXEJB9jek1vy0KlJPWOMO8A2N/
	 wQjlcYeJWcEYTw4AjPvNxYeeKMldJEnLyN3So0/ENRvmU0kB4g+ppZkDDEP9OE7JyY
	 74gpb+v3RBPX5I3+VEQ8oODTF9uOz0PPt66KoqRLSguqnjmH8/Z5q7nUVcve3OlcHc
	 IIuSQCZLToIm3NIRMXeAuQmFIoogUbg7HGvCWXFOyHFNxLyFQzuV3KcaFDP9Mc8QZK
	 GRQ7F3+7hc6xg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Joel Stanley <joel@jms.id.au>
Cc: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] soc: aspeed-lpc-ctrl: Fix clock cleanup in error path
Date: Thu, 26 Aug 2021 11:36:22 +0200
Message-Id: <162997057882.837869.17149619730485531942.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210825001214.3056193-1-joel@jms.id.au>
References: <20210825001214.3056193-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 25 Aug 2021 09:42:14 +0930, Joel Stanley wrote:
> Move syscon_regmap_lookup_by_compatible() above the
> devm_clk_get() to avoid missing clk_disable_unprepare().

Applied to arm/soc, thanks!

[1/1] soc: aspeed-lpc-ctrl: Fix clock cleanup in error path
      commit: 51e321fed0ff8d64eff809a4ee0547254cdcc4a1

       Arnd
