Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07C7265CBD
	for <soc@lists.linux.dev>; Tue, 23 Sep 2025 21:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758662460; cv=none; b=E0CfmOZqXqgs8Z3SbNSTUT03qUCSlwkhdBf9KV/ziutidmX45C50urr91VAdjfpA2WGiT7Sk1CxGRSWKDmtfRoCcZoSG4POKAEmhkJ01IoZDn8aACXZKlIO//fPPYuCRanYvNEDAsecr+pDvNRLTDqXQY3bQ0LbVTLIE+v6MKng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758662460; c=relaxed/simple;
	bh=UAIN8Mf9OXqloNKpgH4IEps6Iy8kjNP87tWsHLhVKXg=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=HYw2VY+fWXggw2T0OVfnUcBKLB+pytG7Je6ZN8NtXfOWqYitYGospWzTGvSXibkbGaroQPJstWn/KpXB2ybMypzLMj5TPPqMaY1wJJB3G0tKqqO1e4USydrS+ah2VTD4xOVMpumPfUINilhaZXE2vf1R2rlEOKHo0bJR/hVCHTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jez92kLh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jez92kLh"
Received: by smtp.kernel.org (Postfix)
	id C6A66C4CEF7; Tue, 23 Sep 2025 21:21:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1557C4CEF5;
	Tue, 23 Sep 2025 21:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758662460;
	bh=UAIN8Mf9OXqloNKpgH4IEps6Iy8kjNP87tWsHLhVKXg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jez92kLhhZgeXqna/jF4oMA2/ML5m/e9ruwESQvn2O+MjjKCNbXq5HhpS9Uie3Lb3
	 VzW8yONvicbbPZ5BZ9Hl2Lo4CulfrJo0Jwef9shXDwkvK9yV+n3/9KnVnNoiyKT8zc
	 jvh7X9rTF/CEr1Llk9I5W4teauECXR9aD1S29eoFhuwFoE/FtroDy8gXUtu0tQzZ9t
	 6ubZWyIZ70ndbYSUBPDyG0ia1X0jT9rzDqpD9A2GgjazcpXmqf8PAarnpJLpp/qDea
	 H1Yjz7oDQjSVPL958O0P3GCkDzvMLrW6iSF4ssrlQ+GFfUVnlm8uuipPbzwRlRD6hD
	 S+XgUQmKxzZcw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF6539D0C20;
	Tue, 23 Sep 2025 21:20:58 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.18
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <175866245774.1926563.5670548143721644408.git-patchwork-notify@kernel.org>
Date: Tue, 23 Sep 2025 21:20:57 +0000
References: 
 <MAUPR01MB11072ABA02A18CC7AA9B88874FE17A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: 
 <MAUPR01MB11072ABA02A18CC7AA9B88874FE17A@MAUPR01MB11072.INDPRD01.PROD.OUTLOOK.COM>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (for-next)
by Arnd Bergmann <arnd@arndb.de>:

On Wed, 17 Sep 2025 16:19:05 +0800 you wrote:
> Hey Arnd,
> 
> Please pull this dt changes for RISC-V/Sophgo.
> 
> Thanks,
> 
> Chen
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] RISC-V Sophgo Devicetrees for v6.18
    https://git.kernel.org/soc/soc/c/065106185550

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


