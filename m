Return-Path: <SRS0=ZYY7=ND=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17832C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 08:07:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B45BB60EB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Aug 2021 08:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B45BB60EB9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S9HWahrxFj7wdn1Voop3567vB4CzH5GkLfs+ybYEX5M=; b=gPnmWhpOIc6i44
	h1tFpfBN8OSLxqwtx3VIvTvk4Xvivi0a+gN/XlWmjoRrNQCMIL+IW52eU0AY8+/QnGTkLDJRsfwIv
	TfYSRjk1osyf2U7v+3ffTquZPj2z6QSG9TTWWOa8DCyME0OSEuRJu9OqHVr3lZf1L9rdYQfY8PkqS
	Xi1DIrsk3MXagY6vka1wk5zuEano8DVB9nyRZ8FZnxto3Qcp4Ij8hwgJIXmwWO7P2l7a/cXr2Brgf
	dLGd4NgR/XBjmSfFBfXC67GSaw4mHr3nlVidia9YPc/EWetjEWF+6TOraeP/kzeiWY2I21hkWwwBj
	r5WAQgXiby+KSTeHxHbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE5hx-0092Ok-SS; Thu, 12 Aug 2021 08:04:58 +0000
Received: from muru.com ([72.249.23.125])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE5Wq-008zo4-0Y
 for linux-arm-kernel@lists.infradead.org; Thu, 12 Aug 2021 07:53:29 +0000
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id DC1B880E2;
 Thu, 12 Aug 2021 07:53:47 +0000 (UTC)
Date: Thu, 12 Aug 2021 10:53:25 +0300
From: Tony Lindgren <tony@atomide.com>
To: Santosh Shilimkar <santosh.shilimkar@oracle.com>
List-Id: <soc.lore.kernel.org>
Cc: "arnd@arndb.de" <arnd@arndb.de>, "olof@lixom.net" <olof@lixom.net>,
 "soc@kernel.org" <soc@kernel.org>, "arm@kernel.org" <arm@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] soc: Keystone driver update for v5.15
Message-ID: <YRTTdcg+lj1/vH0L@atomide.com>
References: <0A637A41-2353-4900-962C-DBE50BBDE75A@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0A637A41-2353-4900-962C-DBE50BBDE75A@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_005328_180689_84248358 
X-CRM114-Status: UNSURE (   7.02  )
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
Message-ID: <20210812075325.c7X9NxXsynhfMfCei4xy5DyynhSKnfUgoMX-vu8Q0d0@z>

* Santosh Shilimkar <santosh.shilimkar@oracle.com> [210810 23:47]:
> Tony Lindgren (1):
>       soc: ti: Remove pm_runtime_irq_safe() usage for smartreflex

Thanks for picking this one up, I also just sent a pull request for it,
my pull request can now be just ignored as that's a single commit
in it.

Regards,

Tony

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
