Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB0020899C
	for <soc@lists.linux.dev>; Wed, 19 Mar 2025 22:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742422298; cv=none; b=eVCc2U14q2lnzNlGfoZlj9x3xT6FOvd3kDTyyMqI4cd+R6Oaq+ddttxre7f97w+amgi9meJyRuVlsnT55lTS3pkk1Rh2nS0I5ipZZQx5zcRaCdhS28IqHo1BiiSWMM/uKkYDXD5h+DISRxVvTLAzJJKPP/RWCpOXbJ7mxQPT8VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742422298; c=relaxed/simple;
	bh=p0dQEEXNfAGF0SU4aHs8Vutz3paTa1dcOQ/nfyNnX9s=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Nvp3DQudKbYXMmWfiV0zigRd2Ko2tBv8DjW3lBeCv7FMh5fNObYIIiYlBmkYPEylVZ+K95ARivsdAXmdWS4jVgq0k+aJ1hMvuWGL+58pnyNmjfv6+KBaqI64QV0dcdTrKiUX6mOEog4YIycR3zLjavqjmkCpl6Jqkcw6u8bEiaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kAp5aJf0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kAp5aJf0"
Received: by smtp.kernel.org (Postfix)
	id 8C917C4CEEA; Wed, 19 Mar 2025 22:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7687FC4CEE4;
	Wed, 19 Mar 2025 22:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742422297;
	bh=p0dQEEXNfAGF0SU4aHs8Vutz3paTa1dcOQ/nfyNnX9s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=kAp5aJf0+6hSiLBdGidjFyaPqmiKLFdvItvHX9f6aqDYuh6fqx6SNacP0Ri7clH63
	 GD3n1J+BIq5AtFuF597Eeu2c69avBfoK9xgnTmVy9zw9YfRrOFXgDLsoi/+rrADAhg
	 V7THF61wHUTKztB9SfsqLrI2OJcffRI8SFDmhiuK2BRY5saKl6f8AWrDP4HN1KpsL3
	 +yzpMj83Cszvvfrf2cR9YK7jHI+YWQweitvbmMSgk+SVPWiX8bMk6YqUcx7MdkiEnx
	 GZZBnqt6ikAvNI12+8fV1MO8YYnYN8JGXUmKrUGusEUfUV8dDBX9/AAPJ8bgowPKMl
	 /QuG4rVmtfiUg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C943806654;
	Wed, 19 Mar 2025 22:12:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] More Qualcomm driver updates for v6.15
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <174242233299.1211847.3813905912845348972.git-patchwork-notify@kernel.org>
Date: Wed, 19 Mar 2025 22:12:12 +0000
References: <20250319142448.2279164-1-andersson@kernel.org>
In-Reply-To: <20250319142448.2279164-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 19 Mar 2025 09:24:47 -0500 you wrote:
> The following changes since commit 2e14c17a2e3d697bef6b5bf49b253d6e52f3d186:
> 
>   soc: qcom: Do not expose internal servreg_location_entry_ei array (2025-02-14 11:37:30 -0600)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-for-6.15-2
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] More Qualcomm driver updates for v6.15
    https://git.kernel.org/soc/soc/c/64e70a729bbb

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


