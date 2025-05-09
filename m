Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A95D2367DD
	for <soc@lists.linux.dev>; Fri,  9 May 2025 16:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746806997; cv=none; b=RmHTppM9rwBVgsE5jse3DeMzAxeqfWHSMa2UPLZtu8c93vGJuglU7q2NmwktKyYYsTi/ZBvmu8I8rsMImJMLPy28icmBLqhhMm/YDsaqfm7wRQw6d7lAfLTBS++l7nKguqaUUKdWvJaMTYdLMs5U1Zv4WCj5k/vCbKOwDpxLJ4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746806997; c=relaxed/simple;
	bh=BDT5OgH6pRAdJkQu1I2d+GZiz3PjE4ikf0lK6Zq9d5Y=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=RL31u67tbVeDED7ozWIV0qF3oVPql/sl0XA03Z1f2qEtXbM5IE+RR50jPnKj5mByCtR6Ivcdeh56r0lRF7h+i00XTyeFGkiB5vr/50zvBh6HCM5dzpMhDfN9Miw2ILJH5NlnZlEA4NGi7svQmRqsOsNfUDGxXtoXJYReeUQ3ne4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FEFP1PX1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FEFP1PX1"
Received: by smtp.kernel.org (Postfix)
	id 1F8B8C4CEED; Fri,  9 May 2025 16:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C07C4CEE4;
	Fri,  9 May 2025 16:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746806997;
	bh=BDT5OgH6pRAdJkQu1I2d+GZiz3PjE4ikf0lK6Zq9d5Y=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=FEFP1PX1oCH3HnTZSZdLdBasFIqQb2A0lJZooI20cUYqxfcDeurMwk9LvH1hIcuio
	 +gi7MrB8JEs2JG86B7OoM9Ap0Dgeul/myhuzkHm8skfA44ypbXHv6Ww2xkd9QhKkWt
	 pN555CoLCwo8GwFmzPcMjibuFU2H9QxW56EDww9uzGD3FME9AJtiorcYlqRKNmTcJo
	 Zdogot3ek289H2V5eDcx7OLDs1w682/tBt1xrrw+7UOx1W5RIeVXymkSh5FuWzcLgz
	 81AkaF0LcFzLx4UVsoMxH/0E1oofYDUvjmOtNz6NlBsZNCEtNOLlVRiZOCUXWOc/aq
	 8fvdW2T94zSpA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD77380CFFB;
	Fri,  9 May 2025 16:10:36 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Amlogic fixes for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174680703518.3673480.7314253860379202368.git-patchwork-notify@kernel.org>
Date: Fri, 09 May 2025 16:10:35 +0000
References: <e9c520a1-b986-49e1-b9b1-67511c187716@linaro.org>
In-Reply-To: <e9c520a1-b986-49e1-b9b1-67511c187716@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 9 May 2025 17:45:41 +0200 you wrote:
> Hi,
> 
> Here's a set of DT fixes for the new PWM bindings migration, and missing
> audio nodes enabling for the dreambox DTs.
> 
> Thanks,
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Amlogic fixes for v6.15
    https://git.kernel.org/soc/soc/c/e36f6de6adec

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


