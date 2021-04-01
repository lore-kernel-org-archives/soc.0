Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B48C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 21:14:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7D91610A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 21:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7D91610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iTgP+oGR2OreBVH+Sf7YCOTLRzwX+AIFTy1AXHWSxZM=; b=ovnd7ZuBP7yKsNx9DQUulhgT+
	aJw0DrfAm97bFzGCIUZsb+PYvUe09y1cXVylKwBTB/pUXCX8XYxx9vSPI2q7n0XT2ro7j8dKMrcjF
	rrpPm3k/cYA/Mg5+jaaGf7eTwp+bQZ3tgkYIoZaSvmyXxp9JDZqeTaOA9oow1Kawb/wsnU/SUqAoV
	6/psg1LvRYiAI7Ze7agtNGbwEo3dGfvseZa7CRgxSmBuKCU+sY9HdFfDHb86xUaJc0os4O+6yqXXa
	I9FELdEl42NSqqIB5HO/PRdUJPoBQ+1V5Dx8b1zjddYVRlL13U1RR88Zea3A/waE4uZGQVGlhGVJ5
	Tp/pZwg2A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS4Yb-00B13e-TU; Thu, 01 Apr 2021 21:08:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS4WE-00B0wY-IB
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 21:06:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5B2F761103;
 Thu,  1 Apr 2021 21:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617311181;
 bh=yEeBq9au/1/8SGwwI5LjOH2w9D5Ry/sCr4gyR7wQbhM=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jm16m2GRLCKZGoR7f+o+lo2k68SPS/Fm5Y1CSN2LapApz9x6lNE4biVR0JYvV44x9
 BHZ68/2ev1yUTDLx/FOofYeovZowyzIGtAImOCAv2NpBx49gTbO3+atA4R9ODuxIBt
 349MLygwvJdnsDyxQatJPlhQL0q/O3N9ojIyUYp5INhVrFECpk3giL78y0FiBeuQHf
 PwDwhTN/NoDHoXx84RT97shhhKwhybNEj1DGMjAWEM2lbAQ/J4u8Ri+1UgdOVxdznu
 qnjioFncHRTIgWd89lRtxKxd27wdUn4BWAj8RgSpwI1fmiVQ4Re1eeo2Ns1x9/vFHY
 4MeIim9YUncOg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Li Yang <leoyang.li@nxp.com>,
 Stefan Agner <stefan@agner.ch>, linux-imx@nxp.com, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 6/6] i.MX defconfig change for 5.13
Date: Thu,  1 Apr 2021 23:06:07 +0200
Message-ID: <161731114623.662954.11029736079612919707.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210331041019.31345-6-shawnguo@kernel.org>
References: <20210331041019.31345-1-shawnguo@kernel.org>
 <20210331041019.31345-6-shawnguo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_220642_763271_E3538F6D 
X-CRM114-Status: UNSURE (   6.19  )
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
Message-ID: <20210401210607.r-gZyT5Hx6w-JEpE5Kvg67JQbrXarsD8i2Oq78DH-TA@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 31 Mar 2021 12:10:19 +0800, Shawn Guo wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-defconfig-5.13
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: bbbd7b0120849d0d8022a5a211d3f1171ecf43cb

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
