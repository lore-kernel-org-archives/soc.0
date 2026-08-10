Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F33F42C4FD
	for <soc@lists.linux.dev>; Mon, 10 Aug 2026 16:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786380685; cv=none; b=BIWzdmAmY6oJrIGwIB+nhjnEGTQILnf//7NCLf82tpyo9iFhXQQYrPJ31wMSvKf2TyZc2ZFU7MxLXNk2m8kTn5R0c10B6sLadujUyACLsPgirDmlsL9s2NEUbDMtOPcV2Co8b83Oq3glE0zjS05W8SIzSDdA/dWFtV6nkru2IKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786380685; c=relaxed/simple;
	bh=Zhp1sYKIPe89pWualRuJnUVWtuLN80nWrMHzFaCkhME=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ie3UdDfkRzkDIuF+yIJ//Yd/RWFhQ4Ex6ctcA3aRp++3/krxf/+1cTorW4bm7bnLNIOIswW2jpt+INgtNqc5bk4RrnJNV72dovA/TgL95ptY2SfjQZD0Dk4VClpAu0qaD9eQURuNKYK//xhwsnjKIFBV2dtwSmAh5f0MyfM3vxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PzionL1b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PzionL1b"
Received: by smtp.kernel.org (Postfix)
	id B453F1F00A3A; Mon, 10 Aug 2026 16:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E8E41F000E9;
	Mon, 10 Aug 2026 16:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786380682;
	bh=dvBTNcD+W4t+i5dA11x750JczhbtU3f+fNKBAmcguYY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=PzionL1bDsHhm4PVVjqnOGMuK0iVxglU8abzeuZUBmDKBzeLcy8V+/2S6XvVUreJe
	 UQhyri0isJtpIn+1f0KmWPvjIP9QuydPXt3v0jm2y8dX8bMkGHdexe8NAge2Bzcjj8
	 p3fjPca60AF17eR0N5wGueTWw4a8foc6xbwqQOD6Q5BOc2xAXTQ5guFBoauMl7MsYL
	 72dTTdJ1LJqPD3keGFbUX3P+tbo9/DnBXoWkDQb714zhWEllKGg7vwVi5dntYAlxGY
	 R0BGTLACVurYsDL6+F7jrjzy3o2Qb6JAuOd8QCml2vuTjfX9hLQiYDvJjBXHnj+NoE
	 CtyyEgAMLcyUA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9394E39253F2;
	Mon, 10 Aug 2026 16:50:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] ARM Sophgo Devicetrees for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178638063913.3872609.8369367317225821467.git-patchwork-notify@kernel.org>
Date: Mon, 10 Aug 2026 16:50:39 +0000
References: <c68193e7-4917-4941-a461-b70ff9521dc5@linux.dev>
In-Reply-To: <c68193e7-4917-4941-a461-b70ff9521dc5@linux.dev>
To: Chen Wang <chen.wang@linux.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 5 Aug 2026 08:45:20 +0800 you wrote:
> Hey Arnd,
> 
> Please pull this dt changes for ARM/Sophgo.
> 
> Thanks,
> 
> Chen
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] ARM Sophgo Devicetrees for v7.3
    https://git.kernel.org/soc/soc/c/bfe9922bea4a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


