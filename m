Return-Path: <SRS0=2LUn=GY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 364DAC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 10:43:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9B78207CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 10:43:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9B78207CC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a36nT65+jxuTp6s1d15vC4Ynv4l4SXRsOH/rsJy5eoI=; b=MG3/Q2NP+OMB6IiQXdCl1kuYW
	xvWFz6AbHQyaLbqEGJsngovnjaf/tvvPamNQbII30HBMsittFcw16E6W9FsI9WGDraIPLVrDYeTN2
	Vi3xoQVUFLVDPdIIi+w71We4oCP9uECl9RG71LSTDNhC8xvCNQuT30PKuERfAG07bXQB50MBXCgn3
	sra1SDi7QhPfXP3GCX99BP4wKoNXVnRrFCRCHZ7j6W33eP+2+kfEj43EGW9SjY0jUpqOJpg5lUxBJ
	foAZdy4cIh1AQsR8aoa14FnfJfmpZ2l1J8Mt7orkgN23URp+VBOvq2Wuo3j2kzowuQtIyZI9ODMY4
	4uKcEpF0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2XPC-0008BR-TR; Thu, 21 Jan 2021 10:41:34 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2XPA-0008Ab-Cw
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Jan 2021 10:41:33 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 0B01622FAD;
 Thu, 21 Jan 2021 11:41:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1611225687;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JDILWN2Qt0CRRMnHqdXZCjQvogas/S8Dy2MJuaJxQKk=;
 b=jC+SKLV/orq38gIrVKvQRdKd4J76RPnn0LqF4Vr8EwOfVD+f7XzPpnSFWHjDxMBql+/Ieb
 SUfOJajVatGzvLP2keWDGOdIYF9LNZAo00vXfO4Hil4mGO+XRb/PAOiOw1/hH5jsZbW4jp
 fyYxBLtSI35wjK6PQLFjp3ngBkrfckQ=
MIME-Version: 1.0
Date: Thu, 21 Jan 2021 11:41:26 +0100
From: Michael Walle <michael@walle.cc>
To: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 0/3] add Ebang EBAZ4205 support
In-Reply-To: <8917c9a1-09e9-0a39-5732-da7f555ae9ad@xilinx.com>
References: <20210120194033.26970-1-michael@walle.cc>
 <fff420d1-fc9a-23ce-0d07-58a3c6f10c4d@xilinx.com>
 <aa96fcaa362181d4b6fef9f1de0aa914@walle.cc>
 <0a1c6ebf-1d5b-4f06-56db-f04e87d2ae9a@xilinx.com>
 <bd86194a13882ce472764d0c91029e33@walle.cc>
 <8917c9a1-09e9-0a39-5732-da7f555ae9ad@xilinx.com>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <df072e37bb6f3500d713be565cfa1328@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_054132_553210_730607B7 
X-CRM114-Status: GOOD (  19.87  )
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
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210121104126.krUQxd6zyZssXprTnk7fuY_blI9lqcwDtfGxkVtEC5g@z>

Hi,

Am 2021-01-21 11:23, schrieb Michal Simek:
>>> Back to your case. Board is cheap which is not all the time case for 
>>> any
>>> xilinx board but you have only uart, sd and partially described 
>>> ethernet
>>> which doesn't work without PL. Is it worth to have this described?
>> 
>> I got your point. But it is at least a jump start for the users if 
>> that
>> board boots out of the box. And yes, its unfortunate, that ethernet
>> just works if the PL is configured. This is already done by the
>> bootloader, because there I do have the same problem.
> 
> Zynq/ZynqMP boards can use U-Boot SPL. "Advantage" of this solution
> especially for Zynq is that in u-boot there is open a way for adding
> ps7_init file which is determined by device tree name.
> I think it would make sense to add these DTs and also ps7_init to 
> U-Boot
> project and wire it up with zynq_virt platform and then you can boot
> Linux with using U-Boot's DT pointed by $fdtcontroladdr.
> Then you will get support from scratch to be able to boot.

I already have patches for u-boot (using SPL). But my impression was
that linux is the master for the device trees. Esp. if there are some
problems with the board its often useful to have an in-tree device
tree.

What is the difference between this board and the other zynq boards
in the kernel?

In any case, please make this decision now: will you accept this
device tree or not?

-michael

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
