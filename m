Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 702A7C41513
	for <soc@archiver.kernel.org>; Fri, 26 Apr 2024 16:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 5447BC4AF0B; Fri, 26 Apr 2024 16:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E8E4C4AF08;
	Fri, 26 Apr 2024 16:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714148483;
	bh=l2FTrIzg+sDuLELsYRDOL+lvNsTfmX1ByKZws12Ri2Y=;
	h=Subject:From:Date:References:In-Reply-To:To:List-Id:Cc:From;
	b=lLkSpKLfPXqNDJyY7oNXYJVho5VtH/LRjOkXvLrwIPTrA8z0Ni6dx0qzJJDLjoH+J
	 f6t1RVaILl5TQuaJBg6r5sY45W9lyHe7uh03DsiaMj1NoA+5tUqUnKrDOa/2rBAg4/
	 kIfJw59FlzLCu7B3cqyY1GiCMcjNTYUyIv0pzsTn7u/j77ss/qCJ5SPXj65NyRQ7cb
	 J8sugIhGpLZoagJLK4ZxsuZitnXgWgXK9jXvSkDgP3KeQffRbhtvdWNdCNef5/UPc2
	 XEnl5Ha0eBLuY5GwIN5NdT4iLncqP4tL0S/UehBQ7ENIE3djDTNne+2Ed+A2i8lOkT
	 J5ivVgxEHlosQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2608FC433F2;
	Fri, 26 Apr 2024 16:21:23 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [GIT PULL] Qualcomm driver fix for v6.9
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171414848315.5338.6105490738161777799.git-patchwork-notify@kernel.org>
Date: Fri, 26 Apr 2024 16:21:23 +0000
References: <20240420163816.1133528-1-andersson@kernel.org>
In-Reply-To: <20240420163816.1133528-1-andersson@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

This pull request was applied to soc/soc.git (arm/fixes)
by Arnd Bergmann <arnd@arndb.de>:

On Sat, 20 Apr 2024 11:38:15 -0500 you wrote:
> The following changes since commit 4cece764965020c22cff7665b18a012006359095:
> 
>   Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git tags/qcom-drivers-fixes-for-6.9
> 
> [...]

Here is the summary with links:
  - [GIT,PULL] Qualcomm driver fix for v6.9
    https://git.kernel.org/soc/soc/c/14672a9b3ec5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


