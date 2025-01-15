Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E18A51553BB
	for <soc@lists.linux.dev>; Wed, 15 Jan 2025 17:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736961201; cv=none; b=NiSFm53H4zazFrd5zgLxwQxgrIqotEKXsZ0nahqSDUfb6GEWYRHUhSWYTLqfZjqyDkTANDtYuw2AgERzCZK2je58D1eN03w1HqvggIJK7tFOHOGNH6TfYIrE9E9H8psq8PEqlgfC/UIRmOACL0PIUt/B9smyo4snd3B3q4ciZFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736961201; c=relaxed/simple;
	bh=+Cz1bXhQOdtBrkSh4BacwUAWMbgQf4J0/VFV4JkkjTk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BIkmFzUtoo2DwZQZaeFU2XF4VRBqvidnsbHGvu/jUmPkVLWf3Ww6EJJsWEGOGBiWHab1zPyI1mXJEysTkVwTYNeUi1QRT0wlXIHkHlVU+SWGAJ0U4WbkyRAYunDy6OhmIoKr0aWkhbBe8DwrwVdqV0wbuJTdRfcix3eJh6f4JPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lpOnqpXh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lpOnqpXh"
Received: by smtp.kernel.org (Postfix)
	id D6166C4CEE0; Wed, 15 Jan 2025 17:13:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0168C4CED1;
	Wed, 15 Jan 2025 17:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736961200;
	bh=+Cz1bXhQOdtBrkSh4BacwUAWMbgQf4J0/VFV4JkkjTk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lpOnqpXhc2YZ7+WUn7Wu/oNeuPXkOT6VFTnu8hA0EFKObefR/mRDjjBTgGrWFrzmK
	 yolwWOlwg9ADwgKwHlfuc7mw1UBAO7sOHwwzIHE9yecnEngvnse9SWa5bl9+xKbXym
	 hHWv+PHsVXf6bqI/qoRpAJYe9+U1ROfKbkESyjLdLag17TOmERrgronBNonXvfcgUJ
	 tyhhRozf/8XPMGBtt4GHLGhUn8AAo0gZWyAiXmH03GWALA2UgHj5QcOWZEFZivy9Gd
	 2DN/rs58HB4T8r5F6OTkHIdTnt9KsWXT/PUC3NaPyPKpPKdnrbwjUEGNG6b4iR6Sdx
	 14sSCZd/aUriw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB0BB380AA5F;
	Wed, 15 Jan 2025 17:13:44 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE fix for v6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173696122348.809051.4920585830926478589.git-patchwork-notify@kernel.org>
Date: Wed, 15 Jan 2025 17:13:43 +0000
References: <20250102140102.GA3082088@rayden>
In-Reply-To: <20250102140102.GA3082088@rayden>
To: Jens Wiklander <jens.wiklander@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 2 Jan 2025 15:01:02 +0100 you wrote:
> Hello arm-soc maintainers,
> 
> Please pull this small patch fixing a version print in the optee driver.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE fix for v6.14
    https://git.kernel.org/soc/soc/c/384727c43275

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


