Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0792AD37
	for <soc@lists.linux.dev>; Thu, 27 Nov 2025 22:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764281593; cv=none; b=S8F29xl0ZHw3J2M8+PX3uGeZqnbUzZH0huyQ93PbtKZKimNyjxcRnbDamwF940Cudz2Nroo2bDTc+U5jsHtzYCNY1fFxyXnauZI7EVtNvewlEHPxxx7U9k9nalW0kvWqitCHcLHfG+lHPOLfaxtgGiE5aA8et6T5nNhFq12hZew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764281593; c=relaxed/simple;
	bh=0nxsJ7c8d5fvB2S5G7o7v0XLWj9CSAkmVtLmZM+RTgE=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=pVvnNKET0X7CJOLvzXdJp9ofYYjpCfOzmpQ+aGdrW1Mx8sFlbJj88UjaXmSu6TPTunBiuA2w5KZE3XKDAsUtL99nIUBtFcr76FZ3bN1FKFc6GRR4dfLsrYG80dgdJCxk9DfwTRVWMP80oEcv3fPARQ/9NpJ3CepglGkgppBLVS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KIQ/ibp7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KIQ/ibp7"
Received: by smtp.kernel.org (Postfix)
	id 0648CC116D0; Thu, 27 Nov 2025 22:13:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E512AC4CEF8;
	Thu, 27 Nov 2025 22:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764281592;
	bh=0nxsJ7c8d5fvB2S5G7o7v0XLWj9CSAkmVtLmZM+RTgE=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KIQ/ibp7XDvGI9uqyK4ZHNnd7se8Yf8uVgG8jZS3Gw59fE0obUeqKqMRQdM4CUJjz
	 urqv3tUEnlDFb3pPpdYwCXC1Qj4S8KhfPosRk3/E57MbsSHAq5DRbXb7Xm6eErEuhc
	 cxAIN8wHRXLQ+cgroyGhEzQwz823zQk7+vRd1jCCw0aIBt7+p8gM9VXf78rWXoQcCP
	 sXsQL8gYGEdFJ+xuMmy+hBVq23wppatgXpw1QEBf0BduUp2wOPY3zvJX01cd0kmoIb
	 gRLD65Gv/Ud+PCw82ypH/Jbo80/pP/vDwQ5Ron3ZzNSbdReKVJPJOATjB2rHMmHc13
	 WJMlN94xqR6HA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 795023808204;
	Thu, 27 Nov 2025 22:10:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] SOC FSL for 6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176428141502.55019.9475258288420697684.git-patchwork-notify@kernel.org>
Date: Thu, 27 Nov 2025 22:10:15 +0000
References: <bd0f1a68-7e0e-4cc6-995c-f46561b71c52@kernel.org>
In-Reply-To: <bd0f1a68-7e0e-4cc6-995c-f46561b71c52@kernel.org>
To: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 26 Nov 2025 18:48:19 +0100 you wrote:
> Hi Arnd,
> 
> Please pull the following Freescale Soc Drivers changes for 6.19
> 
> Thanks
> Christophe
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] SOC FSL for 6.19
    https://git.kernel.org/soc/soc/c/16cc3988cc36

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


