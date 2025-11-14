Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32ECA2F39D1
	for <soc@lists.linux.dev>; Fri, 14 Nov 2025 23:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763162638; cv=none; b=Vozd1JghpHRwpwsA2z4/EIVpLg8cVgHh3fBN1SPWwM3hpI0wXRrdXMJK/MiEkRcM99mSx7xWFsBeEO2AMstROZ8a+NdmlNh+2mBgBNXIGBynJeY8XPoqA7wBDZIn6KGiFE4hmq98ruRke3KMx8O23VLXnCgOtIljFgWs9e80Kbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763162638; c=relaxed/simple;
	bh=cBDxn+H5TKNfsjQ8UIxxX+t1MWqCH7nKvN++kviz0G8=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=mFtVAeS+GU94pN76CSfB7WChII+NMCwzxSXD/I4SM9Gt6MbnqA7Y9/VrisMpaIUB//MPHovWT1pNmHA+6OhLjtZvkHNu8+693KvE5kIB+r9PJmqHWA49lsNq7su5jeU+K1q+PKSugWIW5hOFHYoQRDiZezpDMHwDwQgGkez8g7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f7HzQp0i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f7HzQp0i"
Received: by smtp.kernel.org (Postfix)
	id D9607C4CEF8; Fri, 14 Nov 2025 23:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A95C19424;
	Fri, 14 Nov 2025 23:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763162637;
	bh=cBDxn+H5TKNfsjQ8UIxxX+t1MWqCH7nKvN++kviz0G8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=f7HzQp0iA3N5/3MZ90k0k/GbSy3rdiA+DMN64rl+5pwfrtJrrUU/ynw39u1s8OBVj
	 8zRdZKYC46inSNWnxf8p0LH9JUAL6oHsUCH00bRgxK5Z7DcaDysRnRDQQqdLxsOTXt
	 vm48m15dZMHpl5y391HDdYFMM8am8s/uyjP4bEaVtIm2dmfHowXUz6cc7VvQ7dDigq
	 /UYYGFmjcakKaJTgbFlTtdCBGUoVOT89JvgqrP40yUeWhHNERbwE5Hrf/q1YR0eG9Z
	 SBJVlhV7Wf0dpN7TxFtJPr+GnlOZ5arxx3UaFaGsquqH1ob/P0pZEJgYAEOselqVUd
	 Hvl9J78wJhfqQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70E773A78A5F;
	Fri, 14 Nov 2025 23:23:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Broadcom devicetree-arm64 fixes for 6.18 (part 2)
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <176316260599.1867843.3489502727549714414.git-patchwork-notify@kernel.org>
Date: Fri, 14 Nov 2025 23:23:25 +0000
References: <20251105183126.3923882-1-florian.fainelli@broadcom.com>
In-Reply-To: <20251105183126.3923882-1-florian.fainelli@broadcom.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed,  5 Nov 2025 10:31:25 -0800 you wrote:
> The following changes since commit 6146a0f1dfae5d37442a9ddcba012add260bceb0:
> 
>   Linux 6.18-rc4 (2025-11-02 11:28:02 -0800)
> 
> are available in the Git repository at:
> 
>   https://github.com/Broadcom/stblinux.git tags/arm-soc/for-6.18/devicetree-arm64-fixes-v2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Broadcom devicetree-arm64 fixes for 6.18 (part 2)
    https://git.kernel.org/soc/soc/c/4e08ec0054a9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


