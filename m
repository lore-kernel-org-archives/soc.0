Return-Path: <patchwork-bot+linux-soc@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCBC6C41513
	for <soc@archiver.kernel.org>; Fri, 13 Oct 2023 21:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 99FADC433CB; Fri, 13 Oct 2023 21:00:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 84AEBC433C8
	for <soc@kernel.org>; Fri, 13 Oct 2023 21:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697230827;
	bh=0A9cV9SvZ66tPU7ineqPD63Gv4g30zE+1j6A6ItAFEU=;
	h=Subject:From:Date:List-Id:To:List-Id:Cc:From;
	b=KutRH1eIOBhFStDzS0FMZ/NzXNs1ECtQ/XbQiz1ewwT0StfX1CKYbbNFsFuBh9QSj
	 Ci5wKUnri2wPkeyYbAHnIHsb+3dzjUNw2ZrQmfsJCYx6Ax7H2gUeHJHtIhLEunMVi6
	 NPhYRFAxhbP3u+5AN3ZSjQQ5bpl1Oz4oMr/nBgoiwxaMILdslacy1kDltw62/e+gbi
	 XjrP1nyS9R8Cm9t3mYF9RJPQEpO/ffXZ+cQ2juwwOkSMlWYjBHxaRY61POexjSUy9W
	 gwriqtio6mhEhaabgZuooSgIoPWRVzlWrMgxxvIJYLg7HBtd2HNqb8v1pJsFx63aCJ
	 v4G2bBzRC0Tyw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5DAF8C73FEA;
	Fri, 13 Oct 2023 21:00:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Patchwork summary for: linux-soc
From: patchwork-bot+linux-soc@kernel.org
Message-Id: 
 <169723082730.14185.14096185393524341795.git-patchwork-summary@kernel.org>
Date: Fri, 13 Oct 2023 21:00:27 +0000
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org

Hello:

The following patches were marked "accepted", because they were applied to
soc/soc.git (arm/fixes):

Patch: IXP4xx MAINTAINERS entries
  Submitter: Krzysztof Hałasa <khalasa@piap.pl>
  Committer: Arnd Bergmann <arnd@arndb.de>
  Patchwork: https://patchwork.kernel.org/project/linux-soc/list/?series=792037
  Lore link: https://lore.kernel.org/r/m3ttqxu4ru.fsf@t19.piap.pl


Total patches: 1

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


