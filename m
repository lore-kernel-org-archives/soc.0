Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96026189
	for <soc@lists.linux.dev>; Wed, 24 Sep 2025 22:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758751813; cv=none; b=dz16u42xeD2JDoBPJl+XC0mFmhXDmsFR/xE4a1U2i82zuHWKJ7OKl1oJklrdUBv4yL7lDWzo2B14juAcclE3jFnfEuukulsZQYWD2vsUCRc34TQ33W0c88BCGUadJJuGeVpjnMdDg4d9WA56wQiXSjW6vCPLNbVLVHoCBUf9g+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758751813; c=relaxed/simple;
	bh=JfDpVwrfsbVG3+Z618ph5ZjhqOASG3VVbJ5VqHKFTio=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=fpgrNFiv6vgq4DoJKa6N8BqjDrM/1ZWIuCNh48z+l9t+VuQBUZJOMTnzkCvMH8zdfkS2FP0MhiIi11Y9Y5Kd59V2u5MsQuWCydYF1oldGjE9V+RxQkVCaWQtDPcN3NRcSllrxq7ok316dCr4ZFkeSJQ1+1GgGzUtknIypyjKMUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ofg4A1+l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ofg4A1+l"
Received: by smtp.kernel.org (Postfix)
	id 88F55C4CEF8; Wed, 24 Sep 2025 22:10:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 732FDC4CEE7;
	Wed, 24 Sep 2025 22:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758751813;
	bh=JfDpVwrfsbVG3+Z618ph5ZjhqOASG3VVbJ5VqHKFTio=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Ofg4A1+l0wZ/pZp/jfojegCzJZjotE6iEQ5faQGbCBl1iLcqLn9roKGND8ZoKesJj
	 BC7z6Lsy5A8oH6Um2yKDBIb6MuibU3zPskQ82sIr10+wZGo52RB8a+tshtuMiu1THT
	 01d6/Lm/N+tcttPPpNmU31PDp94FZt0HikUhdZtGlYck0ITl5Qh0eZnl9iuXj+yCGQ
	 Bz2/fzFUt33sQpdlzLfW+gAjdfFsCzxBDLr02NplnbqmwVKa1YMfMQpXdEc5kEKrkK
	 AkWxog0FthmKlbM5hYaJ9bOsgHgnTkvbrf88m5eqKHsPHka7RxsfusioThyPmKm4NO
	 AFjeJpnwohq/g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 1BC9539D0C20;
	Wed, 24 Sep 2025 22:10:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Misc Devicetrees for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175875180973.2716298.1255383295809501391.git-patchwork-notify@kernel.org>
Date: Wed, 24 Sep 2025 22:10:09 +0000
References: <20250924-frighten-magazine-ee2f16e64638@spud>
In-Reply-To: <20250924-frighten-magazine-ee2f16e64638@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 24 Sep 2025 18:38:16 +0100 you wrote:
> Hey Arnd,
> 
> Wee bit late (meant to do this last week and forgot, sorry) but here's my
> dt content for v6.18.
> 
> Thanks,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Misc Devicetrees for v6.18
    https://git.kernel.org/soc/soc/c/8c0650e0cef2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


