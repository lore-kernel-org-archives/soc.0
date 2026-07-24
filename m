Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1146444707
	for <soc@lists.linux.dev>; Fri, 24 Jul 2026 16:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911254; cv=none; b=YXtuH2xuCZ+TduF46US3V0LN+JgnKW/Db+TJagAHEmET8YuSWzozgg9Y8yxLHVpdwq9na59M7JFBOW+joVSH/XcjnxL72zuyox7ydGGBLdPourdKa4BtzCRHZL47uph9fH6IfOd/i0ci2v3V7gAonv/SzDAXRSSfyfNpy6BEQ1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911254; c=relaxed/simple;
	bh=Cxd5Rx3Zr1oBJZ185DEi/WCsbzzQEJcYCMkI+LSswds=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=MydtqJjeld2iMU7Udo3z/vReN32fL8vDHnUDM2Trg0EgRJgZdh9x14Fcmi6SNQv6qTwecuOIPy0haysqmK3XZKRykL008GthiltyoL0A6LosYWApEsIPY2cWgpL/1hWXIau6H40TPPMjV0KXNXlBjEHzLSYHe2TzkHbhOFOSvpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AgxbM9U5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AgxbM9U5"
Received: by smtp.kernel.org (Postfix)
	id 62C5F1F00A3A; Fri, 24 Jul 2026 16:40:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C3C01F000E9;
	Fri, 24 Jul 2026 16:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784911252;
	bh=V0JgzaE3A5S+Lnw+7GU/vqkxaGipJWvYWKQQ03z3eO8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=AgxbM9U5mXXbxYzpSGSuRKJzIibYLM6wPEQWk2N2+kz/zANSYgqhXpmQxY3ecbe1E
	 UXtTkVfsplHMA2/FOYW2AnjgdxxbExqRnS15Zg3Eg4LmvwmnfOYhHoOBqj0rPEa2yU
	 NFTAZKlbIOtwWwNi8rKGgB+jwzxS+5VQvKLjJZHAHCzLhwzqjfCKAY2wv8iWUNTdrp
	 r0uLI0vJerkHTzMEBYcRZqD9lClY1urKDxLTnCPHIrF+j0kZOtrdCnnpe4NjFDgAZY
	 n7cRao7x0CRGh9bJEQ7uUoPWAQ9m49ksD/ZNXEEPt8qjBWApCfAILj9xp0bX8vXDhg
	 jBv7aDjSgA51A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0A6739263A5;
	Fri, 24 Jul 2026 16:40:20 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: arm_scmi: Updates for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178491121934.3229915.11379687088256631195.git-patchwork-notify@kernel.org>
Date: Fri, 24 Jul 2026 16:40:19 +0000
References: <20260724134651.2930500-1-sudeep.holla@kernel.org>
In-Reply-To: <20260724134651.2930500-1-sudeep.holla@kernel.org>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 24 Jul 2026 14:46:48 +0100 you wrote:
> Hi ARM SoC Team,
> 
> Please pull !
> 
> I am keeping these as updates for v7.3 rather than fixes for v7.2,
> allowing them to remain in -next for additional reviewi/testing time.
> Aside from Sashiko’s review, there has been limited feedback on these
> fixes, which address issues identified by Sashiko.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: arm_scmi: Updates for v7.3
    https://git.kernel.org/soc/soc/c/7c4856193d6c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


