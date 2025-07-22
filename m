Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C17271454
	for <soc@lists.linux.dev>; Tue, 22 Jul 2025 20:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753217433; cv=none; b=A1vARfDfHSQ30Xu4O+ez0w0GI1YIRb9Y485Y7kQhznBil8CqUU2u//ZnkpZMT3Fx+TDNPnR6nj823A9HoTPuD2F1Z3HOtHb9sPNDoiZKi0ajS4xAYRTZy43AyXb4RB1gs+pyqBQA1Vc6Ii8N1620c0OEEZAaSMUAnUrrOywZkEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753217433; c=relaxed/simple;
	bh=5OQBn/5ySFC5JO2M4HkydpDmweK0cb2HJ/d9qKw2R9Q=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=sCfCXQgvo0sFNg+edmy1URhFtck+RtPtlkl8SgVWGfsaNsuEcho7CJ89niYQCPzGwkiBffOAitr+qbuYQ3hwDkizdNVCoU6wYBNfJqiIi5frnC9g4BLx4ncy2hL0QipkAb7tbiqICLYf8NtRHtE5lJCcaRynQ+2po6T9S+YwFDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YKGKlLVv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YKGKlLVv"
Received: by smtp.kernel.org (Postfix)
	id 1E917C4CEF7; Tue, 22 Jul 2025 20:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F80C4CEEB;
	Tue, 22 Jul 2025 20:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753217433;
	bh=5OQBn/5ySFC5JO2M4HkydpDmweK0cb2HJ/d9qKw2R9Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=YKGKlLVvGFa03fn4dKAuPvPbNbZTU4ubP/5PD+EBDBavTw8walypxVs8N5MDUfr8/
	 +R+BsjMoMff/LvAFPoAKYVYxlhtenHAojW/tsEf1/+epIfNI6E2ONER39TpTDE+VdS
	 zIsqTIAjxDHFv4set0f75NGDxfcPePTew+dVquEdwKoQA/ZXfcHFFMbVsrliMofUkk
	 aCjCu9a8S7MmSf+wZaiMC8uFhQRoi2ms54/cH6KyM7KegE0EcFWvA06othbZEEvBGK
	 wRPhaaSVXafhZolK7xLKjW41r3bKijHNwZtsUlo8/PRxnow/tYGDRhT7X3RqTkhLhC
	 4rXkZwAJSVIEw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AEE7B383BF5D;
	Tue, 22 Jul 2025 20:50:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 DeviceTree updates for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175321745149.949540.681725166958666730.git-patchwork-notify@kernel.org>
Date: Tue, 22 Jul 2025 20:50:51 +0000
References: <20250716031059.76348-1-andersson@kernel.org>
In-Reply-To: <20250716031059.76348-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 15 Jul 2025 22:10:57 -0500 you wrote:
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-for-6.17
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 DeviceTree updates for v6.17
    https://git.kernel.org/soc/soc/c/7723866e8b0a

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


