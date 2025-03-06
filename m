Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761231FCD05
	for <soc@lists.linux.dev>; Thu,  6 Mar 2025 15:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741275688; cv=none; b=S7/iecuoV6yULprFvESRfM9zvqjwvsETGLZsPmWBUFp/aB3WPMYzKdrpLTOUltfcwMEHFUajzURu0carUfrzX1gqHD1IO2vd2QupAo9Khoolg6etM57dnac2J2lajr6SuNPzj/caWqHaMSuWG5FMKTgyDB4BzwxPHoz/fVrpSp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741275688; c=relaxed/simple;
	bh=j13REtYNJHCYe7e8o3pEniGxjpKWBAtz0AyO22Y1Boc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=jK9SjTO/VdMglKW/AWkPHBWpO1ExMGQ+H5EwebMpTjJUvxQnVIB9WjP3jP84kp7GUJ/9vre/pE9s6QKmJPEtxA+sXn2vDU6kvwaaNcDr7c4OnCmrjfqpO9weSIYxJRQZmzTC47AYUJ7yGdL3162X9JeeQB+XH7Iz/1MK6UPfhhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5lamZdZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5lamZdZ"
Received: by smtp.kernel.org (Postfix)
	id 0CF9AC4CEE8; Thu,  6 Mar 2025 15:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E73B1C4CEE0;
	Thu,  6 Mar 2025 15:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741275688;
	bh=j13REtYNJHCYe7e8o3pEniGxjpKWBAtz0AyO22Y1Boc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=V5lamZdZlkWTaHcj4oUAsHP7Ob6e/icMQtQmMIgtSkOD2wPCuVhlwlfJ9COc4O4Gh
	 e0iFNB3xDD5eDX1ZWlftDCFRX4eD/MWAN80ZWFfmYM1bllFVN4D9yUMfZ91D/Ngal5
	 cNLEr2ZOwRFVF6dgFpGSG2WCcRNKMj+1Rl5AafdbDXMF31M85pMT2iUbhuTSaGOzoa
	 EQwMJE+SQ676JkzQo749AKj+xoA4VKtAVjk7dNQkJ1d01jWiTYaE6NOuqQGj9fUriA
	 rda77SB5UrRlNJZy7Ja3nVVuf/+51/hl0olr2qslOkyA0UIUfAQD68+IixOBUnHcVp
	 lbTqeK3gDPafg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71331380CEE6;
	Thu,  6 Mar 2025 15:42:02 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/2] Broadcom devicetree fixes for 6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174127572098.1636926.5149666153015614464.git-patchwork-notify@kernel.org>
Date: Thu, 06 Mar 2025 15:42:00 +0000
References: <20250225194041.1063762-1-florian.fainelli@broadcom.com>
In-Reply-To: <20250225194041.1063762-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 25 Feb 2025 11:40:40 -0800 you wrote:
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:
> 
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.14/devicetree-fixes
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/2] Broadcom devicetree fixes for 6.14
    https://git.kernel.org/soc/soc/c/170645f1adb5
  - [GIT,PULL,2/2] Broadcom devicetree-arm64 fixes for 6.14
    https://git.kernel.org/soc/soc/c/b86114f680f2

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


