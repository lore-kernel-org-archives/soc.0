Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C0B6263F38
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 21:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662450; cv=none; b=hDEOhkO/KaQ2cAO05XPcHH6e0ldvLmn9lCdsHhWWvAR//hk73ZMv4gRi5cXMOqql09CU6kBbXt8vMivF74vfEB3l5LwVgw9XvgKXaAvWFD2QFtho0r8Lb00zhCmVZUHVDReqe10fKVCk422wiyjUzBe1ho3tyv83+nfLT12Z3Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662450; c=relaxed/simple;
	bh=d+5z+eB22+BBSrlrzR8XUJSGFe3a4g7ukKc8JXwCjbc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=dJ+ox2MOCoZqozb8pd8L8BBPVq9Xwc77NLDINztOuOFpjozc0rE0izFG0cAj2jVY6Xifs3aqCNM0QOKtVZUbDaMGt1XJq39a0uXYAZ3dXgIMBVo2qMpCO+bVlTjxY/LSJ/fyPQ6YZywjsVUjDCBUqEZwMjgVyzv54obbFyyDRZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b05Te6nP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b05Te6nP"
Received: by smtp.kernel.org (Postfix)
	id D1643C4CEF7; Tue, 23 Sep 2025 21:20:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC255C4CEF5;
	Tue, 23 Sep 2025 21:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758662449;
	bh=d+5z+eB22+BBSrlrzR8XUJSGFe3a4g7ukKc8JXwCjbc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=b05Te6nPXWyJGQb8qJWxkKh8jhpGdwrMcsx5+q4HHa3NMdLvdTnUY8idTSchboGp/
	 dLqFEaB6lwHHEYGM6XgiC+gsvLR7Tjxa0jU18YcQBz12v9a2oIuBGt7St9ceunbVje
	 +YwzPqg5LsV7lQZ46aZ+V924+KbDnK+PmadwWnQxIRM7dWVmy2Jq942nPquMOWZO4k
	 iXef3rmkn0cz6agCuT0Iyl/h0XMRVBVN9deeAfy6hwi3Nz1qHc/3OPV+AqMnr+Y1il
	 +doTWOo4KRCqH/ibqTYYcWbe7nimmqeLo+E0bEFzcUOBT3S1FUJymlvcwY3givkShL
	 7/Kb1Bq8oRNDw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF1139D0C20;
	Tue, 23 Sep 2025 21:20:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Amlogic drivers updates for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866244673.1926563.140520965318771066.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 21:20:46 +0000
References: <003cb467-531d-4a8d-a97f-19d59154132f@linaro.org>
In-Reply-To: <003cb467-531d-4a8d-a97f-19d59154132f@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 19 Sep 2025 09:43:43 +0200 you wrote:
> Hi,
> 
> Here's drivers updates for Amlogic SoCs, 2 non-urgent fixes for the meson_sm driver.
> 
> Thanks,
> Neil
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Amlogic drivers updates for v6.18
    https://git.kernel.org/soc/soc/c/833bb53d5ecf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


