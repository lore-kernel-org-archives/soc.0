Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095C122FE0E
	for <soc@lists.linux.dev>; Fri,  9 May 2025 16:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746807007; cv=none; b=HYgQaRf3nmVYBXWAVRO7MV6NFA9ptmzpvLUYJw04PgPLnsFd0TS8p+wyJ++vluR20GD4pFE3/Hu0VdPK/mXfQx1VqvA6psU6hHUhB1/OKoNojIrKhD9w/6yJajplNzglt9pgOGSZNi6SoBqAeFJSyugdnKNhMPULvTOBd3ieFQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746807007; c=relaxed/simple;
	bh=WiiA9WCLCUJSKT2yYuDgao2V05/8bifwTtN0v+hCQ24=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=dbIFM0yg/3h94qjr3ESUtjs+Dip3/RL/m/2hftBixbmm0pUjywsy45aZq/IxY2hJfPMg6k3evnrI7/tjJMgw1Ep3TNftA8AxzKidP0UXZ6a7fNCvWvBpgoeOu6jCIPRAElEts72HnSxGgZee2+QhCH3reWisgtARWA7mmxsR8tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tcVKawK0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tcVKawK0"
Received: by smtp.kernel.org (Postfix)
	id 902C3C4CEEE; Fri,  9 May 2025 16:10:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A8AFC4CEE4;
	Fri,  9 May 2025 16:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746807006;
	bh=WiiA9WCLCUJSKT2yYuDgao2V05/8bifwTtN0v+hCQ24=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=tcVKawK0wiX1aX54cwbA9JFzLxiI0mhueDJuPyimpg/M9zA9tvaGbxoN2GJjwtDVw
	 ujSxO4yiG2a4Wl/fnh/rCBbZAZTdguchl51LkvawJU0a6lKACg8v+zL0kRDrGWZBzj
	 BpkcWHEs8U5/342rYnUJcXgHAPr+qtrLUuTTVBRHJ++50DYqDbajKBa2fXsdqZFP9o
	 jfPwEKxK0NypzkbpJlLyVsjSoVni4uz+6rqjpzqzDL1mBNnNYs15zycm/VQO4zMulq
	 wiaXFfW4+nuX7a0TtEeC7aasnWzk/N6kGWwrOpWnXGMKgIT1EV06UoM7UUq3IjJZjO
	 1YYpcieU9H9XQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33D66380CFFB;
	Fri,  9 May 2025 16:10:46 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees fixes for v6.15-rc1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174680704498.3673480.4157416148847871729.git-patchwork-notify@kernel.org>
Date: Fri, 09 May 2025 16:10:44 +0000
References: <MA0P287MB2262454C19B8899BC1694D04FE832@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
In-Reply-To: <MA0P287MB2262454C19B8899BC1694D04FE832@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 30 Apr 2025 15:29:00 +0800 you wrote:
> Hey Arnd,
> 
> Please pull dt fixes for RISC-V/Sophgo.
> 
> Thanks,
> Chen.
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Sophgo Devicetrees fixes for v6.15-rc1
    https://git.kernel.org/soc/soc/c/6053915252d7

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


