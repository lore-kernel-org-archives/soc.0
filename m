Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D130C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 23:09:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01CC364E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 23:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01CC364E53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=jtd3cCr3jPnoe425az0nFlTuLyp7HFd5Ujx7qWVqf6Q=; b=a0Ge6Vx3Yjz8hDDLaQV3dRKuS
	/LNmYVw0Sk8Mc2ysRYygcMX0unqgd82HBx9ZxGjLC8t/4yH9NRFpibArkJXm497oiXf0Kj3A1BIAY
	D+e4TgQpD+UVbITIx1ndWwzeg27NuaVCpsQX3rYou7kHcVMSlCSbTlro4V03BnzNWeCoz61W7iKc2
	7QOhziSEPxiijE+gvjq0cTMGdYfi14nkBn67p1k6AZAhDCsrb8E4tdTOO3Oiy/dMAKaSdiJfdgJ2o
	IkiQMExs3kD7t7B+dQ1gby5EYgurQcOrCwCgncsHtAhCfIK8JdL7q1WPeA6PoCogDc4MBxKX+6Iwh
	3T7OZusWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9c75-0007o9-Si; Tue, 09 Feb 2021 23:08:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9c5m-0007Jb-JU
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Feb 2021 23:06:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BDEB764E5B;
 Tue,  9 Feb 2021 23:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612912005;
 bh=Lm9mD4TDfrKP1FuvKDuBqUCGzT+XEF3aP3SSUIiU0KY=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VDKRJ2sY8nWqMnz2TQkom7CPgr6y2frh/3ZScMz2zjEvDUPtfM99P+O/wF3CdKHzs
 rITHFTxCLbnBo8utWwyj8fP0DQfOXWZLR8HptxMllYjp3AB9VKneoIxxNHm4u9HnQ7
 4oubjlff2/NbGfae3JggSBT6xDnKAWaUvF/7FTC7t1nF6chCsHxKLDSqAcQrddSAU4
 1sZuuYBJj/O01fXEN8rzDsMq3FIfzp6rXm+5rkZLpJkCRyPx15dO+bXhBou+m1lz8A
 ceo7vK69do19cHlltuBA9LEcyOWitZyP5qUv2wWB2lJeXkpeQn7+jdp/WxI/XtYnic
 hKPxfyK80N8PQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [GIT PULL 4/6] i.MX device tree change for 5.12
Date: Wed, 10 Feb 2021 00:06:13 +0100
Message-ID: <161291108085.974605.6481239956002704956.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210204120150.26186-4-shawnguo@kernel.org>
References: <20210204120150.26186-1-shawnguo@kernel.org>
 <20210204120150.26186-4-shawnguo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_180646_780088_25D0C425 
X-CRM114-Status: UNSURE (   8.48  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Stefan Agner <stefan@agner.ch>,
 Li Yang <leoyang.li@nxp.com>, linux-imx@nxp.com, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209230613.GDMKCTFi4ar7pagvx6HdRC1Tx5yXt95WXaAqxNDCVGI@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 4 Feb 2021 20:01:48 +0800, Shawn Guo wrote:
> Tag imx-fixes-5.11-2 is merged into the branch to resolve some
> dependency around imx6-sr-som board support.
> 
> Shawn
> 
> 
> The following changes since commit 82c082784e03a9a9c043345f9bc04bc8254cf6da:
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 48a60549d207c0e5691b88cd91305a7c0521cef5

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
