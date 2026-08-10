Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79B93AA4EF
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 09:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786352461; cv=none; b=BYBAT1kvaNVSo/bkwwgDuOkuDgSgKYjXzQFwK3fMB4QwCaMine28slIEnTQUQHJymLcte0SLiyCyDY24ePUOZgQ3dx05rHF4ytfsNHsugFuYPdosRidl71Duay4hrb8qL3bubXOdKp3ksyVUktil2K5ZhvR7sQOBXBatuxPlL+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786352461; c=relaxed/simple;
	bh=ZWerEbJ5Aoz52VeDT7SvC0JD7T8zlNl4k60iHZz9Rug=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=kjuKjiFg8JAcT8BFenrZ5L95XYdVAg/s0uXEVPPKeCFtjiRxIKyf4Q4nxH9MMfYJn1XnJJ7m8ISSrGQOOK+fzl83Y521wLF4yqAG/nSGAuLeJfvn3UPiz45Z73Nw2VxoxIcWpz0K8LKbiCJ7/tJTVJ7ZwF9dUrgaT5sx6MREFWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cKkc+st/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cKkc+st/"
Received: by smtp.kernel.org (Postfix)
	id 6394D1F00A3D; Mon, 10 Aug 2026 09:01:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C2DA1F000E9;
	Mon, 10 Aug 2026 09:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786352460;
	bh=OXd9vCooh/LDoSu61Ih5CkKD0dYNKln7U96P7o9cCxY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=cKkc+st/bwpocOOUW01nHPLOKdCfQz97f7j5psgvFEgHE79kCfUiFQ3RefDs7z+a/
	 oDih4UT7M2HH4jatfK7MJkvvT2EmlLi6OE+fLtFvgJWsqPZQUN+SGeTUC5DiGIhRBO
	 g8piYRjaM6hQIys3atJrocR+VjNMrIlfXw6sF2SItwmwOedJMzpnm7JoJmN7Aw+S5O
	 jZ4bbGb6zvJZIFbvvCWZP8MfZRbfOU/+d8eimuh9ut83ec+WPZXYRz4htJjxZ7Eqrb
	 M8TGlRRHlH66t9QXn0NeAkax3i0AtFydrxSNY/RUyNbxBZ97rVUBTqh/QHnjTC4TzX
	 8Sft5sp5WuIIQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568B93924FC2;
	Mon, 10 Aug 2026 09:00:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE fix for v7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178635241699.3658557.9531759173253469435.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2026 09:00:16 +0000
References: <20260806131232.GA673420@rayden>
In-Reply-To: <20260806131232.GA673420@rayden>
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 6 Aug 2026 15:12:32 +0200 you wrote:
> Hello soc maintainers,
> 
> Please pull this small OP-TEE fix for the OP-TEE drivers.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE fix for v7.2
    https://git.kernel.org/soc/soc/c/42cf613e04c3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


