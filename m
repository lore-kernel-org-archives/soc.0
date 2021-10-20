Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89DF8C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 14:58:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4674D60FDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 14:58:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4674D60FDA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sEM63CLjsmNl9ebP7XZA6Ua3L2Fst2cvoi44lMbF7FA=; b=StP7hFsCgvwbZz
	fnJ7Oa24jSYkYk6hhsaUwVSb5ChA0tSDjs1r9yLNrSJLA9xkWOMvNeKbbhJa4ECqA+reWkEueHBZ9
	CaseONp3ZWbWM9bSAMOL9fMs+tnAehBT+2FFVfXcxQCh0n8PVVQ8JLfvSz9eNZJsYK4+7YlD7ShU1
	FAvLcuWwAs3GaTXZzyolyqXM8RkxoPs+pwZiPX9kOf73B71Ic5TWLxwj3XaKHiC4a39Cd9hBfzlQX
	KYRoqT7gFoZVvXWO/3dbcQdwSx8HYsyTQ/QWaZ1dhjDlhpqJ/IIJqah8jB5u9bCZVTm+OdG8s9DMN
	fZNrcOPi9/DjlcZmTFew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdD0z-004rYC-Qs; Wed, 20 Oct 2021 14:56:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdCpI-004orl-Qh
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 14:44:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 866686139F;
 Wed, 20 Oct 2021 14:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634741060;
 bh=kEBysfS/YBZVOGFNt6jdMv44BC+4gnb4c7TOErSvrNs=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cUnG7a40slWx2KtXnwSau6VV5qIyWi2uGap9qXRdmCGgXRuLoODo6Ics92Na2pN1J
 WlWHQKOK8KRtdZZF2IsBQapVwD+Ay7mu/guo9pc3x2SM4zMCN9KzX6wNYXUooVmw7n
 JdEF2UFQ2N/Gg/fu4a+Hv3gF7/QikjNKo+tiMEv/SmgxhgvfuBxL7/Ha9cvAZK5jQk
 amD7BTnufHxt9Fykvq+YO4zgt1T/5aDupcnFRf9VepGVTiioHN46v/DB7rcVlv7uFX
 W7SVvFSIZVBpo8tLPwm9kA00LXXXPAXasOHS5Y/4T5clLjwssu9mERJdA5D21W2EQs
 Ftz+j8lyGUNfg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>,
 linux-imx@nxp.com, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>
Subject: Re: [GIT PULL] i.MX fixes for 5.15, round 4
Date: Wed, 20 Oct 2021 16:44:11 +0200
Message-ID: <163474104501.3915621.6629377896939659320.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211018000958.GC25810@dragon>
References: <20211018000958.GC25810@dragon>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_074420_949244_D3773700 
X-CRM114-Status: UNSURE (   7.09  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211020144411.snKfFcYrOIvJoGYGAeRw8HwhoRxI5tfb6dOeD_sY3zM@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 18 Oct 2021 08:10:02 +0800, Shawn Guo wrote:
> The following changes since commit a1467faa10414ab3d91be7ef6d2b11272ec00e95:
> 
>   ARM: imx: register reset controller from a platform driver (2021-10-15 09:38:06 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.15-4
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 72cd4e3bde4e8ad178f9a698996275e20d235b63

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
