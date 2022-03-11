Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0223C433FE
	for <soc@archiver.kernel.org>; Fri, 11 Mar 2022 10:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id BA3CFC340F4; Fri, 11 Mar 2022 10:50:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4FC2C340E9
	for <soc@kernel.org>; Fri, 11 Mar 2022 10:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646995810;
	bh=5ld1aFqnsdKJUi5x/BJP+LC+mnCzJ4F85gSl/EoDfe4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=QlBFZdJf4/u4zwS56ICMpuv4K8D/wbfDUWFkjJJJzNWHZxWZZ03zZO6o122IYvsbP
	 CWl9JV/wlysWXIDF07N+iRxTxnoKZZicgoAMxfDE16ZyOC95QiWP/DEGf+FHQAXtn8
	 IPeBteq47+q4k599IW998lI8UDF4FNFEfiAWdKBRY2pzPVY+cNrE36Ejw7OCsmyjPf
	 5h3vU/4BULH3sGnKhobgfgu4ZsN9fKflQZfGa94ii49giI7YBnJpXeB5lZK+bdGUdg
	 IvwSEmEwA5aaW3VGb3hQkcXF7lkiqmHAJQx+aaoWliFTF/5zT+TN6PJ2EFQryArKsw
	 LfUAhZ22qjzDA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 75662E8DD5B;
	Fri, 11 Mar 2022 10:50:10 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164699581037.25725.1744432189324903653.git-patchwork-summary@kernel.org>
Date: Fri, 11 Mar 2022 10:50:10 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: PL022 DT fixes for seattle, lg and lpc platform
  Submitter: Kuldeep Singh <singh.kuldeep87k@gmail.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=622558
  Lore link: https://lore.kernel.org/r/20220311093800.18778-1-singh.kuldeep87k@gmail.com
    Patches: [v2,1/3] arm64: dts: seattle: Update spi clock properties
             [v2,2/3] arm64: dts: lg131x: Update spi clock properties
             [v2,3/3] ARM: dts: lpc32xx: Update spi clock properties


Total patches: 3

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


