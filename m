Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B651553BB
	for <soc@lists.linux.dev>; Wed, 15 Jan 2025 17:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736961191; cv=none; b=CpBSiUZ1eZHL5EcBLSxp3QanHpGMfb6AoIjJU5HgQtTuL4sB0w1FMOgGXdcc73FH6gmEsrDF8MpJbs+Rlk4vh2g2T/lYk9v6GSp86hG1ALnyfK+7w8bgLRPy18FSG2TYcZbxwBsTuz38HD84JeHTUlNlqIxE5Jy2yHaswMwmMPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736961191; c=relaxed/simple;
	bh=oRbJ2duoXHOunnZBT7WkAHV3RLvQ3UZLAdEGCovXQBI=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=egvhpBiT/UkPD0XTORS/+i31gpY4nwMzXU7qT/dMLX9uI9SrZzslkoukfJUBkwtvFgFbqPg6ucpR9l3VYnbecfU+wsBCgPILtKYGnhZWVDmT60wffFcq4kTI4H9LX0V5D6flcjlLekZx2bfvocFQcAWjuDuY3biHtpnr1tsWZLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g/kZ4Z2M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g/kZ4Z2M"
Received: by smtp.kernel.org (Postfix)
	id 9A7B4C4CEDF; Wed, 15 Jan 2025 17:13:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84E30C4CED1;
	Wed, 15 Jan 2025 17:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736961190;
	bh=oRbJ2duoXHOunnZBT7WkAHV3RLvQ3UZLAdEGCovXQBI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=g/kZ4Z2MQBqG30t5qGgKuW6hsYCr6UUKm5BGm8hKW7dCjgF8kTHokBLbOZ5dImvVV
	 UOfs26ZdWjFXDz+xCH+pJDL9Ryh32lKIvwxaZV7dlQLyE/Gxq/WDNxvJBTCHc6S5Qn
	 xQNbeXFqZabcjKDzxe25KuOte1hAQRMY6XsA5bK7hujqrTSUhl4Dt1NUG8VelpEe7C
	 o4hEyqsl90lEtyx/kzThIYiHmGk37a7620bkipb4bY07P/2MvX4X+wTpDVLUgxCuIK
	 2SFfIAiobC5eTTRUvFj23M0iORwVuLEYEKmYZVP02w+LLvwdO8+n98jhzdd23y0EDz
	 5EieWtBIThI/g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id ADCF2380AA5F;
	Wed, 15 Jan 2025 17:13:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Microchip AT91 defconfig updates for v6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173696121348.809051.1201069974181601476.git-patchwork-notify@kernel.org>
Date: Wed, 15 Jan 2025 17:13:33 +0000
References: <20250107081424.758980-1-claudiu.beznea@tuxon.dev>
In-Reply-To: <20250107081424.758980-1-claudiu.beznea@tuxon.dev>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue,  7 Jan 2025 10:14:22 +0200 you wrote:
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-6.14
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Microchip AT91 defconfig updates for v6.14
    https://git.kernel.org/soc/soc/c/c036b5230248

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


