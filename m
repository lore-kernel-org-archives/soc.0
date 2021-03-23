Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD37C433C1
	for <soc@archiver.kernel.org>; Tue, 23 Mar 2021 17:32:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 99EF2619C8; Tue, 23 Mar 2021 17:32:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1B676619C6;
	Tue, 23 Mar 2021 17:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1616520768;
	bh=px+dsmpGIJX28r5BOs6atO0cDgWqAXesuynL4LCgmAc=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ii+rZMxD8EpbDb65OADZc8WnpegtdKPhJeqYMTFKp6sI4M7oNVTuib+oztDWNLJ0b
	 X95SLAwDxaQINtiMUZB4l/iauVhyBDO6cItPrIVh8fgiwCXpzQrsX71/cplKdGKbLC
	 3DeUCsT4KIbu4lj59/DC4wcIYW8/mPE05YSTIy7N56S1BGk5E0j7WYKCfxr54Q9xp0
	 Bt7wKToc6jMao6pO6+oQRjtETzJeTUAMDAAE9cbFUGd042jbko7wGfo5cjmPYof/HM
	 i7rcRhvyzFMPjx03vmfqLktuy2Eje2eh/NYzyU0zxW/YkV76jUyWpTf96cyF9zbTnZ
	 bA3ejD2mN0C7g==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
	op-tee@lists.trustedfirmware.org
Subject: Re: [GIT PULL] OP-TEE tracepoints for v5.13
Date: Tue, 23 Mar 2021 18:32:41 +0100
Message-Id: <161652074443.2900645.3221618123232650172.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210315113733.GA1944243@jade>
References: <20210315113733.GA1944243@jade>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 15 Mar 2021 12:37:33 +0100, Jens Wiklander wrote:
> Please pull this patch adding tracepoints around calls to OP-TEE in
> secure world.
> 
> Thanks,
> Jens
> 
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 9a752ebe6bca61150f3eeee22a8d7b4516c8d350

       Arnd
