Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6792AC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 20:22:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A55C5610CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 20:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A55C5610CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F+Vn/7/os5OMc7vk0DGULFNI++zrmBoL32sl9+PAxuU=; b=mOdvTgLAotxwm784V1244gs4W
	7xqEE8g+RTmiUGN/1F7uXducpPAplG/4YDCoTdUJiRlp1Xmzu1FqNIKJ73DC+FU1OIlRJ+V8TjxkQ
	lgtqeW2LQ3+31XpIWUtYlagIz9qsb2CHk2MzJIXQ2NDmTCc4cttBQ1QlZ1hrKl63D3iC4g2uE/GKL
	cNyjqx8TsrDsNglzGI3ZrKN2T99RdIfZ/nHms8WKQiIq7rcDxzdKYaSrh0/5UIE4p5aJe/xRWosRZ
	2gGVa9vexkrUkND8p7Oj6CAqoPYnasrSvuc102hJbpjEpORUuNyNvjleZhxbbiaBoVEjpr8GCu4EX
	xqDlY7ZcA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS3mc-00Auhm-7t; Thu, 01 Apr 2021 20:19:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS3jS-00At6c-Ss
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 20:16:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 738A2610FA;
 Thu,  1 Apr 2021 20:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617308157;
 bh=ufg/cRdcxShOJD1Q0EVorYKURcUE0VRxI6kHw442nSM=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IcBY6Erk+ZN8sNvkx+d1OUGDKLCR5yoSyQnmA4e9UN4qKT6aA1W2YtsXFklccJvsX
 tKIFk9bgxz5reNedswsX4SZ2MXlXkMniT7oFU4d9oPZhWWjiCAeQK9DdXeFwUMTVUd
 OUbdoIle5gqwjoYxwa2G15o0NFlFE9YFBqyI4rzD71IYbKGxyu96K3M67BPQSR8nct
 EKlUDEimkOruUWP4XB9Q9jZuDwAfl9WbLwLpYuZCWGq/kGAKPR+Fqa2i7vdhvP7BSA
 b6xHSEpsjrHRDzNAv0aBaOb+41nX1m6SR6o3vmokrxFSqEJ5mcCcifZxNc1/KBclk3
 Yym5gvj6OGfsA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
 Li Yang <leoyang.li@nxp.com>, linux-imx@nxp.com,
 Stefan Agner <stefan@agner.ch>
Subject: Re: [GIT PULL 5/6] i.MX arm64 device tree update for 5.13
Date: Thu,  1 Apr 2021 22:15:25 +0200
Message-ID: <161730808640.655497.12938908556780243539.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210331041019.31345-5-shawnguo@kernel.org>
References: <20210331041019.31345-1-shawnguo@kernel.org>
 <20210331041019.31345-5-shawnguo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_211559_454110_E841FBEE 
X-CRM114-Status: UNSURE (   6.09  )
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
Message-ID: <20210401201525.4WW9y5ZStfj41vGicTBLdo9Q-XbCZrYH51BH8rkkgnw@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 31 Mar 2021 12:10:18 +0800, Shawn Guo wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-5.13
> 
> [...]

Merged into arm/dt, thanks!

merge commit: d2adc561c9bfc72468cb50d15080459757ff5f2e

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
