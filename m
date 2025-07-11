Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D372928EA4B
	for <soc@lists.linux.dev>; Fri, 11 Jul 2025 11:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752234594; cv=none; b=QY8iAjDyK19mP4mnej8qiEx/iz8HYXiYGPt3H8EK8kB/sWA02iLwoHxKlYhGEInOPa9ZUsUEFr/jRizOMCECSX7NIFB3Llgw10RIfDsPqTCoxo1gaY88/biOhkXhojbZr6PyfFoupM2adAA3v2+FoNpUN+mIYxbi5Sh1LDRQYAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752234594; c=relaxed/simple;
	bh=edz8DYAs/x2Vie/NacCFsj/rFLrHUF21WEuLzj8CiYw=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=gssOCXvqlOOvieIs+k5xzoZcSzqyzWDldPcbGxcV1Uexz29SILi/fp1fa7CYwfEKjMYoSd0nwix3UyCUCgCYWl56nx4hkl3w4i/8cDG5UTW/eM+SZZcnDZQe8nfzu0lCPpf0Vs/ez5dIu9Bde1GHQd1WHbsZZc3s8ltW8h4/PXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t30eHtxO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t30eHtxO"
Received: by smtp.kernel.org (Postfix)
	id 8AECFC4CEF0; Fri, 11 Jul 2025 11:49:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7528DC4CEED;
	Fri, 11 Jul 2025 11:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752234594;
	bh=edz8DYAs/x2Vie/NacCFsj/rFLrHUF21WEuLzj8CiYw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=t30eHtxOC+VvJCAVR5ua03qIuqKp6+Ww/RiBmY1iXxLjgmcMO09SJt50HAfn7tfx0
	 vnJlzp0tgsMHZG1f8hY5r5VHe8aIypin6F3Stkagb1SlNQnVKSNCHarGN5NfVHdufL
	 d/f3tGHk03t8zPEPJmD1hLxE1BacYijRBQd+uS5LiUvo3XF8zuEQ2u2eMzUhOGsrMA
	 fjasr1SULXNKOCNt8LRYoBv51fNW7sAdfXjpqUnoBVAFWyZnxyie8VIsY2Qn8XKLhn
	 SK++dPxR3RqaIKfdKDpqPiX2qPakLMK5n94NkO/DHekTUTBcE9jPk4E0u+uytN+GQH
	 e4evMj5eW8OJA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADAF1383B275;
	Fri, 11 Jul 2025 11:50:17 +0000 (UTC)
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
 <175223461649.2239616.5538150078762321860.git-patchwork-notify@kernel.org>
Date: Fri, 11 Jul 2025 11:50:16 +0000
References: 
 <d119a7b44b25a1e55a710adec7fce3e9a9fc898e.camel@codeconstruct.com.au>
In-Reply-To: 
 <d119a7b44b25a1e55a710adec7fce3e9a9fc898e.camel@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
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


