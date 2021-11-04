Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FCAFC433EF
	for <soc@archiver.kernel.org>; Thu,  4 Nov 2021 00:12:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 3CAF6611ED; Thu,  4 Nov 2021 00:12:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 23908611C8;
	Thu,  4 Nov 2021 00:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1635984767;
	bh=R53xwiOKPYuPoGfkTMoKbKJWWekdbSb/uj3EIaw5hEo=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=AMLhYAVvAYSKEPz/cR9H+hcHpw6+L8/vpzdn5K6KYOIVM+UShTUfMfOyYpRK8QOLM
	 cqMT0C3UfJgf2O1SK+S33NEKt/o33qRleut3y7Ln9vxPTzQpXhMyP/EYUpJSWKbEEI
	 2AiPjePBiNxPqJT9MItKskj8/pjF1wtY2MqA1cY2TjiwKYEgoVZKA8NVpHhefeNDvW
	 CzJWpUEw8Q24R9g0p+DwCnRHE3oI2IchTnU6keIpNcxJs+mHD69dSw7Q7XusURnA6L
	 LFFImNUdFKIMaGU7Cb4M16YawWzG3ebm+RpudD+JS8pqg9GfMMHHwOL3gDPVmSJ/q4
	 W3+fJbk1LaUcA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 19025609BA;
	Thu,  4 Nov 2021 00:12:47 +0000 (UTC)
Subject: Re: [GIT PULL 2/4] ARM: SoC DT updates for v5.16
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a3A94cW4hxjkgDu1OMH9iJYaONbktZL=yfjxVCWLLGiYw@mail.gmail.com>
References: <CAK8P3a2FokRce-oN3dRJPihmDPWuqgWfWg1FNG6WKpWiUa4eNQ@mail.gmail.com> <CAK8P3a3A94cW4hxjkgDu1OMH9iJYaONbktZL=yfjxVCWLLGiYw@mail.gmail.com>
X-PR-Tracked-List-Id: <soc.lore.kernel.org>
X-PR-Tracked-Message-Id: <CAK8P3a3A94cW4hxjkgDu1OMH9iJYaONbktZL=yfjxVCWLLGiYw@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/dt-5.16
X-PR-Tracked-Commit-Id: c17c7cc775b31ab54e8cba05f9e7b16fd32dd84f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ae45d84fc36d01dcb1007f4298871eec37907904
Message-Id: <163598476709.32364.15264904338517574638.pr-tracker-bot@kernel.org>
Date: Thu, 04 Nov 2021 00:12:47 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, SoC Team <soc@kernel.org>

The pull request you sent on Wed, 3 Nov 2021 23:53:43 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/dt-5.16

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ae45d84fc36d01dcb1007f4298871eec37907904

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
