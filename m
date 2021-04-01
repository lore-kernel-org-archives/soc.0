Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0580BC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 19:41:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85834610A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 19:41:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85834610A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UzatTRqsjdEJDTPJbwYUp3lHMoDAbWUaRGQ9pynULPg=; b=YoOHvAOQVvsy5O6jgJ4sz2Tig
	nWX8U+GrTlJEprQ3sUZmoNsQhxTOIQL87Gv5Q9JphdhVrQKeaOqy/7LY4eK8Ih4EDADh/nwcRh4Zp
	g9hmOYkzLCeAO7yzAZGeDzEKF6jZ5pItNn7fk0V3OAglbdR1lgo8aR4rXsMaRi5xm/SVk847tsOsu
	/g/YcSmReFRhoPSG71IpzPMWrk/HXsCO1HqdXvz85b6Eql1WfKhvtTgoFsth0EiJek4J9YDq2gn06
	oaL7p3nCIehrR+uL7QmUNHzVlTw2GbZsWLVDScra9qqVzZhrro8jKb3hrDMfPXNq45aVyiT8H/ymM
	6tGxZQvdQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS37u-00Ao3x-QY; Thu, 01 Apr 2021 19:37:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS2vk-00Am9S-Md
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 19:26:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A63EF610D1;
 Thu,  1 Apr 2021 19:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617305075;
 bh=36/7A4ejCga6d+w0S3CKrAwrU1ERsUk8zB/68nvokho=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kOBa6BE3CW/tlYYvRD7gIrQmnfraJmntIzGM0hQSP4XeMyB5PWj5Nsz51uqxAguxw
 /wABq8BDc+RQfNO84KTyQLnmz9avQd+11i+qn/SnVFTs/o+LCBycXXVOjkJNJLhLYK
 ZcIlowsj28W8OdVwkcbtNXSaUIQA2+/wFja7rQneAvvDX9GEymp8VG2ocaajUkgAgg
 CxjmQMmUvFtDHU/+ocIx5R8gil++dmG/ckPSckFdD8p3gMmvmHaUClduAml+RqL/XO
 H81btc+aguZuAk2YrGvu0BMYy87BNSB3lmHDiTbXKb9cK1s0WZAaybSZ9nDpjc/DjQ
 7s/glElw3N0iQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, Stefan Agner <stefan@agner.ch>,
 Fabio Estevam <festevam@gmail.com>, Li Yang <leoyang.li@nxp.com>,
 linux-imx@nxp.com
Subject: Re: [GIT PULL 1/6] i.MX drivers change for 5.13
Date: Thu,  1 Apr 2021 21:24:15 +0200
Message-ID: <161730504504.632809.4091149331295571068.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210331041019.31345-1-shawnguo@kernel.org>
References: <20210331041019.31345-1-shawnguo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_202628_876190_3B0177FF 
X-CRM114-Status: UNSURE (   6.30  )
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
Message-ID: <20210401192415.M4qeCOLc-MSbaSRwYJ45G0UqKjOoB9NliWp2tbzi_uE@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 31 Mar 2021 12:10:14 +0800, Shawn Guo wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-drivers-5.13
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 62c93360ec5a135061624eb095986799942efcbd

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
