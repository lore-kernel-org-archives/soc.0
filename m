Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE02619F110
	for <soc@lists.linux.dev>; Fri, 11 Oct 2024 10:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728644371; cv=none; b=CTS3MXw2Zk6dYaNe60KdJF4ZMVxfOdMId/t3ks5khYr3FkWCgGe2FGMVBmAloncLRhEsE83tQX++6TSqP1aXSd2VDjWuIZsrECmKhiU3jIEcNQNjgJVUTf/Oq0ZckQSLzLYQrGVqvAH+n+1rHHcH6W2iKNMGTa1I2rNq7Pz241c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728644371; c=relaxed/simple;
	bh=MDqauTmcjSL+0M2elFZirv0Ht9jAA9l4pOT14QCnIeA=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XnGR4hsmNffsyJkzSvNWvS84fhl8fCZ3EiTgeqYH5ifHPLwRnTE1fn28ctPZ/TqJabNTv/wxGawAGaTwciO4t0Qzw1ST92qLO5OmQbpkFGFOSexiK+P8ytS1Y0iYvCuwjCBJF+HmaFJo8TyyeANxmGoUkdefF9C1QPv0nf8hBFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=roKxF2xH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="roKxF2xH"
Received: by smtp.kernel.org (Postfix)
	id 879A3C4CECC; Fri, 11 Oct 2024 10:59:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D949C4CEC3;
	Fri, 11 Oct 2024 10:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728644371;
	bh=MDqauTmcjSL+0M2elFZirv0Ht9jAA9l4pOT14QCnIeA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=roKxF2xH28BDR6HF40UX4lnmL9Nub1s6Cx1BBhVDd4389iktf+yeyMJs0b/6T88Z2
	 dUG9ajApIy1KzaJaDatfW1amtsQU+g6tS+4QT8XxBYxFyOQe5V3pyBHFvFhrXAzPqw
	 wrwXQLPMuhTlN3+do42YGQiW8oxtFpg/bDdnHhuGpsuWnpnVMNaA7ffqpHFGFlLKIZ
	 gi2mUaeRokCOCzrxbFIF9cfyfhtXxhoI5GoaVQ7T0JqRtdtIbtNJmcn70dC0hhEJxe
	 nOJ4PCt45E12DmyAPiSgyAlZeE3Zu6kj1TmrUzfpJYm/g2hc3KH05J9R0vPLxsYH+Q
	 USERzp6sZcExg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33E803822E4C;
	Fri, 11 Oct 2024 10:59:37 +0000 (UTC)
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
 <172864437573.2676212.8309981835804100703.git-patchwork-notify@kernel.org>
Date: Fri, 11 Oct 2024 10:59:35 +0000
References: <20241008220440.23182-1-florian.fainelli@broadcom.com>
In-Reply-To: <20241008220440.23182-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
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


