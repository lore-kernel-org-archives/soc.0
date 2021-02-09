Return-Path: <arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9990C433E0
	for <soc@archiver.kernel.org>; Tue,  9 Feb 2021 23:06:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 8DBF964E4B; Tue,  9 Feb 2021 23:06:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id DABDB64E57;
	Tue,  9 Feb 2021 23:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612911999;
	bh=7ZAyY0kFvIcHeTyX7Q8yoQjLemPKaNWDBWcsAaTeyoM=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pebOjsXaWvoz1Nn7p3gJn5j36/VuF+sPXaO3dL0LRUrKEeDHZ5qtrlv9fT9EamjyQ
	 NF+RbkQoyLCxoq9orwaVO8isWUusX0uV5R+4kU6shJr9F/TiP2qUaYBFfzj7GTDCzB
	 schwSObGKoahBNGW75ALTLeiKMqZEldsxx2FRj0ceDACrKV6+o1AIp5VFdtURRR1n5
	 fAzJ/35+ESLQhJSVBVbnh54YBavrc3fwtSKakGUbS6BNoAwcQ/QvoKeFqMASjJz2vQ
	 QgVZXOLqJLy/2gxMEGtQgBl1r52HeTj+tiMrInh+GFeC4WwRKzcABOrXvTBlBziry2
	 ANazWkzVt4/mw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	afaerber@suse.de,
	olof@lixom.net,
	thomas.liau@actions-semi.com,
	cristian.ciocaltea@gmail.com,
	linux-actions@lists.infradead.org
Subject: Re: [GIT,PULL] Actions Semi ARM DT updates for 5.12
Date: Wed, 10 Feb 2021 00:06:10 +0100
Message-Id: <161291108103.974605.14089940447493072537.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210205050346.GA7619@thinkpad>
References: <20210205050346.GA7619@thinkpad>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 5 Feb 2021 10:33:46 +0530, Manivannan Sadhasivam wrote:
> This PR aims at improving the support for Actions Semi S500 SoC and Roseapplepi
> board. The details are in the signed tag as usual.
> 
> Thanks,
> Mani

Merged into arm/dt, thanks!

merge commit: 74d60e2e93fe0f552532165a807c02c1e298ff54

       Arnd
