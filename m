Return-Path: <SRS0=HiIx=GZ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C78C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 22:46:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B93323AA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Jan 2021 22:46:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B93323AA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Cu6P57b84IE8yBtmafgj0TbJ4V63TqM2LTTSYsgzKTY=; b=UcUiCX+iZmT+VYfqLYiA847/q
	+NzK2WNhejuYj8CJ+iWF+RojGj/YxCr9Seb+TDLfq2SEhEMHXpjjIXK2U81i1/wAW7ZwjPGPaP2qD
	BI3twpgUtP8/rcOIbJNcjqZ/86IBI6RXMFJbnE6JPLzxafPAVpBas/a4NieIeREFmn2nMSBCI2Ywl
	957f/d+mHvLmyc+JhV+9erZE1MIepRBuvVmlPazPR+gg6EZ+aHVRECpEFk2O/ja/L7MZAIq+nVNXr
	x+w+HuqZ34FdhCFXeIhZZFE09+5zYLdJn4o8HLmKNKx0qpvdh+UIzKz+HllSJkOjx+Ohu1Xl7vFMX
	FwrpfYsUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l35Ad-00020s-HP; Fri, 22 Jan 2021 22:44:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l35AR-0001wk-Ug
 for linux-arm-kernel@lists.infradead.org; Fri, 22 Jan 2021 22:44:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6262323AC0;
 Fri, 22 Jan 2021 22:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611355475;
 bh=9YP7ipLErGJnRUfQLW6l/YKDJtN6RrzTjBy0SDIPAB4=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tbN8DHecNOxjhPFst6WlVkzRxuqcS0lDOPSjfic6RDm32+9cDZ3DQbhcGzv7MBbCJ
 0cZhadOEXCRIzjAXFIdJ4nwC9BAYAFmksXUTUcQv/3yhqjnlPcwSJ9Vmb0IEilhVFN
 SrIKS/WWgbV42tZ2xKanWUbdYxbXinNWb3yDEaDRCOo15R9pJjQ5+Da2RVwKYAIiRB
 I05iUMJ+0+mmNEnmYbPzGsbZ3NK4Q8nuu1C+X7MRAYtPROc0aLj11gIx2T1p7BvYLZ
 Pau2XWy3IAgRWIBEYrK6D56n2TXe5gpCTYs14AiTqV9PIw/TbeCt8uRfwgXaaE4Fpd
 dQNAZI1I7rwTA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, soc@kernel.org,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, arm@kernel.org
Subject: Re: [GIT PULL] ARM: at91: defconfig for 5.12
Date: Fri, 22 Jan 2021 23:44:27 +0100
Message-ID: <161135545374.1320625.12711401805152999993.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210122144638.170565-1-nicolas.ferre@microchip.com>
References: <20210122144638.170565-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210122_174436_057436_636D363D 
X-CRM114-Status: GOOD (  10.94  )
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
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Linux Kernel list <linux-kernel@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210122224427.xdN5xeOsIF4EOv-aBag6rMKeJp278kSHfsyC1OSz8e8@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 22 Jan 2021 15:46:38 +0100, nicolas.ferre@microchip.com wrote:
> Arnd, Olof,
> 
> Here are the defconfig changes for 5.12 which contains the removal of old
> wrapper code that we called tclib. No such config option to be used anymore in
> next kernel.
> 
> Thanks, best regards,
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 2cb2b2c9d9f06356d8b00e8afdfc3d8449c3dd95

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
