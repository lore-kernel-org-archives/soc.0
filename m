Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D80BC3DA6E
	for <soc@archiver.kernel.org>; Fri,  5 Jan 2024 10:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C9D25C433C7; Fri,  5 Jan 2024 10:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B2F68C433C8
	for <soc@kernel.org>; Fri,  5 Jan 2024 10:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704451225;
	bh=j/2I5rpPs9QFIh2V+831i7sQ5LVl7VJvXQVohMalnuk=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=tLCI9Mryv0+cRstk2lHKdEoP1JlUX45qhR/yUDUWIkFo6tpHS8gGqAwCuNvQ27d+B
	 LWUFMeAh/cs3J9kFw3sq1CWdVCAiqmWMr2qnM6IyzKB7W1roUhjfnLz08cegh7M/0d
	 MNiykkldLsjkYrkyEAdJo784BSk/DSBE9vJ1rAJIqn1/6+2IyYSKjZe/mdx54G2iTA
	 JMPvLHwUydXn6SdOy1vW+7hZeHeafKSeyuyrcghtbL0mD2M7pkHVsUpGOS/5TgBGcR
	 KPq9s1+UCco907DNFA2DD4xizpEKoP05EgMUNwqnwlatYB6Ikxnhf6RsDHy6y8vvj1
	 Dz7/WGEn3bWZQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8D761C4167E;
	Fri,  5 Jan 2024 10:40:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <170445122552.21771.4765562407226104598.git-patchwork-summary@kernel.org>
Date: Fri, 05 Jan 2024 10:40:25 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] arm64: dts: socfpga: updates for v6.8
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=814231
  Lore link: https://lore.kernel.org/r/20240104001354.152410-1-dinguyen@kernel.org


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


