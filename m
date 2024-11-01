Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224F11AA7AB
	for <soc@lists.linux.dev>; Fri,  1 Nov 2024 15:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730473320; cv=none; b=MBkhRn+ue1ftNRr5FCuNQrSlxcSOVTdMJ9UJSMin6rHenx6XWQHCRJFEv3RZpxXxGIPx3aPk12d997bSjzZdgKBJ1aM6/Cf98Su6sMxOlCbLQTijCsm4IurCs+2HUW49OkLM7pxFsV0/Zlo88t1WKUJmGsD2+p8V8RQ2DcgW6vM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730473320; c=relaxed/simple;
	bh=z5jHYKHxXrz6NyVNpLaMO48IknoLNZwRbu1Iz+H5vlA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=GpwNOnYwWoWcPIlqrHrzyays+fjuLKM9a7ptR1p1EEFmathH/hDeY713IlqMopd/ZatZrRsirq4R2UJZdmDZzVLcKWrMX596XJZ3i4dEYjdXVX+Teg6cHKfs9QIzN3MVHvNqAsxP4dRmZlVdIrLfIDnk0o9yM/ZjIqz8gI9eI1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dgSku2Q8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dgSku2Q8"
Received: by smtp.kernel.org (Postfix)
	id CE4EEC4CED4; Fri,  1 Nov 2024 15:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CCBC4CED1;
	Fri,  1 Nov 2024 15:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730473319;
	bh=z5jHYKHxXrz6NyVNpLaMO48IknoLNZwRbu1Iz+H5vlA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=dgSku2Q86VGpJhjrQa5m3PUUmnMxQvPWpj/yqWJ1qiwD9El3X7OzHEzFVq80kkmOq
	 OmvQUlVWe+yf0j21JVvBLfGmfgTFR1LIbXLVp1hXTC42/xBiFTqkODCB7lqfAmHCb8
	 iKbIbxIW0FPIG9jatrirzVk2VgYATeYDjA5bX0eEufLgf/6zeIfzE7HSXtn7uEGIUy
	 6HrtWscHlcEZNp/BjZoicO7bZFbmTOu0OQ8v2ru2rhTG0YUo4RqB/D8TgsYhm6aJwu
	 ZMOYCXiIxwM8wPPk46TJmuZX9ccQSYr8E5ppvj0w0bvnbY+gvT8wLHQ6HUDwMkynDe
	 bzaeqDW7CQZ0g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB7533AA7F37;
	Fri,  1 Nov 2024 15:02:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V soc fixes for v6.12-rc6
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173047332776.2666840.13133462814704493556.git-patchwork-notify@kernel.org>
Date: Fri, 01 Nov 2024 15:02:07 +0000
References: <20241031-colossal-cassette-617817c9bec3@spud>
In-Reply-To: <20241031-colossal-cassette-617817c9bec3@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 31 Oct 2024 12:22:18 +0000 you wrote:
> Hey Arnd,
> 
> Please pull some fixes that I have accumulated for this cycle.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V soc fixes for v6.12-rc6
    https://git.kernel.org/soc/soc/c/e5c06efdc030

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


