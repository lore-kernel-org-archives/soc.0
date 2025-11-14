Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9562F39D1
	for <soc@lists.linux.dev>; Fri, 14 Nov 2025 23:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763162640; cv=none; b=GVMVJh3YT5tJw5S5g/WiQzjcHeTULRsDWcDz4k/RI8xa2F3oBmtB7ronBp1Xyg5aAslQWiAm3KZ4RDmIx7ycGXci680bs4KUTwty/F2bgA99EMy/ifue/MlYGj7lsZypT5/16G8lLBNNoCuZoexaZ4hzG6OJQp9Apy3Rq5yBFT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763162640; c=relaxed/simple;
	bh=DbMMKX7Inx1SyyFfxcEM2v54xK0i5z6oQIOle6LzJyM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=aYps1yLfCc8o5Uw9B8g/kVW2dMGTnENGTZvNDurDVIQmCxdKYjRdMyS6HawoegHce6Ly5Z5KcsAWQMkrxMDfcHqanPa2rnDh8uP08ISIRLBw5ZJQzY3qm8J57BFUBEowPPUgqIGswAtGlGc2ME25eTTCMb0wxlTfz4G9osIl4L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pgIRR4Yg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pgIRR4Yg"
Received: by smtp.kernel.org (Postfix)
	id 94A46C4CEF1; Fri, 14 Nov 2025 23:24:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AFACC4CEF5;
	Fri, 14 Nov 2025 23:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763162640;
	bh=DbMMKX7Inx1SyyFfxcEM2v54xK0i5z6oQIOle6LzJyM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pgIRR4YgaI9Bd+TItntuPzGgrn5OBz368LhNI8kHA+NWzumSqbsviuzcF+8f2IR1J
	 HIrEcPYHEwTQzSDYRiEELA3FqGqsTSNaYmynkhhyyx3sQX68kIq+fyv6hSO+lPNaWv
	 N9gkHrwAC05oJC2Xt/OfD7OUfIS8EdRzfTQVSJ0KEEaYRx19Mpr3HdrhjZg4mssui7
	 OrhwSRl6aCe0mvXbwa1WnTpZu3ccundqLNfPU132N57STbyKQlEz5petSB7Ic2/l42
	 YW0P6dFgsqfBuWH9a/uh9lBVCmOWPd3tDaO+S+EeqKWyFvBUWnu3HKekQWG3MYr4LB
	 QJ6w/nPDEc6Ww==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C1B3A78A5F;
	Fri, 14 Nov 2025 23:23:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] aspeed: First batch of fixes for 6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176316260899.1867843.11428253466587353143.git-patchwork-notify@kernel.org>
Date: Fri, 14 Nov 2025 23:23:28 +0000
References: 
 <d79a0c80cdd9e2c45e6a82fd8c78219b6d53f206.camel@codeconstruct.com.au>
In-Reply-To: 
 <d79a0c80cdd9e2c45e6a82fd8c78219b6d53f206.camel@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 31 Oct 2025 09:12:40 +1030 you wrote:
> Hello SoC maintainers,
> 
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] aspeed: First batch of fixes for 6.18
    https://git.kernel.org/soc/soc/c/dc00a9fea282

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


