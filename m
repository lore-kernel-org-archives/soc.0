Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439C212B169
	for <soc@lists.linux.dev>; Wed, 15 Jan 2025 17:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736961067; cv=none; b=qASa1m1mYaPZydTuK6rmXvQxUs+KiPAtRtcUwkrZIeajso4GE3Y1tbuCCYWOD/WNaWYQDCY11LdHHTRDfDIYTHsoDGx+zOehoNNyoMz7IOabDJHZTPhbJAr12CFhOPysExkYnnsuSOC/VhmiRWCAQ/eZu3qYAhid6DDy9B1k0KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736961067; c=relaxed/simple;
	bh=W4Zpj8IgURbym+YKveC6T9ah4KipdhNjKFI0923MxCM=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=tNIKaU5scXlQFtozKgDAkhB6heVVa+WY2RVpfORhA+nIdmqXPkSFpKUXhnZ5J5YR+KADvEBRSr8GNhpFtUKfrH3Wy5FJVg3mRJV3LdPuMIij1aQLuO7EiXOF3ARTbBwWAXnl5AKtW5OlVkiOCoJPtYs/Wu9Joy6LiTFFRp0Aylk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M7hUqciJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M7hUqciJ"
Received: by smtp.kernel.org (Postfix)
	id E7549C4CEE0; Wed, 15 Jan 2025 17:11:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D17E1C4CED1;
	Wed, 15 Jan 2025 17:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736961066;
	bh=W4Zpj8IgURbym+YKveC6T9ah4KipdhNjKFI0923MxCM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=M7hUqciJzS6F0Hsd1HWjBNotbkr6hKAJ6SWCs3rI0NrR1W73M4NvMyx2T0z5jR0EY
	 nVHD3T7uM4T/iYds/7otx4i0PPSfiN9HRv/BT41JY8zeSs8ipVFmu4S276ZukmmgDL
	 tfjQRYtQplwCexJXaM+0EKwIB4zfMpvwV3g8P4ecEb56aceqasiDdZP6u2BkfznqvS
	 HhUOpJaj+apHQceDYYRX1i632eotY1as9/DqI9sJArBEUK5HxmMlBRNmof6IlAI6vD
	 IgUsa7upeKgCbxkAYDu/rNjXpCFZXM2dSQxw+YtAEvqZ5AP0+4+E2LR+PNwjeByDap
	 AbSrNYNoMKHbA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAE47380AA5F;
	Wed, 15 Jan 2025 17:11:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL 1/4] soc: ti: Driver updates for v6.14
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <173696108957.809051.7034558065440008472.git-patchwork-notify@kernel.org>
Date: Wed, 15 Jan 2025 17:11:29 +0000
References: <20250110210753.exsx5yxmxpcdn64y@amicably>
In-Reply-To: <20250110210753.exsx5yxmxpcdn64y@amicably>
To: Nishanth Menon <nm@ti.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 10 Jan 2025 15:07:53 -0600 you wrote:
> Hi SoC maintainers,
> 
> Please pull
> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
> 
>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
> 
> [...]

Here is the summary with links:
  - [GIT,PULL,1/4] soc: ti: Driver updates for v6.14
    https://git.kernel.org/soc/soc/c/352bba6c19cd
  - [GIT,PULL,2/4] arm64: defconfig: Driver updates for TI K3 platforms for v6.14
    (no matching commit)
  - [GIT,PULL,3/4] arm64: dts: ti: K3 devicetree updates for v6.14
    (no matching commit)
  - [GIT,PULL,4/4] MAINTAINERS: TI updates for v6.14
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


