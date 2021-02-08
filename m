Return-Path: <SRS0=U7wc=HK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5B18C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 16:19:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9344464E8A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Feb 2021 16:19:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9344464E8A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q5g5fhtFyzfqZqHjmN6KA5pWNUUJfrr7ysoS72dNqoQ=; b=b4z0Yyhd4GWfPU3xeDkVQkper
	oVm8GiMHoDvys6W5O22fFgJM9eAKPMCGjGie/1/tbhEY1EgJEsZpy3zr5EhsTv32zO92QJm3vYv50
	7bE9Xin7VTJH3F8mLnoImvWeWKZL7PzCItiX8AkgMvB1XSRVkZrByxXkP22vCc/opRXtradsKZk0R
	lupJne8P8DKfEOFiPgUBkb+46ZU4iOujypWRBW/CdPzKVgejXHmUwGuOPxvFTZWESTqdBXJITdVHN
	QmZBFf+jxIdde32n4e7ByxWMb9WFjSHqrFXk7y1yTOeIqC5kc4YhmmHcoF/EzYGkT4qi8pkUWnA43
	k15ZbItlQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l99F9-0006wO-Au; Mon, 08 Feb 2021 16:18:31 +0000
Received: from marcansoft.com ([2a01:298:fe:f::2] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l99F6-0006vn-F5
 for linux-arm-kernel@lists.infradead.org; Mon, 08 Feb 2021 16:18:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id B33B54207F;
 Mon,  8 Feb 2021 16:18:23 +0000 (UTC)
Subject: Re: [PATCH 05/18] tty: serial: samsung_tty: add support for Apple
 UARTs
To: Marc Zyngier <maz@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-6-marcan@marcan.st> <87lfc1l4lo.wl-maz@kernel.org>
 <e842f37d-d788-2d34-05e4-86ef94aed8f5@marcan.st>
 <73116feaa00de9173d1f2c35ce16e08f@kernel.org>
From: Hector Martin <marcan@marcan.st>
Message-ID: <7adf8ede-f7ff-7c62-d0fd-9ab4eaf25741@marcan.st>
Date: Tue, 9 Feb 2021 01:18:21 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <73116feaa00de9173d1f2c35ce16e08f@kernel.org>
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_111828_652087_93E79C4A 
X-CRM114-Status: GOOD (  17.38  )
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
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 soc@kernel.org, robh+dt@kernel.org, Olof Johansson <olof@lixom.net>,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210208161821.ade5rAwTz8lziWR6oZt3mL1qaqr_ktcNagDa8XfJIS4@z>

On 08/02/2021 19.34, Marc Zyngier wrote:
> On 2021-02-07 09:12, Hector Martin 'marcan' wrote:
>> On 06/02/2021 22.15, Marc Zyngier wrote:
>>> Do you actually need a new port type here? Looking at the driver
>>> itself, it is mainly used to work out the IRQ model. Maybe introducing
>>> a new irq_type field in the port structure would be better than
>>> exposing this to userspace (which should see something that is exactly
>>> the same as a S3C UART).
>>
>> Well... every S3C variant already has its own port type here.
>>
>> #define PORT_S3C2410    55
>> #define PORT_S3C2440    61
>> #define PORT_S3C2400    67
>> #define PORT_S3C2412    73
>> #define PORT_S3C6400    84
>>
>> If we don't introduce a new one, which one should we pretend to be? :)
> 
> Pick one! :D

*queries /dev/urandom* :-)

>> I agree that it might make sense to merge all of these into one,
>> though; I don't know what the original reason for splitting them out
>> is. But now that they're part of the userspace API, this might not be
>> a good idea. Though, unsurprisingly, some googling suggests there are
>> zero users of these defines in userspace.
> 
> I don't think we can do that, but I don't think we should keep adding
> to this unless there is a very good reason. Greg would know, I expect.

Greg, what do you think? Add more PORT_ UART types for Samsung variants, 
or overload one of the existing ones and deal with it in the driver?

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
