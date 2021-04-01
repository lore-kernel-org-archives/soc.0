Return-Path: <SRS0=UN2r=I6=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B743EC433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 21:16:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64243610A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Apr 2021 21:16:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64243610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XGlA3MrEzXaWSSFBpTLt5SDazaN2NJt1UyG0E7wjbEQ=; b=qYvKk46O61KIhnxhXZXsUZ9jG
	FVhO2S2PGf5CRgzh6DizH6lXSilcvUklcOhB8AOPnIHpniwkiM5QorSIelJ/hWZGY+iQMcACFLADS
	c6+7yWKLpJW6XtXsrFKVj6ZxxVrJpe0bDQlvpRPdWRgbNVEMVlzLwBy2EyczxPVW6m7asnPW57HT9
	klfjcdJz8xgDa15K0WVPbHbEB1tXcfsqy6QpJhEKFoyEtC2kq8uqkBeiCAautKBItMXpL1cNCSwav
	8FoiOJpNnSN1m3mKjv3yUkp6UzG/muUs/seQ014ZNVvNEquoijrK+l9jGMou3lwrQ7hTcGj+3kWOr
	dREP6GmEA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lS4dd-00B1ZW-L8; Thu, 01 Apr 2021 21:14:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lS4XD-00B10F-98
 for linux-arm-kernel@lists.infradead.org; Thu, 01 Apr 2021 21:07:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 55D6161104;
 Thu,  1 Apr 2021 21:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617311233;
 bh=+IyFaEeld/hHrmelBpdh9f+gakfqfNokrR6R1m0Md8Q=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q20rjdys0yl0gMi5MWXxG+/AVFkGstrSDI+Y04MCXK6yqDfqDYdsuBs0tVBXgP4my
 o+B10x6Ava4oZ/e1SvULwCCbaMxy56bPElsPcegTw2rLaWPfswDOv/5ZhaSEu6eix4
 a5K8XmwySR7lJh6fEwi/ZxD7yK26Cxo3uHyQVXN58DH86eM1SfiZFdA+25yO/JxtuF
 A4T7KShIkaJI1SRrah2VaWk2IgeaboEN64zSPr45OU3KNplonkLpJRGcG0EtTBx1f3
 8s7ZUIR6AsSQSxMTo3hhiZSmH9+cS2Z0mEVRKa0TpMuKmzAFiK4NTP9W27CqpwnMzT
 bj7WRvovLW1mw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org,
 "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>,
 Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Kernel list <linux-kernel@vger.kernel.org>,
 Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: Re: [GIT PULL] ARM: at91: soc for 5.13
Date: Thu,  1 Apr 2021 23:07:04 +0200
Message-ID: <161731121872.663132.5899374227891115109.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210401174544.32193-1-nicolas.ferre@microchip.com>
References: <20210401174544.32193-1-nicolas.ferre@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_220723_641314_5BD20EFD 
X-CRM114-Status: UNSURE (   6.78  )
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
Message-ID: <20210401210704.61_pVtfs8TXGnp_Yp1zJJdfnpB7h5TlB2hB5W3Q0izE@z>

From: Arnd Bergmann <arnd@arndb.de>

On Thu, 1 Apr 2021 19:45:44 +0200, nicolas.ferre@microchip.com wrote:
> Arnd, Olof,
> 
> One single patch for now on our SoC branch. Stakeholders agreed to make it
> travel with at91 -> arm-soc.
> 
> Thanks, best regards,
>   Nicolas
> 
> [...]

Merged into arm/soc, thanks!

merge commit: 6f35f62958ea395fa8cbd2a28f713ccac8d9b5bd

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
