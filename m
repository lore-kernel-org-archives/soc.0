Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAD3C54E58
	for <soc@archiver.kernel.org>; Tue, 12 Mar 2024 20:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CB879C433F1; Tue, 12 Mar 2024 20:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5B9EC433C7
	for <soc@kernel.org>; Tue, 12 Mar 2024 20:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710275430;
	bh=gdXT251lYTxk1fJrQ0K9C92yAarTqzV/GlmxlWVpKHs=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=EQln7uOBhTC0dVdrXnTxY26NEj2xFtLoOlSihuGydQwhKUCsI13TKHAnGNs0qu0DX
	 zgMRm9b4wGU79eJx8QB8sYyp1po/F5PrhAfFyEj7sRDRxpb7ESwsFcErLWVmNcE4Xi
	 RCopYmdiCp0J0di4rqH28LQtXGDhIfGUJXC6QQy/3Cd/BDMe6Igr/lW6udVnrW8DAe
	 0TUmVA5ttw075KZhVOY0Zou3hrz/LHtqeuEZqpQ+V+O6SvPa+iOAfn2k3UGo2iK3hK
	 qgeh3wBDi2gASy19Ej2n+p56AUwglcqy6dSxO3l+NfV8bkL+xnvmzWf5BIxONAG5Jk
	 I8nuLGUh+SFig==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 913ECD95053;
	Tue, 12 Mar 2024 20:30:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <171027543051.9906.13301038529763584554.git-patchwork-summary@kernel.org>
Date: Tue, 12 Mar 2024 20:30:30 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Series: bus: ts-nbus: Two improvements
  Submitter: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=819385
  Lore link: https://lore.kernel.org/r/cover.1706083174.git.u.kleine-koenig@pengutronix.de
    Patches: [v3,1/2] bus: ts-nbus: Convert to atomic pwm API
             [v3,2/2] bus: ts-nbus: Improve error reporting


Total patches: 2

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


