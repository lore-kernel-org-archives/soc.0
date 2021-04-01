Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D19FC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 21:16:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25C2E610A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 21:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25C2E610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QsQ8VE/c4YJ/T8PozXQU0CzbUnmh0Dix7cyqVM00O24=; b=qJYfxGQhFAIdOZOSGk8kmrIHa
	vdYAAsKY59PkdiTHTF5Gx5kfCXoPCkBXpq6tyeR3TaXHhrVlZH59oqh7RCm0nFTxSxnfRpJWmBYku
	PEKaKyidddIDIanENvnGBsu6IfuDTStO9e5lg1J2NGrwyalRZ1aDXRlH98WbBGdgW7I5blE3p6zuI
	K8BIH0mpxRboNRIHr+lscy0awA2Jzm/8pd0QZY/nxSYV5r1VA1/UBrfGzCAxAUpGBo0YhfVecYXWp
	i1PdaZoNHXNK1jciSNglLwRTqm7BfkMqtCSrzCYVz5Mko2zVEdDxp5irCGvimF4rCrlHDpmUBXGJW
	2ag68nGOg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS4eB-00B1hP-Lc; Thu, 01 Apr 2021 21:14:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS4XD-00B10D-8L
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 21:07:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7644E61108;
 Thu,  1 Apr 2021 21:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617311235;
 bh=6453ln+PWqcrJ98JQvBIu9jIGZoVpnsbf/f/L7AgyMM=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KG1htfkrBDEI4My2o/ecc0MN65re5loVpfzcXgfqozMgUe1SdyLwI01PkdVaYr96J
 bNskXkJ+GNkVHbRsCNqZ7BBXQzYVhiEcLh35W3spLwx4WLz9ukHBzWR5mTSt5SBF1m
 Ah/QE+JHdRvrcwhTNXdpJGSyGfhH+ZLVgtaa9l/csRimc/kLL67/pycDC0nbJyb1Kd
 VlHhyr7mE52SHWAWANnGtFYRATldjhLqUxT5Nnpvq+3IEhqMg0z4rfDDKDM6djseu3
 q2jdwnIN+0fat0Y9zi4YjtoJtUUIv/l3llDyuFQ0XoXiB0D2AuIw0V0bxMee/VPn+Y
 Ohq1mr/GHDwQg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Shawn Guo <shawnguo@kernel.org>,
	soc@kernel.org,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-imx@nxp.com, Stefan Agner <stefan@agner.ch>, kernel@pengutronix.de,
 Li Yang <leoyang.li@nxp.com>, Fabio Estevam <festevam@gmail.com>
Subject: Re: [GIT PULL 2/6] i.MX SoC update for 5.13
Date: Thu,  1 Apr 2021 23:07:05 +0200
Message-ID: <161731121864.663132.16506818644518053696.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210331041019.31345-2-shawnguo@kernel.org>
References: <20210331041019.31345-1-shawnguo@kernel.org>
 <20210331041019.31345-2-shawnguo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_220723_643441_87E8C50F 
X-CRM114-Status: UNSURE (   6.38  )
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
Message-ID: <20210401210705.HJNr1KT5UvZQrdtaWrncv4WueevUAT5CkLZRQw9db4g@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 31 Mar 2021 12:10:15 +0800, Shawn Guo wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-soc-5.13
> 
> [...]

Merged into arm/soc, thanks!

merge commit: 4f9c62d1f79c42674e8ba0c4592a438c21fcbf23

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
