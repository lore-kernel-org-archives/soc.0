Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B3AEC433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 10:23:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 03A48610E6; Thu,  1 Apr 2021 10:23:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B64F610E5;
	Thu,  1 Apr 2021 10:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1617272632;
	bh=e4TJMuRsiwzOjyKke3jnjHTOGkPTztzbu56nOrJk5lE=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sy8F4lxJQLxSrbye1a8Uy6Mk34J9t0pzx+bAqHOMuh/cV0h2i/3eiUvLEogsGYIme
	 WPcik+taCuLX1bIXMyOBbbmJ4SbrJpdOfP55N0fDc2bSjRorq+ZnT0kXSQSlbnswY/
	 hlFdCoqP4S8sm//dEqEOEu0quvAEt4woJZE8cZBVWnMJ2yHLR8GfqY21EVFyi1fxHT
	 agFs5C+FoVI6HoByiMcUKefR5mOlLXL8parrbw0akuJzMQs9wJoZ1Rs0e2FnizaBNv
	 Evx6I4Kcs/RVIcF82DHjSt85sr/jTB5fH889nuRh9+u2WLiOZshoaoYhq0TW9M/R5W
	 fkTIQiU9XI3BQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	op-tee@lists.trustedfirmware.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: Re: [GIT PULL] OP-TEE tracepoints fix for v5.13
Date: Thu,  1 Apr 2021 12:23:31 +0200
Message-Id: <161727243793.583633.7984995735453542553.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210330082208.GA965793@jade>
References: <20210330082208.GA965793@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 30 Mar 2021 10:22:08 +0200, Jens Wiklander wrote:
> The previous pull request for OP-TEE tracepoints introduced a build
> error when building whithout O=..., apparently many regression builds
> uses that option.
> 
> Please pull this small fix for the build error.
> 
> Thanks,
> Jens
> 
> [...]

You asked for this to be merged for 5.13, but as the change is clearly correct
and required as a build fix, I added it as a fix for 5.12 instead, hope that's
ok.

Merged into arm/fixes, thanks!

merge commit: 3e530f89d72dd1ab31e20d6f8567e357b928705c

       Arnd
