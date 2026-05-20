Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC18239BFE6
	for <soc@lists.linux.dev>; Wed, 20 May 2026 10:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779273061; cv=none; b=D0Gb4uSdKKYqSzwjIjyyxm4EWy6nRjA6yqFlb3p6ny5mBzBg7QCVR4wKKVIYu7qZorTDp/0tC4hlDkgNwKcPkvAOH8tTrYQFu7qPWQvucPIMZGLxlsCj/X3c+yo3xcmLKeMlC3T7pfECsjvbwgbTI5G37wCmwpJykrmFIyCVBas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779273061; c=relaxed/simple;
	bh=wUXhbIEdB5/Lep5/0CBvrcRL+kOiaq/TPxQLH6R+46E=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Hc9rpE4m2ElIUrPuQQufjctNg9Ud7IKQCKSQbXqbco4rD1wCnkjrcN6HI4eOynYiwOTl7cn4U4jWlRVPIv7Sm3+iAE8oi1aadzBphrCm+9en5yrIbAPkGMgx+v0Nt7uTC1Oa02wpsYX6tn15A5eDwo7y36S7Qrzzyuc51Cf8Umw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rn7WEjS/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rn7WEjS/"
Received: by smtp.kernel.org (Postfix)
	id 944581F00893; Wed, 20 May 2026 10:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D7A01F000E9;
	Wed, 20 May 2026 10:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779273057;
	bh=/RvAf9cnohbvbSNGhZJ3GpkNZGM2EZl9CY1UEwB7kk0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Rn7WEjS/PkcS+d5wF91YejAk+nok6wNj79k6lPpdfVil1fR2SIP8GSx+uFVbe1P/+
	 3oIlUz/R/pUbv+gzamyDIh4YlZ748pBJExth6Km1oqtKsS+LC8Jl4gpSuBSJihhKS4
	 ZE8/LzO+LW4+B0tbkQRnjJyuP4JRQtd8X/vkqTegWV68iGFdBqeZ2jYNMAZy3nwLIK
	 7/VVahmzWSaWwp8nXE4O7MX8zhP4BfvuC7k94s1UqfUeLpVJ3hWtpPuwFGpv7LPupu
	 MIVLcCCf8jfatEuGMBgtY00G2K6jT19zU9BbiC9Vp9RZGyEyntI5h8+ByGqg0TF1il
	 FgfbLG7IK0h+w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 568EB3930A0E;
	Wed, 20 May 2026 10:31:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] PXA1908 DT changes for 7.2
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177927306789.3101306.5274138490841256314.git-patchwork-notify@kernel.org>
Date: Wed, 20 May 2026 10:31:07 +0000
References: <KimLSS9zQ2O_qT5luvFs7Q@gmail.com>
In-Reply-To: <KimLSS9zQ2O_qT5luvFs7Q@gmail.com>
To: =?utf-8?q?Duje_Mihanovi=C4=87_=3Cdujemihanovic32=40gmail=2Ecom=3E?=@aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 09 May 2026 13:04:46 +0200 you wrote:
> Hi SoC maintainers,
> 
> Here's a small set of DT changes for PXA1908.
> 
> I must note that I've changed the repository and my PGP key since the last
> pull request.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] PXA1908 DT changes for 7.2
    https://git.kernel.org/soc/soc/c/6cf3cf025848

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


