Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A92283141
	for <soc@lists.linux.dev>; Fri, 11 Jul 2025 11:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752234586; cv=none; b=PVfV8WDwwgPLuXHMoDQ0v97rDA1i63fSRJPJHJZgAIzsikqcxRFYsAN8+Hu2W4C32+lEzq5FvMZGUjUM2WSY/GY8D4/3s58Y39nWIBx3yUPqkmA13XWu2tcqgpvMPguwunQ5rCTvaf+YxQ6CFWFtAwPC5v3qjtFai/C+dbBghGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752234586; c=relaxed/simple;
	bh=HyCJlyN8z7wjfWC12LNJMo05vvJGcTGjcTMWp5rRxo8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Dl0XfRe85qLZziNJu28GGybau4j0R3ALGdPYDlguxB4MSxwm+1AG+yJBSjdU1OfntjFPIi1qE0TnR5D0pbDJY5cQhybgYT41Sae/6C51bmGUMOVskVAT9gAlo28vWW8MQcH+A1dNwUxB7E4LWTovBT5aDBi2xODG6p4iVQyChk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pn6Bk0Ie; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pn6Bk0Ie"
Received: by smtp.kernel.org (Postfix)
	id 18860C4CEF5; Fri, 11 Jul 2025 11:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2702C4CEED;
	Fri, 11 Jul 2025 11:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752234586;
	bh=HyCJlyN8z7wjfWC12LNJMo05vvJGcTGjcTMWp5rRxo8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Pn6Bk0IefVcXrs6YdoV3LrlV28FwmVWXmxaNkSTDKmRtcysn9O8Okq88eSHr3d//X
	 GO/gGw7LQjTbSAR3T26mkCSdXdRkbOsLdKl39j+Og9qlMnQlN4tDNYI0j4tZdaWitV
	 tuKiKt4kiDAfWuuxSz0V76PnSeWedFriUwIyaF2kBYQkA/hf1pqlDS0Sut4LC7lCRv
	 ZN1wyal66M48Em8Cb+KXPFr7FO2TyMot9ypCFB8m0HqlxZ5XLq0Ea4QB7xqCfyfbEM
	 zdhrktzL+BrbrqXVbXdWXdoTKGa56lBVYthaG0M5WaUVF/UniC2O3mstnlb6/pDlyh
	 73z8fSpUioOow==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3424E383B275;
	Fri, 11 Jul 2025 11:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] aspeed: drivers: changes for 6.16-rc6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175223460786.2239616.10482257345914230253.git-patchwork-notify@kernel.org>
Date: Fri, 11 Jul 2025 11:50:07 +0000
References: 
 <d119a7b44b25a1e55a710adec7fce3e9a9fc898e.camel@codeconstruct.com.au>
In-Reply-To: 
 <d119a7b44b25a1e55a710adec7fce3e9a9fc898e.camel@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 10 Jul 2025 11:54:13 +0930 you wrote:
> Hello SoC maintainers,
> 
> Here are two fixes to the ASPEED LPC snoop driver for the 6.16 release
> cycle.
> 
> Cheers,
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] aspeed: drivers: changes for 6.16-rc6
    https://git.kernel.org/soc/soc/c/07d45e80960a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


