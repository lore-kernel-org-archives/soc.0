Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF731853
	for <soc@lists.linux.dev>; Fri, 20 Dec 2024 17:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734714620; cv=none; b=mDl1xTKgYQMLHs1juBaNF+1HjIzqPXEEAZFPVJYs/N99CoEMPK7SgdXsGuE6nOYfFJm/wVA/jWwhEwu0gCfLLTKSFot3+xytirDSiisdHGIEi5V8KFTcK+QsDc0VZ8hyX8qTZuIMV0LGnIJp+HKI6TkcGJSQWjLjSB9zS5igpEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734714620; c=relaxed/simple;
	bh=Kvm9O4+INcYwhlX7t+LjqSk8tdPDCz+JRGSH+Vqz5FY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=FBPmPSZBJUwQroM+njsU8XPMt2sLDKrLx1N3h7CMRq60jR7q/g6M0Un+TgP7VO3hsbjht+jx4rqGUc0kjm/3xjAukhOM1GHy39sookv0iSuycCqIZxn0NuiW41wiTckonTu34D+qVbeYoMfLTb/jSEvS/7sHgPIVVPJ9R0ry6EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQvkrUEq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQvkrUEq"
Received: by smtp.kernel.org (Postfix)
	id 2D511C4CED7; Fri, 20 Dec 2024 17:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17535C4CECD;
	Fri, 20 Dec 2024 17:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734714619;
	bh=Kvm9O4+INcYwhlX7t+LjqSk8tdPDCz+JRGSH+Vqz5FY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GQvkrUEqxu/uufRwlBkNUYppbyrGpP1465p0FBlPSL+3bm5PdN9vRYYW0dFVlxyI0
	 XQMn/6Z88kJjTR7kymZiBUPATwIb9E45ks+NJTX2o3fnRYZNiJtMQFKeVrxglQyz2j
	 UgoeWqTO/2xz8EzblRn3q+eYJt3kIlNF1i0q0bBDx86xTwCt00/dxjDCsQRNUGRb/A
	 5An8gc+CU6TB1mUAHKHa/BCHweybzSI2/aULlNkjmvuZhcutnniJ+LwLCW/gtJmhww
	 HWr0POBIu1s2kMpWE/rvjAFIHTteckzXLp9teENIevGfv4mu5HRWKpR1i29SQ4aPCi
	 eEJe3Kyxm5a9A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C6B3806656;
	Fri, 20 Dec 2024 17:10:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/1] Broadcom devicetree-arm64 fixes for 6.13
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173471463674.2963436.14169474616013431004.git-patchwork-notify@kernel.org>
Date: Fri, 20 Dec 2024 17:10:36 +0000
References: <20241217190547.868744-1-florian.fainelli@broadcom.com>
In-Reply-To: <20241217190547.868744-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 17 Dec 2024 11:05:47 -0800 you wrote:
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.13/devicetree-arm64-fixes
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/1] Broadcom devicetree-arm64 fixes for 6.13
    https://git.kernel.org/soc/soc/c/a31ffd6ed5ee

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


