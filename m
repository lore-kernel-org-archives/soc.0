Return-Path: <konstantin@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03ADCE8D5C
	for <soc@archiver.kernel.org>; Thu, 19 Sep 2024 08:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 63321C4CEC6; Thu, 19 Sep 2024 08:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D92BC4CEC4;
	Thu, 19 Sep 2024 08:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1726734230;
	bh=g4lRFBu2pFhycGu71QfqA5RZhuiFts/exn4I0Dgjxpk=;
	h=Date:From:List-Id:To:Subject:From;
	b=pm8SzSedSVBXUWtjFMgHhHQ8JzeMCqDx3I1f9eWEezu8IOyrQ/2/J4cLk7F7PnAqC
	 Oktm/kbf73LN15LE+wjwwrAuFHH8mDD+31LRn8J0mlM1FyDysXLItvv9XBlkZ6UbHD
	 /gDedvIxVO1yxOxWLlFsLeMqdrta0SOEAHpqiOs0=
Date: Thu, 19 Sep 2024 04:23:46 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: Making this a real mailing list
Message-ID: <20240919-rousing-jumping-magpie-c4c611@lemur>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello, all:

A long time ago now we set up soc@kernel.org as a "pseudo-list" that uses some
postfix magic to pretend it's a real list in order to be archived on
lore.kernel.org. This setup is a one-off arrangement that periodically causes
unexpected problems.

I suggest we do the following:

- set up a real mailing list called soc@lists.linux.dev
- configure it to also accept soc@kernel.org as a valid list address for
  continuity purposes
- subscribe current members of soc@kernel.org to the new list
- update patchwork to make sure it receives the new list data
- update MAINTAINERS to change `M: soc@kernel.org` to `L: soc@lists.linux.dev`

I don't see any downsides compared to the current setup, but please send any
objections if you think of any. Otherwise I'll go ahead with the change in the
near future.

Best regards,
-K
