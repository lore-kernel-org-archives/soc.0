Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A8BA481AF
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 22:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731450703; cv=none; b=k4GKDuYJHn/249MLD4CIMkuWv2m8ANoXnPc0ajwp4WEPijQV1ECOVZyQoVu84kpjFkX/nkg7zyMxABYQtuevYbmDBWyPj2Hg5d6FBSvk/PVyvpoQz3h5T+3ZEMQU0xU5xxGpD8yQCTMfa2M2M3zEXKyUb524rwYfxLJEr0L5tTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731450703; c=relaxed/simple;
	bh=vRW20RSQKY0/+IICMR7sV/ZowlMmORLc3L9lWu+5MZ8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=RjOLb6y/8LZFGnTPK15cd1dWxWI70qMezdy4A5r6xqAV5L/CtEwcqfNVIFPw1dx4B7zwLxTD41JET5llcXZU4VaosOKJ8yWtJydI4ZDBrWat58n/bmc8WgYwJ2JYwGcFD47fmtrhUoo6Y690QYenf6BPmFjB3ELtGNjNmzXlc3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jp3jW3Yd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jp3jW3Yd"
Received: by smtp.kernel.org (Postfix)
	id 546FEC4CED6; Tue, 12 Nov 2024 22:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F236C4CECD;
	Tue, 12 Nov 2024 22:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731450703;
	bh=vRW20RSQKY0/+IICMR7sV/ZowlMmORLc3L9lWu+5MZ8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jp3jW3Yd0TNrr0i8k3GiD7JZlxBLzyrBtp1u7k0o6PlWiQnku7o6LH3+QPYV790x1
	 yPfx2xhnjWiSuqw+75tWWnnMab9zdnBsSB1UCAjipavGukWqugtPqc29pMmWiQnza4
	 4wh/XGRVpl1c9Fu2qL36Y9puIWUvm5It7PUiMMJv7IJSTv1r6VVeZVCWgbI2l2Idgw
	 pdRoJE40X/vajfpCAWmfxxNVn8lVhjJMQwTNwJt9chk7OTu9Si+rzYwOOgPHAawj1M
	 2mM2Y3iKoX9/XLxKPDmxA5cppshwfkaW4SyM5OaikQsbYytDj8zm0SiYx3HA3uOYZv
	 DBPxWG06+NupA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADE9E3809A80;
	Tue, 12 Nov 2024 22:31:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173145071323.694695.15300147128993085593.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 22:31:53 +0000
References: <MA0P287MB2822DC23E1EE47A5C7D41476FE532@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB2822DC23E1EE47A5C7D41476FE532@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 6 Nov 2024 09:12:30 +0800 you wrote:
> Hey Arnd,
> 
> Please pull dt changes for RISC-V/Sophgo.
> 
> Thanks,
> Chen.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Sophgo Devicetrees for v6.13
    https://git.kernel.org/soc/soc/c/44533285bdaf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


