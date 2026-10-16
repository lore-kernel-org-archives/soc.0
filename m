Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAF554CF6D
	for <soc@lists.linux.dev>; Fri, 16 Oct 2026 17:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792170612; cv=none; b=Hq6e+LK1H2fTf8QYGiyt02FCiUzRkvUMHyl1b1U1ThYJyI0Q3Qe9voQ8Gv4FR6kw8ZPOHuMYAVdjo9WNLmqX/cqH8HZbSVkoX+RN3Rmshk0usvyUemvlQCBEj9hb57pBsdBRJMwp/9fyS97mT+xv8i8doUsQIhHyXDbfIRR8YwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792170612; c=relaxed/simple;
	bh=gDhbvg/4BbBpbV3SwTE3GgazC1ln+nxIKkNGuLhZzDY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=YbYdBeyk4fGkMcuXeDPaRjiJBz+Ca7HHfA3RFeKmtwm8c8ZZZp1mAvxIc+E2yJC4YiQXnLU81XlNzxyOCWwrVec+/cYZJ3tNR0zEcg+k1U5xZ3dVio+BqI30dFiRNTrMhhwoFyGA7Hu6NK129x5wuQS52qVxaQ3sBBcwX5p2/38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z7QGGsNF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z7QGGsNF"
Received: by smtp.kernel.org (Postfix)
	id 1EB7A1F000C5; Fri, 16 Oct 2026 17:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0913E1F000C4;
	Fri, 16 Oct 2026 17:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792170611;
	bh=NAUkl0rFfhAjVrnMdEZmIATEITWCIzCX+rUInLSb1Cs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=Z7QGGsNFuRY5Rlw3Dsoz8WoPo6YhbtLS2Tp3ij7ePhGiAFYp0GfYtnWptEilcb0aZ
	 zFbOhKbb93e9q5M8EV1P+Q1EFKSXk8UBNzLM8dpNpZFNTPVZxZpIt0JG/SFk7d8/Vv
	 TAHRjdn97FB6e141+Gl9MEgCHSwu6zi6pfG1bUKSK+EDtwQNb+IyqA05iVw6Q8OvRM
	 hgToZvuybfiFar65ATPZ0jb7Q6vmgH+G2cG6yM30GWjlmTTZuKH884GqBNASZYWRoW
	 hiBkLgEFR8mh2fPQI7Ii8GyUcl5I/66mhe4+euaJQtu+smY+KuAseuXKevJGpvji0d
	 CRqSd3gFGdgqg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F1566380AA52;
	Fri, 16 Oct 2026 17:10:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/5] soc: ti: Driver updates for v7.4
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179217060979.880342.838849316593512325.git-patchwork-notify@kernel.org>
Date: Fri, 16 Oct 2026 17:10:09 +0000
References: <20261005124915.e632elbacgr6nxgs@anyway>
In-Reply-To: <20261005124915.e632elbacgr6nxgs@anyway>
To: Nishanth Menon <nm@ti.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 5 Oct 2026 07:49:15 -0500 you wrote:
> Hi,
> 
> Please pull
> 
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/5] soc: ti: Driver updates for v7.4
    (no matching commit)
  - [GIT,PULL,2/5] arm64: defconfig: TI K3 config updates for v7.4
    (no matching commit)
  - [GIT,PULL,3/5] arm64: dts: ti: K3 updates for v7.4
    (no matching commit)
  - [GIT,PULL,4/5] MAINTAINERS: TI K3 updates for v7.4
    https://git.kernel.org/soc/soc/c/cfe69169c03e
  - [GIT,PULL,5/5] ARM: dts: ti: keystone: Updates for v7.4
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


