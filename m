Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7237C4332F
	for <soc@archiver.kernel.org>; Tue,  8 Feb 2022 09:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A0D19C340F3; Tue,  8 Feb 2022 09:21:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A3CBC004E1
	for <soc@kernel.org>; Tue,  8 Feb 2022 09:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644312109;
	bh=p8Yww3cdbxr9sFFdfOOTIfL92QAyE398k6btBYeNNz4=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=Y+n5siMBAf9mgU0rXXiqGB/Rg8QlJkI1iSbMIiv1PtUZmKIIJbHcs9l+VflYEC24D
	 xu8WU+/NCqXqXy7AJnWu8OxGnB2dNLs9D8yvsk1PbWeZtY4lISXFf0Pd5eSENcaU8b
	 QTQYxwz6cOjTkHbAL1WjeBrFfoU5UEB1hdR4X5ck2pFAx6H8/0CUw+/cLEngBj+w6+
	 h4Hn4BTm45Tc4xJKbySn1J1R8Qv5GLL9PjK0ri1ladJM33uZh+A2tFhaCRmctDNfaf
	 z3miPR+BoXWno8Vo2BoGufe1wRGikXxfQZDWdsc26CdPp5FfXbA08hE+g05SkU0B/j
	 0VCpNDrP1rI1A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6E27FE5CF96;
	Tue,  8 Feb 2022 09:21:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <164431210935.18327.14402699398688225720.git-patchwork-summary@kernel.org>
Date: Tue, 08 Feb 2022 09:21:49 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (for-next):

Patch: [GIT,PULL] arm64: dts: TI K3 fixes for v5.17
  Submitter: Nishanth Menon <nm@ti.com>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=611273
  Lore link: https://lore.kernel.org/r/20220204130716.fjlm4vvcbtzcwlwx@chalice

Patch: [GIT,PULL] ARM: socfpga: fix for v5.17
  Submitter: Dinh Nguyen <dinguyen@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=611791
  Lore link: https://lore.kernel.org/r/20220207101002.7566-1-dinguyen@kernel.org

Patch: [GIT,PULL] OP-TEE fix for v5.17
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=610996
  Lore link: https://lore.kernel.org/r/20220203132323.GA4132001@jade

Patch: [GIT,PULL] i.MX fixes for 5.17
  Submitter: Shawn Guo <shawnguo@kernel.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=609713
  Lore link: https://lore.kernel.org/r/20220129073150.GZ4686@dragon

Patch: [GIT,PULL] Apple SoC MAINTAINERS updates for 5.17
  Submitter: Hector Martin <marcan@marcan.st>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=603725
  Lore link: https://lore.kernel.org/r/24ae6871-3e67-5c7f-2060-28048db439a2@marcan.st

Patch: [GIT,PULL] OP-TEE fixes for v5.17
  Submitter: Jens Wiklander <jens.wiklander@linaro.org>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=608611
  Lore link: https://lore.kernel.org/r/20220126102609.GA1516258@jade


Total patches: 6

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


