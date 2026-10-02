Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3643537FF
	for <soc@lists.linux.dev>; Fri,  2 Oct 2026 21:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790977811; cv=none; b=M5LkRoGCBodCieoZv/UujTsb8IsuAzucoI7GrARWlgw6r8mkmVpQXrqqcYpUCk4PoJilV/Fo3bgGHVacCybcVZXg08w8rbxBEJ3krkJC+ojjmcmZTWFk2Nixk0i/dy9yEGyoTrV0peAlTN5gmAGfU7MSlzRBnkorr/3b+ISkzes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790977811; c=relaxed/simple;
	bh=Pd4t7J+J6ggSbqVsMThGUZ4MP5zHxRGPs5yYDRWVLfA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=eXsPTqZi3Lw/slYiK8Y5APNIXJ9wU889UDFwTOxuYuPDYG0qAizY/GyMRHErZP9O8JGVpsxlmJGcuS5Bjz5LmBbz9O/e3HnrT+jVAT6+/BATI02W3TndVvYRqseFBUKB22ND5usEciNvntAszLWOh8HDnvV10EatOg7sFD41y9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRShx0Qu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRShx0Qu"
Received: by smtp.kernel.org (Postfix)
	id 981AB1F00893; Fri,  2 Oct 2026 21:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 825791F0089A;
	Fri,  2 Oct 2026 21:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790977810;
	bh=4AldSYxoKU7HqbxjsoN+ZPRTj49wo5hZNm81Ds2pa6U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=XRShx0QuKzB12UPc8gce1ynKA0eMwLARkAKMyWOrVErdmE8GojDQDbSvXbrLIalT3
	 +DVd/yyfCCp2Wru1KYhxYnUzuPEdvnbPq/viy6G3Rs9ni/wZEwUDcTqbGP6iO+Q+cX
	 c0hmZTii251HT7hPjJlOZlS0+9r60vmBmzBYgObkZ13OuNs8+q+UDOR0H5/oinxkoE
	 H8QELNHr3puuPa4vlE6uKEiaen9dC2w33mkm3HWeczBtJzVk6Cf5Dr9HVSNZAMWZBA
	 2nBkVLO2PncvZvniyQAxedJHFOqMmlO3APu1KkeN1xSHFOdwWVDiFDVn0qfR6Uv/Bh
	 4m+SPlLDmrztw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773BD3811A72;
	Fri,  2 Oct 2026 21:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] OP-TEE fixes for v7.3
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <179097780902.3602058.169654214923364047.git-patchwork-notify@kernel.org>
Date: Fri, 02 Oct 2026 21:50:09 +0000
References: <20261002142443.GA778834@rayden>
In-Reply-To: <20261002142443.GA778834@rayden>
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 2 Oct 2026 16:24:43 +0200 you wrote:
> Hello soc maintainers,
> 
> Please pull these fixes for the OP-TEE driver in the TEE subsystem.
> 
> Thanks,
> Jens
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] OP-TEE fixes for v7.3
    https://git.kernel.org/soc/soc/c/e984d7bf4689

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


