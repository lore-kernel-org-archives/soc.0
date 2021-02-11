Return-Path: <SRS0=xpWt=HN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9BE5C433E9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Feb 2021 15:05:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BE4A64F0E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Feb 2021 15:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BE4A64F0E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i1QuBJ0Z1yVIhZe/q0EekrIkJVrhtYAq0OcAXqQGYyc=; b=U4m0Qvnh26azPXpmiSZCl6Qzl
	dNORrOz2rCDjlNg3Q6wD3oc28CLG75wc7II5ia1/1TqJp01mBPKDZLsygD7fE+GfpFHDcLAT0LsMD
	dRhEGDQ01tHmkg1325RoDHQz2nmQ0EjUh96Dq6Pg+UgmJB23Y9ss8GNk3vYEtanv2AiuE3eG27Iwc
	FfIv7xRR4vKRLuLslGjnLkwY3qIkTZNutN8M+EYQOmt6RLEWLG0wyGQZoBYEOzkW5OkMMcextT+N1
	tmI3pukyujobwQrmIs0T9V9i+SrSutHH4jmIJQGq0uHB4KPbRObRs5OPets05lGZ3GonLfsb/r+cl
	trLagh+EQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lADW8-0005m2-Tj; Thu, 11 Feb 2021 15:04:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lADW6-0005lc-GN
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Feb 2021 15:04:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 673FD64EEB;
 Thu, 11 Feb 2021 15:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613055865;
 bh=+jRoaD3iDwRW6TssAdozKbV2lWhdbP0kdSOL+xK/aNc=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oFrz9l/D80OFyMamSVIO6KHbjBK+rSIk4//bXhMB1KEGOYbX1wu+fw2GB2ISOxxHD
 ilJ4mgWKra18d6S237jEOOv8LvjN2piFN5f36W3ZNVysdgXqPpcM5Wk8F6W7TO2e8H
 xykg7hbvS0/p9v4gGv61YOB9SOfBpqxcXS27vy55A0a8zCq56nGPfYXdbVqXcNDPJm
 HtKTXkufcz/u6mWV//pKws1jI+qmU1Igm3AVM/HqkSOoEXFli+WPurMgqAehemdp/i
 TzI8SuoUAFf55eaQoJBUW8Q9A9mrsPbgHXTZBGvCuXhOxUEUr6RbOO1izoJJcrJIJ+
 CigTtHobl4XRw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm <arm@kernel.org>,
 Joel Stanley <joel@jms.id.au>
Subject: Re: [GIT PULL] ARM: aspeed: devicetree changes for 5.12
Date: Thu, 11 Feb 2021 16:04:20 +0100
Message-ID: <161305573907.259289.4679154731626442010.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACPK8XfQgGch5bK3YD0La+CE2L5DxVa1MNw6m1fc40j0w7e9Tw@mail.gmail.com>
References: <CACPK8XfQgGch5bK3YD0La+CE2L5DxVa1MNw6m1fc40j0w7e9Tw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_100426_629426_F59072E4 
X-CRM114-Status: UNSURE (   9.07  )
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210211150420.5Oaaqb-r8HcY-ChOEQpbyLx7yMhlmb4Xe2Oca0GO2D4@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 10 Feb 2021 12:28:23 +0000, Joel Stanley wrote:
> Here's my late pull request. I've deferred some LPC device tree
> bindings rework that need a closer review, so the contents of this
> pull request should be straightforward.
> 
> The following changes since commit a74c6525f12f35a5af529ff057e63cfdc461704c:
> 
>   ARM: dts: aspeed: ast2600evb: Add enable ehci and uhci (2021-02-10
> 21:21:36 +1030)
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 52ded9eaa25a203e59142db252d0bc2aae80a2c2

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
