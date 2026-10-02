Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C7A3C2B9B
	for <soc@lists.linux.dev>; Fri,  2 Oct 2026 21:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790977820; cv=none; b=dLU20pUMvJfrDDQlSwPp1ouHPAnGihxFyburt+jayXJjG2IeVeo6DDZvMsW/sK/qeCG2Zu8AnMD7WScU8n4pD5IxsJ9LyKLGtC6pzq4Ig/nf1lYCF2JqUl0SaCvY5CmUwbcwCDsSgtfjAGi1q6+Oo6PJpAfJbRcr+EdYaxxpEuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790977820; c=relaxed/simple;
	bh=xVV51xCwaudrKkUFZ/TBL3fE67tEz16R1cCKgmEFlik=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=FJheud+TOMDU4kTJmxp8Sbz+1GOAO/UVQjU2/yt3yBD3/d8v0VeiIXNI13dHMTyNrErS/9YoNoxn0FcxeQndcxUVplS5svzM/o14KJIBYi86uvKWmN9vinD0/NEoCfTdaFCHfS3mckVAUAZymXRIgnCKIhmv6axwt5bNM5mrt1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HKieRFBp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HKieRFBp"
Received: by smtp.kernel.org (Postfix)
	id 97C121F0089A; Fri,  2 Oct 2026 21:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 809A91F00898;
	Fri,  2 Oct 2026 21:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790977819;
	bh=8qVkA0LLmrgGFscH3yGiX7dr+dG0vMXz7wsEy59As7g=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=HKieRFBpX4VpBoWidsx6vWtbEgrCvKESBhss/22qZgL/x86VzDFjQhAiaSvhkmu+3
	 60ch7isJwQ9py6h+4jYbInAfxfkeyHuWhxHGVQ4T4Y8SUWaEzx8NgMmFMxRHrak8S/
	 9NYBMAUoTxxLY4kGgIJEs7yb8aWnxRSqBR0O8XwVvufUoi4XPDszXyZ+fk4vD6znfZ
	 hqwy9+B3cUQDVI8mLiQ1XLjvia8WZW1yxc9EhL6u1fBkFoflWoex0u92q5y9LmSFXE
	 Au1ggWfBv8SUQfpTUSZiVKocbl9qJ2SjQ6aL1lgJkgZTL6w94k8ib0UL2sxtWL90Vj
	 yyQUr9+9pr60g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 772BA3811A72;
	Fri,  2 Oct 2026 21:50:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL v2] iMX fixes for 7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179097781802.3602058.1055752314915977601.git-patchwork-notify@kernel.org>
Date: Fri, 02 Oct 2026 21:50:18 +0000
References: <20260922145600.2249087-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20260922145600.2249087-1-Frank.Li@oss.nxp.com>
To: Frank Li <Frank.Li@oss.nxp.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 22 Sep 2026 10:55:59 -0400 you wrote:
> From: Frank.Li@nxp.com
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,v2] iMX fixes for 7.3
    https://git.kernel.org/soc/soc/c/8166a325157a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


