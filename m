Return-Path: <pr-tracker-bot@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE9ADC25B06
	for <soc@archiver.kernel.org>; Tue,  2 Aug 2022 16:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CFF3CC43147; Tue,  2 Aug 2022 16:39:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9C3FC4314A;
	Tue,  2 Aug 2022 16:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659458347;
	bh=OqJYUa0qL6oaixMPzyRwyJyesy4CyXBMGFetziilqrw=;
	h=Subject:From:In-Reply-To:References:Date:To:List-Id:Cc:From;
	b=nEhPj9C7K7ZWD8Kf7klS70Skv7pgg91gh2Xfcnjg0Aw4PVNIzwRl81wZ5xDdES9ug
	 cGQzS6XnjdPvIFfgdE96nZJTBOrM5ZcjVRnVPWiiDCx5f1BvHAkV0xAAKV4gqaJ+kg
	 WD1fD6mhDG7Iq7umrDK5JGw8VKxTk/gApTNYmCq80ecfXpvAFvyt4G6GxLM3z/tGAW
	 QWQrP2alux4DQ3OsO8Y9c8DxmYQhKZvKZkJKQYwE9eT2B+hFu3ahRcDgTRX4tRAh84
	 9Op422HD1fbBjisvep6Pf7uVGzF0QFUWpC9Wkwgaeq1RAYiwcPzBVNBd7/2RFGBOo8
	 RH86yqYZ+3weA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id A9A01C43142;
	Tue,  2 Aug 2022 16:39:07 +0000 (UTC)
Subject: Re: Re: [GIT PULL 0/6] SoC branches for 5.20
From: pr-tracker-bot@kernel.org
In-Reply-To: <CAK8P3a1DVcc=AV29AJJxMzBVoU-grFaNet0ndxPgPFvpK-ZANQ@mail.gmail.com>
References: <CAK8P3a3GTzeJUdcjVv-1fL7h7e6XRFPA65-5xseQ4=tyZE8UDg@mail.gmail.com>
 <CAHk-=wgdnnAmDopTKXbS5u3Ty8GgAfuFOSOycsCfe6pSAqunHg@mail.gmail.com>
 <CAK8P3a0L24AxQD_72bHYY7CKvnvcYi4e_+Zq_n6KqWXzD7-G9g@mail.gmail.com> <CAHk-=wjPm7q4ikoErhEn3dgGsO_-RSyYuRYox2oHp+Z0z8FUGA@mail.gmail.com> <CAK8P3a1DVcc=AV29AJJxMzBVoU-grFaNet0ndxPgPFvpK-ZANQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-arm-kernel.lists.infradead.org>
X-PR-Tracked-Message-Id: <CAK8P3a1DVcc=AV29AJJxMzBVoU-grFaNet0ndxPgPFvpK-ZANQ@mail.gmail.com>
X-PR-Tracked-Remote: https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm-drivers-5.20
X-PR-Tracked-Commit-Id: 99978d2fd90b9a43d187dae7b0f3266ccd980c5c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 47b62edcd4eb70ccf4ecfacaf1a960eecfd3f891
Message-Id: <165945834769.26510.5514853847491823701.pr-tracker-bot@kernel.org>
Date: Tue, 02 Aug 2022 16:39:07 +0000
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, SoC Team <soc@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>

The pull request you sent on Sat, 30 Jul 2022 11:49:45 +0200:

> https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git arm-drivers-5.20

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/47b62edcd4eb70ccf4ecfacaf1a960eecfd3f891

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
