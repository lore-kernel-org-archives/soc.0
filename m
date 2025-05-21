Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF0622FF2B
	for <soc@lists.linux.dev>; Wed, 21 May 2025 22:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747866675; cv=none; b=M++6ckqZ/HPiIj1LLXXNp/BCv+/9TW5PyQ1p1R/weNJWr9CWFB3oCr80rNpN93TFwlwlPzrs1ta9cz9b7ObBUpqGUTuwSdFgA9nCNQ0A7zpJxksYME0/hfH0EsfxvCeLNv+POJjSK465FAKh7yw6aB23zVeKDSNk9mUAISFUcbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747866675; c=relaxed/simple;
	bh=1egQYHrSUMLz3PyVpzX6nItcL26JNQjaX47J5KF1OQo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=QlNzG2UxsNVOqBrifUQeIE5j0vyOfBDX/JMuPpfYlnf4x8vhdMcmiCMGi/V36p4G87ARnitKRAzxzSIDyjV1ckSWM7MjOYlLsthi0BMePTOZoGh35cBDyaiKoJQIM6fb1WfGOWSicrQbPGW8Rgh6b424/0NxNHqE1Su6VuRrUYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LOk1r7WZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LOk1r7WZ"
Received: by smtp.kernel.org (Postfix)
	id 66CDCC4CEEF; Wed, 21 May 2025 22:31:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 513DEC4CEEA;
	Wed, 21 May 2025 22:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747866675;
	bh=1egQYHrSUMLz3PyVpzX6nItcL26JNQjaX47J5KF1OQo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LOk1r7WZRZCtIMWs7AG219i1tWypvR8StQE9gVa1mI7ITJCaOXwvr82dmtZEO7v2E
	 VAV6DwhLdYtQlh7U2V5fU93Wiw7kfo9uKqnMIcoUj0hA8cXkAc2O/6014fGVXU2diz
	 cZtgi1ypzEElpbEMK1JMTO8f5ORVVv7C4B4LSRa3lQ7REAzpPWb1gJFfcdXKi5H44T
	 kRMwbzUu3JdFne6MrQbMU4yKMx0e+X/bznq6Ckw9i2yPzoQI9dc066Z3SmMmYtEftq
	 dDAN2GwKV5g/mP1oIRQZalCeRrXRbypgl/Pzo22xuigOg31mCEH/xG21yiAvZXgEyf
	 4KA9HqGUhGfRw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D37380CEEF;
	Wed, 21 May 2025 22:31:52 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 3/3] RISC-V Devicetrees for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174786671074.2299459.1977434230192539569.git-patchwork-notify@kernel.org>
Date: Wed, 21 May 2025 22:31:50 +0000
References: <20250516-gap-exploring-f8f516ab4e1c@spud>
In-Reply-To: <20250516-gap-exploring-f8f516ab4e1c@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 16 May 2025 12:01:39 +0100 you wrote:
> Hey Arnd
> 
> Please pull some ~RISC-V~Starfive updates for 6.16. They're a bit late
> and only went into linux-next today, cos I was stalling out for some
> acks before picking them up.
> 
> Thanks,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,3/3] RISC-V Devicetrees for v6.16
    https://git.kernel.org/soc/soc/c/00000994fe32

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


