Return-Path: <SRS0=E8YZ=HE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2A26C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 17:11:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B17D64F4B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 17:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B17D64F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1VyU4LiEed1fGzGzyYpVNpPe3fncMjsbg/sF/Dgtt1w=; b=T1QGWoFGAOTABeXgZFeweX/9T
	1X4kxbo7NuKRcWFfkxp9KxY+QBbG9+vc9zRIMOnfa2u2l/NDOwS/Fbw8AUvHQ0D3WOSjzMb7TWdkp
	7duEmsg+U2oa9LBK9LG9rvv/Bga2IUIpwTCPDG5GSqPwg8KIzCk6i9P/iz6NkxT3PkY6nMYzmW7le
	QIoSo89mWfRlrdUxQItZGRYbD/WHnbo4iDGDsZLyUS1+VN7BcBenoPN/8Ppth49FzLA/q9x/I4Fpc
	xYai/bJvOJKlYv9lAs+KfdfufikrbBtfrdWWClz2o90KlFONLO02faM/2axoFU0Bj4fRzgRckTIAi
	+n7RWRcQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6zCb-0003Iv-Tl; Tue, 02 Feb 2021 17:10:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6zCL-0003BC-S0
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Feb 2021 17:10:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA7A364E08;
 Tue,  2 Feb 2021 17:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612285841;
 bh=2JJrT5jSpZJqjvFgYPmTs8bfRS+l2D+GVPZs/0zwoPU=;
 h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
 b=kAH/79lipDu/yIAckBJmY/Il54W5T0wnL3q0wA8o0Ioa8ys+XX+qEDtPWEFTSFunH
 uwOf4DsPDFY75VTbAgg+pfKHQpHR6y4wQh9qTtKKklPztfj7wHU0NdOq8gioQTe5BS
 CmYw7Y9kX25B9wFERzhTFGPSKxzv4r+YyMLZHfiCjTX0AYJvjxnBKR4/b3VDa8mzR1
 qW1ZzUVOjXeA8A82dcjO9631RjzeF7OCSkCAg2zWtFQIUREdgsXn4XhEFGT7JjiRcA
 RKXevsWlNhwF3dXOCikef38X/35Xkn4PJgM99MoflA0G4u/JwmL/IyMS28nET7eC8X
 FznMTfIDG/I+Q==
From: Arnd Bergmann <arnd@kernel.org>
To: olof@lixom.net, Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 arm@kernel.org
Subject: Re: [GIT PULL 2/2] ARM: DTS: Keystone update for v5.12
Date: Tue,  2 Feb 2021 18:10:15 +0100
Message-ID: <161228552230.1852435.17404241904576684823.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <1612156910-11159-1-git-send-email-santosh.shilimkar@oracle.com>
References: <1612156910-11159-1-git-send-email-santosh.shilimkar@oracle.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_121042_108365_52804DA9 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210202171015.L4f7KrxrpRv7fBTWCZs5bN3Adlncv8loe0Nwm7UN5ts@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sun, 31 Jan 2021 21:21:50 -0800, Santosh Shilimkar wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ssantosh/linux-keystone.git tags/keystone_dts_for_5.12
> 
> [...]

Merged into arm/dt, thanks!

merge commit: bc84e13f9b1b3e2ac4df988089a9e8bcabb90ca3

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
