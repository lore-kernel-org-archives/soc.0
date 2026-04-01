Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608E7A932
	for <soc@lists.linux.dev>; Wed,  1 Apr 2026 22:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775081433; cv=none; b=YmvtroxAzipBgSKQIj1Ez+HjcB8QiTs6KsyLBm+sTdw8IfmmRXXiTrI2chq7vqBzLlzdkhOiMMrA5gXv/5/mRRQ3nJSt8Yv9ruDRb25t7UCqZ/kC7VHq/Diyf6KUWC7Q50smkpbfyt1ngUDKlmhecXzKbl3JfL0WzpqBJTAqeYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775081433; c=relaxed/simple;
	bh=8hdmeje7iHecprMs54T5VJguwLu1qWb2pZVSRk8DNNg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=tzLw3Jy6X3Lnekq3e/00RSA2sG1g3+YG+vCqxfM6wFg6y99NNKS8it6CcBh/SKUC3fkdaOrU+ZjD8t7slECf40KjYc6JyuG1/XD6Ypa4G5OpcksqNscAcFJZIULxNjPHnKL+aRq2diTk/clCK9TF1BPqntiI++g18vR90J4l6mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HebcVSxO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HebcVSxO"
Received: by smtp.kernel.org (Postfix)
	id 0F224C2BCAF; Wed,  1 Apr 2026 22:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED9F2C116C6;
	Wed,  1 Apr 2026 22:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775081433;
	bh=8hdmeje7iHecprMs54T5VJguwLu1qWb2pZVSRk8DNNg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=HebcVSxOXRD9SpLa22QnRQ+VJmrw72CI954jirrB1wx17eV1cZwkWDmeTpvy3sxKD
	 P/DpNTngH2ItJRPWeQqWeN7Kd5VgcTHnxrmBYEm5Wuszj5V2TDMQ9XkkyQr/zBKo7j
	 sBlmrBrtF8iKOg1RV3Bc/WL62O8ubNkMtxY5ZSCDqpLrTkLv/4T5CQcdPgQ5dXm4Ox
	 +5/cdmmvkNSwoKoCbwlEai+sOnJ8cckR1JkxC4F7U5c0pMdK7xkdXR8QSMwcLTZtDR
	 X3Y/bY8g4+pfEYRU4pd9z2aR6cJPKkOwlMkcXRiwei92ZRVUYex0AP+wwKujhdWcvn
	 QjlqG+0PkDWRA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 02E033808203;
	Wed,  1 Apr 2026 22:10:17 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v7.1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <177508141553.3882930.11128986700249638027.git-patchwork-notify@kernel.org>
Date: Wed, 01 Apr 2026 22:10:15 +0000
References: <20260325160104.4115956-1-sudeep.holla@kernel.org>
In-Reply-To: <20260325160104.4115956-1-sudeep.holla@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 25 Mar 2026 16:00:59 +0000 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> Regards,
> Sudeep
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Updates for v7.1
    https://git.kernel.org/soc/soc/c/720d813b5371

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


