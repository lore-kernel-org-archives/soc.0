Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C83BC432BE
	for <soc@archiver.kernel.org>; Thu, 12 Aug 2021 20:44:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 7F047610CD; Thu, 12 Aug 2021 20:44:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01923610EA;
	Thu, 12 Aug 2021 20:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1628801058;
	bh=9WwxREJRR4U0+2CT6CqVEIrRLcjmcYZaGwYDsR3s8pY=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aIlCSO4z2Poa0fj9tw+WeDbIPQCoAzP1kHWVj9dEXBvl9ugo3pLxtHeA0NeoKKxnZ
	 g8Y/qtDXQ85YIeKft3TUsdLsSNJirztqQc6mOAl373pA0gBxlGfO61XSZaqmtqNfWm
	 1YH3+RR2KY4X9D+tJn0/zDjPldrCT0X3yN5Nv7nJgoFdU9BMNKhJja3iWdvwbGkQ3u
	 K+5NoRdBJh9lxnpMkB3Xhe8/hcyvEvzgcx3UPRG+kR0OMmXx8FYreoGEBzBQ6T/HTZ
	 KvqlltJ3It7Wno46eI4LnDPv5gknrUlarOuwS3jSkazKjcs4Bgq26+ZkRalJWKm8Bw
	 3YoDeTJBuWwBA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: "soc@kernel.org" <soc@kernel.org>,
	Santosh Shilimkar <santosh.shilimkar@oracle.com>,
	"olof@lixom.net" <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"arm@kernel.org" <arm@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [GIT PULL] soc: Keystone driver update for v5.15
Date: Thu, 12 Aug 2021 22:44:03 +0200
Message-Id: <162880092637.1372486.15700318335948204747.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <0A637A41-2353-4900-962C-DBE50BBDE75A@oracle.com>
References: <0A637A41-2353-4900-962C-DBE50BBDE75A@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 10 Aug 2021 23:38:07 +0000, Santosh Shilimkar wrote:
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
>   Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git tags/drivers_soc_for_5.15
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 866e1691ed5beee933c0f8c9268963c33377ede6

       Arnd
