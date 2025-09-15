Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D879431A551
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 14:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757946611; cv=none; b=IhGm33h/H3AOeBsz0trOljybdpuJeoAZli7dAcJYa9RHB6Anhp5sVuatWH7Fx5YEuGTsWG3lcO2zOlQahzxe4Ed4kENuIrQkWAbCSRA5IGmzUOoKotV8ToM+CYZQ8/C2nxbt1OkNL6G4M3SVnllIUn0+ejLY29f/2jRGbZwiknQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757946611; c=relaxed/simple;
	bh=P+/LmxoewHxLebP03bFawz02yuaM2GDByexbaDZGwl4=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=q668TMFlceIMVrokR5R0FOMX+uBe/9MXA46sZvm3Xp9n77v1wbt8+dACHWPTs24wWU+7Qy4jZuEPJ0cET+qR3QGVmq4XLIxl+40xFOl2vxABE7z5LQgQW84COURIcBBFUWVL8+qVZ1Oeglg3jXXiN7Yz3o1jhRdTOeLh7F9Relg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CTtqbGm3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTtqbGm3"
Received: by smtp.kernel.org (Postfix)
	id C5510C4CEF7; Mon, 15 Sep 2025 14:30:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFA85C4CEF1;
	Mon, 15 Sep 2025 14:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757946611;
	bh=P+/LmxoewHxLebP03bFawz02yuaM2GDByexbaDZGwl4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=CTtqbGm30wVaAka7s1FXncI2ZWcviW4ab8VyNg9kHQeNUI/jUWLtGetpkmt3ef9by
	 4EI8J5vwABpfr7BPvVCiK5x7SCytbXA1jRUmMynQSeM5ffrLjm/soZzbxvv66+3CGS
	 Ig7SfBfTmzDzIV1jMSeb+nKGkTCXWohVuF4olx1UpfOTQG3Dwq8dGFbAHLgaJXo4AH
	 ZY3yhifyXML7h6R+zn34E0B6AoZw/o5zoc9zjGeeRfsICcx9JeOSScouEav2kNftkc
	 Cb61A1wSiKfWXXsYFOg6dO7bhNjpbPohEDc68CYA4fKKy+o4ZbJIMEkfEtvJw1Zg22
	 Eq6JnG79dLNPw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C3139D0C18;
	Mon, 15 Sep 2025 14:30:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver updates for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175794661323.4799.8864128155022624460.git-patchwork-notify@kernel.org>
Date: Mon, 15 Sep 2025 14:30:13 +0000
References: <20250911215017.3020481-1-andersson@kernel.org>
In-Reply-To: <20250911215017.3020481-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Thu, 11 Sep 2025 16:50:14 -0500 you wrote:
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.18
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver updates for v6.18
    https://git.kernel.org/soc/soc/c/ecdca1af962b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


