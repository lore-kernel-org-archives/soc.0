Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D9E272E6E
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763756552; cv=none; b=ZCtfa0gBUVSJWCT5NdtamxOLXharSK6tUNSlLvHi8MLMrBorkRmLkhtUb2i0tQVun3NPP8c9q35JqCmBF8f9hm0G0ZEec/kAbMK6PvlecBSjCAOTdIZtQXwvkhMUt2BBm4mbqCWvbFKu4kyGiZIdSDfJt6dcbknnCCXlvE9c4Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763756552; c=relaxed/simple;
	bh=2UqPDiPm3fPoGfTKiPdW5vF1k5JUQV+hYgCxZ4NrHKE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=i/iFitEaiuaW/XrKRr7BKc6TMFoSOppXvnJwh5pZq55t8Cyaxz1q0+BOHETAq/TlagWbKNsMH5YYHLpL8RTpmed4f1BR87UvUSeYQ0/VKtw5jqfQXWCjU11nj8vRisxoOH8tM+p4jVzmhYSvlpOP1zwsd6GFRP9wCNzpigK8J6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nGJi4O1A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nGJi4O1A"
Received: by smtp.kernel.org (Postfix)
	id A72F4C116C6; Fri, 21 Nov 2025 20:22:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 915C8C4CEF1;
	Fri, 21 Nov 2025 20:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763756551;
	bh=2UqPDiPm3fPoGfTKiPdW5vF1k5JUQV+hYgCxZ4NrHKE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=nGJi4O1ARRvVx6z4KkdKh8GwZz/BY303LHhEe4z9bLufUy0C1Fp9zaqHLpEQEBzfQ
	 NutYz9vYwbHZaKF6l4sORbNLOg12LFk+Z9si3vkLwTnD3KwLWSIk3FLbPfmJcYJH/c
	 itCPMi86wZD9a3p059yLU8VcdycKi9eXjhCmsiIda7bFOQ67J30n3V+j+zyr2kHIng
	 Bxks6XBZfJ/RtSw+55W5AzYN3B4Qs0nTP18mPu5EnzpS7O6Mp0hKfeI9xRRBtXT9kZ
	 AnZV1IY7HDn/3UGd/XoH7wRHhARZAjwfwPdhYc+i/QKBZuFscC7lzTONyZw3wBbMee
	 rRZYm8mPoNl6Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70CFB3A78A68;
	Fri, 21 Nov 2025 20:21:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] STM32 DT changes for v6.19#1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375651599.2571237.2599344612232427845.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:21:55 +0000
References: <e5a44767-d50f-44c1-9c74-1eb9c539cc50@foss.st.com>
In-Reply-To: <e5a44767-d50f-44c1-9c74-1eb9c539cc50@foss.st.com>
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 18 Nov 2025 09:34:47 +0100 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider this first round of STM32 DT changes for v6.19 cycle.
> 
> Thanks
> Alex
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] STM32 DT changes for v6.19#1
    https://git.kernel.org/soc/soc/c/5733ad88a50c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


