Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57024C04A95
	for <soc@archiver.kernel.org>; Fri, 23 Sep 2022 20:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 12006C433B5; Fri, 23 Sep 2022 20:50:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC98BC433C1
	for <soc@kernel.org>; Fri, 23 Sep 2022 20:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663966216;
	bh=340Tk6h4CKuGjB8UkiVayK/kS4ptIMBX6x8ccac56dE=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=ds+Mi8cDclx4axXdB0EQ6cfzraBmebbOL98NNh4n2ydjyospZGVCrzjV/ZmQJxRLR
	 e33opZR7WRxKEE1mV4ztxMhftWKfXHnl9qiuyZarXRluOhoUKsCSj43bs6qvReziNq
	 98mvy+qJR2+HIa/+g+heiTXGGJFCh8bJ2s1T23F640tFaRQ5z+GEZ1NxNjz/zwLKMJ
	 3OBSL3xRXykFD0/i5x1L7UBv5WFcYuTi4WEvSCHOkSJvMEHUnx1Q60deGkUn6jcxXe
	 FJL8TtR0efpRjizlWXy/CySYEQvscefkswv+QsGkWXS3A8t7hhDQSNpalTN05ZbE8A
	 zYenk5Wxuaqzw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BC7C9C072E7;
	Fri, 23 Sep 2022 20:50:15 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <166396621570.24262.6859087735410477991.git-patchwork-summary@kernel.org>
Date: Fri, 23 Sep 2022 20:50:15 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: Renesas SoC updates for v6.1 (take two)
  Submitter: Geert Uytterhoeven <geert+renesas@glider.be>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=678182
  Lore link: https://lore.kernel.org/r/cover.1663588772.git.geert+renesas@glider.be
    Patches: [GIT,PULL,1/2] Renesas ARM DT updates for v6.1 (take two)
             [GIT,PULL,2/2] Renesas ARM SoC updates for v6.1


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


