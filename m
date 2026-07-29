Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F96E3EC834
	for <soc@lists.linux.dev>; Wed, 29 Jul 2026 16:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340849; cv=none; b=Knko9JOM/LeHmVeHpq1w1YPxI+ZL50irU2g92+KiVDYrf8eR6NarlqDjJiZ4Ee01WXX2JIa2UxFCt4khZDXMd6iDCqy9CbFA1Kl1aTqSHq+MH6M9Bbew7WgPPbKHG9J+4gpfYGBSRxpYzAvK0ia+Qd33jGZcX2d1u5WYSW0WoLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340849; c=relaxed/simple;
	bh=jDzYbktftajs2o+G6AwuarDveI4dndCDpSIMEojVsxI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=RSFpsCH0AWCPfIJX03mbG27+/g7QECxg61MtXQh2Wk9JxsrY4+1fpc8Cp4EObWLqgsra0chlS7MNLI5PCHbzY/Q70GZIFZ/Ae2B3VWoKdbko7J7hnCXl3cpd2sbbmO2WdJlpKHR9M3Zp97hd4vt4gBDW2JmwS/hUSOQKTzOOTz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I4UlaH4Z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4UlaH4Z"
Received: by smtp.kernel.org (Postfix)
	id 9BB311F00A3E; Wed, 29 Jul 2026 16:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 851801F000E9;
	Wed, 29 Jul 2026 16:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785340848;
	bh=39DZuBTYkxz/E37cw4XKbH6yuSCPUQpsMJEGD273W18=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=I4UlaH4Z5/K4XwFq+rMltIFFjbxiL0cdD11qdXUCoH8JE40RfYsz1xNY78kNn89QV
	 f+IdW9stvSSGGkcKUO0iuJoCLFwi2Y9T926WYR3K4uL6MZpEaHeJLIVYGH7Ewnh0tc
	 hYA/GhNMbzCSYiIfd5/1fQGzkQ5lcMhX0QktfzA1YKJRKjXZ3hEm7vQdp9y7uW35p9
	 sIg9stURb31QCuXa3TkO7q+HLWHi+Adk+nz+JCdDNslCSHHbE23L3L9fOTluPQX3Yx
	 nwh7j4tYVIkdMQuLt3pKwE8VsqXKge1eIL9zE6TiQiqudcWSWCCqih9tFi6GF9KKsY
	 BRgbAxmUHbunw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ECA9439253CF;
	Wed, 29 Jul 2026 16:00:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V T-HEAD devicetree changes for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178534081274.3143403.4697156662576834176.git-patchwork-notify@kernel.org>
Date: Wed, 29 Jul 2026 16:00:12 +0000
References: <amfoPMED/cB4zinU@x1>
In-Reply-To: <amfoPMED/cB4zinU@x1>
To: Drew Fustini <fustini@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 27 Jul 2026 16:22:36 -0700 you wrote:
> The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:
> 
>   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-dt-for-v7.3
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V T-HEAD devicetree changes for v7.3
    https://git.kernel.org/soc/soc/c/37ce61435453

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


