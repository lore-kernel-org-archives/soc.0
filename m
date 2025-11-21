Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AF12D2486
	for <soc@lists.linux.dev>; Fri, 21 Nov 2025 20:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763758246; cv=none; b=CnUkSBS34EAzGOWS/vbal48xUekVIrN5d1L1NLmrjnmX8aI2x4PIKJeKwddCbERaw1ECtBfpyu8FdVw868cKPIVvxyWlsAcJXUz0YuANSsMPRAS+aBumTO8iOngxr5F+HzLUR0379zx7tKUPqELRKYBMW2QUj3n4Ds1FJPuasoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763758246; c=relaxed/simple;
	bh=oviDDZMzIEMal25u/bhspw1ZqUVtYUTtuVnPR+t8XQI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=pGddx1/VZMV9YFuA1yOTwt5ON2pbeAGDYAEN3ANSyYYrPsOlVvVfXreGqz2kzOQ+VZNKClIiP00WsVVU4t2jpEK1ukKvoqmgw6ra/q9R7Z+daJbkrsOso7cJ5KRHUVY4cPI3EnajHWG6JvBKo7mdAl3IIRENl8gz8bc1W/npBAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oGG1CQr5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oGG1CQr5"
Received: by smtp.kernel.org (Postfix)
	id F2055C116C6; Fri, 21 Nov 2025 20:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC229C4CEF1;
	Fri, 21 Nov 2025 20:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763758245;
	bh=oviDDZMzIEMal25u/bhspw1ZqUVtYUTtuVnPR+t8XQI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=oGG1CQr5RIVvQ55FXRPo69PalAeTekXy6P7CV7XHaOFgIHUC+tDbHiHG7V7Oim/iw
	 zEAX5vWpgLiX1PSWKzor/KHt1cf+OxlPrTcEU5rBKVgjni627ACG4+Fn/HAbfayefR
	 zILs0NqZ/h4naAsnmnK+jsLxdu68LGyiyp4d4UXJYwBevYgWxmT8vkOoPEzMBcU7aD
	 wVoZ1ZzRKClfwTbvAydVmJfxth0AEm13QqHJNBwIU5or8D8ngvqDX1Pr9eNEHGSJy0
	 WpfgtywCTl8ys+wM6ecndaDls6umt0/djWaFkAmG6dwZnN6AVUqupm4Z5PrjFV9CT5
	 6LJ50kCdY3VIQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADD623A78A68;
	Fri, 21 Nov 2025 20:50:11 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 defconfig updates for v6.19
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176375821052.2580769.13083616448650118499.git-patchwork-notify@kernel.org>
Date: Fri, 21 Nov 2025 20:50:10 +0000
References: <20251117205341.3177221-1-andersson@kernel.org>
In-Reply-To: <20251117205341.3177221-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Mon, 17 Nov 2025 14:53:39 -0600 you wrote:
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> 
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.19
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 defconfig updates for v6.19
    https://git.kernel.org/soc/soc/c/922ef7512dd0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


