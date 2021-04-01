Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E834BC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 20:21:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C3DA610CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 20:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C3DA610CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=R3QsqXVFftfMetvx3f+L3CBj3cJMqy1Hcxa3AtvKYIY=; b=j+f0iUZ/4SKbu+1mZPu7UHuPh
	o/eUwsKfD7nKAeB1TAogp9T5IuExnEkViI9iIQMYBddk6IMwNrrZhLuBzXaWAQ4r1CiLIE1IwRtm4
	fCiv7iXKyzwwRfuLLCrlPwM7TaKuyDC6dxQGKmD46vgwRWAeD1MT5sBDvXajXd3OW4tcRbTr3cOOI
	dhFbGMQMyfuq/s0dz0Ic+2p+mOMAoOALTeKGdlAtRDHCF0nsjgUKAKAw5/CRIBjNYDAIEP4q1YyMO
	h3CHQ22ejx14ENTtfJgasHLJdQYR7aowKTm+sGEdi4bFkmB44I2zDEuauegCd9eKJBsi2o313mj5k
	cXPEnwMLA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS3m1-00AuYT-1t; Thu, 01 Apr 2021 20:18:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS3jN-00At2R-Tl
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 20:16:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D577D610F7;
 Thu,  1 Apr 2021 20:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617308152;
 bh=kwWyuDUAJuOzjmy8QsMSGDC1bsN5AwFFHpq5F3sfG0E=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fnXZ9+oy+xCSyh0FAWf+V/VbBvNh3ParmimUP3KAwjcvZlGq1EA+HBzrBGTG+X1Ab
 yluUOwddRuhDV6p6qZyj/wrzWPEdlWjhDrB7F+7qzrf1hlPXPY//YZbwNVAZxm1nQc
 Ar46RZokVBb1TFVkRnXfB71oFKItM2t7d7dH5n1rrTr8yBSGtkQuprvncG8zR92JTe
 2s2mGoxFAwA0X/8js5mEzwYpl33XFjvGZ2fAuNmy8AmqNsKyB1zScU+u2k+Gg4VJh9
 uq3vUp+uCYlEsJ2SSP3RFgSlj1o+28IIbY8y76lMtZOWr2Rfo1OKzVeqIKfqvtWL0F
 XlAFuYMrX6gMw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
 Li Yang <leoyang.li@nxp.com>, linux-imx@nxp.com,
 Stefan Agner <stefan@agner.ch>
Subject: Re: [GIT PULL 3/6] i.MX DT bindings update for 5.13
Date: Thu,  1 Apr 2021 22:15:23 +0200
Message-ID: <161730808624.655497.9470372573569537914.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210331041019.31345-3-shawnguo@kernel.org>
References: <20210331041019.31345-1-shawnguo@kernel.org>
 <20210331041019.31345-3-shawnguo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_211555_912162_B73301DB 
X-CRM114-Status: UNSURE (   5.98  )
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
Message-ID: <20210401201523.8j9AHUONGxdJDluwwfI90e452WehIxsBJK1nJ5yky14@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 31 Mar 2021 12:10:16 +0800, Shawn Guo wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindgins-5.13
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 2771bc0dbaad48238b0fc3ae73d1c5215b5e018b

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
