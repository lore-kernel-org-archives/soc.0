Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D7A2E1F06
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 20:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758660009; cv=none; b=C5KTXO5aCqsWeD5BhjHBO0Yq9Bpc4oRwXePPJv9IOdsnvL1I2curI6qVEOpu9yTO+Nke8sTiqOF1yQ0QauAKHCkJh5+7jIPtvMZzrQwXogj4dfJ/AqnYxAtydClPOPVbeOxLkvmAf8i+ZgFBaxygKePiB1e5eIAMlOLI80/TPyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758660009; c=relaxed/simple;
	bh=opt42JAKuWGW6uP5agAV6w/Et7PU8JL+j6zxbxuDmas=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=uJ32EZAV4pnCKDWUx1N5QVdWeUbmj23BM5K32gtKmq5v7EDbBDvqqdr7ZojjjzyTiINSrVRRrrcOESgZyQgWO1uU8yb/t0tKa4woi5gpG269CjaN5DrMEN+pH5B8R2kux5kdWJ5L4NeBKzIUIF0FHxzzFzpuSklOMf+QT/3LTp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a7p4fJ0H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a7p4fJ0H"
Received: by smtp.kernel.org (Postfix)
	id CE611C113D0; Tue, 23 Sep 2025 20:40:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5013C4CEF5;
	Tue, 23 Sep 2025 20:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758660008;
	bh=opt42JAKuWGW6uP5agAV6w/Et7PU8JL+j6zxbxuDmas=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=a7p4fJ0HrPI4NlttpvccV1rKPxVjKgLrOUgrdw8l/Ia7CPnHP8qi1FT+b2rCHlYxj
	 DdtrFeA775ilas4nsthIJuNgDyms1niEvbVMzp8M0J8D6qFcg6TfH5XVfSis0TB3bx
	 b6lJSI5NvOKO2/dEU6hKdDWpycbqyI21274+GnHsaeQiE/7hv7Bm7xCJ6jn/QTmde0
	 yrjOKpTbsxNLC5Dg+8UKqywQWfQzbOvyxmTRr3ditjCSKVVN2wJ1iKzaTbK9Gl7poN
	 CSSIISVEcInTqtIAAJjKpa0xS0Zs2kavwE+5S8iz8lIbF6Qm0ItNoe+snVvrXbhX25
	 xC8fEL/ktPYDg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF5839D0C20;
	Tue, 23 Sep 2025 20:40:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] firmware: tegra: Fixes for v6.17
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866000575.1916197.4046983935818232038.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 20:40:05 +0000
References: <20250919093034.2747884-1-thierry.reding@gmail.com>
In-Reply-To: <20250919093034.2747884-1-thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Fri, 19 Sep 2025 11:30:33 +0200 you wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:
> 
>   Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)
> 
> are available in the Git repository at:
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] firmware: tegra: Fixes for v6.17
    https://git.kernel.org/soc/soc/c/13923775d5b0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


