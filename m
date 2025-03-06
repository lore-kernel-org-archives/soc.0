Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A3B21149F
	for <soc@lists.linux.dev>; Thu,  6 Mar 2025 16:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278708; cv=none; b=R9mXzg4scVEIYZ7I6qigvsXamOorSh6VFvJaBAcUM6FWs9oZP4MTUwMmMDKnBmR/uQNcXb1+s8cTug5yzCRaKDQxlCBLjUUAwfkq++dnGprDd/O1mANrUYVlkfDRgLWwXr5uWfS7E0V1lxfIsrulsGLlv3kazSON33F7jwOOvAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278708; c=relaxed/simple;
	bh=Qr0Sb8T0MfcOHQpr02cWt8/4a4ailGRzTQ+S2F+J2LY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Aq6fr9u4ekwiceDOtPutkdKl1Znd6/0DR6/MueciCce8ev9N90wowcStEjQeLsEA1KNJO3qL4rEBB+PUOFpavKxKl1///7bJsfwf8SRmskJBIQZANJ54WHM2eYgt0islr6QBZxFLnY2KQVkP9XB7iT8vNTCHAjRxs3CNcm9Z34E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gj8UF0mc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gj8UF0mc"
Received: by smtp.kernel.org (Postfix)
	id CE486C4CEE4; Thu,  6 Mar 2025 16:31:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8C5EC4CEE0;
	Thu,  6 Mar 2025 16:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741278707;
	bh=Qr0Sb8T0MfcOHQpr02cWt8/4a4ailGRzTQ+S2F+J2LY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Gj8UF0mcAYKB/ZsSMx8AyQjKnlrHxvwNhw4pMc9gIqfNCLyl70wxtrYsCs5l/A1c/
	 /OydQqkzl0Sp5qHiX1AJgfznTOj2F0IfBVrDg+P2lL/pF7uzNajimekSdjM2hKhedy
	 V8Lh6GUwzqKRJQ5B/vPof6uw4+cYXmlULKx1CWpIHCmkwbMS+p71pX+3EMIt3eu8GX
	 KbPK0KIDKPRcVdXTSghzHX9s6x8Bbw9id1TJrHYrh1K5IkcWZ9xAFqZfSOWuCEjsDH
	 wOgBFe9v/oKOtzDKeHm10y62/ixI+akK8nRBoX7utklqKNopmSP6ygtoxemQ9qbePl
	 gyL6kTE5/kHLQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3549C380CEE6;
	Thu,  6 Mar 2025 16:32:22 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Second batch of Apple SoC DT updates for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174127874098.1655995.15335481172568865749.git-patchwork-notify@kernel.org>
Date: Thu, 06 Mar 2025 16:32:20 +0000
References: <20250302115808.59172-1-sven@svenpeter.dev>
In-Reply-To: <20250302115808.59172-1-sven@svenpeter.dev>
To: Sven Peter <sven@svenpeter.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Sun,  2 Mar 2025 12:58:08 +0100 you wrote:
> Hi,
> 
> this is the second batch of device tree updates for Apple SoCs based
> on the first PR sent earlier [1].
> This one adds nodes for SPI controller, SPI NOR flash and NVRAM partitions
> for M1 and M2 devices. The SPI controller driver has been merged for a while
> already and we just forgot to pick the device tree changes up.
> It also adds the touchbar digitizer nodes. The corresponding driver and
> dt-bindings are already in -next and should be part of the 6.15 merge window
> as well.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Second batch of Apple SoC DT updates for v6.15
    https://git.kernel.org/soc/soc/c/ca6db056106e

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


