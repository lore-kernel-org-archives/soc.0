Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2B85C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 19:40:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 001FC6108B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 19:40:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 001FC6108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PHYFOxIacTpiF9P8UAwXIRJXVWcytz8vdwP/RFLBzfs=; b=EQohFdJkHf9TbI1nVRFSQjFtf
	NDlHG2DFSQ5Y9DhDyJ4UMKLhy1Bvj90ADQNeSotX8DES0s95fGPATTmuKUVShzwMCBKu8FiORMbSS
	pLogPiBhxq1AsSTP4Ei8S4EytVJ97n+6091ueDVCk3VNvMaWZbS1NldYjaQL39zzMhM8AhKXT3+iY
	gLTwA8XjGU/luIXgDlvlqrBfxXs7ivDpcg8wU2QkVSvwc112+VOec443xHc5+N65qMajPAHOIUDk7
	IAntoWy67uF3/shgjoH/+0WjbWfC7aMufgpY3oL8mpN+00EbUR1yk+Ey1p91oOcMEf7Mq1zysolpD
	wl8M19SYw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS37F-00Anu2-Dc; Thu, 01 Apr 2021 19:36:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS2vi-00Am9P-I9
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 19:26:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 11D6C610C7;
 Thu,  1 Apr 2021 19:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617305073;
 bh=D7jJwnU+o4TFZE/ODZG4YwaqAYa78t9bwwiTUI35u18=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZIHdbmYtKJ2K5Gb+IqDF5ghFYdXZGeeYOn6xU62eZm2jW0FB74wxPqtj/UnMDM+od
 mpiYHvPoSNgufD2iFABfOpEFb/bQHL4qJfA0KRUpjgiX26EJg8PeK4d6HSh78O76ft
 onHziqy7iuDr6f5qJp1MtxYLOZ0KHwel+dfjgvzl23I/xM1Uj1dUadvdZKenqH23Dg
 EcBSNie2F8z1sSGDwkhrlfvN7y7+Vtc31+ZybYLK+l/t0sgI9MF6hEk3dYrXmsDfge
 x4voyWl+aC8B0CUFFjxH7kth8GgupVjzJWorp6PloD43K9AXow+MHlB3fLzwNHLMgX
 V1GDLDt8BIRgg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, gregkh@linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org, sboyd@kernel.org,
 dmitry.torokhov@gmail.com, robh@kernel.org, u.kleine-koenig@pengutronix.de,
 bgolaszewski@baylibre.com, thierry.reding@gmail.com, f.fainelli@gmail.com
Subject: Re: [GIT PULL] Raspberry Pi driver updates for v5.13
Date: Thu,  1 Apr 2021 21:24:14 +0200
Message-ID: <161730504479.632809.2179392548261995613.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210322174232.29549-1-nsaenz@kernel.org>
References: <20210322174232.29549-1-nsaenz@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_202628_875318_0C796F6F 
X-CRM114-Status: UNSURE (   6.35  )
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
Message-ID: <20210401192414.Ddil-Ixz91-MsmqvRjD5syJBM7KBjMQrvSFMLsjLsQc@z>

From: Arnd Bergmann <arnd@arndb.de>

On Mon, 22 Mar 2021 18:42:32 +0100, Nicolas Saenz Julienne wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/nsaenz/linux-rpi.git tags/rpi-poe-v5.13
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 7da68c64bc9037da7e470bfd219a2b5b7e7c5af1

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
