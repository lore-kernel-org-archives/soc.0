Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAD422CA11
	for <soc@lists.linux.dev>; Thu, 16 Jan 2025 16:01:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737043293; cv=none; b=SKOnKo12pjRy/XFsuNiMOb0wqOQ1+VwH/DKukRDJq3T7PWTY91TULyJxejJ4Y/ZntFpEjk5eFqbFZ9x1msBgb7SBc5pjWQkuOWbO+Y9QGcd8ywujALLLK3JlpKdI5sE3b+Z8igK+AVRxxx7IBAvGopuHfWTT+b4w2podWBexa1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737043293; c=relaxed/simple;
	bh=+VUw2uEFWxiJUs4Z27coXaFInxuLDOfYkmcsa5/lBW4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=W6+w2WwmrBXTCrrKKbDHan1QsGmfRCkwymWZr7YhokzpyjeehF4nFdCVJ8BkKv8t2eRhViLUcjn5AAk+51yBuC6EBn2qSfq1uku5TsMUP31FHclL5Usc/FhOwqzU/R9SiNuosYqcnN7nPZWJhroA5Q8Audal++zUc64qFPDrqro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SVzK/iQH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SVzK/iQH"
Received: by smtp.kernel.org (Postfix)
	id B4C0FC4CED6; Thu, 16 Jan 2025 16:01:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87FD6C4CEF6;
	Thu, 16 Jan 2025 16:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737043293;
	bh=+VUw2uEFWxiJUs4Z27coXaFInxuLDOfYkmcsa5/lBW4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=SVzK/iQHH1GeK0W2QDEfpk9lXq5JlpiWPNac0tLthNNqs7EWNwMqJjqWEZDpWYd3M
	 OcIbTkmLRzBTEXok/V7qhDUajq5DGUitqX9pmek4OBKqxQsL85mH1ji1RZcb3NZJCr
	 B9DZXrhp3/bQd9R0BfwgFuCWAnd9TP7FEyPk6+NPwYyTV6lDaD/q6Vma5BTYX24mh/
	 D67On43Wj5KukpCUM9v7AnTWDUqznbVt3JjLcrJcOQ7oLHYUvttCKNE6o5FD+h05+r
	 0eL7oLzX5Z8H76EzKEhK3iTGKWXctLLMMfyb4ZnFP6DXOnMLzaNf2e/6NuGDdgyuPE
	 D3Ac1PoqqHd+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE61380AA63;
	Thu, 16 Jan 2025 16:01:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] MediaTek ARM32 DTS updates for v6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173704331648.1501791.433522252451412122.git-patchwork-notify@kernel.org>
Date: Thu, 16 Jan 2025 16:01:56 +0000
References: <ea93d0ea-a1a0-4d36-8880-4f05c85f0c1b@gmail.com>
In-Reply-To: <ea93d0ea-a1a0-4d36-8880-4f05c85f0c1b@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 8 Jan 2025 13:14:57 +0100 you wrote:
> Hi Arnd,
> 
> Would you mind to pull the following patches.
> 
> Regards,
> Matthias
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] MediaTek ARM32 DTS updates for v6.14
    https://git.kernel.org/soc/soc/c/9f98a04da87b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


