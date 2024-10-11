Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A58B1E3DC7
	for <soc@lists.linux.dev>; Fri, 11 Oct 2024 10:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644364; cv=none; b=GW4jVzrR2u4JeEJSCjptk8g96msLNRm3tdvvthOt1D6/+BJ1K2MXRIBUVZUZfKHFVlE2gABWcqKs75uxhwRWJcTURKphswxu4rL36xbDCLvqpVcW0gIDjNZso87pLlsBsJ01iY3HJ1kkeAKpLnprTwLw2M7CtLf4Am15xgZE06k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644364; c=relaxed/simple;
	bh=XVF92ONytmSEvg9+3LCp17HI4yjn0KW5Jfjm5sksGps=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=POKxYdAvvzfKRXRWSU8sB7L/x15wsyGabkhcr2nL19r/o3aVI72Iqmpo84E0QCm9c4SE4AajncYWxGfvUWzEUndVm6RigIYWA8ZcI/PbkTwBLBvPtqtKXncprZuSHizDIdwQMTwiH0QrkXdojDtoHbTTEVpt99VY+nu9KLqGu4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=raKidglo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="raKidglo"
Received: by smtp.kernel.org (Postfix)
	id C1D72C4CECF; Fri, 11 Oct 2024 10:59:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB890C4CEC3;
	Fri, 11 Oct 2024 10:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728644363;
	bh=XVF92ONytmSEvg9+3LCp17HI4yjn0KW5Jfjm5sksGps=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=raKidglohFKYbV8pHeFbAvJSh2WitesXKUYTYPHa+ZnUjJrj1kqyYwJC2gu/qWc9y
	 71vRIoTSBa8yDr6UwkKonqncuu3fuNv3XUUwUlp9nHliL/l4sLLrZgYcHhp8MWtTx3
	 W1HS7AYgt4h+gw8CZjJWK/HYrKwxTRB90LzG85JVBEz0RmncelLWMgQn/9yD+usWh8
	 PVD6JflZ3rfiFGSXQIeKZWzT9gzOhdo3xI7kEP4m86tN06KJZk+B3abZ3wmmbTPuRr
	 8QQBGEs8FkmRsea4CEtf87GHMkreXbAQefrqZGUNFlxtmZ/AgWzD5AT86/on2lYfae
	 AQJbMZ+JkVXDQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C7E3822E4C;
	Fri, 11 Oct 2024 10:59:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V T-HEAD Devicetrees for v6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172864436798.2676212.16845751065941544020.git-patchwork-notify@kernel.org>
Date: Fri, 11 Oct 2024 10:59:27 +0000
References: <ZsWs8QiVruMXjzPc@x1>
In-Reply-To: <ZsWs8QiVruMXjzPc@x1>
To: Drew Fustini <drew@pdp7.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 21 Aug 2024 12:01:37 +0300 you wrote:
> Hi Arnd,
> 
> Please pull these thead dts changes. I've run W=1 dtbs_check and they
> have been in linux-next since August 9th.
> 
> Thanks,
> Drew
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V T-HEAD Devicetrees for v6.12
    https://git.kernel.org/soc/soc/c/d846d5f1ba5c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


