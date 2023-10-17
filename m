Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3014C41513
	for <soc@archiver.kernel.org>; Tue, 17 Oct 2023 22:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C30AEC433C9; Tue, 17 Oct 2023 22:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB438C433CA
	for <soc@kernel.org>; Tue, 17 Oct 2023 22:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697580024;
	bh=5EMmQN+tS//YOOSJqKLzpF6puVNKZXMJybGJQpk1SrE=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=ZqQjgn6zEHO8eLZyqYnYnJkTY0b2O8D1YESaWyTM1a+YFHoCnL69F/MCH5Y5hnSVM
	 GdQmWxzMaJ3H0FKZNK8u7UYGziaQa/tnMN1MFqP5Kva+/jZoOGElZDgpVDUJWk7a0M
	 yzfxpTFsXLMkrOVyW5NDH6q2JIaLZgGZ/hO8zbnuK55eDPKKvS7mjLzl2mLzm4/736
	 iU0jyWzzHMInooHalgLz+LWbSl/oW6flpiTlSrOi6msyinU4Wra7g8NRR0XdiWg6nW
	 2RJXsqRuCiU5wxp4HSQUHmVBNbUcwH2YUnHOkBrH8lZ/mRMqfHLujmp34psGTJ10Ab
	 6wfey5ZQfHDTw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 85735E4E9DD;
	Tue, 17 Oct 2023 22:00:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169758002449.24805.14005753313550912943.git-patchwork-summary@kernel.org>
Date: Tue, 17 Oct 2023 22:00:24 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: [GIT,PULL] Rockchip dts fixes for 6.6
  Submitter: Heiko Stübner <heiko@sntech.de>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=793714
  Lore link: https://lore.kernel.org/r/1965242.usQuhbGJ8B@phil


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


