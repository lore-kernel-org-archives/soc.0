Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D49020899C
	for <soc@lists.linux.dev>; Wed, 19 Mar 2025 22:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742422293; cv=none; b=V2XaL1W95H+4VXa0RDkQakKWuBrl+rYipoYu4F2t7Ee2EfTdreQN+EFaLlvtEPLNRcSpr9vOOlahfcb4vOgIFuG/dNfg5xk3JSqUGtFw4XaQ3x1Q6E1ePIne0uUa8lbbHETxXzWxk/K4Wam+NsVgJZZEruUsDl5CeMJVimgPM9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742422293; c=relaxed/simple;
	bh=vByc6rgxmGaN1nbiKlLVA3nqZSpqhoXXTsv2SeNE8pk=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ruT0GJMV86P5bTsLQCfiNqHmiKxJbjI9sm4RgNLyqpwpaE+3m96xRShDXwgsg/cdzMuCGuxRnsa0L0kDxveUQkWSgPngGKTp03V8ag4Jff0gK9xrccn6xdw8NkS5oi/rj43iRo7IUn2/x/o+vmmr2HxCrRKRT2FDO3b38WAEvZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KvXMPSYJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KvXMPSYJ"
Received: by smtp.kernel.org (Postfix)
	id 1FB5BC4CEE7; Wed, 19 Mar 2025 22:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A032C4CEE4;
	Wed, 19 Mar 2025 22:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742422293;
	bh=vByc6rgxmGaN1nbiKlLVA3nqZSpqhoXXTsv2SeNE8pk=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KvXMPSYJJg+znIFxDow2D1ye4eI5VbBMQKetC8093DP8yDqGLgEtbGvpZYk2ufuj4
	 WbHoBHnFpYhzzwvPlzSsBEfz5RcO4G40te6t6ZWT9LbTzjdI7kx+ElLrCRxTocjK1z
	 I1D8eNddj6hClpmW2CimxvP/VyEdLEJiDEiV2WWZg7Gu/pVLzlagaiqtwwnEOXloJb
	 KJfPg2jHfO2M0L0ByASEKSOQbiEYYf/pDmFYrrVRRiDiGLsm/svNIoArbpGWh1pH3I
	 Gs7l7MWHq4FPUHaPEuy0JCx4exe+jbuGGyBSfNo0BsnJR2cXiF6jkmhGtVXloWlanY
	 xrz+fjgNcuZVA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE1F3806654;
	Wed, 19 Mar 2025 22:12:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm Arm64 defconfig updates for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174242232875.1211847.4930447769020458526.git-patchwork-notify@kernel.org>
Date: Wed, 19 Mar 2025 22:12:08 +0000
References: <20250319144354.2281720-1-andersson@kernel.org>
In-Reply-To: <20250319144354.2281720-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 19 Mar 2025 09:43:53 -0500 you wrote:
> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:
> 
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-arm64-defconfig-for-6.15
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm Arm64 defconfig updates for v6.15
    https://git.kernel.org/soc/soc/c/701340d3b78b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


