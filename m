Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB08E3271FD
	for <soc@lists.linux.dev>; Mon, 15 Jun 2026 17:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781544612; cv=none; b=NQyepQA6UN2njxLffo02IRdBdur1XKk/z5ii80DiX+cpKX2y4prm7max/DdIH1UPES2iYaEnGnLiJnYaS1XdwsJRvrH5yMZFpn8WPTpPzvvobHakouC8zwFX1h6Zkue7jpF6Sv/G9PEwmrpCFWzgGYei2qWDw4lWWhaCcQZC9Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781544612; c=relaxed/simple;
	bh=jlBKc5Oj0LHGrGdKoA4FL5EJFCFudAp0+8zE6a0G8/Y=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=gVw/j2RXhKVuFepbXDfXsm93xziH2kq/wWFHcEV7k//y/NQm500O2QzN/PBbQ47iPLZx7Y2flJFWzgldgNAr9iaC9dAUgHvK+dPMLHtDubiUnJTckuTTXgNSQQOWvpQds5ANXtul6RsYkVJD7AXA3qjmC6vM1mdcvo05nQl4B1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=feGmMIJl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="feGmMIJl"
Received: by smtp.kernel.org (Postfix)
	id 8CC791F00A3A; Mon, 15 Jun 2026 17:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 762021F000E9;
	Mon, 15 Jun 2026 17:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781544611;
	bh=0Xgb8mqbgccgPdyRMRj8q97RYVL1tkO6D/FeFMMi/8k=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=feGmMIJlv3QztJDOXfueJs3pNIZJrhTjmtTVDd4tfKJ2pKYTD8DgX1CIAh0a4Fo0C
	 gJVO8xh4+e1mpVoYRoUGWTBgUPd/gtd27hwKfdTLEttO/rrB1/u0ZWYYEyt9d5Oa7J
	 mhXSbSCXwNFKQQjpJMaCMJdaeMx8ZziEpyjNsBB7cCDtKVHba0Yp/96I3AoDCizweP
	 1l46OJoyu4Wcg1wFtKSRsmFmzJdn++o4AACDT/qMi+/BRhQmvD0gHjMRd/2wDQooPt
	 LtCjjU5VxCDvx06fpbGKOjMyuEl6e+x4v+a37p6LjIqeKRwcBwLsMZPe7csykQWswD
	 Mh6wL1vE7hmsA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A313824F27;
	Mon, 15 Jun 2026 17:30:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] arm64: dts: aspeed: Fix duplicate pinctrl labels and
 address scheme
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178154460638.216722.4407855827499249700.git-patchwork-notify@kernel.org>
Date: Mon, 15 Jun 2026 17:30:06 +0000
References: <20260612-aspeed-arm64-dt-v1-1-d1d1a4737905@codeconstruct.com.au>
In-Reply-To: <20260612-aspeed-arm64-dt-v1-1-d1d1a4737905@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 12 Jun 2026 18:03:27 +0930 you wrote:
> From: Ryan Chen <ryan_chen@aspeedtech.com>
> 
> A report from shashiko-bot highlighted some concerns concurrent to
> application of the series[1].
> 
> Fix duplicate pinctrl_tach{0-15} and pinctrl_n{cts,dcd,dsr,ri}5 labels
> in aspeed-g7-soc1-pinctrl.dtsi. These didn't cause errors from dtc
> because dtc accepts duplicate labels for duplicate nodes specified
> through a node reference[2].
> 
> [...]

Here is the summary with links:
  - arm64: dts: aspeed: Fix duplicate pinctrl labels and address scheme
    https://git.kernel.org/soc/soc/c/9e84fd546dc3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


