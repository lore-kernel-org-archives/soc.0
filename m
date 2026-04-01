Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD66315D53
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 22:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775081429; cv=none; b=KWaVWgAtsVhhfBgKK6Pm/SQ0rErxC9igswPNzBLLqrEYgdDtr67wCwvufZUYKXxRs77Ehejq3R512kHHt2WuVjo7hUsbDruxspZWxjRkz8EE2PSkMvwvTOWZyXwv/mOq7GGbQAJSOexSKqjUH8d45r8VbBBWc6k3sWJOb2n72Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775081429; c=relaxed/simple;
	bh=FJ41BD9up95J+dfp2+Dam8PMIi1KbMUL/B8jSSC9X24=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=GTpV/90boSU53dxJWsEzPLr5WPP9yjmBOYAGQiNRExwJ4mJJDbXgv8oYs+NZKjQ2OwIjPuaHCNWUD33S6mdamI1GoaKmutO1+LREKHFEY/TStZSonYVJYrWno28KIib0MaGq/GuKSKkT3Oo1LgG9K0dHznQSh/oqV/cpqkjrwKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f3rFhcmk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3rFhcmk"
Received: by smtp.kernel.org (Postfix)
	id 13735C2BCAF; Wed,  1 Apr 2026 22:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF9ACC116C6;
	Wed,  1 Apr 2026 22:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775081429;
	bh=FJ41BD9up95J+dfp2+Dam8PMIi1KbMUL/B8jSSC9X24=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=f3rFhcmk9ZymJGGxMCrIIBGLXx3qFmMv/F09peGgzkkcHrKp/fRKer1HtoNXZoGbR
	 66RdnF9B7a7QzlJ7F4JO/Yaht/u6+ny4TjC+PrfkSYzlVI9YN82gzNTDdi72+ZjcHE
	 1mqbhazmagM/GaPRnGaRAFbW5d/LGi0OAD5gQlljgW74yKDLsvtgrSkzzYYPJPi76k
	 LuS2v+UAC12ExY4zfA3UTT/Zj9p8tg9Ij/k+c1AkJdjrLgi6ZgHMzFppMChMWc1zRF
	 4cJVzAFDgcqb7I/QqHAdYI27bX01ta9BeQK02PmdwuG8D0StsMhmpwzGel5MiiJBSR
	 b2OVYeS+5uu5g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02CC43808203;
	Wed,  1 Apr 2026 22:10:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STM32 Bus firewall for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177508141153.3882930.1370195348075994079.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 22:10:11 +0000
References: <c1de351b-6272-4903-8231-d92e5190a60c@foss.st.com>
In-Reply-To: <c1de351b-6272-4903-8231-d92e5190a60c@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 26 Mar 2026 10:04:08 +0100 you wrote:
> Hi Arnd,
> 
> Please consider the first round of STM32 firewall bus patch-set. DT part
> for STM32 MPU SoC will come with the STM32 DT pull request.
> 
> Regards
> Alex
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32 Bus firewall for v7.1
    https://git.kernel.org/soc/soc/c/dc26ea325f9c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


