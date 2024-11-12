Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A9A200BAD
	for <soc@lists.linux.dev>; Tue, 12 Nov 2024 15:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731424983; cv=none; b=EUnz0UzwqKt2GQEfWN0IWXYZ/6gUmGfJATOKP6nQPz2sE5hU3JDEsEhRqWPXTjwWzfhnpKpJvCixPphEnjkjk6N4YhHeGuyebrH6nqAcL51FGRP2ziKfZdGgGID8MpVhtDpQ3NN8qCDdJDt9VDBqhGtkq2CGeVJruzfnr5PE9Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731424983; c=relaxed/simple;
	bh=7YxA0s6lJhFmQL4Cbe1hIQ0cdx7Q3mFcvKjee0xjL1o=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=LkDJZkF5VwhMllwmtSMg5/1M7vTOewnZEH3IgWVn8mk4doAZAaAECk9vJOLBiIReh4MHZlw7n/xik3CSR09oA2WcH8GSBpawCYRdVIIBL79HEGfQI9mifJYm+sAYq9OkJf8noVZSr29VFIFyHoWs6EO52iNkQ3dbtafUmpXJVK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sb9QLjds; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sb9QLjds"
Received: by smtp.kernel.org (Postfix)
	id 97FE7C4CED5; Tue, 12 Nov 2024 15:23:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 814F0C4CECD;
	Tue, 12 Nov 2024 15:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731424983;
	bh=7YxA0s6lJhFmQL4Cbe1hIQ0cdx7Q3mFcvKjee0xjL1o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=sb9QLjdsARJpma9PikiC72Vo/dOhWZydpOcKdxG3dmzQG54kLpxdeH8w3zhQQoc0Y
	 YacHDPHOzCr0KjGP96iufbyl+sFBZNgsq18jjStiMAt+WvbvZILGUsrrFWAH0GZGbG
	 dXQs8WC6BT54DkSBUIOU0SOM6Z80isE71KwOPsYT/luwYVHrM3VNdKSyqcR3jnXE/M
	 DK8CtGN0KUhWe/svG34E8A98FGK9VCUWrUgjWSAc6BV+stBP+qprMhIZHm7Io0O0mY
	 zfJiDAHoA6TGYX8LtoJy+hJxpnKZdDdUq97GVQqkVw0cXoi0SVHvdjp1tbEWWvXwrw
	 qlaTyYAnUPpBA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE383809A80;
	Tue, 12 Nov 2024 15:23:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT,PULL] hisilicon: driver updates for v6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173142499349.562452.5791303359138415933.git-patchwork-notify@kernel.org>
Date: Tue, 12 Nov 2024 15:23:13 +0000
References: <671B3FBD.8050905@hisilicon.com>
In-Reply-To: <671B3FBD.8050905@hisilicon.com>
To: Wei Xu <xuwei5@hisilicon.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 25 Oct 2024 14:50:37 +0800 you wrote:
> Hi ARM SoC maintainers,
> 
> Please consider to pull the following changes.
> Thanks!
> 
> Best Regards,
> Wei
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] hisilicon: driver updates for v6.13
    https://git.kernel.org/soc/soc/c/d1d43fae0662

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


