Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A67455173
	for <soc@lists.linux.dev>; Wed, 29 Jul 2026 16:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785340855; cv=none; b=PVeA++uVvNnxKLcABqcEK0S4OAz7jqIFzUD6D5VGTBDoVuAKRpWMO8RoBNAzIQM0GQTSKiWdc4Od+uP3qkSSML87210s6nHwe3sA9mNIKKa6xGLRl0KrXvEbb4NlDeY3sqxUFLENR8l3ZReA78GL70H+O86CjYMTfpmKZ7Bimxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785340855; c=relaxed/simple;
	bh=Asu7iYy8EFPIKa+jEO8men8KWq1q54W2cQRqFEghMQc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=HDdbFola+kQU1T/vNo93lWeV+lHE2SJrUk6ZcShJ8SqzMYzjoCKQ8SDwIKikOh0c7G5vstm67Ob8WlPFAcf85yr1nFDudEbzp71gEItj/m/XLaCbW3ozdQ1UQMMFSnuyCg/zPRLeDv4YO4rykzL5rcKIhIcWNYd65dL3jKTfLWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TAq6ulUT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TAq6ulUT"
Received: by smtp.kernel.org (Postfix)
	id 03EB41F00A3D; Wed, 29 Jul 2026 16:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E22AE1F00A3A;
	Wed, 29 Jul 2026 16:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785340853;
	bh=ozMbpAMT8BjIEyn/Lxcv14FLfyzXPXM23OavtV0Dk6U=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=TAq6ulUTQYpv7quSh43v+SFshlZC2IaDp4HTrUgU/SMq2SF0UQw8fqq639bXBt0NL
	 DWMc8jG7hoP3EbN4CKFZdya1CjEnChjGuhEBNQ1rrCVY93uviySaQlSeVzeFq4AnWR
	 YiLq8oKzhq/LuiGyiLtYUiRCUTVg45hsU832DcNWd2ZZw8Qz2H3D5kyy8LxVxv+Abz
	 v6oDJbdJbCU0ZmWg/I99wIBEbPKZFbflrxAHtrIq+WtFAiMi7S7lXdXJEME17+yzjf
	 39MdfvNAsfwoeaqPIvD98wsXwrq4xjcSGxI/vKawe5dlxyxow2HIXM11esGKK7NFUB
	 leLZrk1nUytJg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 5693A39253CF;
	Wed, 29 Jul 2026 16:00:19 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Rockchip dts32 changes for 7.3 #1
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <178534081789.3143403.4218278176449055644.git-patchwork-notify@kernel.org>
Date: Wed, 29 Jul 2026 16:00:17 +0000
References: <2102545.PIDvDuAF1L@phil>
In-Reply-To: <2102545.PIDvDuAF1L@phil>
To: Heiko Stuebner <heiko@sntech.de>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Tue, 28 Jul 2026 17:21:57 +0200 you wrote:
> Hi soc maintainers,
> 
> please find below Rockchip ARM32 DT changes for the merge-window for 7.3 .
> 
> 
> Please pull.
> Thanks
> Heiko
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Rockchip dts32 changes for 7.3 #1
    https://git.kernel.org/soc/soc/c/d2ccddbbcc70

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


