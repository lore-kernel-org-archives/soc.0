Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEECBC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 10:26:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67C59606A5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 10:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67C59606A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4Zo6TuXNyesDu8qEdwoFjzQS96Om2iAbd9X1p0rFrso=; b=PcH2U7JcgXPWxjkle2P1/G5yb
	xvul/nafVgs5CG+I22GdjRLdxzuXoUKI8Ciy/Ubq715OGiFnihRKSIe9XVHsoa3UM/gVErpS1YZlf
	Ep6q8L6snEwI6ZZYxizR/OFGFqnjCV89FaLoeLdh535SkiJ5j9B1ZDZkLroLiAXmuUM3hCzG5yZ87
	oRZv2dkkXvGa5Q9DgAw6EoslVbHy72H2Cwuz9Joqxl72lnCBUk0lOcH8+tJta4Q0JumMMX8RJpaOV
	25XdSzvZKj777+Yi0Kgmk1LUe8J/cxBheJGu/1/HJAdDN2lgrDJPnEKjizKsusb2d2IqHcZY+8Z1+
	v5LfxhrUQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRuV5-009CtA-5A; Thu, 01 Apr 2021 10:24:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRuUW-009Cjp-La
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 10:24:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 58482610CA;
 Thu,  1 Apr 2021 10:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617272635;
 bh=echKhk/+du5revw56d9N1TtPnxzuzBPGHd3iaQ496Xk=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UxuCUS8Ewavw1VGOPNOhxECVjCSTnSE2hTmRdj80WAgBHauG0SU1ub8DXfDKZu5KF
 7VvXgHEEDctKtAwWqd57pztmBDHjvQdM1uF68y1PIaxWg9ieLAx/KOWpAXR3g/FU1L
 iFEDzr3lUl2kuLF5J5pLsKB4WHP56yvDJpfLSjBPqJvQrBPrLUSBO/wlADdJm2G5mn
 hPJ7v/mNTTdTXAQHLMiAo3jEzCJEAWEsJwdjGaU9+WJ7JRGX+Muf1iKEArUp8iwmyj
 56+Tcwz7mKTTkVaTCdpULUEBTo+eT9HjIBvPB3LTGopF73Bq7V/h7IQYIukxDWkMLE
 UCNVhQOH7ZvrQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Shawn Guo <shawnguo@kernel.org>,
	arm@kernel.org,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-imx@nxp.com, kernel@pengutronix.de, Stefan Agner <stefan@agner.ch>,
 Fabio Estevam <festevam@gmail.com>, Li Yang <leoyang.li@nxp.com>
Subject: Re: [GIT PULL] i.MX fixes for 5.12, round 2
Date: Thu,  1 Apr 2021 12:23:32 +0200
Message-ID: <161727243755.583633.10590032736575762334.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210330090236.GQ22955@dragon>
References: <20210330090236.GQ22955@dragon>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_112358_950724_654841A3 
X-CRM114-Status: UNSURE (   6.26  )
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
Message-ID: <20210401102332.clgYJ05GtANVdRr-QDQ8k-wtdQJJUNKl-pQsTxFUqe8@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 30 Mar 2021 17:02:37 +0800, Shawn Guo wrote:
> The following changes since commit e4817a1b6b77db538bc0141c3b138f2df803ce87:
> 
>   ARM: dts: imx6ull: fix ubi filesystem mount failed (2021-03-18 12:06:28 +0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.12-2
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 89e21e1ad92373b7306b9b8494d45781598ce72f

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
