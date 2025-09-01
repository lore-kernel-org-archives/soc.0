Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56471EAC7
	for <soc@lists.linux.dev>; Mon,  1 Sep 2025 10:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756724357; cv=none; b=O5wjSLuHFOjdByWM/KIXkYmpIEZUG93bqWTgnjFUgnieKA7WypW1+AKgwGS+8/aPyHgRmYP29XmJIEcd5U5e+1aLvxo8gTW6PYurzaU4AAxvid9aREcq5+LysToEkr1p+4BNwqgJvIjDxy4ddFs5X/dI7gFDEf59OfDRd8qWwMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756724357; c=relaxed/simple;
	bh=r3QC3XgvZjpVt0lwlWXZ2y5A2JoHWVLlEmEnEUWuj/c=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=CY/ba3vwfbM8SKLr/W0p+CfhmZyI/CfqiAaEfkJwxw+z+KhFvI+dATCKv2woqOX2ncJU3V1d0c597/JyNIqiXEZo5bx/KbeFApzEIZloDM8l8+a4MeR+/hJceFarbWLFbwXchFNPQPN9Kr46bkws5+J/FnVOlNMEyQuudaoCgcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G+jHET0U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G+jHET0U"
Received: by smtp.kernel.org (Postfix)
	id EB278C4CEF4; Mon,  1 Sep 2025 10:59:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1951C4CEF0;
	Mon,  1 Sep 2025 10:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756724355;
	bh=r3QC3XgvZjpVt0lwlWXZ2y5A2JoHWVLlEmEnEUWuj/c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=G+jHET0UBS9Omt6d9JAzOSJFuaSctHyba3jk8oQ7oLjLCjcwgd1fgxUwG60K07lQI
	 Wu2E0DYBggv9IpFOB4qc1jxJ4Tstxn9o9f9jeF+5Vm7xXrvY4/fLxFvWasjk5cdFkX
	 7l0AOqoYnikh41aR6coRK7zQqVcZNa1tJhxccfMMpkhr/jqRkU4hsssMHcdUzUZSxl
	 KK8awfBaJiWLPO8AVcCbwroZQSbrXbKSTceRbdWfIzQox5eEgO2BssGGnfJFRwvEX/
	 8iM9Wx1bZhfF07obK2Og1xngsCuNninxm4TcLYBhWKm+2U+n1AuWJCEr6Jgx15kWEn
	 dJ5PNHzR7iCgA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EACDB383BF4E;
	Mon,  1 Sep 2025 10:59:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] nuvoton arm64: early devicetree changes for 6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175672436148.3681523.4309998904232224187.git-patchwork-notify@kernel.org>
Date: Mon, 01 Sep 2025 10:59:21 +0000
References: 
 <bf3734aab62a5fcc8959261551bb4b1fa636efbd.camel@codeconstruct.com.au>
In-Reply-To: 
 <bf3734aab62a5fcc8959261551bb4b1fa636efbd.camel@codeconstruct.com.au>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 25 Aug 2025 14:05:03 +0930 you wrote:
> Hello SoC maintainers,
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] nuvoton arm64: early devicetree changes for 6.18
    https://git.kernel.org/soc/soc/c/1b8086f1729b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


