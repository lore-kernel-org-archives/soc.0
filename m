Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83766386C39
	for <soc@lists.linux.dev>; Tue,  9 Jun 2026 07:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780989609; cv=none; b=KduD0AqUcPjcNEQ5qG8LC/3AMIo/hRGebyRdG5CUg5lTYOTg7se/O1V7BWj3DfcgQqMw1kzuakL6CVPsPJlfvJX2z++Et/s6Rl0/N13MSlo/gwtACZaX1iSeCdvoJ0NtmJc+jqZTXeXG3mNHwlYRNziJTj7FCPC0ym1AfqIlxpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780989609; c=relaxed/simple;
	bh=2/ckDtcn60jpKmIijhF/TxO3TwPu2EaSbqVH+cykX9U=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=r24N9Np+DC+M144SoouoX/8lh91ZZLiZ/wS2BPG2GBugoDNJNY0GjqC5g26EQgyMq5mzhpOPXwLm1cuVh2quId19TWlCbWX72KCWUp9QMqlybDHyDw8OhQvw/lrIYNsIvSeh8QCOwL4Rgo07fkaTuGEk/Uu4XZZIx0CN+0P8K6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a982PE7c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a982PE7c"
Received: by smtp.kernel.org (Postfix)
	id 2AD911F00898; Tue,  9 Jun 2026 07:20:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B4D1F00893;
	Tue,  9 Jun 2026 07:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780989608;
	bh=Jg5zMwvYRZq806Rrx712XZaOImJ5K3OFRfZG2azdw5o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=a982PE7cT6+mihSP9P1uECXeD9riJGgPPRCo0VUgrF4JCudkByvAYqzkElTHSIVF2
	 VkEHN7oUhhhIDMrUItQxwVNjoGRK2ObvwqkCBwmwr+ZF09iwK+44tLlYUTXxvKB6Cd
	 r13alMLi0v5TUErUwV/JiALAWYREue6vYmTUU27qmecudOvrPHNjtXylQwTZksf2+K
	 ghsFlKnSyQN112sOI9RvEHLFRQ2ou4wTFAOODOS6yFs/pelNQzw1Mgpw3ebYjEn+aw
	 20vMm1LttQtaFKOWmDbtImNOSZ+KAOQq66+1fJOb29VZb8nEWLmyt7UQpHb9MbTbbA
	 UrMNNkID17UpA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D09153822E08;
	Tue,  9 Jun 2026 07:20:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V soc fixes for v7.1-rc7
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178098960638.1848550.11577127919303355313.git-patchwork-notify@kernel.org>
Date: Tue, 09 Jun 2026 07:20:06 +0000
References: <20260602-brought-impaired-e5cc81043a9e@spud>
In-Reply-To: <20260602-brought-impaired-e5cc81043a9e@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 2 Jun 2026 10:14:20 +0100 you wrote:
> Hey folks,
> 
> Please pull a single minor fix.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V soc fixes for v7.1-rc7
    https://git.kernel.org/soc/soc/c/2736a790528d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


