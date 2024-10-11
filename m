Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37AA42141AE
	for <soc@lists.linux.dev>; Fri, 11 Oct 2024 11:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728645269; cv=none; b=BnWLfALFyigw7WmmWPtiCYURTDeQhGSwA2Y1ovZxfRLK36O1DRTfdilVZqvuJRsT92GO6o+JsYnPhnfCwkszYGE5Pm5ZEveMDtLpxYPBzUd1iDcTJFtNemGsQqqGBDIG9NzPL7KqNyvtH/FC5V8BQLttpfNq8jp5aDIFgHYuJaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728645269; c=relaxed/simple;
	bh=7isQERmQfcL4hD8exvhIOf5DDHztQrFBvjT6FYjM40c=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=H2wMzBcYoG+AHmIGZed0Bm0V4rzb0tTy8QMN0aO9RCz+4TqIoqLN43CJFrBkYwMI44oMGd8XZT43yvtc02aMMRxKa5HT+H4SP79XjyY7kHQSI8N6JK8dOK/9s+NJDZjUY5r7dfceUr3Bw+e7JJgiZtWa+b67eW4awRuomSZAgJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZgcqZrtp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZgcqZrtp"
Received: by smtp.kernel.org (Postfix)
	id BFE4BC4CECF; Fri, 11 Oct 2024 11:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A52A1C4CED1;
	Fri, 11 Oct 2024 11:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728645268;
	bh=7isQERmQfcL4hD8exvhIOf5DDHztQrFBvjT6FYjM40c=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=ZgcqZrtpM6qJio516Tj2cFtggYTsx9TAxGsyMbNqIWbEB9yzIibtvWiUepxyYmUxp
	 p+Z4yn3qiC70Y/syiJ9Jxo+kOdDlLuf/XTyAHO8TMAnXISyPRk7JZhE60z+vnIOPf2
	 y/H1LIu4vZMeDuuK8tBny4698ZmEVjaaHDN437gRmqvVnV8BYPtHoQ51Kv3p47SduB
	 Svgrd7RhtX276nQaLjrJyYaTkF0sL5RY1y/sQkLSkTI41SIvmOtRKQM1/xksh/rcYW
	 Wf8ewCP/wiWvs2KHTFbax6xKxE75rhi5rPy9TejPjxJDw4eofITtqSo10KiYAUpbB8
	 uAf3AzMyz0D8A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E313822E4C;
	Fri, 11 Oct 2024 11:14:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/1] Broadcom devicetree fixes for 6.12
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <172864527323.2676212.11473835990056209811.git-patchwork-notify@kernel.org>
Date: Fri, 11 Oct 2024 11:14:33 +0000
References: <20241008220440.23182-1-florian.fainelli@broadcom.com>
In-Reply-To: <20241008220440.23182-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  8 Oct 2024 15:04:40 -0700 you wrote:
> The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:
> 
>   Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.12/devicetree-fixes
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/1] Broadcom devicetree fixes for 6.12
    https://git.kernel.org/soc/soc/c/b72cd67a0300

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


