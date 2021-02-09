Return-Path: <SRS0=xDNJ=HL=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F9FC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 11:23:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 77E2764E40
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Feb 2021 11:23:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 77E2764E40
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=marcan.st
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4egPwFBR7oDbpRrkkLQ8doo3r97S252WjFXLMCP9otc=; b=dggiO1QKVke7cDwR+KC5OTRjb
	23B0eDknzgKbnlUaDWdDpYolIVN1jgwfXQJPBEFVOZnSnjahfCtdQe+Ozjoy7nBR53y8tbTEcdO4P
	0cPc8S/zMYbBNlHxfwfysAogAX3c0fIewCMMD1oL0d2t3VPqWRot7F5MvGdli72kmOHKhMxlvK06n
	j6JMrW2miy1IBnAJi97/ALJBooVY6P75OkXY6dm7fuzKDqN0hgyG/uE0ANaQKcRzRUdc8LWsEr/eO
	S+dVx7ovdxZcGz3fs372EhAQk66YdBPEpZngvyJG+gsvhwJlvaie95HKV6oQpAyhzMTns4fFKagro
	3ka3S8AXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9R62-0000b9-6U; Tue, 09 Feb 2021 11:22:18 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9R5y-0000aZ-F9
 for linux-arm-kernel@lists.infradead.org; Tue, 09 Feb 2021 11:22:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: marcan@marcan.st)
 by mail.marcansoft.com (Postfix) with ESMTPSA id C172941EE3;
 Tue,  9 Feb 2021 11:22:08 +0000 (UTC)
To: Arnd Bergmann <arnd@kernel.org>
References: <20210204203951.52105-1-marcan@marcan.st>
 <20210204203951.52105-14-marcan@marcan.st>
 <CAK8P3a2Ad+xmmMWgznOHPpxgCXKWFYfpHBqt_49_UuxrwFSq+A@mail.gmail.com>
 <c1bc2a087747c4d9@bloch.sibelius.xs4all.nl>
 <635f1a81-58c8-f3b6-ab3f-1cf6a084aed0@marcan.st>
 <CAK8P3a043eO4p2o6tizR2x7a1TZHMqO7TdX53JC4bTZnbQd9iQ@mail.gmail.com>
From: Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH 13/18] arm64: ioremap: use nGnRnE mappings on platforms
 that require it
Message-ID: <11cdf93c-0b25-e1c1-5d18-80ccb4a3f2d9@marcan.st>
Date: Tue, 9 Feb 2021 20:22:06 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAK8P3a043eO4p2o6tizR2x7a1TZHMqO7TdX53JC4bTZnbQd9iQ@mail.gmail.com>
Content-Language: es-ES
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_062214_614392_803E4B6F 
X-CRM114-Status: GOOD (  19.40  )
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
Cc: DTML <devicetree@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 SoC Team <soc@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Olof Johansson <olof@lixom.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Mark Kettenis <mark.kettenis@xs4all.nl>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210209112206.h22yNXTiLSK8haL4i4b8a3jVjcAUf2lIRfRf7IUh_-4@z>

On 09/02/2021 18.15, Arnd Bergmann wrote:
> Right, these are the same ranges that I found in the adt and that Mark
> listed in his code snippet, so it seems we all see the same partitioning
> of the address space. I also see them reflected in the
> /defaults/pmap-io-ranges property in ADT, which seems to have an entry
> for every register range that has some mmio registers, along with what
> appears to be a bitmask of some attributes, and it clearly shows
> the above ranges as having a distinct set of bits from the others
> (in little-endian):
> 
>   00000000 04000000 00000080 00000000 27000080 65494350
>   00000080 04000000 00000080 00000000 27000080 65494350
>   00000080 05000000 00000080 00000000 27000080 65494350
>   00000000 06000000 00000080 00000000 27000080 65494350
>   000000a0 06000000 00000020 00000000 27000080 65494350
>   000000c0 06000000 00000040 00000000 27000080 65494350
>     ^64-bit address       ^64-bit length            ^ 64-bit flags?

That's ASCII :-)

'PCIe'

> 
> As opposed to e.g.
> 
>   0000f002 05000000 00400000 00000000 07400000 54524144

'DART'

>   00800021 05000000 00400000 00000000 07400000 44495344

'DSID'

> Ok, so if we want this to get encoded in a 'struct resource' flag, the PCI
> resources should work just fine as these resources come from the
> PCI layer rather than of_address_to_resource(). I think it would be
> reasonable here to add something to of_address_to_resource() to
> set such a flag if we can find an unused one, and then require the
> drivers for this platform to go through devm_ioremap_resource()
> or similar.

This sounds reasonable. For setting such a flag, I guess looking for a 
property (inherited from parents) would make sense. `mmio-map-mode = 
"nonposted"` or something like that?

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
