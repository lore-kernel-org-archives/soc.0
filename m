Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833B4236453
	for <soc@lists.linux.dev>; Thu, 22 May 2025 11:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747912797; cv=none; b=AF6jPpC7p2VfM2c6EAMoQ4HyzsKECFkXqVyxVP+fCsjkQcs5MkkE0eh5EPK+6DQznR8EaBic3XlyeY46iTDkGj9qnk40GEfUQv7b7Q9d+KIXLP6NpI8i3ibPiVePd3r3orjJUg9IYOOgY20jJ9PaN3BRyGovDp0zZDOH9xFioRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747912797; c=relaxed/simple;
	bh=CcaL8FIX7JbmEvcXOIjSiUx3t8aMch+29wh0ZBDQHag=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=kcBT3OGBjD81DEl4GByzgcYZznndt6abAC95pxJ98aDIoPA4SH6kwQDXTAlBRhD2LZxf81NI4BddkzY7lJpjFv6meLYxQQuEdQubC0cbCs0EHN44JjGMDFuASksrjZPHmo6Nq359JENSZnFuDE3bh9KTtsExJ0rITzbTS6PqziI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g8wxolHP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g8wxolHP"
Received: by smtp.kernel.org (Postfix)
	id 0AC1CC4CEEF; Thu, 22 May 2025 11:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E926AC4CEE4;
	Thu, 22 May 2025 11:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747912795;
	bh=CcaL8FIX7JbmEvcXOIjSiUx3t8aMch+29wh0ZBDQHag=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=g8wxolHPB6pyBq22mNfDCQkUGGerEzBBuXbecCfcWbt4XCLtQD0VCqR7/bsdRQYFc
	 RuuT3pzbI6CKEtteJwXM1QaBYvaQlJHO4nEkgYsq0/mZ9Fkji/qIPEMQ7L/qFImdqg
	 IhBxI9kR2XHsBW2d+b9YJnrkUQmiEf7hnRhxCgGT/6ifHlmG9sYZV+3m/lqb9qt6Oz
	 8gJD5zGhXTjrlpbbhiU418UaXNdOPP8QMlIr+SI1IIYIYqsflVSwKgarNSpvNMV2S3
	 2sBi+CdMxkiEy4XCS8bbKRME41Fgr84/tNVXkO2n/B9IR7XFGAO4nm4QRoa7q/UMn+
	 UYmVYuDUwRN+A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADF133805D89;
	Thu, 22 May 2025 11:20:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/3] RISC-V config for v6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174791283150.2837630.17747742122585667397.git-patchwork-notify@kernel.org>
Date: Thu, 22 May 2025 11:20:31 +0000
References: <20250516-joystick-mortified-385820b1ad0b@spud>
In-Reply-To: <20250516-joystick-mortified-385820b1ad0b@spud>
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 16 May 2025 11:36:53 +0100 you wrote:
> Hey Arnd,
> 
> These are a bit late, but I was waiting for some acks on patches that
> were outstanding for a while dts wise.
> 
> Cheers,
> Conor.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/3] RISC-V config for v6.16
    https://git.kernel.org/soc/soc/c/74b1d172c3b5
  - [GIT,PULL,2/3] RISC-V cache drivers for v6.16
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


