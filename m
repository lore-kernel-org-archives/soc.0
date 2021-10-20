Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B329C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 15:15:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 477F561359
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 15:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 477F561359
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2sQeCKuIQf7zqBB/EX/zYFf/fT9kV9Skc2KtwA2+w6Q=; b=heoHRxXd+fcW+w
	1mcBbDTz7aH4NGoeyeAJAsJocjslKKdk4HY/xOtk3Ewyy6vt0tVPzcd43X9o0ZEXWQcoCNxsZc1le
	9bxkAmvvF1856SXGAYD1UAe3tscFq/RfZKanNN7Me/tWglH7MKGMD7UU9E9uvpe1WdLopHzehFZcy
	zZfB9WgeAXuXoTe23RbnrlXruUzGaNDfEqPn7KGT4HqmHKf+d9q87Q248xXcGtUBIT7thM8eQaWEl
	eWSYvYmrw5gSO2wScv3NSWW3IIDEZq+2PfUV4qoZhayb7ej1gktmm5fEeoMZs6ZGZTZQIypuyfNsB
	0QD0+fXQHVc89poJH+NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdDI7-004wLb-QG; Wed, 20 Oct 2021 15:14:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdCvf-004q7F-U1
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 14:50:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CAF3C6138D;
 Wed, 20 Oct 2021 14:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634741454;
 bh=LbRl675vs7y7YIAIXrMfJo55cxD8XyI46R8ykPvw6FY=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NzON+p3UfHzD3XnD+RNyQU32U1qfcBNseI8FNhmOjq3XPjuuHQEKAZFLbaCK3rbGV
 Z5kDF77hND+MhDBknZM9GweZCtr2C1hHbRJ/Qs3CHsKr8mEzP6ljsi9y2C3xmE8SKk
 hi80iCDux0GUXg+zst4xEUViBoUFD7jqH1RbHKJ8KJqa0XfLN0Vz08YAHk3syDvMFr
 shT8tVf0kNkHeYW7OD9pLkUybDzo9jfAg9K2rVYWrbhDQGuZongUam3jE6GWOtzbBn
 dp3XyX8ZcmbXcyncNT5CPX43mrXNCoYJDfdedKvS6BJSheo/6l6Uhmpe2rqPnnLoco
 8vt3NYGfdW62w==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-imx@nxp.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>
Subject: Re: [GIT PULL 4/6] i.MX arm64 device tree changes for 5.16
Date: Wed, 20 Oct 2021 16:50:20 +0200
Message-ID: <163474139801.4099414.5410543268368455309.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211016140138.1603-4-shawnguo@kernel.org>
References: <20211016140138.1603-1-shawnguo@kernel.org>
 <20211016140138.1603-4-shawnguo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_075056_063326_882BB4DF 
X-CRM114-Status: UNSURE (   6.15  )
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
Message-ID: <20211020145020.LSQFoxqilB0x7sJrTeoDPdxJVfSEuAnqvLC1FbgSarw@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 16 Oct 2021 22:01:36 +0800, Shawn Guo wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-5.16
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 8d2214d3a64cdbe5d1b6e1afbcc3ad4d5ca0f396

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
