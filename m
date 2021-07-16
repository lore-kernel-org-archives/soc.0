Return-Path: <SRS0=r7Jl=MI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B07FDC12002
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jul 2021 21:32:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74FEF613E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jul 2021 21:32:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 74FEF613E3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/oDPvVciDzf0WIBiQaV/H7xi2U5ReoAaar3nysX5g3I=; b=rsyc4KLouGcjxw
	w/rKKJtRET1Qw5PeGtE5wNhxym6/QwIEuhCpf0t60DFg03iY90I3I3EcpU5wVuqljnzr833BXYgkw
	pMMundbcR6T81tic0kmZdoLLYvwdeRE64U0aWIM7u4wMRxOW99IG1pfWFrDfkI5vXWVqbWQre6s5T
	4yP6rNZ9pju/eUGoPaY3nm+EY0HIHDZeHERW+kQbz0Ai234rd3YXDkRGqOt5Rhm9SOfW175ttcExj
	PrstOn6H0UgImICnf6FsJj2fU4Jy/EZvTPkF8x19IW5TcutfDE0ss4VpYAf5JbLJoPc0RKANUoox+
	ZrfyJLhf6NNTY0V9uEYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4VPj-005K95-7Y; Fri, 16 Jul 2021 21:30:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4VKn-005I9z-Jz
 for linux-arm-kernel@lists.infradead.org; Fri, 16 Jul 2021 21:25:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B45261374;
 Fri, 16 Jul 2021 21:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626470725;
 bh=k952yPNWWdG7QtLT3USK8nnSCYwGJrpp2mlvUl3iR50=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=a/XIMqx7mOVmPLenFhUGyFMr1vEZsyfSf8idcbwgXgiOLhPCZlTeCqCvKJJP1UwmL
 YqG/tZcLYspuaapP/WOvcU9Fx2EXGS2eYom5p16uhRgagXeaLjtRKFdXjDPAcm0g38
 AllifbyOLci3r+FxpejR6Oh+a8UOdVL9KO2AY8CNCd+bHPPdNLFePU5RTpO1WrRF9Z
 8+Iedp8lBaubwAHNhYi5rIJRl4JZMgirmivkzZxgFdiiQX8/YV15qHIb56ifhnZ009
 i2Bmy517loNYVTvhem8gg7jXD+2ddyxMXI5Nf2ycAhFoxTJF61Wxi6bhhGSiVvk1xN
 1YXRDzaaymbdQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>,
 ALKML <linux-arm-kernel@lists.infradead.org>,
 ARM SoC Team <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] firmware: arm_ffa: fixes for v5.14
Date: Fri, 16 Jul 2021 23:24:52 +0200
Message-ID: <162647049946.3478428.5724268915646605487.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210714165806.2617325-1-sudeep.holla@arm.com>
References: <20210714165806.2617325-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_142525_729597_B7204AE2 
X-CRM114-Status: UNSURE (   5.73  )
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
Message-ID: <20210716212452.mHi_UxXaKH-B20B1jkAFuwdpzAkDAvO9RwVWxorXlJ0@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 14 Jul 2021 17:58:06 +0100, Sudeep Holla wrote:
> Please pull !
> 
> Regards,
> Sudeep
> 
> -->8
> 
> The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: d28912d6f0ab6dbd0ca483ae77a4260b145542c5

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
