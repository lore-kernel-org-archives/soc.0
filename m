Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A80212D6B
	for <soc@lists.linux.dev>; Thu,  6 Mar 2025 16:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741278709; cv=none; b=C+qVgT7aVqgKqPzNak5Qold4xcvXP8D+UeoH1PbI/j36ktqR9t0hO2v3dw385BmBk2M6CY1mVN6Sl2t9jgNH+JqcmaN6hJqXXKJEGPgmyARjNOuXzZQgbgGFaCZFV/uMZqZbxviMxvFQSU5BW/9ccddC8+Zu2NkGWQvQPzrqDZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741278709; c=relaxed/simple;
	bh=gSFp9l+GV/YReusNeaeG27owtRQDpZ/EeHoxvGKsCUI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=FjbZluZsFCa7QqfXHNGY7EFsz9XsWRFXdinPKlgkAM1mThLZQo+SHVBhkIRPWNFRRJ4MG9r15Z2KG/at3vD9FDOEDe8euzobAoqOPoqJ2g5Z5OqN7+ttlWA5gfAAYK60yKYlRZPFdZRVySTbGgBMrY1C31/0d52oDrCtTs45d20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uQ/jYNPc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uQ/jYNPc"
Received: by smtp.kernel.org (Postfix)
	id 05523C4CEE4; Thu,  6 Mar 2025 16:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3E40C4CEE0;
	Thu,  6 Mar 2025 16:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741278708;
	bh=gSFp9l+GV/YReusNeaeG27owtRQDpZ/EeHoxvGKsCUI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=uQ/jYNPcCZWyJ29puHIdnfPDMVlrzSMex8Z1bd4/6tHk34/+KLThb+6jZBfQ8RbzS
	 tZRiPvGFGIvHh1vnI/459Ba62fTByb1T1tV1CHRykGCJZPs4L/nqSV1N76oLFk5+Pf
	 MhGkX3/dP5ne0qr7qp9qhqPKksPbby1ZlUxA3tPNxfOx2MUKOzzvdBs4WRFi1wMxgP
	 ipzlTLpgMrVBtt2ccEaTMy0pReNXAYWYAhEKryNCh3yiP21i4l6dH6CcQeUg9ETud4
	 RoiVV11wqH3A2UDeflHuYjRayMhR2ZpOrgExGSvLXUuLD1vp4lq2un0fQJthXkot1U
	 Tbn42x++EzLPg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 71063380CEE6;
	Thu,  6 Mar 2025 16:32:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] firmware: arm_scmi: use ioread64() instead of
 ioread64_hi_lo()
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174127874224.1655995.5770719690686079153.git-patchwork-notify@kernel.org>
Date: Thu, 06 Mar 2025 16:32:22 +0000
References: <20250304144346.1025658-1-arnd@kernel.org>
In-Reply-To: <20250304144346.1025658-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: soc@kernel.org

Hello:

This patch was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  4 Mar 2025 15:43:34 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The scmi_common_fastchannel_db_ring() function calls either ioread64()
> or ioread64_hi_lo() depending on whether it is compiler for 32-bit
> or 64-bit architectures.
> 
> The same logic is used to define ioread64() itself in the
> linux/io-64-nonatomic-hi-lo.h header file, so the special case
> is not really needed.
> 
> [...]

Here is the summary with links:
  - firmware: arm_scmi: use ioread64() instead of ioread64_hi_lo()
    https://git.kernel.org/soc/soc/c/3b8c56d80727

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


