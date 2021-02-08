Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73CF5C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 23:23:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0499864E31
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 23:23:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0499864E31
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mtoElz5PE3i5x5mVetPJtXK/apDRHbmyrmNvNqR32Xk=; b=RasfJFR+MsmzBsADiwaHg0rx0
	oy36pj2hiQ1b9JJM9I5Fmpac6WOIE3YgO9hzqiZ8z6VdspZP3PbfwFaEjf9H/0ARDFOVlD8FSRZqz
	fcdtmZ7k35T3PjmerwVWNd34wVpJ+3/ox8NSrOwjA2COg+yVWrmVU+QyeMh0MeBrcC8RpMBR+d0wh
	GE2K6nkHqMJPB/BpIdLw46kuhbfUPygnmonDTNgxsElutL2VzvQP3mAGuK/5EGhH8eOJJPA6vpBzY
	aoVxsYVu83a4bF9rqS5zCH0jJpI6hdY1hkt/R5wbLE+geREOfT0VuGYrC5a13oWLicgEavMlKEWlc
	lt721iKlw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9FrS-0002X3-Mv; Mon, 08 Feb 2021 23:22:30 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9FrQ-0002Wd-D8
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 23:22:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id 0E26B4207F;
 Mon,  8 Feb 2021 23:22:23 +0000 (UTC)
Subject: Re: [PATCH 05/18] tty: serial: samsung_tty: add support for Apple
 UARTs
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-6-marcan@marcan.st> <87lfc1l4lo.wl-maz@kernel.org>
 <e842f37d-d788-2d34-05e4-86ef94aed8f5@marcan.st>
 <73116feaa00de9173d1f2c35ce16e08f@kernel.org>
 <7adf8ede-f7ff-7c62-d0fd-9ab4eaf25741@marcan.st> <YCFq3DqOzv4//6Vw@kroah.com>
From: Hector Martin <marcan@marcan.st>
Message-ID: <88ed59d8-e18b-c04c-c164-6b15b7c3e390@marcan.st>
Date: Tue, 9 Feb 2021 08:22:21 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YCFq3DqOzv4//6Vw@kroah.com>
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_182228_558422_0DB1EB10 
X-CRM114-Status: GOOD (  15.06  )
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
Cc: Arnd Bergmann <arnd@kernel.org>, devicetree@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, soc@kernel.org,
 robh+dt@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208232221.QUO1XA5TBLCrCDHy4NF24QrtEQ-l6f4SSMNtVVX1xVs@z>

On 09/02/2021 01.46, Greg Kroah-Hartman wrote:
> I HATE adding new PORT_ types, as I am almost positive no one uses them,
> but as they are in the uapi files, we can't delete them.
> 
> So, just use an existing one, why do you want a new one?  If you don't
> have a userspace tool that requires it, don't bother.
> 
> Just use PORT_8250 and be done with it.  I should force all new drivers
> to use that as well :)

Krzysztof: given this, I think it would be fair to add an enum to the 
driver to keep track of the actual hardware type (grouped into probably 
just 3, S3C24XX, S3C6400, APPLE), get rid of any code in there that 
cares about the uapi-visible port type (other than setting it correctly 
for those that do exist, to maintain current behavior), and just make 
everything else use PORT_8250 for that?

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
