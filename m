Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A683664C6
	for <soc@lists.linux.dev>; Wed, 30 Jul 2025 07:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753858966; cv=none; b=JA6oGnfCN4Pyu0egAEm2k5rHWJXXEnGEj0gd+B8/crujAjUiUWES6L1k9aNQCnMstyv0D9FuyisSL+ziP/PqxymV3+OOb1BJwNLqxYdqr7P2cgD5fXCzAN40zeTCVmb6zlGpDldfP01zsQiWdKJ/vMWLV1oOBYJOYW0WbZBleOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753858966; c=relaxed/simple;
	bh=UFc4jdFbD8Ra1DRW1AMOxMJV+NV30qhdVQID5xHP0Fk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=INUnHnFc3nestgJ1ryav0hD6e9BLMfo1Rz1N5WioTKKyICAp+EuIHScB5YzptvMwCOYsvLms72ERSgNP4NGK3GycJrXx66JLkpUjj+iyefvszmjyyMZdVQkX0QYT/aSeVQRtfCAdiSgFb1bEO/iHQw0+J27+SYvNw0pTzQiBsOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=naqpVDYa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="naqpVDYa"
Received: by smtp.kernel.org (Postfix)
	id 01F17C4CEF5; Wed, 30 Jul 2025 07:02:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A42C4CEE7;
	Wed, 30 Jul 2025 07:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753858965;
	bh=UFc4jdFbD8Ra1DRW1AMOxMJV+NV30qhdVQID5xHP0Fk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=naqpVDYa1xUe/NZll2h6hl0q3+K8/tHKk12XSrXjPc9lmmaVaOXwVniJvjASfk8qi
	 yyftefoXKlebH3GCARkEropegsg9rqL9aMD16JChsjMIFJuHo9sTA64xjlSaQ8BMYC
	 6e4Tsxh3Tmsy47TL4N7uqH1SdT8XoZgmRd0sWW/NWV+46VbbrLlDeuV2+B6NYTE8au
	 7fkOLiyZnRtyKIF+x05r29Cb+KMLdUBmj4O1uab93IG2Rno9mIBsoZ4V5ByYlxMPYH
	 3paveleLZygTY/M6Y1sHZ/3cP56GSMD7w0fPGQ0GgfqAmhwUNeFPGma28w7a4PGRMc
	 9Yy+WKQlTEe+A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D18383BF5F;
	Wed, 30 Jul 2025 07:03:03 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/1] Broadcom devicetree fixes for 6.16
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175385898201.1808741.13851292720715444648.git-patchwork-notify@kernel.org>
Date: Wed, 30 Jul 2025 07:03:02 +0000
References: <20250729205711.3393417-1-florian.fainelli@broadcom.com>
In-Reply-To: <20250729205711.3393417-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 29 Jul 2025 13:57:11 -0700 you wrote:
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:
> 
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.16/devicetree-fixes
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/1] Broadcom devicetree fixes for 6.16
    https://git.kernel.org/soc/soc/c/388d739369c3

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


